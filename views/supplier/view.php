<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Supplier */

$this->params['page'] = 'Suppliers';
$this->title = ucwords($model->name);
$this->params['breadcrumbs'][] = ['label' => 'Suppliers', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="supplier-view ibox float-e-margins ibox-content">

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', '#delete', [
            'title' => 'Delete',
            'class' => 'btn btn-danger delete',
            'data-key' => $model->id,
            'data-selected' => $model->name,
            'data-page' => 'supplier',
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            ['label' => 'Supplier ID', 'value' => $model->id],
            ['label' => 'Name', 'value' => ucwords($model->name)],
            ['label' => 'Address', 'value' => ucwords($model->address)],
            'telephone',
        ],
    ]) ?>

</div>
