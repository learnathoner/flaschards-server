// Fetch decks, name, score, and cardcount
exports.FETCH_DECKS = `SELECT d.id, d.deckname, d.score, c.id AS card_id FROM decks d
LEFT JOIN cards c ON d.id = c.deck_id`;

// Fetch Deck
exports.FETCH_DECK = deckname =>
  `SELECT * FROM decks d WHERE d.deckname = '${deckname}'`;

// Fetch cards in each deck
exports.FETCH_DECK_CARDS = deckName => {
  return `SELECT * FROM cards c 
	INNER JOIN decks d ON c.deck_id = d.id
	WHERE d.deckname = '${deckName}';`;
};

// Add Deck
exports.ADD_DECK = deckName => `
	INSERT INTO decks(deckname, score)
		VALUES('${deckName}', 0) 
`;

// Add Card to DeckID
exports.ADD_CARD = ({ cardFront, cardBack, deckId }) => `
	INSERT INTO cards(card_front, card_back, deck_id)
		VALUES('${cardFront}', '${cardBack}', ${deckId}) 
`;

// Update Deck Quiz score
exports.UPDATE_SCORE = ({ id, score }) => `
	UPDATE decks SET score = '${score}' where id = '${id}'
`;
