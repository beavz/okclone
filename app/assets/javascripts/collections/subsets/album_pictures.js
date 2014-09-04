OKC.Subsets.AlbumPictures = Backbone.Subset.extend({
  url: function () {
    "api/albums/" + this.album.id + "pictures";
  },

  initialize: function (models, options) {
    this.album = options.album;
  }
});