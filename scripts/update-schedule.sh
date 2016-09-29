#!/bin/bash

curl --include --request PATCH http://localhost:3000/schedules/1 \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "schedule": {
      "title": "work1",
      "day": "monday",
      "start": "06:00",
      "end": "13:00",
    }
  }'
