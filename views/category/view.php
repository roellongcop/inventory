<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Category */

$this->params['page'] = 'Categories';
$this->title = ucwords($model->name);
$this->params['breadcrumbs'][] = ['label' => 'Categories', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="category-view ibox float-e-margins ibox-content">

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', '#delete', [
            'title' => 'Delete',
            'class' => 'btn btn-danger delete',
            'data-key' => $model->id,
            'data-selected' => $model->name,
            'data-page' => 'category',
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            ['label' => 'Category ID', 'value' => $model->id],
            ['label' => 'Name', 'value' => ucwords($model->name)],
            ['label' => 'Description', 'value' => ucfirst($model->description)],
            ['label' => 'Barcode Prefix', 'value' => $model->barcode_prefix],
        ],
    ]) ?>

</div>
