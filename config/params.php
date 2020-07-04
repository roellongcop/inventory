<?php

return [
    'adminEmail' => 'admin@example.com',
    'limit' => 100,
    'actions' => [
    	'index' => ['index'],
    	'default' => ['index', 'create', 'view', 'update', 'delete'],
    	'withReport' => ['index', 'create', 'view', 'update', 'delete', 'report'],
    ]
];
