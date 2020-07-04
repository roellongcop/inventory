<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel app\models\UserSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->params['page'] = 'Users';
$this->title = 'Users';
$this->params['create'] = Html::a('Create User', ['create'], ['class' => 'btn btn-primary']);
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-index ibox float-e-margins ibox-content">

    <?php #echo $this->render('_search', ['model' => $searchModel]); ?>

    <?php Pjax::begin() ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            ['label' => 'USER ID', 'attribute' => 'id'],
            ['label' => 'USERNAME', 'attribute' => 'username'],
            ['label' => 'PASSWORD', 'attribute' => 'password', 'value' => function($model) {
                return '********';
            }],
            ['label' => 'VERIFICATION CODE', 'attribute' => 'authKey'],
            ['label' => 'USERTYPE', 'attribute' => 'user'],

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
                            'data-selected' => $model->username,
                            'data-page' => 'user',
                        ]);
                    }
                ]
            ],
        ],
    ]); ?>

    <?php Pjax::end() ?>
</div>
