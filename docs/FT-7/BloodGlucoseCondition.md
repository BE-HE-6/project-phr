### Blood Glucose Condition

#### POST Method

```http
  POST /api/blood_glucose_conditions
```

| Parameter | Type      | Description |
| :-------- | :-------- | :---------- |
| `name`      | `string` | ***Required***  |

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

| Parameter | Type      | Description |
| :-------- | :-------- | :---------- |
| `id`      | `integer` | ***Required***  |
| `name`      | `string` | ***Required***  |

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
