## Configuration

Tamarama uses the `dotenv` gem for managing environment variables such as database connection strings.

For you, this boils down to providing `.env.development` and `.env.test` files in the project root. Check out `example.env.test` for an example of what such a config file might look like.

```ruby
# .env.test
DATABASE_URL="postgres://user:password@localhost/myblog_test"
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
