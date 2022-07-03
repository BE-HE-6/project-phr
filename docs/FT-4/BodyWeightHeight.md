### Blood Pressure

#### GET Method

```ruby
  GET /api/body_weight_height
```

```ruby
  GET /api/body_weight_height/:id
```

| Parameter | Type      | Description |
| :-------- | :-------- | :---------- |
| `id`      | `integer` | _Optional_  |

#### POST Method

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

#### DELETE Method

```ruby
  DELETE /api/body_weight_height/:id
```

| Parameter | Type      | Description  |
| :-------- | :-------- | :----------- |
| `id`      | `integer` | **Required** |

[![Run in Postman](https://run.pstmn.io/button.svg)](https://documenter.getpostman.com/view/18486227/UzJETz9e)
