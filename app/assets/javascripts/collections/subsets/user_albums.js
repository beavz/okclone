OKC.Subsets.UserAlbums = Backbone.Collection.extend({
  model: OKC.Models.Album,

  url: function () {
    "api/users/" + this.user.id + "albums";
  },

  initialize: function (models, options) {
    this.user = options.user;
  }
});