OKC.Models.Question = Backbone.Model.extend({
  
  answers: function () {
      this._answers = this._answers ||
        new App.Collections.QuestionAnswers([], { question: this });
      return this._answers;
    },
  
  parse: function (attributes) {
    this.answers().set(attributes.answers, { parse: true });    
    delete attributes.answers;
    return attributes;
  }
})