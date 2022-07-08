### Blood Oxygen

#### GET Method

```http
  GET /api/blood_oxygens
```

```http
  GET /api/blood_oxygens/:id
```

| Parameter | Type      | Description  |
| :-------- | :-------- | :----------- |
| `id`      | `integer` | **Required** |

#### POST Method

```http
  POST /api/blood_oxygens
```

| Parameter                   | Type      | Description    |
| :-------------------------- | :-------- | :------------- |
| `blood_oxygen`              | `integer` | **_Required_** |
| `note`                      | `string`  | _Optional_     |
| `user_id`                   | `integer` | **_Required_** |
| `blood_oxygen_condition_id` | `integer` | **_Required_** |

#### JSON Body Request Example

```
{
    "data":{
        "blood_oxygen":99,
        "note":"Test 1",
        "user_id":1,
        "blood_oxygen_condition_id":8
    }
}
```

#### DELETE Method

```http
  DELETE /api/blood_oxygens/:id
```

| Parameter | Type      | Description  |
| :-------- | :-------- | :----------- |
| `id`      | `integer` | **Required** |

[![Run in Postman](https://run.pstmn.io/button.svg)](https://documenter.getpostman.com/view/18486227/UzJMqEnF)
