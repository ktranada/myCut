MyCut.Views.BarberFormModal = Backbone.CompositeView.extend({
  template: JST['barbers/barbers_new'],
  events: {
    "submit form": "formData",
    "click .upload-button": "upload",
    "click span.cancel-button": "cancelForm"
  },
  className: "modal-form",

  initialize: function(options){
    this.shop = options.shop;
    this.barber = options.model || new MyCut.Models.Barber();
    this._isNew = this.barber.isNew();
    debugger
    var that = this;
  },

  cancelForm: function(e) {
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
    debugger
    this._barberData.shop_id = this.shop.get('id');
    this.barber.save(this._barberData, {
      success: function(){
        that.collection.add(that.barber);
        humane.log("You have sucessfully added a barber");
        Backbone.history.navigate("shops/" + that.shop.get('id') + "/edit/barbers", { trigger: true });
        that.$el.hide();
      },
      error: function(model, response) {
        that.errorHandler(response);
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
    var renderedContent = this.template({barber: this.barber});
    this.$el.html(renderedContent);
    return this;
  },

  upload: function() {
    var that = this;
    debugger
    cloudinary.openUploadWidget(BARBER_CLOUDINARY, function(error, result){
      that.barber.attributes.photo_url = result[0].eager[0].url
    })
  }
});
