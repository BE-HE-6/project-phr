### Profile

```http
  GET /api/profiles/:id
```

| Parameter | Type      | Description |
| :-------- | :-------- | :---------- |
| `id`      | `integer` | Optional    |

```http
  PUT /api/profiles/:id
```

| Parameter     | Type      | Description  |
| :------------ | :-------- | :----------- |
| `id`          | `integer` | **Required** |
| `email`       | `string`  | **Required** |
| `password`    | `string`  | **Required** |
| `name`        | `string`  | Optional     |
| `birth_place` | `string`  | Optional     |
| `birth_date`  | `date`    | Optional     |
| `blood_type`  | `string`  | Optional     |
| `bpjs_id`     | `string`  | Optional     |
| `ktp_id`      | `string`  | Optional     |

[![Run in Postman](https://run.pstmn.io/button.svg)](https://documenter.getpostman.com/view/21008529/UzJETzbz)
