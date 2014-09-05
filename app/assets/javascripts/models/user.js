OKC.Models.User = Backbone.Model.extend({
  urlRoot: "api/users",

  initialize: function () {
  },

  // subcollections:
  responses: function () {
    this._responses = this._responses ||
      new OKC.Subsets.UserResponses([], {
        user: this,
        parentCollection: OKC.responses
      });
    return this._responses;
  },

  albums: function () {
    this._albums = this._albums ||
      new OKC.Subsets.UserAlbums([], {
        parentCollection: OKC.albums,
        user: this
      });
    return this._albums;
  },

  parse: function (attributes) {
    this.albums().set(attributes.albums, { parse: true });
    delete attributes.albums;

    this.responses().set(attributes.responses, { parse: true });
    delete attributes.responses;

    return attributes;
  },
})