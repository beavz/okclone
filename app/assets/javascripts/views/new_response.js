OKC.Views.NewResponse = Backbone.View.extend({
  initialize: function () {
    this.model = OKC.current_user.unanswered_question;

  },

  template: JST["responses/new"],

  events: {
    "submit form" : "submit"
  },

  render: function () {
    if (this.model) {
      var content = this.template({
        question: this.model,
      });
      this.$el.html(content);
    } else {
      this.$el.html("No remaining questions :(")
    }
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON();
    var response = new OKC.Models.Response();
    response.save(params.response, {
      success: function (response) {

      }
    });

  }

});