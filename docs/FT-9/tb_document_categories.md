### Document Categories

-   ##### Get All Document Categories

    ```ruby
    GET /api/document_categories
    ```

    Example Response
    <details>
        <summary>Response Success</summary>
        
        Status Code: 200 OK

        Body:
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

    </details>

-   ##### Get Document Category

    ```ruby
    GET /api/document_categories/:id
    ```

    | Parameter | Type      | Description    |
    | :-------- | :-------- | :------------- |
    | `id`      | `integer` | **_Required_** |

    Example Response
    <details>
        <summary>Response Success</summary>
        
        Status Code: 200 OK

        Body:
        {
            "id": 1,
            "name": "Inactivated vaccines",
            "created_at": "2022-06-21T14:17:30.212Z",
            "updated_at": "2022-06-21T14:17:30.212Z"
        }

    </details>
    <details>
        <summary>Error id Not Found</summary>
        
        Status Code: 404 Not Found

        Body:
        {
            "message": "Couldn't find TbDocumentCategory with 'id'=1"
        }

    </details>

-   ##### Create Document Category

    ```ruby
    POST /api/document_categories
    ```

    | Parameter | Type     | Description    |
    | :-------- | :------- | :------------- |
    | `name`    | `string` | **_Required_** |

    Example Response
    <details>
        <summary>Create Successfully</summary>

        Status Code: 201 Created

        Body:
        {
            "id": 1,
            "name": "Inactivated vaccines",
            "created_at": "2022-06-21T14:17:30.212Z",
            "updated_at": "2022-06-21T14:17:30.212Z"
        }

    </details>
    <details>
        <summary>Error Duplicate Name</summary>
        
        Status Code: 422 Unprocessable Entity

        Body:
        {
            "message": "Validation failed: Name has already been taken"
        }

    </details>
    <details>
        <summary>Error name Can't be Blank</summary>
        
        Status Code: 422 Unprocessable Entity

        Body:
        {
            "message": "Validation failed: Name can't be blank"
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

    Example Response
    <details>
        <summary>Update Successfully</summary>

        Status Code: 204 No Content

    </details>
    <details>
        <summary>Error id Not Found</summary>
        
        Status Code: 404 Not Found

        Body:
        {
            "message": "Couldn't find TbDocumentCategory with 'id'=1"
        }

    </details>
    <details>
        <summary>Error Duplicate Name</summary>
        
        Status Code: 422 Unprocessable Entity

        Body:
        {
            "message": "Validation failed: Name has already been taken"
        }

    </details>
    <details>
        <summary>Error name Can't be Blank</summary>
        
        Status Code: 422 Unprocessable Entity

        Body:
        {
            "message": "Validation failed: Name can't be blank"
        }

    </details>

-   ##### Delete Document Category

    ```ruby
    DELETE /api/document_categories/:id
    ```

    | Parameter | Type      | Description    |
    | :-------- | :-------- | :------------- |
    | `id`      | `integer` | **_Required_** |

    Example Response
    <details>
        <summary>Delete Successfully</summary>

        Status Code: 204 No Content

    </details>
    <details>
        <summary>Error id Not Found</summary>
        
        Status Code: 404 Not Found

        Body:
        {
            "message": "Couldn't find TbDocumentCategory with 'id'=1"
        }

    </details>
