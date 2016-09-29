#!/bin/bash

curl --include --request DELETE http://localhost:3000/schedules/1 \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json"
