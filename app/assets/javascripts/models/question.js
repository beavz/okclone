OKC.Models.Question = Backbone.Model.extend({
  urlRoot: "/api/questions",

  answers: function () {
    this._answers = this._answers ||
      new OKC.Subsets.QuestionAnswers([], {
        question: this,
        parentCollection: OKC.questions
      });
    return this._answers;
  },

  parse: function (attributes) {
    this.answers().set(attributes.answers, { parse: true });
    delete attributes.answers;
    return attributes;
  }
})