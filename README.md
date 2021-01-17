# Artist Pals
<img width="1023" alt="Screen Shot 2021-01-17 at 2 22 52 PM" src="https://user-images.githubusercontent.com/59414750/104856397-bac6d700-58cf-11eb-803a-0393424a4a30.png">

Artist Pals is an internal API built for a ficticious e-commerce website that's dedicated to selling K-pop merchandise. In the world of K-pop, there are a variety of exclusive merchandise that can only be obtained at certain events such as concerts, fan meetings, comebacks, etc. Many of these items are unavailable for purchase over an official website. Artist Pals offers fans the opportunity to exchange, sell, and purchase items. Please enjoy this API.

## Installation Directions

1. Run `git clone git@github.com:melatran/artist-pals.git` if you want the repo on your local machine
2. Run `bundle install` to install the gems
3. Run `rake db:reset`
4. Run `bundle exec rake import` to load seeds
5. Run `rails s` to start the server
6. On your browser, enter `http://localhost:3000`
7. In PostMan, enter `http://localhost:3000` + the endpoints below to try it for yourself

## Endpoints
### Merchant Endpoints
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

**GET** /api/v1/merchants/:merchant_id (get one merchant shop back)

*Response*

```
{
    "data": {
        "id": "1",
        "type": "merchant",
        "attributes": {
            "name": "Light Stick Shop",
            "id": 1
        }
    }
}
```

**GET** /api/v1/merchants/:merchant_id/items (get all the items for one merchant)

*Response*

```
{
    "data": [
        {
            "id": "1",
            "type": "item",
            "attributes": {
                "id": 1,
                "name": "Super Junior Light Stick",
                "description": "Version 1",
                "photo": "https://cdn.shopify.com/s/files/1/2420/2037/products/suju1.1_1024x1024.jpg?v=1570294064",
                "unit_price": 35.23,
                "merchant_id": 1
            }
        },
        {
            "id": "2",
            "type": "item",
            "attributes": {
                "id": 2,
                "name": "EXO Light Stick",
                "description": "Version 3 with three light levels",
                "photo": "https://i.ytimg.com/vi/C8Lt4HpzJ1U/maxresdefault.jpg ",
                "unit_price": 35.76,
                "merchant_id": 1
            }
        },
        {
            "id": "3",
            "type": "item",
            "attributes": {
                "id": 3,
                "name": "DAY6 Light Band",
                "description": "Not a lightstick but a light band bracelet",
                "photo": "https://pm1.narvii.com/6926/39174cd1b302e8fd8e3022f540a08ca246b4da62r1-735-593v2_uhq.jpg",
                "unit_price": 23.01,
                "merchant_id": 1
            }
        }
    ]
}
```

### Item Endpoints
**GET** /api/v1/items (get all items available in all stores)

*Response*
```
{
    "data": [
        {
            "id": "1",
            "type": "item",
            "attributes": {
                "id": 1,
                "name": "Super Junior Light Stick",
                "description": "Version 1",
                "photo": "https://cdn.shopify.com/s/files/1/2420/2037/products/suju1.1_1024x1024.jpg?v=1570294064",
                "unit_price": 35.23,
                "merchant_id": 1
            }
        },
        {
            "id": "5",
            "type": "item",
            "attributes": {
                "id": 5,
                "name": "GOT7 Sticker Pack",
                "description": "A collection of random stickers of GOT7",
                "photo": "https://i.etsystatic.com/16960599/r/il/965ca5/1851639955/il_570xN.1851639955_fmx5.jpg",
                "unit_price": 687.23,
                "merchant_id": 2
            }
        },
        {
            "id": "6",
            "type": "item",
            "attributes": {
                "id": 6,
                "name": "SJ Returns",
                "description": "Stickers inspired by SJ Returns",
                "photo": "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/i/49c4ddcb-3d71-411e-8a32-79e215993a20/dcxa89g-1de69693-af88-4f16-9e90-c51fccb339e3.jpg",
                "unit_price": 159.25,
                "merchant_id": 2
            }
        },
        {
            "id": "7",
            "type": "item",
            "attributes": {
                "id": 7,
                "name": "NCT Logo",
                "description": "NCT Logo Sticker 1 pack",
                "photo": "https://images-na.ssl-images-amazon.com/images/I/61irOtwV6SL._AC_SX522_.jpg",
                "unit_price": 311.63,
                "merchant_id": 2
            }
        },
        {
            "id": "8",
            "type": "item",
            "attributes": {
                "id": 8,
                "name": "DAY6 Dolls",
                "description": "All of Day6 dolls",
                "photo": "https://pbs.twimg.com/media/Dmi7OhIUcAY_5M4.jpg",
                "unit_price": 343.55,
                "merchant_id": 3
            }
        }
    ]
}
```

