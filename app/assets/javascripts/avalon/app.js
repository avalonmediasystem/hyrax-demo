Avalon = {
    initialize: function () {
      let create_video = require('avalon/create_video');
      create_video();
    },

    mediaPlayer: function(options) {
      var MediaPlayer = require('avalon/media_player');
      return new MediaPlayer(options);
    }
}
