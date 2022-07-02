### Document Categories

-   ##### Get All Document Categories

    ```ruby
    GET /api/document_categories
    ```

-   ##### Get Document Category

    ```ruby
    GET /api/document_categories/:id
    ```

    | Parameter | Type      | Description    |
    | :-------- | :-------- | :------------- |
    | `id`      | `integer` | **_Required_** |

-   ##### Create Document Category

    ```ruby
    POST /api/document_categories
    ```

    | Parameter | Type     | Description    |
    | :-------- | :------- | :------------- |
    | `name`    | `string` | **_Required_** |

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
