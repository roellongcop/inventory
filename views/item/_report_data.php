
<tr>
	<td>
		<?= ucwords($model['name']) ?>
	</td>

	<td>
		<?= ucwords($model['category']['name']) ?>
	</td>

	<td>
		<?= number_format($model['price'], 2) ?>
	</td>

	<td>
		<?= $model['quantity'] ?>
	</td>

	<td>
		<?= ucwords($model['supplier']['name']) ?>
	</td>
	
	<td>
		<?= ucwords($model['unit']['name']) ?>
	</td>
</tr>
