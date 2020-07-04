<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%about}}".
 *
 * @property int $id
 * @property string $name
 * @property string $description
 * @property string $address
 * @property string $email
 * @property string $telephone
 */
class About extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%about}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'description', 'address', 'email', 'telephone'], 'required'],
            [['description', 'address'], 'string'],
            [['name'], 'string', 'max' => 200],
            [['email'], 'string', 'max' => 50],
            [['email'], 'email'],
            [['telephone'], 'string', 'max' => 20],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'description' => 'Description',
            'address' => 'Address',
            'email' => 'Email',
            'telephone' => 'Telephone',
        ];
    }
}
