var express = require('express');
var router = express.Router();

var db = require('../database/queries')

/* GET home page. */
router.get('/', function(req, res, next) {
  //res.render('index', { title: 'Express' });
  res.render('index.pug', { title: 'Music Player' });
  //res.send("Music_Player beta v1.0.0")
});

router.get('/api/music', db.getAllMusic);
router.get('/api/music/songs/:id', db.getSingleSong);



router.get('/api/music/album/:id', db.getSingleAlbum);
router.post('/api/music/add/', function( req, res ) {
  const { song_title, artist } = req.body
  console.log(req.body);
  //const song_title = req.body.song_title
  //const length = req.body.length
  //const song_count = req.body.song_count
  console.log( 'TITLE', song_title )
  //console.log( 'LENGTH', length )
  //console.log( 'COUNT', song_count )
  console.log( 'BODY ', req.body)

  db.createSong( song_title, artist )
    .then( function() { res.status(201).json({
          status: 'success',
          message: 'Inserted one song'
        })
      })
    .catch( function( error ) {
      res.send( error )
    })
})

router.put('/api/music', db.updateSong);
router.delete('/api/music', db.removeSong);

function getAllMusic(req, res, next) {};
function getSingleSong(req, res, next) {};
function createSong(req, res, next){};
function updateSongs(req, res, next) {};
function removePuppy(req, res, next) {};



module.exports = router;
