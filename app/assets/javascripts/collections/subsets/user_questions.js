OKC.Collections.UserQuestions = Backbone.Collection.extend({
  model: OKC.Models.Question,

  url: function () {
    return this.user.url + "/questions";
  },

  initialize: function (models, options) {
    this.question = options.question;
  }
});