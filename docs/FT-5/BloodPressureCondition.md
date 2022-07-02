### Blood Pressure Condition

#### GET Method

```http
  GET /api/blood_pressure_condition
```

```http
  GET /api/blood_pressure_condition/:id
```

| Parameter | Type      | Description |
| :-------- | :-------- | :---------- |
| `id`      | `integer` | _Optional_  |

#### POST Method

```http
  POST /blood_pressure_condition
```

#### PUT Method

| Parameter | Type     | Description  |
| :-------- | :------- | :----------- |
| `name`    | `string` | **Required** |

```http
  PUT /api/blood_pressure_condition/:id
```

| Parameter | Type      | Description  |
| :-------- | :-------- | :----------- |
| `id`      | `integer` | **Required** |
| `name`    | `string`  | _Optional_   |

#### DELETE Method

```http
  DELETE /api/blood_pressure_condition/:id
```

| Parameter | Type      | Description  |
| :-------- | :-------- | :----------- |
| `id`      | `integer` | **Required** |
