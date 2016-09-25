#!/bin/bash

curl --include --request PATCH http://localhost:3000/schedules/1 \
  --header "Authorization: Token token=BAhJIiUyYTUxZGJhZDI1YWU3NWUzY2RkNWYzMjVhMThhZTEyZAY6BkVG--c04740e3a6dfc42630b6e86a26cb1a3a557e8fd8" \
  --header "Content-Type: application/json" \
  --data '{
    "schedule": {
      "title": "work1",
      "day": "monday",
      "start": "06:00",
      "end": "13:00",
      "user_id": '1'
    }
  }'
