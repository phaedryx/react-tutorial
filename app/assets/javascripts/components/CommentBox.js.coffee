{br, div, form, h3, h4, input, p, span, textarea} = React.DOM

Comment = React.createClass
  render: ->
    div className: 'comment',
      h4 className: 'author',
        @props.author
      span
        'Hello World, I am a Comment'

CommentList = React.createClass
  render: ->
    div className: 'comment-list',
      Comment({author: 'Tad'})

CommentForm = React.createClass
  submit: ->
    {author, comment} = @refs
    alert "#{author.state.value} said: #{comment.state.value}"
    false

  render: ->
    form className: 'comment-form', onSubmit: @submit,
      input type: 'text', placeholder: 'your name', ref: 'author'
      br {}
      textarea placeholder: 'your comment', ref: 'comment'
      br {}
      input type: 'submit', value: 'post'

CommentBox = React.createClass
  render: ->
    div className: 'comment-box',
      h3 {}, 'Comments'
      CommentList()
      CommentForm()

window.CommentBox = CommentBox
