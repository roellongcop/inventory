<?php

use yii\widgets\ListView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\SaleSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->params['page'] = 'Suppliers';
$this->title = 'Supplier Reports';
$this->params['breadcrumbs'][] = ['label' => 'Suppliers', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sale-index ibox float-e-margins ibox-content">
	<div id="report">
		<div class="text-center">
			<h3><?= Yii::$app->template->getAbout(1)->name ?></h3>
			<?= Yii::$app->template->getAbout(1)->address ?> <br>
			<?= Yii::$app->template->getAbout(1)->email ?><br>
		</div>
		<h3>SUPPLIER REPORTS</h3>
	    <table class="table table-bordered">
	    	<thead>
	    		<tr>
	    			<th>NAME</th>
	    			<th>TELEPHONE</th>
	    			<th>ADDRESS</th>
	    		</tr>
	    	</thead>
	    	<tbody> 
	    		<?= ListView::widget([
	    			'dataProvider' => $dataProvider,
	    			'itemView' => '_report_data'
	    		]) ?>
	    	</tbody>
	    </table>
	</div>
	<button class="btn btn-primary print-report">
		<i class="fa fa-print"></i> Print
	</button>
</div>
