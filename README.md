# hubot-azure-redis-brain
A hubot brain using azure redis cache

## Requirements

* Running hubot on Azure App Service
* Running Azure Redis Cache
* SSL/TLS only

### How to deploy Hubot on Azure App Service

See http://www.jasonpoon.ca/2015/06/12/how-to-deploy-hubot-in-slack-to-azure/

Azure Web Site was integrated Azure App Service. So you can deploy hubot on Azure App Service similarly.

###  How to use azure redis cache

See https://azure.microsoft.com/en-us/documentation/articles/cache-nodejs-get-started/

You may skip the clause *Enable the non-SSL endpoint*, because node-redis has suporteded it already.

## Installtion

```bash
npm install hubot-azure-redis-brain --save
```

Then add hubot-azure-redis-brain to external-scripts.json

```json
[
  ...
  "hubot-azure-redis-brain",
  ...
]
```

## Configuration

You must set the following items in your Azure App Service's App settings.

* AZURE_REDIS_HOST (yourredishost.redis.cache.windows.net)
* AZURE_REDIS_PORT (default: 6380)
* AZURE_REDIS_ACCESS_KEY
* AZURE_REDIS_STORAGE_KEY
