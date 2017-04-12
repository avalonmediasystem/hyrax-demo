Avalon = {
  initialize: function () {
    let createVideo = require('avalon/create_video')
    createVideo()
  },

  mediaPlayer: function (options) {
    var MediaPlayer = require('avalon/media_player')
    return new MediaPlayer(options)
  }
}
