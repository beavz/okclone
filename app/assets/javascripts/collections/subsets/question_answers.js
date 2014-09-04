OKC.Collections.QuestionAnswers = Backbone.Collection.extend({
  model: OKC.Models.Answer,

  url: function () {
    return this.question.url + "/answers";
  },

  initialize: function (models, options) {
    this.question = options.question;
  }
});