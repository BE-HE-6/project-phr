### Vaccines

-   ##### Get All Vaccines

    ```ruby
    GET /api/vaccines
    ```

-   ##### Get Vaccine

    ```ruby
    GET /api/vaccines/:id
    ```

    | Parameter | Type      | Description    |
    | :-------- | :-------- | :------------- |
    | `id`      | `integer` | **_Required_** |

-   ##### Create Vaccine

    ```ruby
    POST /api/vaccines
    ```

    | Parameter             | Type      | Description    |
    | :-------------------- | :-------- | :------------- |
    | `id`                  | `integer` | **_Required_** |
    | `name`                | `string`  | **_Required_** |
    | `user_id`             | `integer` | **_Required_** |
    | `location`            | `string`  | **_Required_** |
    | `vaccine_category_id` | `integer` | **_Required_** |

-   ##### Delete Vaccine

    ```ruby
    DELETE /api/vaccines/:id
    ```

    | Parameter | Type      | Description    |
    | :-------- | :-------- | :------------- |
    | `id`      | `integer` | **_Required_** |

[![Run in Postman](https://run.pstmn.io/button.svg)](https://documenter.getpostman.com/view/5427578/UzJETz9V)
