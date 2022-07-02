### Documents

-   ##### Get All Documents

    ```ruby
    GET /api/documents
    ```

-   ##### Get Document

    ```ruby
    GET /api/documents/:id
    ```

    | Parameter | Type      | Description    |
    | :-------- | :-------- | :------------- |
    | `id`      | `integer` | **_Required_** |

-   ##### Create Document

    ```ruby
    POST /api/documents
    ```

    | Parameter              | Type                    | Description    |
    | :--------------------- | :---------------------- | :------------- |
    | `doc_name`             | `string`                | **_Required_** |
    | `doc_upload`           | `file (jpg, jpeg, png)` | **_Required_** |
    | `user_id`              | `integer`               | **_Required_** |
    | `document_category_id` | `integer`               | **_Required_** |

-   ##### Delete Document

    ```ruby
    DELETE /api/documents/:id
    ```

    | Parameter | Type      | Description    |
    | :-------- | :-------- | :------------- |
    | `id`      | `integer` | **_Required_** |
