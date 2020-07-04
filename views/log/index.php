<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel app\models\LogSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

 
$this->params['page'] = 'Logs';
$this->title = 'Logs';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="log-index ibox float-e-margins ibox-content">

    <?php #echo $this->render('_search', ['model' => $searchModel]); ?>
    <?php Pjax::begin() ?>

        <?= GridView::widget([
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'columns' => [
                ['class' => 'yii\grid\SerialColumn'],

                [
                    'label' => 'INCHARGE', 
                    'attribute' => 'user_id', 
                    'value' => function($model) {
                        return strtoupper($model->user->username);
                    }
                ],

                [
                    'label' => 'DESCRIPTION', 
                    'attribute' => 'description',
                    'format' => 'raw', 
                ],

                [
                    'label' => 'DATE', 
                    'attribute' => 'date', 
                ],
            ],
        ]); ?>

    <?php Pjax::end() ?>
</div>
