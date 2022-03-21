#!/bin/bash
echo $$
ACTION="loading api json"
echo $ACTION

curl -X GET "http://127.0.0.1:8000/openapi.json" > output.json

echo
echo "items"

curl -X GET "http://127.0.0.1:8000/items/?q=foo&limit=2" -H 'User-Agent:roberto federico'
echo 
echo "users"

curl -X GET "http://127.0.0.1:8000/users/?q=foo&limit=2&skip=5" -H 'User-Agent:roberto federico'

echo "tests"

curl -X GET "http://127.0.0.1:8000/tests/?q=pippo" -H 'User-Agent:roberto federico'

echo "tests"

curl -X GET "http://127.0.0.1:8000/dpaths/?q=pippo" -H 'x-key:fake-super-secret-key' -H 'x-token:fake-super-secret-token'

<<comm

curl -X PUT "http://127.0.0.1:8000/items/50" -H  "Content-Type: application/json" -d '
{
    "title": "Foo",
    "timestamp": "2022-03-15 16:00:00",
    "description": "Buongiorno a voi!"
}
'

<<comm
curl -X POST "http://127.0.0.1:8000/login/" -H "Content-Type: multipart/form-data" -F "username=king.arthur@camelot.bt" -F "password=guinevere" 

echo "file"

echo "file generic"
curl -X POST "http://127.0.0.1:8000/files/" -d "file=@my-data/test.txt" 
echo
echo "file upload curl lf"
curl -L -F "file=@output.json" http://127.0.0.1:8000/uploadfile/

curl -X POST "http://127.0.0.1:8000/" -H  "accept: application/json" -H  "Content-Type: application/json" -d "{\"test_key\":\"test_val\"}"
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
'''
echo 
echo "request form & file "
curl -L -F "file=@output.json" -F "fileb=@my-data/test.txt" -F "token='XXXX'" http://127.0.0.1:8000/files/
' 

curl -X POST "http://127.0.0.1:8000/items/50" -H  "Content-Type: application/json" -d '
{
    "name": "Foo",
    "timestamp": "2022-03-15 16:00:00",
    "description": "Buongiorno a voi!"
}
'
comm
