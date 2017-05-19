var express = require('express');
var router = express.Router();

var db = require('../database/queries')

/* GET home page. */
router.get('/', db.getAllMusic)
router.get('/api/music', db.getAllMusic);
router.get('/api/music/songs/', db.getSingleSong);
router.get('/api/music/album/', db.getSingleAlbum);
router.post('/api/music/add/', function( req, res ) {
  const { song_title, artist } = req.body
  console.log(req.body);
  console.log( 'TITLE', song_title )
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
