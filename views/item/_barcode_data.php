<?php if($model->serial) : ?>
	<div class="col-xs-4 barcode-panel text-center">
		<?= $model->serial ?> <br>
		<?= Yii::$app->barcode->generate_png($model->serial) ?> <br>
		<?= $model->name ?>
	</div> 
<?php endif; ?>
