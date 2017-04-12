export default function () {

  const manifest = require('avalon/manifest');

  function prepSection() {
    let body = document.getElementsByTagName('body')[0],
      footer = document.getElementsByTagName('footer')[0],
      innerHtml = `<div class="row">
                      <div class="col-sm-12">
                        <hr>
                        <h3>Media Element Player</h3>
                        <div id='media-player-target'></div>
                      </div>
                     </div>`,
      section = document.createElement('section');

    section.className = 'container';
    section.innerHTML = innerHtml;
    body.insertBefore(section, footer);
  }

  function startPlayer() {
    let v = document.getElementsByTagName("video")[0];
    let player = new MediaElementPlayer(v, {
      startVolume: .5,
      success: function (mediaElement, originalNode) {
        // Do stuff here
        mediaElement.currentTime = 30;
      }
    });
  }

  prepSection();

  let mediaPlayer = Avalon.mediaPlayer({'manifest': manifest, 'target': 'media-player-target'});
  mediaPlayer.render();

  startPlayer();

}