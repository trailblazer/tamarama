## Installation

Needs `.env.development` and `.env.test`.

```ruby
# .env.test
DATABASE_URL="postgres://user:password@localhost/ch_test"
```

## Migrations

```
RACK_ENV=test rake db:migrate
RACK_ENV=test rake db:migrate[0]
```

## Testing Connection

```
RACK_ENV=test rake db:debug
```
