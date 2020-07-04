<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\About */

$this->params['page'] = 'Abouts';
$this->title = 'Create About';
$this->params['breadcrumbs'][] = ['label' => 'Abouts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="about-create ibox float-e-margins ibox-content">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
