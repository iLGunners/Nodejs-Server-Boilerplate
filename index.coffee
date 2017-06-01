###
  @project simple-server
  @file index.coffee
  @purpose basically, every piece of code is in this file.
  ================================================================>>>
###

express = require('express')
bodyParser = require('body-parser')

###
# ================================================================\
# @region Global Constants
# ================================================================/
###

GENERIC_INVALID_OBJECT_REQUEST_RESPONSE = {
  hasError: true
  error:
    code: "VAL_ERR"
    message: "Invalid Request."
}

GENERIC_INVALID_DATA = {
  hasError: true
  error:
    code: "DATA_ERR"
    message: "Invalid Data."
}

INTERNAL_SERVER_ERROR = {
  hasError: true
  error:
    code: "INTERNAL_SERVER_ERROR"
    message: "Internal Error. Please check in after couple of hours."
}

###
# ================================================================\
# @region Global Variables
# ================================================================/
###

# create application/json parser
jsonParser = bodyParser.json()

# Instantiate an express server
app = express()

###
# ================================================================\
# @region APIS/Routes
# ================================================================/
###

app.get '*', (req, res)->
  console.log '-------> GET at *'
  res.send 'hello world!'

# This responds a POST to Register
app.post '/register', jsonParser, (req, res) ->
  console.log '-------> POST at /register'
  console.log 'got req.body: ', req.body
    
  res.send {
    "hasError": false
    "message": "this is from node server"
    "token": "this is a token from server"
  }

###
# ================================================================\
# @region Entry Point and Base Code
# ================================================================/
###

# The server runs here
PORT = process.env.PORT || 8080
server = app.listen(PORT, ->
  port = server.address().port
  console.log "simple-node-server running at http://localhost:#{port}"
  return
)