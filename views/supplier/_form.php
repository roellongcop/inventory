<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Supplier */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="supplier-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
	    <div class="col-md-6">
    		<?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
	    </div>
	    <div class="col-md-6">
    		<?= $form->field($model, 'telephone')->textInput(['maxlength' => true]) ?>
	    </div>
    </div>
    <div class="row">
	    <div class="col-md-6">
    		<?= $form->field($model, 'address')->textarea(['rows' => 6]) ?>
	    </div>
    </div>


    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
