<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Item */

$this->params['page'] = 'Items';
$this->title = 'Create Item';
$this->params['breadcrumbs'][] = ['label' => 'Items', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="item-create ibox float-e-margins ibox-content">

    <?= $this->render('_form', [
        'model'      => $model,
        'categories' => $categories,
        'suppliers'  => $suppliers,
        'units'      => $units,
    ]) ?>

</div>
