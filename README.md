# Bookstore

## Setup

To execute migrations and load test data, run the following:
```
docker compose exec server mix ecto.migrate
docker compose exec server mix run priv/repo/seeds.exs
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
