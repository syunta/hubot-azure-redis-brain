redis = require 'redis'

module.exports = (robot) ->

  host = process.env.AZURE_REDIS_HOST
  port = process.env.AZURE_REDIS_PORT or 6380
  accessKey = process.env.AZURE_REDIS_ACCESS_KEY

  tls_option = {servername: host}
  client = redis.createClient port, host, {tls: tls_option}

  client.auth accessKey

  robot.brain.on 'save', (key, val = {}) ->
    client.set key, val #TODO: not update value

  robot.brain.on 'get', (key) ->
    client.get key, (err, reply) -> reply or err

  robot.brain.on 'close', ->
    client.quit()
