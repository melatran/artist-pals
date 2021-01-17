# Artist Pals

Artist pals is an API that supports an undeveloped front end. Artist Pals is an app designed for K-Pop fans to exchange and purchase K-pop merchandise from one another. This API consists of users, merchants, transactions, and items.

# Endpoints
## Merchant Endpoints
**GET** /api/v1/merchants (get all merchants)

*Response*

```
{
    "data": [
        {
            "id": "1",
            "type": "merchant",
            "attributes": {
                "name": "Light Stick Shop",
                "id": 1
            }
        },
        {
            "id": "2",
            "type": "merchant",
            "attributes": {
                "name": "Stick-It",
                "id": 2
            }
        },
        {
            "id": "3",
            "type": "merchant",
            "attributes": {
                "name": "Plush Shop",
                "id": 3
            }
        }
    ]
}
```

