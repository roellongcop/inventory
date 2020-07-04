<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%item}}".
 *
 * @property int $id
 * @property string $name
 * @property double $price
 * @property int $max
 * @property int $min
 * @property int $quantity
 * @property string $serial
 * @property string $barcode
 * @property int $category_id
 * @property int $supplier_id
 * @property int $unit_id
 *
 * @property Supplier $supplier
 * @property Category $category
 * @property Unit $unit
 * @property MovingProducts[] $movingProducts
 */
class Item extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%item}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'price', 'max', 'min', 'quantity', 'category_id', 'supplier_id', 'unit_id'], 'required'],
            [['price'], 'number'],
            [['max', 'min', 'quantity', 'category_id', 'supplier_id', 'unit_id', 'is_deleted'], 'integer'],
            [['barcode'], 'string'],
            [['serial'], 'unique'],
            [['name'], 'string', 'max' => 100],
            [['supplier_id'], 'exist', 'skipOnError' => true, 'targetClass' => Supplier::className(), 'targetAttribute' => ['supplier_id' => 'id']],
            [['category_id'], 'exist', 'skipOnError' => true, 'targetClass' => Category::className(), 'targetAttribute' => ['category_id' => 'id']],
            [['unit_id'], 'exist', 'skipOnError' => true, 'targetClass' => Unit::className(), 'targetAttribute' => ['unit_id' => 'id']],
            [['max', 'min'], 'validateStock'],
            ['is_deleted', 'default', 'value' => 0]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'price' => 'Price',
            'max' => 'Maximum Stock',
            'min' => 'Minimum Stock',
            'quantity' => 'Quantity',
            'serial' => 'Serial',
            'barcode' => 'Barcode',
            'category_id' => 'Category',
            'supplier_id' => 'Supplier',
            'unit_id' => 'Unit',
        ];
    }

    /**
     * Validates the maximum and minimum stock.
     * This method serves as the inline validation for maximum and minimum.
     *
     * @param string $attribute the attribute currently being validated
     * @param array $params the additional name-value pairs given in the rule
     */
    public function validateStock($attribute, $params)
    {
        if ($this->max <= $this->min) {
            $this->addError($attribute, 'Maximum stock must greater than minimum.');
        }
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSupplier()
    {
        return $this->hasOne(Supplier::className(), ['id' => 'supplier_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(Category::className(), ['id' => 'category_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUnit()
    {
        return $this->hasOne(Unit::className(), ['id' => 'unit_id']);
    }

  

    public function getStock($status, $count = true)
    {
        if ($status == 'empty') {
            $where = ['i.quantity' => 0, 'i.is_deleted' => 0];
        } elseif ($status == 'full') {
            $where = 'i.quantity >= i.max AND i.is_deleted = 0';
        } elseif ($status == 'critical') {
            $where = 'i.quantity <= i.min AND i.quantity != 0 AND i.is_deleted = 0';
        } else {
            $where = 'i.quantity > i.min AND i.quantity < i.max AND i.is_deleted = 0';
        }
        
        if ($count === true) {
            return Item::find()
                ->alias('i')
                ->select('COUNT(*) id')
                ->where($where)
                ->one()['id'];
        }

        return Item::find()
            ->alias('i')
            ->innerJoinWith('category c')
            ->innerJoinWith('supplier s')
            ->innerJoinWith('unit u')
            ->where($where)
            ->asArray()
            ->all();
        
    }


    public function getMovingProducts($type)
    {
        switch ($type) {
            case 'fast':
                $sort = SORT_DESC;
                break;

            case 'slow':
                $sort = SORT_ASC;
                break;
            
            default:
                $sort = SORT_DESC;
                break;
        } 
        
        return MovingProduct::find()
            ->select('item_name, SUM(quantity) as total')
            ->groupBy('item_name')
            ->orderBy(['total' => $sort])
            ->limit(6)
            ->asArray()
            ->all();
        
    }


    public function getNotMovingProducts()
    { 
        return Item::find()
            ->select('name, quantity')
            ->where('name NOT IN (SELECT item_name FROM tbl_moving_product)')
            ->groupBy('name')
            ->asArray()
            ->all();
    }

    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {

            $this->barcode = Yii::$app->barcode->generate_png($this->serial);
        }
        return true;
    }
    

 
}
