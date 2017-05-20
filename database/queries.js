var promise = require('bluebird');

var options = {
  //Initialization Options
  promiseLib: promise
};

var pgp = require('pg-promise')(options);
var connectionString = 'postgre://localhost:5432/music';
var db = pgp(connectionString);

//add query functions
function getAllMusic(req, res, next){
  db.any('SELECT * FROM songs')
    .then(function (data){
      res.render('../views/index.pug', {data: data})
      console.log(data);
      // res.status(200)
      //     .json({
      //       status:'success',
      //       data:data,
      //       message: 'Retrieved ALL music'
      //     });
      })
      .catch(function (err){
        return next(err);
      });
    }
function getSingleAlbum(req, res, next){
      var album_title = req.query.album_title;
      console.log(req.query);
      db.any('SELECT album_title, artist FROM album WHERE album_title = $1', album_title)
      .then(function (data){
        res.render('../views/index.pug', {data: data})
        res.status(200)
          .json({
            status: 'success',
            data: data,
            message: 'Album'
          });
      })
      .catch(function (err){
        return next(err);
      });
    }


function getSingleSong(req, res, next){
  var songID = parseInt(req.query.id);
  var song_title = req.query.song_title;
  db.any('SELECT song_title, video FROM songs WHERE song_title = $1', song_title)
  .then(function (data){
    res.render('../views/index.pug', {data: data})
     res.status(200)
     .json({
        status: 'success',
        data: data,
        message: 'Song'
      });
  })
  .catch(function (err){
    return next(err);
  });
}

function createSong( song_title, artist ) {

  console.log(song_title);
  return db.one('INSERT INTO songs(song_title, artist) VALUES ($1, $2) RETURNING id',[song_title, artist])
}

function updateSong( song_title, artist ) {

  console.log(song_title);
  return db.one('UPDATE songs(song_title, artist) SET ($1, $2) RETURNING id',[song_title, artist])
}

function removeSong(req, res, next){
  var song_title = req.query.song_title;
  db.result('DELETE FROM songs WHERE song_title = $1', song_title)
}

module.exports = {
  getAllMusic: getAllMusic,
  getSingleAlbum: getSingleAlbum,
  getSingleSong: getSingleSong,
  createSong: createSong,
  updateSong: updateSong,
  removeSong: removeSong
};
