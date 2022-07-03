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

| Parameter | Type      | Description |
| :-------- | :-------- | :---------- |
| `blood_glucose`      | `integer` | ***Required***  |
| `note`      | `string` | _Optional_  |
| `user_id`      | `integer` | ***Required***  |
| `blood_glucose_condition_id`      | `integer` | ***Required***  |

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
