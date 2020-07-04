<tr>
	<td>
		<div class="col-md-10 col-md-offset-1 invoice-panel" id="<?= $model->customer_id ?>">
			<?= str_replace("?", "₱", $model->invoice) ?>
		</div>
		<div class="col-md-2 col-md-offset-5"> <br>
			<button class="btn btn-primary btn-block invoice" data-key="<?= $model->customer_id ?>">
				<i class="fa fa-print"></i> Print
			</button>
		</div>
	</td>
	<td><?= $model->customer_id ?></td>
	<td>₱ <?= number_format($model->total, 2) ?></td>
	<td><?= $model->sale_date ?></td>
	<td><?= strtoupper($model->user->username) ?></td>
</tr>