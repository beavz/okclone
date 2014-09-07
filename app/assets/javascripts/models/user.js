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

  unansweredQuestions: function () {
    this._unansweredQuestions = this._unansweredQuestions ||
    new OKC.Subsets.UnansweredQuestions([], {
      parentCollection: OKC.questions
    });
    return this._unansweredQuestions;
  },

  parse: function (attributes) {
    this.albums().set(attributes.albums, { parse: true });
    delete attributes.albums;

    this.responses().set(attributes.responses, { parse: true });
    delete attributes.responses;

    if (attributes.unansweredQuestions) {
      this.unansweredQuestions().set(attributes.unansweredQuestions, {parse: true});
      delete attributes.unansweredQuestions;
    }

    return attributes;
  },
})