fs = require 'fs'
path = require 'path'

module.exports = (robot) ->
  p = path.resolve __dirname, 'src'
  fs.exists p, (exists) ->
    if exists
      for file in fs.readdirSync(p)
        robot.loadFile p, file
