# Marley Spoon Recipes

It's a simple app to show the information on the recipes from Marley Spoon.

### System dependencies
- docker, docker-compose

### How to get it up
Provision(only on first start):
```
docker-compose run --rm bash
-> bundle install
```

Start the service:
```
docker-compose up rails
```
The service will be available on URL http://localhost:3000

### How to stop the service
Press Ctrl + C in the terminal where the service is run or open another terminal tab and execute the command:
```
docker-compose down
```

### How to run the tests
```
docker-compose run --rm rspec
```

### Environment variables to configure for production
1. `RAILS_ENV` — environment the service is run in
1. `CONTENTFUL_SPACE_ID` — Space ID to the API on Contentful
1. `CONTENTFUL_ACCESS_TOKEN` — Access Token to the API on Contentful
