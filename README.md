# Stats

By Chris Oliver

## Setup

```
bundle
rake db:create && rake db:migrate

# Load development data. Sets up 1M records over 16 consecutive days
rake db:seed

rails s
```

## Running Tests

```
rake db:test:prepare
rake
```
