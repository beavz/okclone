OKC.Subsets.QuestionAnswers = Backbone.Subset.extend({
  url: function () {
    return this.question.url + "/answers";
  },

  initialize: function (models, options) {
    this.question = options.question;
  }
});