<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Item;

/**
 * ItemSearch represents the model behind the search form of `app\models\Item`.
 */
class ItemSearch extends Item
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'max', 'min', 'quantity', 'category_id', 'supplier_id', 'unit_id'], 'integer'],
            [['name', 'serial', 'barcode'], 'safe'],
            [['price'], 'number'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params, $limit = 10)
    {
        $query = Item::find()->where(['is_deleted' => 0]);

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => [
                'defaultOrder' => [
                    'id' => SORT_DESC
                ]
            ],
            'pagination' => [
                'pageSize' => $limit
            ]
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'price' => $this->price,
            'max' => $this->max,
            'min' => $this->min,
            'quantity' => $this->quantity,
            'category_id' => $this->category_id,
            'supplier_id' => $this->supplier_id,
            'unit_id' => $this->unit_id,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'serial', $this->serial])
            ->andFilterWhere(['like', 'barcode', $this->barcode]);

        return $dataProvider;
    }


    public static function one($field = "", $value)
    {
        if ($field === "") {
            return Sale::findOne($value);
        }
        return Sale::findOne([$field => $value]);
    }


    public static function bySerial($serial)
    {
        return Item::findOne(['serial' => $serial]);
    }


    public static function fetch($array = true)
    {
        if ($array === true) {
            return  Item::find(['is_deleted' => 0])
                ->innerJoinWith('category')
                ->innerJoinWith('unit')
                ->innerJoinWith('supplier')
                ->asArray()
                ->all();
        }

        return Item::find(['is_deleted' => 0])
            ->innerJoinWith('category')
            ->innerJoinWith('unit')
            ->innerJoinWith('supplier')
            ->all();
    }


}
