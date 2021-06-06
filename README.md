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


### Rationale behind the choices made
I’ve chosen Ruby on Rails as a web framework, since I’m the most familiar with it and it lets me really quickly create a fully working application.

Since we only consume the data from the external API and display it to the user, we don’t need to persist any state, therefore there is no need in a database.

To use the Contentful API I’ve picked the gem that already does the main work of making external requests under the hood and returns data in the form of Ruby objects, which are convenient to work with.

I’ve also considered that Contentful API sometimes could be unavailable or some errors could occur. To deal with this situation the error handling has been added, so that an appropriate error page is shown when it happens.

Important to mention that it is possible that there will be a lot of recipes, for that reason, the explicit pagination has been added.

