OKC.Models.Thread = Backbone.Model.extend({
  urlRoot: "/api/message_threads",

  initialize: function (options) {
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
    delete attributes.messages;
    return attributes;
  }

});

