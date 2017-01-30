###
  @project simple-server
  @file index.coffee
  @purpose basically, every piece of code is in this file.
  ================================================================
###

express = require('express')
bodyParser = require('body-parser')

###
# ================================================================
# @region Global Constants
# ================================================================
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
# ================================================================
# @region Global Variables
# ================================================================
###

# create application/json parser
jsonParser = bodyParser.json()

# Instantiate an express server
app = express()

###
# ================================================================
# @region APIS/Routes
# ================================================================
###

app.get '*', (req, res)->
  res.send 'hello world'

# This responds a POST to Register
app.post '/register', jsonParser, (req, res) ->
  console.log '-------> Got a POST at Register'
  
  console.log 'got req: ', req
  
  res.send {
  	'hasError' : false
  }

###
# ================================================================
# @region Entry Point and Base Code
# ================================================================
###

# The server runs here
PORT = process.env.PORT || 8080
server = app.listen(PORT, ->
  host = server.address().address
  port = server.address().port
  console.log "project-arachnid running at http://#{host}:#{port}"
  return
)