**GET** /api/v1/items/:item_id (get one item back)

*Response*

```
{
    "data": {
        "id": "5",
        "type": "item",
        "attributes": {
            "id": 5,
            "name": "GOT7 Sticker Pack",
            "description": "A collection of random stickers of GOT7",
            "photo": "https://i.etsystatic.com/16960599/r/il/965ca5/1851639955/il_570xN.1851639955_fmx5.jpg",
            "unit_price": 687.23,
            "merchant_id": 2
        }
    }
}
```

**POST** /api/v1/items (create one item)

*Body*

```
{
  "name": "MAMAMOO Light Stick",
  "description": "a lightstick shaped like a radish",
  "photo": "https://i.ebayimg.com/images/g/-YYAAOSwIDZbPXbz/s-l400.jpg",
  "unit_price": 35.23,
  "life": "test",
  "merchant_id": 1
}
```

*Response*

```{
    "data": {
        "id": "18",
        "type": "item",
        "attributes": {
            "id": 18,
            "name": "MAMAMOO Light Stick",
            "description": "a lightstick shaped like a radish",
            "photo": "https://i.ebayimg.com/images/g/-YYAAOSwIDZbPXbz/s-l400.jpg",
            "unit_price": 35.23,
            "merchant_id": 1
        }
    }
}
```

**PATCH** /api/v1/items/:item_id (edit an item's information)

*Body*

```
{
    "description": " for their fans a radish"
}
```

*Response*

```
{
    "data": {
        "id": "18",
        "type": "item",
        "attributes": {
            "id": 18,
            "name": "MAMAMOO Light Stick",
            "description": " for their fans a radish",
            "photo": "https://i.ebayimg.com/images/g/-YYAAOSwIDZbPXbz/s-l400.jpg",
            "unit_price": 35.23,
            "merchant_id": 1
        }
    }
}
```

**DELETE** /api/v1/items/:item_id (remove an item from shop)

### Search Endpoints
**GET** /api/v1/merchants/find?parameters (find one merchant that matches the shop)

*Response*

```
/api/v1/merchants/find?name=plush shop

{
    "data": {
        "id": "3",
        "type": "merchant",
        "attributes": {
            "name": "Plush Shop",
            "id": 3
        }
    }
}
```

**GET** /api/v1/merchants/find_all?parameters (find all merchants that match the search criteria)

*Response*

```
/api/v1/merchants/find_all?name=shop
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

**GET** /api/v1/items/find_all?parameters(find all items that match the search criteria)

```
/api/v1/items/find_all?description=exo

{
    "data": [
        {
            "id": "5",
            "type": "item",
            "attributes": {
                "id": 5,
                "name": "GOT7 Sticker Pack",
                "description": "A collection of random stickers of GOT7",
                "photo": "https://i.etsystatic.com/16960599/r/il/965ca5/1851639955/il_570xN.1851639955_fmx5.jpg",
                "unit_price": 687.23,
                "merchant_id": 2
            }
        },
        {
            "id": "10",
            "type": "item",
            "attributes": {
                "id": 10,
                "name": "GOT7 Jackson",
                "description": "GOT7 Gotoon",
                "photo": "https://pm1.narvii.com/6963/7d1a8154b9290b960f38eb2c6d2fa6211dfba067r1-768-1024v2_uhq.jpg",
                "unit_price": 340.18,
                "merchant_id": 3
            }
        }
    ]
}
```
