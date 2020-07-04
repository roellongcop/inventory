<?php

namespace app\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "{{%unit}}".
 *
 * @property int $id
 * @property string $name
 * @property int $is_deleted
 *
 * @property Item[] $items
 */
class Unit extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%unit}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['is_deleted'], 'integer'],
            [['name'], 'string', 'max' => 50],
            ['is_deleted', 'default', 'value' => 0]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Unit Name',
            'is_deleted' => 'Is Deleted',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItems()
    {
        return $this->hasMany(Item::className(), ['unit_id' => 'id']);
    }


    public function getChartData()
    { 
        return Unit::find()
            ->alias('u')
            ->select(['u.id', 'u.name label', 'COUNT("u.*") total'])
            ->innerJoinWith("items i")
            ->where(['u.is_deleted' => 0, 'i.is_deleted' => 0])
            ->groupBy("u.name")
            ->orderBy(['total' => SORT_DESC])
            ->asArray()
            ->all(); 
    }

    public function getItemsByUnitID($unit_id)
    {
        return Item::find()
            ->alias('i')
            ->innerJoinWith('category c')
            ->innerJoinWith('supplier s')
            ->innerJoinWith('unit u')
            ->where(['i.unit_id' => $unit_id, 'i.is_deleted' => 0])
            ->asArray()
            ->all();
    }

    public static function dropDown()
    {
        $dropdown = Unit::find()
            ->where(['is_deleted' => 0])
            ->orderBy('name', 'asc')
            ->all();

        $dropdown = ArrayHelper::map($dropdown, 'id' , 'name');

        return $dropdown;
    }
}
