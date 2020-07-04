<?php

namespace app\models;

use Yii;
use yii\base\Model;

/**
 * ContactForm is the model behind the contact form.
 */
class PasswordResetForm extends Model
{
    public $authKey; 

    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [ 
            [['authKey'], 'required'], 
            [['authKey'], 'validateCode'], 
        ];
    }

    /**
     * @return array customized attribute labels
     */
    public function attributeLabels()
    {
        return [
            'authKey' => 'Verification Code',
        ];
    }

    public function validateCode($attribute, $params)
    {
        if (User::findOne(['authKey' => $this->authKey]) === null) {
            $this->addError($attribute, 'Code not Found.');
        }

    }

    
}
