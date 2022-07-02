
### Registration

```http
  POST /api/sign_up
```
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `role` | `integer` | Default = 0 (User) |
| `email` | `string` | **Required** |
| `password` | `string` | **Required** |
| `name` | `string` | **Required** |
| `birth_place` | `string` | **Required** |
| `birth_date` | `date` | **Required** |
| `blood_type` | `string` | **Required** |
| `bpjs_id` | `string` | **Required** |
| `ktp_id` | `string` | **Required** |