const express = require('express');
var bodyParser = require('body-parser');
// SQL
const { promiseQuery, insertQuery, updateQuery } = require('./db/db_index');
const {
  FETCH_DECKS,
  FETCH_DECK,
  FETCH_DECK_CARDS,
  ADD_DECK,
  ADD_CARD,
  UPDATE_SCORE
} = require('./db/queries');

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

// Return cards by deckName
app.get('/decks/:deckname', (req, res) => {
  const { deckname } = req.params;

  promiseQuery(FETCH_DECK_CARDS(deckname))
    .then(deck => res.json(deck))
    .catch(err => res.end());
});

// Add card to deck
app.post('/decks/:deckname', (req, res) => {
  const { cardFront, cardBack, deckId } = req.body;

  insertQuery(ADD_CARD({ cardFront, cardBack, deckId }))
    .then(res => res.send('inserted card'))
    .catch(err => res.end());
});

// Update deck score
app.put('/decks/:deckname', (req, res) => {
  const { id, score } = req.body;

  updateQuery(UPDATE_SCORE({ id, score }))
    .then(updated => res.send(updated))
    .catch(err => res.end());
});

// Add new deck
app.post('/decks/', (req, res) => {
  const { deckname } = req.body;
  console.log(req.body);

  insertQuery(ADD_DECK(deckname))
    .then(() => {
      promiseQuery(FETCH_DECK(deckname)).then(deck => res.send(deck));
    })
    .catch(err => res.end());
});

const port = process.env.PORT || 3000;

app.listen(port, () => console.log(`Example app listening on port ${port}!`));
