<?php
use yii\widgets\DetailView;

?>
<?= DetailView::widget([
    'model' => $model,
    'attributes' => [
        ['label' => 'Item ID', 'value' => $model->id],
        ['label' => 'Name', 'value' => ucwords($model->name)],
        ['label' => 'Category', 'value' => ucwords($model->category->name)],
        ['label' => 'Supplier', 'value' => ucwords($model->supplier->name)],
        ['label' => 'Unit', 'value' => ucwords($model->unit->name)],
        ['label' => 'Price', 'value' => '₱ ' . number_format($model->price, 2)],
        'quantity',
        'max',
        'min',
        ['label' => 'Status', 
        'value' => Yii::$app->template->createlabel($model), 
        'format' => 'raw'],
        ['label' => 'Serial', 'value' => ($model->serial) ? $model->serial : 'N/A' ],
        ['label' => 'Barcode', 
        'value' => Yii::$app->barcode->generate_png($model->serial), 
        'format' => 'raw'],
    ],
]) ?>