OKC.Models.Album = Backbone.Model.extend({
  urlRoot: "/api/albums",

  pictures: function () {
    this._pictures = this._pictures ||
      new OKC.Subsets.AlbumPictures([], {
         parentCollection: OKC.pictures,
         album: this });
    return this._pictures;
  },

  parse: function (attributes) {
    this.pictures().set(attributes.pictures, { parse: true });
    delete attributes.pictures;
    return attributes;
  }
});