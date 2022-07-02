### Document Categories

-   ##### Get All Document Categories

    ```ruby
    GET /api/document_categories
    ```

    <details>
        <summary>Response Success</summary>
        <p>
            ```http
            200 OK
            ```
            [
                {
                    "id": 1,
                    "name": "Inactivated vaccines",
                    "created_at": "2022-06-21T14:17:30.212Z",
                    "updated_at": "2022-06-21T14:17:30.212Z"
                },
                {
                    "id": 2,
                    "name": "Toxoid vaccines",
                    "created_at": "2022-06-21T14:26:35.562Z",
                    "updated_at": "2022-06-21T14:26:35.562Z"
                }
            ]

        </p>

    </details>

-   ##### Get Document Category

    ```ruby
    GET /api/document_categories/:id
    ```

    | Parameter | Type      | Description    |
    | :-------- | :-------- | :------------- |
    | `id`      | `integer` | **_Required_** |

    <details>
        <summary>Response Success</summary>
        
        {
            "id": 1,
            "name": "Inactivated vaccines",
            "created_at": "2022-06-21T14:17:30.212Z",
            "updated_at": "2022-06-21T14:17:30.212Z"
        }
    </details>

-   ##### Create Document Category

    ```ruby
    POST /api/document_categories
    ```

    | Parameter | Type     | Description    |
    | :-------- | :------- | :------------- |
    | `name`    | `string` | **_Required_** |

    <details>
        <summary>Response Success</summary>

        {
            "id": 1,
            "name": "Inactivated vaccines",
            "created_at": "2022-06-21T14:17:30.212Z",
            "updated_at": "2022-06-21T14:17:30.212Z"
        }

    </details>

-   ##### Update Document Category

    ```ruby
    PUT /api/document_categories/:id
    ```

    | Parameter | Type      | Description    |
    | :-------- | :-------- | :------------- |
    | `id`      | `integer` | **_Required_** |
    | `name`    | `string`  | **_Required_** |

-   ##### Delete Document Category

    ```ruby
    DELETE /api/document_categories/:id
    ```

    | Parameter | Type      | Description    |
    | :-------- | :-------- | :------------- |
    | `id`      | `integer` | **_Required_** |
