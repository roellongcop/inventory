<?php
namespace app\components;

use Yii;
use app\models\Sale;
use app\models\About;
use app\models\Log;
use app\models\Item;

/**
 * 
 */
class Template extends \yii\base\Component
{
	public function message()
	{
		if (Yii::$app->session->hasFlash('success')) {
			return '
				<div class="alert alert-success">
		            '. Yii::$app->session->getFlash('success') .'
		        </div>
	        ';
		}
	}

	public function createlabel($model) 
	{
		if ($model->quantity == 0) {
	        return '<label class="label label-danger">Empty</label>';
	    } elseif ($model->quantity >= $model->max) {
	        return '<label class="label label-success">Full</label>';
	    } elseif ($model->quantity <= $model->min) {
	        return '<label class="label label-warning">Warning</label>';
	    } else {
	        return '<label class="label label-primary">Good</label>';
	    }
	}

	public function getSales($date)
	{
		return number_format(Sale::getSales($date), 2);
	}
	

	public function getAbout()
	{
		return About::findOne(1);
	}

	public function insertLog($description)
	{
		$log = new Log;
		$log->description = $description;
		$log->user_id = Yii::$app->user->identity->id;
		$log->date = date('Y-m-d H:i:s A');
		$log->save();
	} 

	// public function 
	public function getStock($status)
	{
		return Item::getStock($status);
	}

}