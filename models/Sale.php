<?php

namespace app\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "{{%sales}}".
 *
 * @property int $id
 * @property string $item
 * @property double $total
 * @property string $customer_id
 * @property string $sale_date
 * @property int $user_id
 *
 * @property User $user
 */
class Sale extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sale}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['item', 'total', 'customer_id', 'sale_date', 'user_id', 'invoice'], 'required'],
            [['item'], 'string'],
            [['total'], 'number'],
            [['user_id'], 'integer'],
            [['customer_id'], 'unique'],
            [['customer_id', 'sale_date'], 'string', 'max' => 20],
            [
                ['user_id'], 
                'exist', 
                'skipOnError' => true, 
                'targetClass' => User::className(), 
                'targetAttribute' => ['user_id' => 'id']
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'item' => 'Purchased Item',
            'total' => 'Total',
            'customer_id' => 'Transaction ID',
            'sale_date' => 'Sale Date',
            'user_id' => 'Incharge',
            'invoice' => 'Invoice',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    public function getSales($date)
    {
        if ($date == 'Y') 
        {
            $where = ['YEAR(sale_date)' => date('Y')];
        } 
        elseif ($date == 'm') 
        {
            $where = ['MONTH(sale_date)' => date('m'), 'YEAR(sale_date)' => date('Y')];
        } 
        elseif ($date == 'W') 
        {
            $where = [
                'WEEK(sale_date)' => date('W'), 
                'MONTH(sale_date)' => date('m'), 
                'YEAR(sale_date)' => date('Y')
            ];
        } 
        elseif ($date == 'd') 
        {
            $where = ['sale_date' => date('Y-m-d')];
        } 
        else 
        {
            $where = ['YEAR(sale_date)' => $date];
        }

        return Sale::find()
            ->select('SUM(total) total')
            ->where($where)
            ->one()['total'];
    }

    public function getMonthlySale($month, $year) 
    {
        return Sale::find()
            ->select('SUM(total) total')
            ->where(['MONTH(sale_date)' => $month, 'YEAR(sale_date)' => $year])
            ->one()['total'];
    }

    public static function getDistinctYears()
    {
        $years =  Sale::find()
            ->select('YEAR(sale_date) as sale_date')
            ->where('YEAR(sale_date) != "NULL"')
            ->distinct('sale_date')
            ->all();

        $years = ArrayHelper::map($years, 'sale_date' , 'sale_date');

        return $years;

    }

}
