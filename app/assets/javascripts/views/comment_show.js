BigStart.Views.CommentShow = Backbone.CompositeView.extend({
  template: JST['projects/comment_show'],
  tagName: "li",
  
  events:{
    "click button.destroy": "destroyComment"  
  },
  
  destroyComment: function(event){
    event.preventDefault();
    this.model.destroy();
  },

  render: function() {
    var partial = this.template({ comment: this.model}); 
    this.$el.html(partial);
    return this;
  }
});
