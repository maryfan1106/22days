require('dotenv').config();
const db = require('./db');
const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

app.get('/', (req, res) => res.send('22days api'));

app.get('/stories', db.getStories);
app.post('/stories', db.postStory);

app.listen(port, () => console.log(`Listening on port ${port}`));