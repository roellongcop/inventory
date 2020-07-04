<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel app\models\CategorySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->params['page'] = 'Categories';
$this->params['create'] = Html::a('Create Category', ['create'], ['class' => 'btn btn-primary']);
$this->title = 'Categories';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="category-index ibox float-e-margins ibox-content">

    <?php #echo $this->render('_search', ['model' => $searchModel]); ?>

    
    
    <?php Pjax::begin(); ?>
        <?php $search = (Yii::$app->request->queryParams) ? 
            serialize(Yii::$app->request->queryParams) : ''; ?>
            
        <?= Html::a('<i class="fa fa-print"></i> Print Categories', 
            ['report', 'search' => $search], 
            ['class' => 'btn btn-primary']) 
        ?>

        <?= GridView::widget([
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'columns' => [
                ['class' => 'yii\grid\SerialColumn'],

                ['label' => 'NAME', 'attribute' => 'name', 'value' => function($model) {
                    return ucwords($model->name);
                }],

                ['label' => 'DESCRIPTION', 'attribute' => 'description', 'value' => function($model) {
                    return ucfirst($model->description);
                }],

                ['class' => 'yii\grid\ActionColumn',
                    'headerOptions' => ['width' => 130],
                    'buttons' => [
                        'view' => function($url) {
                            return Html::a('<i class="fa fa-th-large"></i>', $url, [
                                'title' => 'View',
                                'class' => 'btn btn-info btn-sm'
                            ]);
                        },
                        'update' => function($url) {
                            return Html::a('<i class="fa fa-edit"></i>', $url, [
                                'title' => 'Update',
                                'class' => 'btn btn-success btn-sm'
                            ]);
                        },
                        'delete' => function($url, $model) {
                            return Html::a('<i class="fa fa-trash"></i>', '#delete', [
                                'title' => 'Delete',
                                'class' => 'btn btn-danger btn-sm delete',
                                'data-key' => $model->id,
                                'data-selected' => $model->name,
                                'data-page' => 'category',
                            ]);
                        }
                    ]
                ],
            ],
        ]); ?>
    <?php Pjax::end(); ?>
</div>
