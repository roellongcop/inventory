<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Unit */

$this->params['page'] = 'Units';
$this->title = 'Create Unit';
$this->params['breadcrumbs'][] = ['label' => 'Units', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="unit-create ibox float-e-margins ibox-content">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
