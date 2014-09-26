OKC.Views.NewResponse = Backbone.View.extend({
  initialize: function () {
    this.collection = OKC.current_user.unansweredQuestions();
    this.model = _.first(this.collection.models);
  },

  template: JST["responses/new"],

  events: {
    "submit form" : "submit"
  },

  render: function () {
    if (this.model) {
      var content = this.template({
        question: this.model,
        message: this.message
      });
      this.$el.html(content);
    } else {
      this.$el.html("No remaining questions :(")
    }
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var view = this;
    var params = $(event.currentTarget).serializeJSON();
    if (!(params["acceptable_answers"])) {
      $(view.$el).find(".message").html("You must choose at least one acceptable answer.");

    } else {
      var response = new OKC.Models.Response();
      response.save(params.response, {
        success: function (response) {
          view.collection.remove(view.model);
          view.model = _.first(view.collection.models);
          view.render();
        }
      });

      $.ajax({
        url: "/api/acceptable_responses",
        data: params
      })
    }

  }

});