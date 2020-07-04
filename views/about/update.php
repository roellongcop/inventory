<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\About */
$this->params['page'] = 'Abouts';
$this->title = 'Update Information: ' . ucwords($model->name);
$this->params['breadcrumbs'][] = ['label' => 'Abouts', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="about-update ibox float-e-margins ibox-content">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
