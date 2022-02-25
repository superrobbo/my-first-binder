#!/bin/bash
echo "loading openapi file"

curl -X GET "http://127.0.0.1:8000/openapi.json" >> output.json

curl -X PUT "http://127.0.0.1:8000/itemscomplex/1" -H 'Content-Type: application/json' -d '{"item": {
        "name": "Foo",
        "description": "The pretender",
        "price": 42.0,
        "tax": 3.2
    },
    "user": {
        "username": "dave",
        "full_name": "Dave Grohl"
    }
}'
