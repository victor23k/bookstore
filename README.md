# Bookstore

## Setup

Build and start containers:
```
docker compose up -d
```

To execute migrations and load test data, run the following:
```
docker compose exec server mix ecto.setup
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
