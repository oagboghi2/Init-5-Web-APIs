var express = require('express');
var router = express.Router();

var db = require('../database/queries')

/* GET home page. */
router.get('/', function(req, res, next) {
  //res.render('index', { title: 'Express' });
  res.send("Music_Player beta v1.0.0")
});

router.get('/api/music', db.getAllMusic);
router.get('/api/music/songs/:id', db.getSingleSong);
router.get('/api/music/album/:id', db.getSingleAlbum);
router.post('/api/music', db.createSong);
router.put('/api/music', db.updateSong);
router.delete('/api/music', db.removeSong);

function getAllMusic(req, res, next) {};
function getSingleSong(req, res, next) {};
function createSong(req, res, next){};
function updateSongs(req, res, next) {};
function removePuppy(req, res, next) {};



module.exports = router;
