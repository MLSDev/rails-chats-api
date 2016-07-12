# Rails Chats API - Sample Application

## Install

### Clone repository
```
git clone https://github.com/MLSDev/rails-chats-api
```

### Install gems
```
cd rails-chats-api
```

```
bundle install
```

### Run migrations
```
rake db:migrate
```

### Run specs
```
rake
```

### Run server
```
rails s
```

## API documentation

### Sign Up
```
curl -d 'user[email]john@mcclane.com&user[password]=superhero&user[password_confirmation]=superhero' localhost:3000/profile
```

### Sign In
```
curl -d 'session[email]=john@mcclane.com&session[password]=superhero' localhost:3000/session
```

### Get own Profile info
```
curl -H 'Authorization: Token token="XXXX-YYYY-ZZZZ"' localhost:3000/profile
```

## TODO

### Sign Out

#### Request
```
curl -H 'Authorization: Token token="XXXX-YYYY-ZZZZ"' -X DELETE localhost:3000/session
```

#### Response
```json
200 OK
```

### Customize Profile Info

#### Request
```
curl -H 'Authorization: Token token="XXXX-YYYY-ZZZZ"' localhost:3000/profile
```

#### Response
```json
{ "email": "john@mcclane.com" }
```

### GET User's List

#### Request
```
curl -H 'Authorization: Token token="XXXX-YYYY-ZZZZ"' localhost:3000/users
```

#### Response
```json
[
  { "id": 1, "name": "John McClane" },
  { "id": 2, "name": "Bruce Wayne" },
  { "id": 3, "name": "Vito Corleone" }
]
```

Note: You have to add `User#name`

### Create Chat

#### Request
```
curl -H 'Authorization: Token token="XXXX-YYYY-ZZZZ"' -d 'chat[user_ids][]=2&chat[user_ids][]=3' localhost:3000/chats
```

#### Response
```json
{
  "id": 1,
  "users": [
    { "id": 1, "name": "John McClane" },
    { "id": 2, "name": "Bruce Wayne" },
    { "id": 3, "name": "Vito Corleone" }
  ]
}
```

### Create Message

#### Request
```
curl -H 'Authorization: Token token="XXXX-YYYY-ZZZZ"' -d 'message[text]=Yipikaye ... guys' localhost:3000/chats/1/messages
```

#### Response
```json
{
  "id": 1,
  "text": "Yipikaye ... guys",
  "chat_id": 1
}
```

Note: Only participants can create message in a chat.
