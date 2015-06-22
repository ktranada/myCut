MyCut.Views.BarberFormModal = Backbone.CompositeView.extend({
  template: JST['barbers/barbers_new'],
  events: {
    "submit form": "formData",
    "click button.upload-button": "upload",
    "click .cancel-new-barber": "cancelForm"
  },

  initialize: function(options){
    this.shop = options.shop;
    this.barber = options.model || new MyCut.Models.Barber();
    this._isNew = this.barber.isNew();
  },

  cancelForm: function() {
    event.preventDefault();
    this.$el.hide();
  },

  formData: function(event){
    event.preventDefault();
    this._barberData = $(event.currentTarget).serializeJSON()['barber'];
    if (this._isNew){
      this.createBarber();
    } else {
      this.updateBarber();
    }
  },

  errorHandler: function(response){
    var errors = $.parseJSON(response.responseText).join("<br>")
    this.$('.errors-container').html(errors);
  },

  createBarber: function(){
    var that = this;
    this._barberData.shop_id = this.model.get('id');
    this.barber.save(this._barberData, {
      success: function(){
        that.collection.add(newBarber);
        humane.log("You have sucessfully added a barber");
        Backbone.history.navigate("shops/" + that.mode.get('id') + "/edit/barbers", { trigger: true });
      },
      error: function(model, response) {
        that.errorHander(response);
      }
    })
  },


  updateBarber: function(){
    var that = this;
    this.barber.save(this._barberData, {
      success: function(){
        humane.log("Barber has been updated.");
        Backbone.history.navigate("shops/" + that.mode.get('id') + "/edit/barbers", { trigger: true });
      },
      error: function(model, response) {
        that.errorHander(response);
      }
    })
  },

  render: function(){
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  },

  upload: function() {
    var that = this;
    cloudinary.openUploadWidget(BARBER_CLOUDINARY, function(error, result){
      var data = result[0];
      that.barber.photo_url = data.eager[0].url
    })
  }
});
