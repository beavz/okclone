OKC.Views.ShowCurrentUser = Backbone.View.extend({
  initialize: function () {
    this.tab = ".info";
    this.editing = {};
    this.fileStrings = {};

    this.listenTo(this.model, "sync", this.render);
    this.listenTo(OKC.albums, "add sync", this.render);
    this.listenTo(OKC.pictures, "add sync", this.render);
  },

  events: {
    "click nav.tabs": "changeTab",
    "click button.edit" : "showForm",
    "click button.cancel" : "hideForm",
    "click button.delete" : "deleteResponse",
    "click button.delete-pic" : "deletePic",
    "click button.set-profile-pic" : "setProfilePic",
    "submit form.user-update" : "updateUser",
    "submit form.response-update" : "updateResponse",
    "submit form.album-create" : "createAlbum",
    "submit form.picture-create" : "createPicture",
    "change .image-upload" : "handleFile",
    "click .photo" : "renderAlbumModal"
  },

  partials: {
    ".info" : "users/_info_editable",
    ".photos" : "users/_photos_editable",
    ".questions" : "users/_questions_editable"
  },

  template: JST["users/show"],

  render: function () {
    var content = this.template({
      user: this.model,
      tab: this.tab
    });
    this.$el.html(content);

    var tab = this.tab;
    var tabContent = JST[this.partials[tab]]({
      user: this.model,
      editing: this.editing
    });
    this.$(".tab-content").html(tabContent);

    return this;
  },

  changeTab: function (event) {
    event.preventDefault();
    this.tab = $(event.target).data().id;
    this.render();
  },

  showForm: function (event) {
    event.preventDefault();
    var key = $(event.target).data().id;
    this.editing[key] = true;
    this.render();
  },

  hideForm: function (event) {
    event.preventDefault();
    var key = $(event.target).data().id;
    this.editing[key] = false;
    this.render();
  },

  updateUser: function (event) {
    event.preventDefault();
    var form = $(event.currentTarget);
    var params = form.serializeJSON();
    this.model.save(params, { patch : true });
    this.editing[form.data().id] = false;
    this.render();
  },

  updateResponse: function (event) {
    event.preventDefault();
    var that = this;
    var form = $(event.currentTarget);
    var res_id = form.data().res;
    var params = form.serializeJSON();
    this.model.responses().get(res_id).save(params, {patch: true})
    this.model.fetch({
      success: function () {
        that.editing[form.data().id] = false;
      }
    });
  },

  deleteResponse: function (event) {
    event.preventDefault();
    var that = this;
    var form = $(event.currentTarget);
    var res_id = form.data().id;
    this.model.responses().get(res_id).destroy();
    this.model.fetch({
      success: function () {
        that.editing[form.data().id] = false;
      }
    });
  },

  deletePic: function (event) {
    event.preventDefault();
    event.stopPropagation();
    var view = this;
    var picId = $(event.target).data().id;
    OKC.pictures.get(picId).destroy({
      success: function () {
        view.render();
      }
    });
  },

  setProfilePic: function (event) {
    event.preventDefault();
    event.stopPropagation();
    var view = this;
    var picId = $(event.target).data().id;
    this.model.save({ avatar_id: picId }, {
      patch : true,
      success: function () {
        view.render();
      }
    });
  },

  createAlbum: function (event) {
    event.preventDefault();
    var view = this;
    var params = $(event.target).serializeJSON();
    var album = new OKC.Models.Album();

    album.save( params.album,
      { success: function (album) {
        view.model.albums().add(album);
      }
    });
  },

  createPicture: function (event) {
    event.preventDefault();
    var view = this;
    var albumId = $(event.target).data().id;
    var params = $(event.target).serializeJSON();

    var picture = new OKC.Models.Picture(params.picture);
    picture.save({
      image: this.fileStrings[albumId],
      album_id: albumId
    },
    {
      success: function (picture) {
        delete picture.attributes.image;
          picture.fetch( { success: function (picture) {
            view.model.albums().get(albumId).pictures().add(picture);
            delete view.fileStrings[albumId];
          }
        });
      }
    });
  },

  handleFile: function (event) {
    var view = this;
    var albumId = $(event.currentTarget).data().id
    var file = event.currentTarget.files[0];
    var reader = new FileReader();

    reader.onloadend = function () {
      view.fileStrings[albumId] = this.result;
    };

    if (file){
      reader.readAsDataURL(file);
    }
  },

  renderAlbumModal: function (event) {
    var template = JST["users/_album_modal"];
    var albumId = $(event.currentTarget).data().id;
    var content = template({ album: this.model.albums().get(albumId) })
    $('ul.pictures').html(content);
  }

});