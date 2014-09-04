OKC.Collections.UserAlbums = Backbone.Collection.extend({
  model: OKC.Models.Album,
  url: function () {
    "api/users/" + this.user.id + "albums";
  }
});