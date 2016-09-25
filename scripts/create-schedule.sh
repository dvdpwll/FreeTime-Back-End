#!/bin/bash

curl --include --request POST http://localhost:3000/schedules \
  --header "Authorization: Token token=BAhJIiVkNWIyZGM0NjMwM2VlODY1YjY2MTQxYjg2OGY4ODIxZAY6BkVG--315f48d6a513430f4693114413c714c47666ddfc" \
  --header "Content-Type: application/json" \
  --data '{
    "schedule": {
      "title": "work1",
      "day": "monday",
      "start": "09:00",
      "end": "17:00"
    }
  }'
