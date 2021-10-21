# Basic Ruby on Rails: Top Score Ranking

#### Ruby version
* ruby-2.6.3

#### Rails version
* 'rails', '~> 6.1.4', '>= 6.1.4.1'

#### Database version
* 'sqlite3', '~> 1.4'

#### System dependencies
* 'kaminari'
* 'rspec-rails'

## Build and run your app
* Install the gems using **`bundle install`**

* Create the database **`rake db:create`**

* Run the migrations **`rake db:migrate`**

## How to run the test suite
* **`rspec spec/request/player_scores_spec.rb`**

    or  

* **`rspec`**


# API Document

## Create player score
```http
POST /player_scores?playername=Inoue Naoki&score=2323
```

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `playername` | `string` | **Required**
| `score` | `integer` | **Required**

#### Response
```javascript
{
    "id": integer,
    "scoreid": string,
    "playername": string,
    "score": integer,
    "time": string,
    "created_at": string,
    "updated_at": string
}

example

{
    "id": 20,
    "scoreid": "20-1634784369",
    "playername": "Kusal Perera",
    "score": 3445,
    "time": "2021-10-21T02:46:09.798Z",
    "created_at": "2021-10-21T02:46:09.816Z",
    "updated_at": "2021-10-21T02:46:09.816Z"
}
```

## Show all players scores data
```http
GET /player_scores?page=1&rows=20
```

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `page` | `string` | **Required**
| `rows` | `integer` | **Required**
| `after` | `string` | **Not Required**
| `before` | `string` | **Not Required**
| `playernames` | `array` | **Not Required**

#### Response
```javascript
[
    {
        "id": integer,
        "scoreid": string,
        "playername": string,
        "score": integer,
        "time": string,
        "created_at": string,
        "updated_at": string
    }
]

example
[
    {
        "id": 20,
        "scoreid": "20-1634784369",
        "playername": "Kusal Perera",
        "score": 3445,
        "time": "2021-10-21T02:46:09.798Z",
        "created_at": "2021-10-21T02:46:09.816Z",
        "updated_at": "2021-10-21T02:46:09.816Z"
    }
]
```

## Show single player score data
```http
GET /player_scores/1
```

#### Response
```javascript
{
    "id": integer,
    "scoreid": string,
    "playername": string,
    "score": integer,
    "time": string,
    "created_at": string,
    "updated_at": string
}

example
{
    "id": 20,
    "scoreid": "20-1634784369",
    "playername": "Kusal Perera",
    "score": 3445,
    "time": "2021-10-21T02:46:09.798Z",
    "created_at": "2021-10-21T02:46:09.816Z",
    "updated_at": "2021-10-21T02:46:09.816Z"
}
```

## Show single player scores data
```http
GET /player_scores/playername
```

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `playername` | `string` | **Required**


#### Response
```javascript
[
    {
        "id": integer,
        "scoreid": string,
        "playername": string,
        "score": integer,
        "time": string,
        "created_at": string,
        "updated_at": string
    }
]

example
[
    {
        "id": 20,
        "scoreid": "20-1634784369",
        "playername": "Kusal Perera",
        "score": 3445,
        "time": "2021-10-21T02:46:09.798Z",
        "created_at": "2021-10-21T02:46:09.816Z",
        "updated_at": "2021-10-21T02:46:09.816Z"
    }
]
```

## Show single player max score data
```http
GET /player_scores/maxscore
```

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `playername` | `string` | **Required**


#### Response
```javascript
{
    "id": integer,
    "scoreid": string,
    "playername": string,
    "score": integer,
    "time": string,
    "created_at": string,
    "updated_at": string
}

example
{
    "id": 20,
    "scoreid": "20-1634784369",
    "playername": "Kusal Perera",
    "score": 3445,
    "time": "2021-10-21T02:46:09.798Z",
    "created_at": "2021-10-21T02:46:09.816Z",
    "updated_at": "2021-10-21T02:46:09.816Z"
}
```

## Show single player low score data
```http
GET /player_scores/lowscore
```

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `playername` | `string` | **Required**


#### Response
```javascript
{
    "id": integer,
    "scoreid": string,
    "playername": string,
    "score": integer,
    "time": string,
    "created_at": string,
    "updated_at": string
}

example
{
    "id": 20,
    "scoreid": "20-1634784369",
    "playername": "Kusal Perera",
    "score": 3445,
    "time": "2021-10-21T02:46:09.798Z",
    "created_at": "2021-10-21T02:46:09.816Z",
    "updated_at": "2021-10-21T02:46:09.816Z"
}
```

## Show single player avarage score
```http
GET /player_scores/lowscore
```

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `playername` | `string` | **Required**


#### Response
```javascript
{
    "avascore": integer,
}

example
{
    "avascore": 750
}
```

## Delete single player score data
```http
DELETE /player_scores/1
```
#### Response
```javascript
integer

example
1
```






