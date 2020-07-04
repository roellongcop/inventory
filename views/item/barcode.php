<?php

use yii\widgets\ListView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\SaleSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->params['page'] = 'Items';
$this->title = 'Item Reports';
$this->params['breadcrumbs'][] = ['label' => 'Items', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sale-index ibox float-e-margins ibox-content">
	<div id="report">
		<div class="text-center">
			<h3><?= Yii::$app->template->getAbout(1)->name ?></h3>
			<?= Yii::$app->template->getAbout(1)->address ?> <br>
			<?= Yii::$app->template->getAbout(1)->email ?><br>
		</div>
		<h3>ITEM BARCODES</h3>


		<div id="barcode">
			<?= ListView::widget([
				'dataProvider' => $dataProvider,
				'itemView' => '_barcode_data'
			]) ?>
		</div>
	</div> 
	<div class="row"> 
		<div class="col-md-12"> <br>
			<div class="input-group col-md-4">
				<input placeholder="Number of copy" type="number" id="quantity" class="form-control">
				<span class="input-group-btn"> 
					<button type="button" class="btn btn-primary print-report">
						<i class="fa fa-print"></i> Print
					</button> 
				</span>
			</div>
		</div>
	</div>
</div>

	

<?php
$this->registerJs('
	$(".summary").html("");
	var old = $("#barcode").html();

	$("#quantity").on("input", function() {
		$("#barcode").html(old)
		var barcodes = $("#barcode").html();
		var quantity = $(this).val();
		for (var i = 1; i < quantity; i++) {
			barcodes += $("#barcode").html();
		}
		$("#barcode").html(barcodes);
	})
');