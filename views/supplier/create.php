<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Supplier */

$this->params['page'] = 'Suppliers';
$this->title = 'Create Supplier';
$this->params['breadcrumbs'][] = ['label' => 'Suppliers', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="supplier-create ibox float-e-margins ibox-content">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
