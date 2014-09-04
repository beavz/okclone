OKC.Collections.AlbumPictures = Backbone.Collection.extend({
  model: OKC.Models.Picture,
  url: function () {
    "api/albums/" + this.album.id + "pictures";
  }
});