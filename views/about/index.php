<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\AboutSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->params['page'] = 'Abouts';
$this->params['create'] = Html::a('Create Information', ['create'], ['class' => 'btn btn-primary']);;
$this->title = 'Abouts Us';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="about-index ibox float-e-margins ibox-content">
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        // 'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            ['attribute' => 'name', 'value' => function($model) {
                return ucwords($model->name);
            }],

            ['attribute' => 'description', 'value' => function($model) {
                return ucfirst($model->description);
            }],

            ['attribute' => 'address', 'value' => function($model) {
                return ucfirst($model->address);
            }],

            'email:email',

            'telephone',

            ['class' => 'yii\grid\ActionColumn',
                'buttons' => [
                    'view' => function($url) {
                        return Html::a('<i class="fa fa-th-large"></i>', $url, [
                            'class' => 'btn btn-info btn-sm'
                        ]);
                    },
                    'update' => function($url) {
                        return Html::a('<i class="fa fa-edit"></i>', $url, [
                            'class' => 'btn btn-success btn-sm'
                        ]);
                    },
                    'delete' => function($url) {
                        return Html::a('<i class="fa fa-trash"></i>', $url, [
                            'class' => 'btn btn-danger btn-sm',
                            'data' => [
                                'confirm' => 'Are you sure?',
                                'method' => 'post'
                            ]
                        ]);
                    }
                ]
            ],
        ],
    ]); ?>
</div>
