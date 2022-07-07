### Measurement

-   #### Get All Measurements by lab result ID

    ```ruby
    GET /api/measurements/:result_id
    ```

    | Parameter           | Type      | Description    |
        | :------------------ | :-------- | :------------- |
    | `result_id`         | `integer` | **_Required_** |


-   #### Create Measurements relation by lab result ID

    ```ruby
    POST /api/measurements/
    ```

    | Parameter           | Type      | Description    |
        | :------------------ | :-------- | :------------- |
    | `result_id`         | `integer` | Optional |
    | `measurement_id`    | `integer` | Optional |
    | `value`             | `string`  | Optional |

-   #### Delete Measurements

    ```ruby
    DELETE /api/measurements/:id
    ```

    | Parameter | Type      | Description    |
        | :-------- | :-------- | :------------- |
    | `id`      | `integer` | **_Required_** |