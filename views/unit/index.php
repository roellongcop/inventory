<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel app\models\UnitSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->params['page'] = 'Units';
$this->params['create'] = Html::a('Create Unit', ['create'], ['class' => 'btn btn-primary']);
$this->title = 'Unit of Measurement';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="unit-index ibox float-e-margins ibox-content">

    <?php #echo $this->render('_search', ['model' => $searchModel]); ?>

    


    <?php Pjax::begin(); ?>

        <?php $search = (Yii::$app->request->queryParams) ? 
            serialize(Yii::$app->request->queryParams) : ''; ?>

        <?= Html::a('<i class="fa fa-print"></i> Print Units', 
            ['report', 'search' => $search], 
            ['class' => 'btn btn-primary']
        )?>

        <?= GridView::widget([
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'columns' => [
                ['class' => 'yii\grid\SerialColumn'],
                ['label' => 'UNIT #', 'attribute' => 'id'],
                ['label' => 'NAME', 'attribute' => 'name', 'value' => function($model) {
                    return ucwords($model->name);
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
                                'data-page' => 'unit',
                            ]);
                        }
                    ]
                ],
            ],
        ]); ?>
    <?php Pjax::end(); ?>
</div>
