// Fetch decks, name, score, and cardcount
exports.FETCH_DECKS = `SELECT d.deckname, d.score, COUNT(c.id) AS cardCount FROM decks d
LEFT JOIN cards c ON d.id = c.deck_id
GROUP BY d.deckname, d.score;`;

// Fetch cards in each deck
exports.FETCH_DECK = deckName => {
  return `SELECT * FROM cards c 
	INNER JOIN decks d ON c.deck_id = d.id
	WHERE d.deckname = '${deckName}';`;
};

exports.ADD_DECK = deckName => `
	INSERT INTO decks(deckname, score)
		VALUES('${deckName}', 0) 
`;
