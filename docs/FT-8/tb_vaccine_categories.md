### Vaccine Categories

-   ##### Get All Vaccine Categories

    ```ruby
    GET /api/vaccine_categories
    ```

-   ##### Get Vaccine Category

    ```ruby
    GET /api/vaccine_categories/:id
    ```

    | Parameter | Type      | Description    |
    | :-------- | :-------- | :------------- |
    | `id`      | `integer` | **_Required_** |

-   ##### Create Vaccine Category

    ```ruby
    POST /api/vaccine_categories
    ```

    | Parameter | Type     | Description    |
    | :-------- | :------- | :------------- |
    | `name`    | `string` | **_Required_** |

-   ##### Update Vaccine Category

    ```ruby
    PUT /api/vaccine_categories/:id
    ```

    | Parameter | Type      | Description    |
    | :-------- | :-------- | :------------- |
    | `id`      | `integer` | **_Required_** |
    | `name`    | `string`  | **_Required_** |

-   ##### Delete Vaccine Category

    ```ruby
    DELETE /api/vaccine_categories/:id
    ```

    | Parameter | Type      | Description    |
    | :-------- | :-------- | :------------- |
    | `id`      | `integer` | **_Required_** |

[![Run in Postman](https://run.pstmn.io/button.svg)](https://documenter.getpostman.com/view/5427578/UzJETz9V)
