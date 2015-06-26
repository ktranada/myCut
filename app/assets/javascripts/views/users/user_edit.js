MyCut.Views.UserAccountEditModal = Backbone.View.extend({
  template: JST['users/user_edit'],
  className: "modal-form edit-modal",

  events: {
    "click .cancel-edit": "closeEdit",
    "submit form": "submitEdit",
    "click .upload-button": "upload"
  },

  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
  },
  closeEdit: function(){
    this.$el.hide();
  },

  submitEdit: function(event){
    event.preventDefault();
    var that = this;
    this.formData = $(event.currentTarget).serializeJSON();
    
    if (this.formData['new_password'] == this.formData['confirm_password']) {
      this.formData["user"]["new_password"] = this.formData['new_password'];
      this.formData ["user"]["photo_url"] = this.formData["photo_url"];
      this.model.save(this.formData, {
        success: function(){
          humane.log("You've successfully updated your account!");
          that.$el.hide();
        },
        error: function(model, response){
          var errors = $.parseJSON(response.responseText).join("<br>")
          var $container = that.$('.errors-container');
          $container.html(errors)
        }
      })
    } else {
      humane.log("Your new password and confirmation must match!");
    }
  },

  upload: function(event){
    var that = this;
    event.preventDefault();
    cloudinary.openUploadWidget(USER_CLOUDINARY, function(error, result){
      if (!error) {
        var photo_url =  result[0].eager[1].url;
        that.model.set({ photo_url: photo_url });
        that.$('img').attr('src', photo_url);
      }
    });
  },

  render: function(){
    
    var renderedContent = this.template({ user: this.model })
    this.$el.html(renderedContent);
    this.$el.hide();
    return this;
  }
});
