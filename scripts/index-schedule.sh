#!/bin/bash

curl --include --request GET http://localhost:3000/schedules/ \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json"
