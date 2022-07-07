### Blood Pressure

#### GET Method

```ruby
  GET /api/blood_pressure
```

```ruby
  GET /api/blood_pressure/:id
```

| Parameter | Type      | Description |
| :-------- | :-------- | :---------- |
| `id`      | `integer` | _Optional_  |

#### POST Method

```ruby
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

`sistole` and `diastole` parameters based on `mmHg` units.
Examples:

- if you're checking blood pressure and get result `120/80` it means, the `sistole` value is `120` and `diastole` value is `80`
- pulse can be assign value by heartrate on each minutes

#### DELETE Method

```ruby
  DELETE /api/blood_pressure/:id
```

| Parameter | Type      | Description  |
| :-------- | :-------- | :----------- |
| `id`      | `integer` | **Required** |

[![Run in Postman](https://run.pstmn.io/button.svg)](https://documenter.getpostman.com/view/18486227/UzJFudWq)
