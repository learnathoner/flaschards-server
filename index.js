const express = require('express')
var bodyParser = require('body-parser')
// SQL 
const { promiseQuery } = require('./db/db_index')
const { FETCH_DECKS } = require('./db/queries')

var app = express()

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

app.get('/', (req, res) => {
  promiseQuery(FETCH_DECKS)
    .then(decks => {
      res.json(decks);
    }) 
    .catch(err => res.end())
})

const port = process.env.PORT || 3000;

app.listen(port, () => console.log(`Example app listening on port ${port}!`))