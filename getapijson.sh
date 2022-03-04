#!/bin/bash
echo "loading openapi file"

curl -X GET "http://127.0.0.1:8000/openapi.json" > output.json

echo
echo "form"

curl -X POST "http://127.0.0.1:8000/login/" -H "Content-Type: multipart/form-data" -F "username=king.arthur@camelot.bt" -F "password=guinevere" 

echo "file"

echo "file generic"
curl -X POST "http://127.0.0.1:8000/files/" -d "file=@my-data/test.txt" 
echo
echo "file upload curl lf"
curl -L -F "file=@output.json" http://127.0.0.1:8000/uploadfile/
<<comm
curl -X POST "http://127.0.0.1:8000/" -H  "accept: application/json" -H  "Content-Type: application/json" -d "{\"test_key\":\"test_val\"}"
comm
echo curl -X GET "http://127.0.0.1:8000/items/" -H 'User-Agent:roberto federico' 
curl -X GET "http://127.0.0.1:8000/items/" -H 'User-Agent:roberto federico'

echo 
echo "put"

curl -X PUT "http://127.0.0.1:8000/items/100" -H "Content-Type: application/json" -d '
{
    "name": "Foo",
    "description": "The pretender",
    "price": 42.0,
    "tax": 3.2,
    "tags": [
        "rock",
        "metal",
        "bar"
    ],
    "images": [
        {
            "url": "http://example.com/baz.jpg",
            "name": "The Foo live"
        },
        {
            "url": "http://example.com/dave.jpg",
            "name": "The Baz"
        }
    ]
}'

echo "list"
curl -H 'Content-Type: application/json' -H 'Accept: application/json' -X POST "http://127.0.0.1:8000/images/multiple/" -d '
[
 {"url":"http://example.com/dog.jog","name":"dog"},
 {"url":"http://example.com/deer.jpg","name":"deer"}
]' 
echo

echo "dict"
curl -H 'Content-Type: application/json' -H 'Accept: application/json' -X POST "http://127.0.0.1:8000/index-weights/" -d '
{ "1":3.5,"2":"A"}
' 
