### Blood Pressure

#### GET all method

```ruby
  GET /api/body_weight_height
```

#### GET Body Weight Height

```ruby
  GET /api/body_weight_height/:id
```

| Parameter | Type      | Description |
| :-------- | :-------- | :---------- |
| `id`      | `integer` | _Optional_  |

#### POST method

```ruby
  POST /api/body_weight_height
```

| Parameter   | Type       | Description  |
| :---------- | :--------- | :----------- |
| `user_id`   | `integer`  | **Required** |
| `weight`    | `float`    | **Required** |
| `height`    | `float`    | **Required** |
| `note`      | `text`     | _Optional_   |
| `date_time` | `datetime` | **Required** |

`weight` and `height` parameters based on `kg` and `cm` units.
Examples:

- if you want to set the weight parameter of 85 kg, then it can be written with
  `weight: 85.0`
- if you want to set height to 175 cm, can be written `height: 175.0` because both of weight and height expect float data type.
- this method can be automaticly return BMI (Body Mass Index) score.

#### DELETE Method

```ruby
  DELETE /api/body_weight_height/:id
```

| Parameter | Type      | Description  |
| :-------- | :-------- | :----------- |
| `id`      | `integer` | **Required** |

[![Run in Postman](https://run.pstmn.io/button.svg)](https://documenter.getpostman.com/view/18486227/UzJETz9e)
