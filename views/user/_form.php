<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\User */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="user-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'username')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'password')
        ->passwordInput(['maxlength' => true, 'value' => '']) ?>

    <?= $form->field($model, 'password_confirm')
        ->passwordInput(['maxlength' => true, 'value' => '']) ?>


    <?= $form->field($model, 'user')->dropDownList((Yii::$app->user->identity->user == 'Administrator')? [
        'Administrator' => 'Administrator',
        'Cashier' => 'Cashier',
    ] : [Yii::$app->user->identity->user => Yii::$app->user->identity->user], [
        'readonly' => (Yii::$app->user->identity->user == 'Cashier') ? true : false
    ]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
