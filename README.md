# learning-api-blueprint
Repository to learn about api blueprint, aglio, drakov and dredd.
***
# Install Aglio to create, edit and generate API Documentation

> npm install -g aglio

### Generate Index.html API Documentation

> aglio -i example.apib --theme-full-width --no-theme-condense -o index.html

### Generate a dynamic API Documentation in 127.0.0.1 in port 3000 ( 127.0.0.1:3000 ) with auto refreshing.

> aglio -i example.apib --theme-full-width --no-theme-condense -s

***

# Install Drakov to create a MOCK SERVER from routes of the API Documentation

> npm install -g drakov

### Runs Drakov to create a MOCK SERVER in port 4000 ( not able auto refreshing )

> drakov -f example.apib -p 4000

***

# Install Dredd to runs route tests.

> npm install -g dredd

### Runs Dredd to execute tests in routes.

> dredd example.apib http://localhost:4000/

***

# Template that I used to generate my index.html

```
  See more examples on aglio github repository.
```

> aglio -i example.apib --theme-full-width -t cyborg -o index.html