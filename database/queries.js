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
  db.any('SELECT * FROM album')
    .then(function (data){
      res.status(200)
          .json({
            status:'success',
            data:data,
            message: 'Retrieved ALL music'
          });
      })
      .catch(function (err){
        return next(err);
      });
    }
function getSingleAlbum(req, res, next){
      var songID = parseInt(req.params.id);
      db.one('SELECT * FROM album WHERE id = $1', songID)
      .then(function (data){
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


function getSingleSong(req, res, next){
  var songID = parseInt(req.params.id);
  db.one('SELECT * FROM songs WHERE id = $1', songID)
  .then(function (data){
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

function createSong(req, res, next){
  req.body.length = parseInt(req.body.length);
  db.none('INSERT INTO songs VALUES(song_Title, length, song_Count)' + '${song_Title}, ${length}, ${song_Count})',
  req.body)
  .then(function (){
    res.status(200)
      .json({
        status: 'success',
        message: 'Inserted one song'
      })
  })
  .catch(function (err){
    return next(err);
  });
}

/* test

$ curl --data "song_Title=Fantasy&length=4&song_Count=4" \
http://127.0.0.1:3000/api/puppies

*/

function updateSong(req, res, next){
  db.none('UPDATE songs SET songTitle = $1, length = #2, songCount = $3',
[req.body.name, req.body.songTitle, parseInt(req.body.length), parse(req.body.songCount)])
  .then(function (){
    res.status(200)
      .json({
          status: 'success',
          message: 'update song'
      })
  })
  .catch(function(err){
    return next(err);
  });
}

function removeSong(req, res, next){
  var songID = parseInt(req.params.id);
  db.result('DELETE FROM songs WHERE id = $1', songID)
    .then(function (reslt){
      res.status(200)
        .json({
          status: 'success',
          message: 'Removed ${result.rowCount} puppy'
        })
        /*jshint ignore:end */
    })
    .catch(function (err){
      return next(err);
    });
}

module.exports = {
  getAllMusic: getAllMusic,
  getSingleSong: getSingleSong,
  createSong: createSong,
  updateSong: updateSong,
  removeSong: removeSong
};
