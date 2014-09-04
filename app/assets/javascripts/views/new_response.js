OKC.Views.NewResponse = Backbone.View.extend({
  initialize: function () {
    this.model = OKC.current_user.unanswered_questions().first();
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
    var that = this;
    var params = $(event.currentTarget).serializeJSON();
    var response = new OKC.Models.Response(params.response);
    console.log("this happens first");
    response.save(); //this happens

    OKC.current_user.fetch({
      success: function (user) {
        that.model = OKC.current_user.unanswered_questions().first();
        console.log(that.model);
        that.render();
      }
    });
  }

});