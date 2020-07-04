<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\Category;
use app\models\Supplier;
use app\models\Unit;

/* @var $this yii\web\View */
/* @var $model app\models\ItemSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="item-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <div class="row">
        <div class="col-md-3">
            <?= $form->field($model, 'category_id')
                ->dropDownList(
                    Category::dropDown(),  
                    ['prompt' => 'Select Category']
                );
            ?>
        </div>

        <div class="col-md-3">
            <?= $form->field($model, 'supplier_id')
                ->dropDownList( 
                    Supplier::dropDown(),  
                    ['prompt' => 'Select Supplier']
                );
            ?>
        </div>
        <div class="col-md-3">
            <?= $form->field($model, 'unit_id')
                ->dropDownList(
                    Unit::dropDown(),  
                    ['prompt' => 'Select Unit']
                );
            ?>
        </div>
        <div class="col-md-3">
            <div class="form-group text-center"> <br>
                <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
                <?= Html::a('Reset', ['item/index'], ['class' => 'btn btn-default']) ?>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-9">
            <?= $form->field($model, 'serial')
                ->textInput(['placeholder' => 'Scan Serial', 'autofocus' => true])
                ->label(false) ?>
        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div> <hr>
