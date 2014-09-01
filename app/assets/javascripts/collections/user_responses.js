OKC.Collections.UserResponses = Backbone.Collection.extend({
  model: OKC.Models.Responses,

  url: function () {
    return this.user.url + "/responses";
  },

  initialize: function (models, options) {
    this.question = options.question;
  }
});