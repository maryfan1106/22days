const Pool = require('pg').Pool
const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_DATABASE,
  password: process.env.DB_PASS,
})

const getStories = async (request, response) => {
    await pool.query('SELECT * FROM stories', (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    })
}

const postStory = async (request, response) => {
  const { date, title, mood, reason, story } = request.body 
  await pool.query(
      'INSERT INTO stories (date, title, mood, reason, story) VALUES ($1, $2, $3, $4, $5)',
      [date, title, mood, reason, story] ,(error, results) => {
    if (error) {
      throw error;
    }
    response.status(201).send(results);
  })
}

module.exports = {
    getStories,
    postStory
}