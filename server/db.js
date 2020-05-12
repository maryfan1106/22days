const Pool = require('pg').Pool
const pool = new Pool({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASS,
})

const getStories = async (request, response) => {
    response.status(200).json(
      [
        {
            "id": 1,
            "date": "May 1, 2020",
            "title": "Moody Blues",
            "mood": "happy",
            "reason": "work",
            "story": "According to all known laws of aviation, there is no way a bee should be able to fly. Its wings are too small to get its fat little body off the ground. The bee, of course, flies anyway because bees dont care what humans think is impossible. Yellow, black. Yellow, black. Yellow, black. Yellow, black. Ooh, black and yellow! Lets shake it up a little. Barry! Breakfast is ready! Ooming! Hang on a second. Hello? - Barry? - Adam? - Oan you believe this is happening? - I cant. Ill pick you up. Looking sharp. Use the stairs. Your father paid good money for those. Sorry. Im excited. Heres the graduate. Were very proud of you, son. A perfect report card, all Bs. Very proud. Ma! I got a thing going here. - You got lint on your fuzz. - Ow! Thats me! - Wave to us! Well be in row 118,000. - Bye! Barry, I told you, stop flying in the house! - Hey, Adam. - Hey, Barry. - Is that fuzz gel? - A little. Special day, graduation. Never thought Id make it. Three days grade school, three days high school. Those were awkward. Three days college. Im glad I took a day and hitchhiked around the hive. You did come back different. - Hi, Barry. - Artie, growing a mustache? Looks good. - Hear about Frankie? - Yeah. - You going to the funeral? - No, Im not going. Everybody knows, sting someone, you die. Dont waste it on a squirrel. Such a hothead. I guess he could have just gotten out of the way. I love this incorporating an amusement park into our day. Thats why we dont need vacations. Boy, quite a bit of pomp... under the circumstances. - Well, Adam, today we are men. - We are! - Bee-men. - Amen! Hallelujah!",
            "backgroundImage": "image1"
        },
        {
            "id": 2,
            "date": "May 2, 2020",
            "title": "Golden Experience",
            "mood": "happy",
            "reason": "school",
            "story": "Students, faculty, distinguished bees, please welcome Dean Buzzwell. Welcome, New Hive Oity graduating class of... ...9:15. That concludes our ceremonies. And begins your career at Honex Industries! Will we pick ourjob today? I heard it's just orientation. Heads up! Here we go. Keep your hands and antennas inside the tram at all times. - Wonder what it'll be like? - A little scary. Welcome to Honex, a division of Honesco and a part of the Hexagon Group. This is it! Wow. Wow. We know that you, as a bee, have worked your whole life to get to the point where you can work for your whole life. Honey begins when our valiant Pollen Jocks bring the nectar to the hive. Our top-secret formula is automatically color-corrected, scent-adjusted and bubble-contoured into this soothing sweet syrup with its distinctive golden glow you know as... Honey! - That girl was hot. - She's my cousin! - She is? - Yes, we're all cousins. - Right. You're right.",
            "backgroundImage": "image2"
        },
        {
            "id": 3,
            "date": "May 3, 2020",
            "title": "Purple Haze",
            "mood": "sad",
            "reason": "relationship",
            "story": "At Honex, we constantly strive to improve every aspect of bee existence. These bees are stress-testing a new helmet technology. - What do you think he makes? - Not enough. Here we have our latest advancement, the Krelman. - What does that do? - Oatches that little strand of honey that hangs after you pour it. Saves us millions. Oan anyone work on the Krelman? Of course. Most bee jobs are small ones. But bees know that every small job, if it's done well, means a lot. But choose carefully because you'll stay in the job you pick for the rest of your life. The same job the rest of your life? I didn't know that. What's the difference? You'll be happy to know that bees, as a species, haven't had one day off in 27 million years. So you'll just work us to death? We'll sure try. Wow! That blew my mind! What's the difference? How can you say that? One job forever? That's an insane choice to have to make. I'm relieved. Now we only have to make one decision in life. .",
            "backgroundImage": "image3"
        
        },
        {
            "id": 4,
            "date": "May 4, 2020",
            "title": "Bites the Dust",
            "mood": "meh",
            "reason": "family",
            "story": "Water. Earth. Fire. Air. My grandmother used to tell me stories about the old days, a time of peace when the Avatar kept balance between the Water Tribes, Earth Kingdom, Fire Nation, and Air Nomads. But that all changed when the Fire Nation attacked. Only the Avatar mastered all four elements. Only he could stop the ruthless firebenders, but when the world needed him most, he vanished. A hundred years have passed and the Fire Nation is nearing victory in the War.",
            "backgroundImage": "image4"
        },
        {
            "id": 5,
            "date": "May 5, 2020",
            "title": "Enigma",
            "mood": "happy",
            "reason": "friends",
            "story": "Water. Earth. Fire. Air. Long ago, the four nations lived together in harmony. Then, everything changed when the Fire Nation attacked. Only the Avatar, master of all four elements, could stop them, but when the world needed him most, he vanished. A hundred years passed and my brother and I discovered the new Avatar, an airbender named Aang, and although his airbending skills are great, he has a lot to learn before he's ready to save anyone. But I believe Aang can save the world.",
            "backgroundImage": "image5"
        },
        {
            "id": 6,
            "date": "May 6, 2020",
            "title": "Bad Company",
            "mood": "sad",
            "reason": "food",
            "story": "Once upon a time there was a lovely princess. But she had an enchantment upon her of a fearful sort, which could only be broken by Love's first kiss. She was locked away in a castle guarded by a terrible fire breathing dragon. Many brave knights had attempted to free her from this dreadful prison, but none prevailed. She waited in the dragon's keep in the highest room of the tallest tower for her true love and true love's first kiss. Like that's ever going to happen. What a loony. Shrek Beware Stay out I think he's in here. All right. Lets get it!",
            "backgroundImage": "image6"
        },
        {
            "id": 7,
            "date": "May 8, 2020",
            "title": "Black Sabbath",
            "mood": "meh",
            "reason": "work",
            "story": "Almost heaven, West Virginia, Blue Ridge Mountains, Shenandoah River. Life is old there, older than the trees, Younger than the mountains, growin' like a breeze. Country roads, take me home, To the place I belong, West Virginia, mountain mama, Take me home, country roads ;_;",
            "backgroundImage": "image7"
        },
        {
            "id": 8,
            "date": "May 9, 2020",
            "title": "Clash",
            "mood": "happy",
            "reason": "food",
            "story": "Baked cookies. The house smells so nice",
            "backgroundImage": "image8"
        },
        {
            "id": 10,
            "date": "May 11, 2020",
            "title": "Requiem",
            "mood": "meh",
            "reason": "school",
            "story": "skewl sux",
            "backgroundImage": "image9"
        }
    ]
    );
    // await pool.query('SELECT * FROM stories', (error, results) => {
    //   if (error) {
    //     throw error;
    //   }
    //   response.status(200).json(results.rows);
    // })
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