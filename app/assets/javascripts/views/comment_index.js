BigStart.Views.CommentsIndex = Backbone.CompositeView.extend({
  template: JST['projects/comments_index'],
  
  initialize: function() {
    this.commentFormView = new BigStart.Views.CommentForm({
      model: new BigStart.Models.Comment(),
      collection: this.collection
    });
    this.addSubview('.comment-form', this.commentFormView);
    this.collection.each(this.addCommentView.bind(this));

    this.listenTo(this.collection, "add", this.addCommentView);
    this.listenTo(this.collection, "sync", this.render);
  },

  addCommentView: function(comment) {
    var commentView = new BigStart.Views.CommentShow({
      model: comment
    });
    this.prependSubview('.comments-list', commentView);
  },

  render: function() {
    var partial = this.template({ comments: this.collection});
    this.$el.html(partial);
    this.attachSubviews();
    return this;
  }
});
