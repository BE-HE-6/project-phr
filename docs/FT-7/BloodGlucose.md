### Blood Glucose

#### GET Method

```http
  GET /api/blood_glucoses
```

```http
  GET /api/blood_glucoses/:id
```

| Parameter | Type      | Description  |
| :-------- | :-------- | :----------- |
| `id`      | `integer` | **Required** |

#### POST Method

```http
  POST /api/blood_glucoses
```

| Parameter                    | Type      | Description    |
| :--------------------------- | :-------- | :------------- |
| `blood_glucose`              | `integer` | **_Required_** |
| `note`                       | `string`  | _Optional_     |
| `user_id`                    | `integer` | **_Required_** |
| `blood_glucose_condition_id` | `integer` | **_Required_** |

#### JSON Body Request Example

```
{
    "data":{
        "blood_glucose":90,
        "note":"Test 1",
        "user_id":1,
        "blood_glucose_condition_id":6
    }
}
```

#### DELETE Method

```http
  DELETE /api/blood_glucoses/:id
```

| Parameter | Type      | Description  |
| :-------- | :-------- | :----------- |
| `id`      | `integer` | **Required** |

[![Run in Postman](https://run.pstmn.io/button.svg)](https://documenter.getpostman.com/view/18486227/UzJMqEnF)
