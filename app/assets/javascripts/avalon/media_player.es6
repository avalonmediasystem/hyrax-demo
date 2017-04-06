export default class MediaPlayer {
  constructor (options) {
    this.manifest = options.manifest
    this.target = document.getElementById(options.target)
  }

  getSubtitles () {
    var subtitle
    this.manifest.content[0].items.forEach((item) => {
      item.body.forEach((body) => {
        if (body.type === "Text") {
          subtitle = body
        }
      })
    })
    return subtitle
  }

  getMediumVideo () {
    var medium
    this.manifest.content[0].items.forEach((item) => {
      item.body.forEach((body) => {
        if (body.type === "Choice") {
          body.items.forEach((item) => {
            if (item.label === "Medium") {
              medium = item
            }
          })
        }
      })
    })
    return medium
  }

  render () {
    let videoElement = `<video height="${this.manifest.height}" width="${this.manifest.width}" controls>
  <source src="${this.getMediumVideo().id}" type="video/mp4">
  <track kind="subtitles" src="${this.getSubtitles().id}" srclang="${this.getSubtitles().language}" >
</video>`
    this.target.innerHTML = videoElement
  }
}
