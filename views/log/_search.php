<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\LogSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="log-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

     <div class="row">
        <div class="col-md-5 col-md-offset-7">
            <?php echo $form->field($model, 'description', [
                'template' => '<div class="input-group"> {input} 
                    <span class="input-group-btn"> ' .
                        Html::submitButton('Search', ['class' => 'btn btn-primary']) .
                        Html::a('Reset', ['log/index'], ['class' => 'btn btn-default']) . 
                    '</span>
                </div>'
            ])->textInput(['placeholder' => 'Type to Search']) ?>
        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>
