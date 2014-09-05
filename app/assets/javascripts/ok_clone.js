window.OKC = {
  Models: {},
  Collections: {},
  Subsets: {},
  Views: {},
  Routers: {},

  initialize: function (user_id) {
    OKC.formattingData = new OKC.Models.FormattingData;
    OKC.formattingData.fetch();

    OKC.pictures = new OKC.Collections.Pictures();
    OKC.albums = new OKC.Collections.Albums();
    OKC.questions = new OKC.Collections.Questions();
    OKC.answers = new OKC.Collections.Answers();
    OKC.responses = new OKC.Collections.Responses();
    OKC.users = new OKC.Collections.Users();

    var user = OKC.current_user = new OKC.Models.User({ id: user_id });
    OKC.nextQuestion = new OKC.Subsets.NextQuestion([], {
      user: user,
      parentCollection: OKC.questions
    })



    new OKC.Routers.Main({$rootEl : $("main")});
    Backbone.history.start();

    console.log("backbone runs");
  }
};



