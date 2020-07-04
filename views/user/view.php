<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\User */

$this->title = ucwords($model->username);
$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['user/index']];
$this->params['breadcrumbs'][] = ['label' => $this->title, 'url' => ['view', 'id' => $model->id]];
$this->params['page'] = 'Users';
?>
<div class="user-view ibox float-e-margins ibox-content">

    <h1><?= Html::encode('User Information') ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'username',
            ['label' => 'Password', 'value' => '********'],
            ['label' => 'UserType', 'value' => $model->user],
        ],
    ]) ?>

</div>
