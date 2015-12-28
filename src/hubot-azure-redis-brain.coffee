redis = require 'redis'

module.exports = (robot) ->

  host = process.env.AZURE_REDIS_HOST
  port = process.env.AZURE_REDIS_PORT or 6380
  accessKey = process.env.AZURE_REDIS_ACCESS_KEY
  storageKey = process.env.AZURE_REDIS_STORAGE_KEY
  tls_option = {servername: host}

  robot.brain.setAutoSave false

  client = redis.createClient port, host, {tls: tls_option}

  client.auth accessKey, (err) ->
    client.get storageKey, (err, reply) ->
      robot.brain.mergeData (JSON.parse reply)

  # called by event of robot.brain.set
  robot.brain.on 'loaded', (val) ->
    client.set storageKey, JSON.stringify val

  robot.brain.on 'close', ->
    client.quit()
