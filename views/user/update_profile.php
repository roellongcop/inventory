<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\User */

$this->title = 'Update Profile';
$this->params['breadcrumbs'][] = 'Update';
$this->params['page'] = 'Profile';
?>
<div class="user-update ibox float-e-margins ibox-content">


    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
