### Blood Glucose Condition

#### POST Method

```http
  POST /api/blood_glucose_conditions
```

| Parameter | Type     | Description    |
| :-------- | :------- | :------------- |
| `name`    | `string` | **_Required_** |

#### JSON Body Request Example

```
{
    "blood_glucose_condition":{
        "name":"bangun tidur"
    }
}
```

#### GET Method

```http
  GET /api/blood_glucose_conditions
```

#### PUT Method

```http
  PUT /api/blood_glucose_conditions/:id
```

| Parameter | Type      | Description    |
| :-------- | :-------- | :------------- |
| `id`      | `integer` | **_Required_** |
| `name`    | `string`  | **_Required_** |

#### JSON Body Request Example

```
{
    "blood_glucose_condition":{
        "name":"bangun tidur"
    }
}
```

#### DELETE Method

```http
  DELETE/api/blood_glucose_conditions/:id
```

| Parameter | Type      | Description  |
| :-------- | :-------- | :----------- |
| `id`      | `integer` | **Required** |

[![Run in Postman](https://run.pstmn.io/button.svg)](https://documenter.getpostman.com/view/18486227/UzJMqEnF)
