BigStart.Views.ProjectHome = Backbone.CompositeView.extend({
  template: JST['projects/project_home'],

  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
  },

  render: function() {
    var partial = this.template({ project: this.model}); 
    this.$el.html(partial);
    return this;
  },
});
