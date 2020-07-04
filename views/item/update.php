<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Item */

$this->params['page'] = 'Items';
$this->title = 'Update Item: ' . ucwords($model->name);
$this->params['breadcrumbs'][] = ['label' => 'Items', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="item-update ibox float-e-margins ibox-content">

    <?= $this->render('_form', [
        'model'      => $model,
        'categories' => $categories,
        'suppliers'  => $suppliers,
        'units'      => $units,
    ]) ?>

</div>
