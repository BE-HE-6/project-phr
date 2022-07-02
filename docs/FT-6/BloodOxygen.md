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

| Parameter | Type      | Description |
| :-------- | :-------- | :---------- |
| `blood_oxygen`      | `integer` | ***Required***  |
| `note`      | `string` | _Optional_  |
| `user_id`      | `integer` | ***Required***  |
| `blood_oxygen_condition_id`      | `integer` | ***Required***  |

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
