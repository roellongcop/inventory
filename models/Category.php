<?php

namespace app\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "{{%category}}".
 *
 * @property int $id
 * @property string $name
 * @property string $description
 * @property int $is_deleted
 *
 * @property Item[] $items
 */
class Category extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%category}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'description', 'barcode_prefix'], 'required'],
            [['description'], 'string'],
            [['is_deleted'], 'integer'],
            [['name'], 'string', 'max' => 50],
            [['barcode_prefix'], 'string', 'max' => 10],
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
            'name' => 'Category Name',
            'description' => 'Description',
            'barcode_prefix' => 'Barcode Prefix',
            'is_deleted' => 'Is Deleted',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItems()
    {
        return $this->hasMany(Item::className(), ['category_id' => 'id']);
    }


    public function getChartData()
    { 
        return Category::find()
            ->alias('c')
            ->select(['c.id', 'c.name label', 'COUNT("c.*") total'])
            ->innerJoinWith("items i")
            ->where(['c.is_deleted' => 0, 'i.is_deleted' => 0])
            ->groupBy("c.name")
            ->orderBy(['total' => SORT_DESC])
            ->asArray()
            ->all(); 
    }

    public function getItemsByCategoryID($category_id)
    {
        return Item::find()
            ->alias('i')
            ->innerJoinWith('category c')
            ->innerJoinWith('supplier s')
            ->innerJoinWith('unit u')
            ->where(['i.category_id' => $category_id, 'i.is_deleted' => 0])
            ->asArray()
            ->all();
    }

    public static function dropDown()
    {
        $dropdown = Category::find()
            ->where(['is_deleted' => 0])
            ->orderBy('name', 'asc')
            ->all();

        $dropdown = ArrayHelper::map($dropdown, 'id' , 'name');

        return $dropdown;
    }


    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) { 
            
            $this->barcode_prefix = strtoupper($this->barcode_prefix);
            return true;
        }
        return false;
    }
}
