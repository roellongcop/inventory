<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Unit */

$this->params['page'] = 'Units';
$this->title = 'Update Unit: ' . ucwords($model->name);
$this->params['breadcrumbs'][] = ['label' => 'Units', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => ucwords($model->name), 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="unit-update ibox float-e-margins ibox-content">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
