// Fetch decks, name, score, and cardcount
exports.FETCH_DECKS = `SELECT d.id, d.deckname, d.score, COUNT(c.id) AS cardCount FROM decks d
LEFT JOIN cards c ON d.id = c.deck_id
GROUP BY d.id, d.deckname, d.score;`;

// Fetch cards in each deck
exports.FETCH_DECK = deckName => {
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
exports.UPDATE_SCORE = ({ deckId, score }) => `
	UPDATE decks SET score = '${score}' where id = '${deckId}'
`;
