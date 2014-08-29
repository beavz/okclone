OKC.Views.NewResponse = Backbone.View.extend({
  intialize: function() {
    this.question = options.question;
    this.answers = options.answers;
  }
  template: JST['responses/new'],

  render: function(){
    var content = this.template({ question: this.question, answers: this.answers });
    this.$el.html(content)
    return this
  }
})