<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Item */
/* @var $form yii\widgets\ActiveForm */
 
?>

<div class="item-form">



    <?php $form = ActiveForm::begin(); ?>
        <div class="row">
            <div class="col-md-8">
                <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'price')->textInput(['type' => 'number']) ?>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <?= $form->field($model, 'category_id')
                    ->dropDownList($categories,  
                        ['prompt' => 'Select Category']
                    )
                ?>
            </div>
            <div class="col-md-4">
                 <?= $form->field($model, 'unit_id')
                    ->dropDownList($units,  
                        ['prompt' => 'Select Unit']
                    )
                ?> 
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'supplier_id')
                    ->dropDownList($suppliers,  
                        ['prompt' => 'Select Supplier']
                    )
                ?>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <?= $form->field($model, 'max')->textInput() ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'min')->textInput() ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'quantity')->textInput() ?>
            </div>
        </div>
       


    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>




