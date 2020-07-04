<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%moving_products}}".
 *
 * @property int $id
 * @property int $item_id
 * @property int $quantity
 * @property string $date
 *
 * @property Item $item
 */
class MovingProduct extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%moving_product}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['item_name', 'quantity', 'date'], 'required'],
            [['quantity'], 'integer'],
            [['date'], 'string', 'max' => 10],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'item_name' => 'Item Name',
            'quantity' => 'Quantity',
            'date' => 'Date',
        ];
    }



    
    public function getByName($item_name)
    {
        return self::find()
            ->select(['id', 'item_name', 'quantity', 'date'])
            ->where(['UCASE(item_name)' => $item_name])
            ->asArray()
            ->all(); 
    }

}
