const express = require('express');
var bodyParser = require('body-parser');
// SQL
const { promiseQuery, insertQuery } = require('./db/db_index');
const { FETCH_DECKS, FETCH_DECK, ADD_DECK } = require('./db/queries');

var app = express();

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }));

// parse application/json
app.use(bodyParser.json());

app.get('/', (req, res) => {
  promiseQuery(FETCH_DECKS)
    .then(decks => res.json(decks))
    .catch(err => res.end());
});

app.get('/decks/:deckname', (req, res) => {
  const { deckname } = req.params;

  promiseQuery(FETCH_DECK(deckname))
    .then(deck => res.json(deck))
    .catch(err => res.end());
});

app.post('/decks/:deckname', (req, res) => {
  const { deckname } = req.params;

  insertQuery(ADD_DECK(deckname))
    .then(deck => {
      console.log(`deck has been inserted, ${deck}`);
      res.send('successfully inserted');
    })
    .catch(err => res.end());
});

const port = process.env.PORT || 3000;

app.listen(port, () => console.log(`Example app listening on port ${port}!`));
