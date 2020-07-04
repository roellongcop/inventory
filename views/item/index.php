<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\ListView;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ItemSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->params['page'] = 'Items';
$this->params['create'] = Html::a('Create Item', ['create'], ['class' => 'btn btn-primary']);
$this->title = 'Items';
$this->params['breadcrumbs'][] = $this->title;
$search = (Yii::$app->request->queryParams) ? serialize(Yii::$app->request->queryParams) : '';
?>
<div class="item-index ibox float-e-margins ibox-content">
	<?= $this->render('_search', ['model' => $searchModel]); ?>

	<ul class="nav nav-tabs">
		<li class="active">
			<a data-toggle="tab" href="#tab-1">
				<i class="fa fa-briefcase"></i> 
				ITEMS
			</a>
		</li>
		<li class="">
			<a data-toggle="tab" href="#tab-2">
				<i class="fa fa-barcode"></i> 
				BARCODES
			</a>
		</li>
	</ul>
	<div class="tab-content">
		<div id="tab-1" class="tab-pane active">
			<div class="full-height-scroll"> <br>
				<?= Html::a('<i class="fa fa-print"></i> Print Items', 
					['report', 'search' => $search], 
					['class' => 'btn btn-primary']) 
				?> 

				<?= GridView::widget([
					'dataProvider' => $dataProvider,
					// 'filterModel' => $searchModel,
					'columns' => [
						['class' => 'yii\grid\SerialColumn'],

						[
							'label' => 'NAME', 
							'attribute' => 'name', 
							'value' => function($model) {
								return ucwords($model->name);
							}
						],

						[
							'label' => 'CATEGORY', 
							'attribute' => 'category_id', 
							'value' => function($model) {
								return ucwords($model->category->name);
							}
						],

						[
							'label' => 'PRICE', 
							'attribute' => 'price', 
							'format' => 'raw',
							'value' => function($model) {
								return '<span class="pull-right">₱ '
									. number_format($model->price, 2) .'</span>';
							}
						],

						[
							'label' => 'QUANTITY', 
							'attribute' => 'quantity', 
							'format' => 'raw',
							'value' => function($model) {
								return '<span class="pull-right">'.$model->quantity .'</span>';
							}
						],
						
						[
							'label' => 'SUPPLIER', 
							'attribute' => 'supplier_id', 
							'value' => function($model) {
								return ucwords($model->supplier->name);
							}
						],

						[
							'label' => 'UNIT', 
							'attribute' => 'unit_id', 
							'value' => function($model) {
								return ucwords($model->unit->name);
							}
						],

						[
							'label' => 'STATUS', 
							'attribute' => 'quantity', 
							'format' => 'raw',
							'value' => function($model) {
								return Yii::$app->template->createLabel($model);
							}
						],


						[
							'class' => 'yii\grid\ActionColumn',
							'headerOptions' => ['width' => 130],
							'buttons' => [
								'view' => function($url) {
									return Html::a('<i class="fa fa-th-large"></i>', $url, [
										'title' => 'View',
										'class' => 'btn btn-info btn-sm'
									]);
								},
								'update' => function($url) {
									return Html::a('<i class="fa fa-edit"></i>', $url, [
										'title' => 'Update',
										'class' => 'btn btn-success btn-sm'
									]);
								},
								'delete' => function($url, $model) {
									return Html::a('<i class="fa fa-trash"></i>', '#delete', [
										'title' => 'Delete',
										'class' => 'btn btn-danger btn-sm delete',
										'data-key' => $model->id,
										'data-selected' => $model->name,
										'data-page' => 'item',
									]);
								}
							]
						],
					],
				]); ?>
			</div>
		</div>
		<div id="tab-2" class="tab-pane">
			<div class="full-height-scroll"><br>
				<?= Html::a('<i class="fa fa-print"></i> Print Barcodes', 
					['barcode', 'search' => $search], 
					['class' => 'btn btn-primary']) 
				?> 
	    		<?php Pjax::begin() ?>
					<?= ListView::widget([
						'dataProvider' => $dataProvider,
						'itemView' => '_barcode_data'
					]); ?>
	    		<?php Pjax::end() ?>
			</div>
		</div>
	</div>
</div>
 