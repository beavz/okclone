OKC.Models.Thread = Backbone.Model.extend({
  urlRoot: "/api/threads",

  initialize: function (options) {
    this.otherUser = options.otherUser;
  },

  messages: function () {
    this._messages = this._messages ||
      new OKC.Subsets.ThreadMessages([], {
        parentCollection: OKC.messages,
        thread: this
      });
    return this._messages;
  },

  parse: function (attributes) {
    this.messages().set(attributes.messages, { parse: true });
    delete attributes.pictures;
    return attributes;
  }

});

