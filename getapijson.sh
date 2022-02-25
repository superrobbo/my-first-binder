#!/bin/bash
echo "loading openapi file"

curl -X GET "http://127.0.0.1:8000/openapi.json" >> output.json

