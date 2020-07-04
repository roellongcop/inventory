<?php

namespace app\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "{{%supplier}}".
 *
 * @property int $id
 * @property string $name
 * @property string $telephone
 * @property string $address
 * @property int $is_deleted
 *
 * @property Item[] $items
 */
class Supplier extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%supplier}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'telephone', 'address'], 'required'],
            [['address'], 'string'],
            [['is_deleted'], 'integer'],
            [['name'], 'string', 'max' => 50],
            [['telephone'], 'string', 'max' => 20],
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
            'name' => 'Supplier Name',
            'telephone' => 'Telephone',
            'address' => 'Address',
            'is_deleted' => 'Is Deleted',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItems()
    {
        return $this->hasMany(Item::className(), ['supplier_id' => 'id']);
    }

    public function getChartData()
    { 
        return Supplier::find()
            ->alias('s')
            ->select(['s.id', 's.name label', 'COUNT("s.*") total'])
            ->innerJoinWith("items i")
            ->where(['s.is_deleted' => 0, 'i.is_deleted' => 0])
            ->groupBy("s.name")
            ->orderBy(['total' => SORT_DESC])
            ->asArray()
            ->all(); 
    }

    public function getItemsBySupplierID($supplier_id)
    {
        return Item::find()
            ->alias('i')
            ->innerJoinWith('category c')
            ->innerJoinWith('supplier s')
            ->innerJoinWith('unit u')
            ->where(['i.supplier_id' => $supplier_id, 'i.is_deleted' => 0])
            ->asArray()
            ->all();
    }

    public static function dropDown()
    {
        $dropdown = Supplier::find()
            ->where(['is_deleted' => 0])
            ->orderBy('name', 'asc')
            ->all();


        return ArrayHelper::map($dropdown, 'id' , 'name');
    }

}
