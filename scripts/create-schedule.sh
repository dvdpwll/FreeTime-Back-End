#!/bin/bash

curl --include --request POST http://localhost:3000/schedules \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "schedule": {
      "title": "work1",
      "day": "Mon",
      "start": "09:00",
      "end": "17:00"
    }
  }'
