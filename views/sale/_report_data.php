<tr>
	<td><?= $model['customer_id'] ?></td>
	<td><?= $model['item'] ?></td>
	<td>
		<span class="pull-right">
			₱ <?= number_format($model['total'], 2) ?>
		</span>
	</td>
	<td><?= $model['sale_date'] ?></td>
	<td><?= strtoupper($model->user->username) ?></td>
</tr>