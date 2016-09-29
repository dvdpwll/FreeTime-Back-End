# FreeTime Back End

This is the back-end for the FreeTime app. This keeps track of schedules in the
following fields: title, day, start, end.

## Links

[FreeTime-Front-End Github](https://github.com/dvdpwll/FreeTime-Front-End)
[Deployed FreeTime-Front-End](https://dvdpwll.github.io/FreeTime-Front-End/)
[Deployed FreeTime-Back-End](https://fathomless-coast-53196.herokuapp.com/)

### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl --include --request POST http://localhost:3000/sign-up \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password",
      "password_confirmation": "an example password"
    }
  }'
```

```sh
scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email"
  }
}
```

#### POST /sign-in

Request:

```sh
curl --include --request POST http://localhost:3000/sign-in \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password"
    }
  }'
```

```sh
scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email",
    "token": "33ad6372f795694b333ec5f329ebeaaa"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH http://localhost:3000/change-password/$ID \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "an example password",
      "new": "super sekrit"
    }
  }'
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl --include --request DELETE http://localhost:3000/sign-out/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl --include --request GET http://localhost:3000/users \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "another@example.email"
    },
    {
      "id": 1,
      "email": "an@example.email"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:3000/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "another@example.email"
  }
}
```

### Schedules

| Verb   | URI Pattern            | Controller#Action   |
|--------|------------------------|---------------------|
| POST   | `/schedules`           | `schedules#create`  |
| GET    | `/schedules`           | `schedules#index`   |
| PATCH  | `/schedules/:id`       | `schedules#update`  |
| DELETE | `/schedules/:id`       | `schedules#destroy` |

#### POST /schedules

Request:

```sh
curl --include --request POST http://localhost:3000/schedules \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "schedule": {
      "title": "example",
      "day": "Mon||Tue||Wed||Thu||Fri||Sat||Sun",
      "start": "09:00",
      "end": "17:00"
    }
  }'
```

```sh
scripts/create-schedule.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "schedule": {
    "id": 1,
    "title": "example",
    "day": "Mon",
    "start": "09:00",
    "end": "17:00"
  }
}
```

#### GET /schedule

Request:

```sh
curl --include --request GET http://localhost:3000/schedules/ \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json"
```

```sh
scripts/index-schedule.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "schedule": {
    "id": 1,
    "title": "example",
    "day": "Mon",
    "start": "09:00",
    "end": "17:00"
  }
}
```

#### PATCH /schedules/:id

Request:

```sh
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
```

```sh
scripts/update-schedule.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE //schedules/:id

Request:

```sh
curl --include --request DELETE http://localhost:3000/schedules/1 \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json"
```

```sh
scripts/delete-schedule.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.
