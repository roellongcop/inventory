<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = 'Login';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-login">

    <div class="loginColumns animated fadeInDown">
        <div class="row">
            <?= Yii::$app->template->message(); ?>
            <div class="col-md-6">
                <h2 class="font-bold title">Point of Sale</h2>
                <?= Yii::$app->template->getAbout()['description'] ?>
            </div>
            <div class="col-md-6">
                <div class="ibox-content">
                    <?php $form = ActiveForm::begin(['class' => 'm-t']); ?>
                        <?= $form->field($model, 'username')->textInput() ?>
                        <?= $form->field($model, 'password')->passwordInput() ?>
                        <?= $form->field($model, 'rememberMe')->checkbox() ?>
                        <?= Html::submitButton('Login', ['class' => 'btn btn-primary', 'name' => 'login-button']) ?>
                    <?php ActiveForm::end(); ?>
                    <p class="m-t">
                        <?= Html::a('Forgot your password ?', ['/password-reset-form']) ?>
                    </p>
                </div>
            </div>
        </div>
        <hr/>
        <div class="row">
            <div class="col-md-6">
                Copyright <?= Yii::$app->template->getAbout()['name'] ?>
            </div>
            <div class="col-md-6 text-right">
               <small> <i class="fa fa-envelope"></i> <?= Yii::$app->template->getAbout()['email'] ?></small>
            </div>
        </div>
    </div>

</div>
