### Blood Pressure Condition

#### GET Method

```ruby
  GET /api/blood_pressure_condition
```

```ruby
  GET /api/blood_pressure_condition/:id
```

| Parameter | Type      | Description |
| :-------- | :-------- | :---------- |
| `id`      | `integer` | _Optional_  |

#### POST Method

```ruby
  POST /blood_pressure_condition
```

#### PUT Method

| Parameter | Type     | Description  |
| :-------- | :------- | :----------- |
| `name`    | `string` | **Required** |

```ruby
  PUT /api/blood_pressure_condition/:id
```

| Parameter | Type      | Description  |
| :-------- | :-------- | :----------- |
| `id`      | `integer` | **Required** |
| `name`    | `string`  | _Optional_   |

#### DELETE Method

```ruby
  DELETE /api/blood_pressure_condition/:id
```

| Parameter | Type      | Description  |
| :-------- | :-------- | :----------- |
| `id`      | `integer` | **Required** |

[![Run in Postman](https://run.pstmn.io/button.svg)](https://documenter.getpostman.com/view/21008529/UzJETzbz)
