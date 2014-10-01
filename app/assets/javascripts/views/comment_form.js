BigStart.Views.CommentForm = Backbone.CompositeView.extend({
  template: JST['projects/comment_form'],
  
  events: {
    'click button' : 'submit',
  },
  
  render: function(){
    var partial = this.template();
    this.$el.html(partial);
    return this;
  },

  submit: function(event) {
    event.preventDefault()
    var body = this.$('.comment-input').val();
    var params = {
      body: body,
      project_id: this.collection.project.id,
      author_id: this.collection.project.get("current_user_id"),
      author_username: this.collection.project.get("current_user_name"),
      author_avator_url: this.collection.project.get("current_user_avator_url"), 
      current_user_id: this.collection.project.get("current_user_id")
    };
    this.collection.create(params, { wait: true });
    this.render();
  }
});
