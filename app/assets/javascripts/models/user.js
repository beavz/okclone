OKC.Models.User = Backbone.Model.extend({
  urlRoot: "api/users",

  // subcollections:
  responses: function () {
    this._responses = this._responses ||
      new OKC.Collections.UserResponses([], { user: this });
    return this._responses;
  },

  unanswered_questions: function () {
    this._unanswered_questions = this._unanswered_questions ||
      new OKC.Collections.UserQuestions([], { user: this });
    return this._unanswered_questions;
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

    if (attributes.unanswered_questions) {
      this.unanswered_questions().set(attributes.unanswered_questions, { parse: true });
      delete attributes.unanswered_questions;
    }

    return attributes;
  },
})