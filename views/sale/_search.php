<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\Sale;

/* @var $this yii\web\View */
/* @var $model app\models\SaleSearch */
/* @var $form yii\widgets\ActiveForm */

?>

<div class="sale-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <div class="row">
        <div class="col-md-5">
            <h2 class="blue">
               <b>
                    TOTAL SALES :
                    <span class="yellow-bg money"> ₱
                        <?= Yii::$app->template->getSales($year) ?>
                    </span>
               </b>
            </h2>
        </div>
        <div class="col-md-offset-7">
            <?php echo  
                $form->field($model, 'sale_date', [
                    'template' => '<div class="input-group"> {input} 
                        <span class="input-group-btn"> ' .
                            Html::submitButton('Search', ['class' => 'btn btn-primary']) .
                            Html::a('Reset', ['sale/index'], ['class' => 'btn btn-default']) . 
                        '</span>
                    </div>'
                    ])->dropDownList(
                        Sale::getDistinctYears(),  
                        ['prompt' => 'Select Year']
                    );
                ?> 
        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>
