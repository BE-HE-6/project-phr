### Blood Oxygen Condition

#### POST Method

```http
  POST /api/blood_oxygen_conditions
```

| Parameter | Type     | Description    |
| :-------- | :------- | :------------- |
| `name`    | `string` | **_Required_** |

#### JSON Body Request Example

```
{
    "blood_oxygen_condition":{
        "name":"bangun tidur"
    }
}
```

#### GET Method

```http
  GET /api/blood_oxygen_conditions
```

#### PUT Method

```http
  PUT /api/blood_oxygen_conditions/:id
```

| Parameter | Type      | Description    |
| :-------- | :-------- | :------------- |
| `id`      | `integer` | **_Required_** |
| `name`    | `string`  | **_Required_** |

#### JSON Body Request Example

```
{
    "blood_oxygen_condition":{
        "name":"bangun tidur"
    }
}
```

#### DELETE Method

```http
  DELETE/api/blood_oxygen_conditions/:id
```

| Parameter | Type      | Description  |
| :-------- | :-------- | :----------- |
| `id`      | `integer` | **Required** |

[![Run in Postman](https://run.pstmn.io/button.svg)](https://documenter.getpostman.com/view/18486227/UzJMqEnF)
