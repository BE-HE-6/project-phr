### Blood Pressure

#### GET Method

```http
  GET /api/blood_pressure
```

```http
  GET /api/blood_pressure/:id
```

| Parameter | Type      | Description |
| :-------- | :-------- | :---------- |
| `id`      | `integer` | _Optional_  |

#### POST Method

```http
  POST /api/blood_pressure
```

| Parameter                     | Type       | Description  |
| :---------------------------- | :--------- | :----------- |
| `user_id`                     | `integer`  | **Required** |
| `blood_pressure_condition_id` | `integer`  | **Required** |
| `sistole`                     | `integer`  | **Required** |
| `diastole`                    | `integer`  | **Required** |
| `pulse`                       | `integer`  | **Required** |
| `note`                        | `text`     | _Optional_   |
| `date_time`                   | `datetime` | **Required** |

#### DELETE Method

```http
  DELETE /api/blood_pressure/:id
```

| Parameter | Type      | Description  |
| :-------- | :-------- | :----------- |
| `id`      | `integer` | **Required** |
