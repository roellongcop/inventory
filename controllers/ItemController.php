<?php

namespace app\controllers;

use Yii;
use app\models\Item;
use app\models\Sale;
use app\models\MovingProduct;
use app\models\ItemSearch;
use app\models\Category;
use app\models\Supplier;
use app\models\Unit;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;

/**
 * ItemController implements the CRUD actions for Item model.
 */
class ItemController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => Yii::$app->params['actions']['withReport'],
                'rules' => [
                    [
                        'actions' => Yii::$app->params['actions']['withReport'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Item models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ItemSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Item model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Item model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Item();

        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            Yii::$app->template->insertLog('Create Item : ' . $model->name);

            $barcode_prefix =  Category::findOne($model->category_id)->barcode_prefix;
            
            $model->serial = $barcode_prefix . str_pad((sizeof(Item::findAll(['category_id' => $model->category_id])) + 1), 10, '0', STR_PAD_LEFT);

            $model->save();

            return $this->redirect(['view', 'id' => $model->id]);
        }


        return $this->render('create', [
            'model'      => $model,
            'categories' => Category::dropDown(),
            'suppliers'  => Supplier::dropDown(),
            'units'      => Unit::dropDown(),
        ]);
    }

    /**
     * Updates an existing Item model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $old_barcode_prefix =  $model->category->barcode_prefix;

        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            Yii::$app->template->insertLog('Update Item : ' . $model->name);
            $new_barcode_prefix =  $model->category->barcode_prefix;


            $model->serial = $new_barcode_prefix . str_replace($old_barcode_prefix, "", $model->serial);

            $model->save();

            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('update', [
            'model' => $model,
            'categories' => Category::dropDown(),
            'suppliers'  => Supplier::dropDown(),
            'units'      => Unit::dropDown(),
        ]);
    }

    /**
     * Deletes an existing Item model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete()
    {
        // $this->findModel($id)->delete();
        $id = Yii::$app->request->post('id');
        $model = $this->findModel($id);
        $model->is_deleted = 1;
        $model->save();

        Yii::$app->template->insertLog('Delete Item : ' . $model->name);
        // return $this->redirect(['index']);
    }

    /**
     * Finds the Item model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Item the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Item::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }




    public function actionReport($search)
    {
        $searchModel = new ItemSearch();
        $dataProvider = $searchModel->search(unserialize($search), Yii::$app->params['limit']);

        return $this->render('report', [
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionBarcode($search)
    {
        $searchModel = new ItemSearch();
        $dataProvider = $searchModel->search(unserialize($search), Yii::$app->params['limit']);

        return $this->render('barcode', [
            'dataProvider' => $dataProvider,
        ]);
    }


    public function actionGetStock()
    {
        if (($status = Yii::$app->request->post('status')) !== null) {
            return json_encode(
                Item::getStock($status, 'list')
            );
        } else {
            return json_encode([
                'full' => Item::getStock('full'),
                'critical' => Item::getStock('critical'),
                'empty' => Item::getStock('empty'),
                'good' => Item::getStock(''),
            ]);
        }
    }




    public function actionGetMovingProducts()
    {
        return json_encode([
            'fast' => Item::getMovingProducts('fast'),
            'slow' => Item::getMovingProducts('slow'),
        ]);
    }

    public function actionGetMovingProductByName()
    {
        if (($item_name = Yii::$app->request->post('item_name')) !== null) { 
            return json_encode(
                MovingProduct::getByName($item_name)
            );
        }
    }

    public function actionGetNotMovingProducts()
    {
        return json_encode(Item::getNotMovingProducts());
    }

    public function actionFetchAll()
    { 
        $items = ItemSearch::fetch();

        return json_encode([
           'items' => $items,
           'transactionID' =>  rand()
        ]);
    }

    public function actionSaveSale()
    {
        $postData = Yii::$app->request->post();
        $orders = $postData['orders'] ?? '';
        $total = $postData['total'] ?? 0;
        $customer_id = $postData['customer_id'] ?? '';
        $invoice = $postData['invoice'] ?? '';

        $records = '';
        
        if ($orders) {
            // code...
            foreach ($orders as $order) {
                $item = $this->findModel($order['id']);
                $item->quantity = $item->quantity - $order['order_quantity'];
                $item->save();

                $mp = new MovingProduct();
                $mp->item_name = $order['name'];
                $mp->quantity = $order['order_quantity'];
                $mp->date = date('Y-m-d');
                $mp->save();

                $records .= '('. $order['order_quantity'] .') ' . $order['name'] . ' = PHP ' . number_format($order['price'], 2) . '<br>';
            }
        }

        $records .= '<b>Total</b> : PHP ' . number_format($total, 2);

        $sale = new Sale();
        $sale->item = $records;
        $sale->total = $total;
        $sale->customer_id = $customer_id;
        $sale->sale_date = date('Y-m-d');
        $sale->user_id = Yii::$app->user->identity->id;
        $sale->invoice = $invoice;
        $sale->save();

        Yii::$app->template->insertLog('Sale Transaction : <br>' . $records);

    }


    public function actionFind($serial)
    {
        $item = ItemSearch::bySerial($serial);

        $this->layout = false;

        if ($item === null) {
            return '';
        }

        return $this->render('_item', [
            'model' => $item
        ]);
    }
}
