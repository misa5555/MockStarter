BigStart.Views.CommentShow = Backbone.CompositeView.extend({
  template: JST['projects/comment_show'],
  tagName: "li",

  render: function() {
    var partial = this.template({ comment: this.model}); 
    this.$el.html(partial);
    return this;
  }
});
