### Lab Results

- #### Get Lab Results by ID

    ```ruby
    GET /api/lab_results/:id
    ```

    | Parameter | Type      | Description    |
    | :-------- | :-------- | :------------- |
    | `id`    | `integer` | **_Required_** |

- #### Get All Lab Results

    ```ruby
    GET /api/lab_results
    ```

    | Parameter | Type      | Description    |
    | :-------- | :-------- | :------------- |
    | `name`    | `string` | **_Required_** |
    | `doc` | `string` | **_Required_** |
    | `date_time`  | `datetime` | **_Required_** |
    | `user_id` | `integer`  | **_Required_** |
    | `result_category_id`  | `integer`  | **_Required_** |
    | `result_note`    | `string`  | **_Required_** |

-   #### Create Lab Results

    ```ruby
    POST /api/lab_results
    ```

    | Parameter   | Type      | Description    |
    | :---------- | :-------- | :------------- |
    | `name`      | `integer` | Optional |
    | `doc`       | `integer` | Optional |
    | `date_time` | `string`  | Optional |
    | `user_id`   | `integer` | Optional |
    | `result_category_id`  | `integer`  | Optional |
    | `result_note`    | `string`  | Optional |

-   #### Delete Lab Results

    ```ruby
    DELETE /api/lab_results/:id
    ```

    | Parameter | Type      | Description    |
    | :-------- | :-------- | :------------- |
    | `id`      | `integer` | **_Required_** |
