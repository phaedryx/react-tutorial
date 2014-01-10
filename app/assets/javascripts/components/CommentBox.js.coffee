{div, hr, span}                = React.DOM
{h2, h3, h4}                   = React.DOM
{form, label, input, textarea} = React.DOM

Comment = React.createClass
  render: ->
    div className: 'comment',
      h4 className: 'author',
        @props.author
      span {}
        @props.comment
      hr {}

CommentList = React.createClass
  render: ->
    div className: 'comment-list',
      Comment({author: 'Tad', comment: 'this is neat'})

CommentForm = React.createClass
  submit: ->
    {author, comment} = @refs
    alert "#{author.state.value} said: #{comment.state.value}"
    false

  render: ->
    form className: 'pure-form pure-form-aligned', onSubmit: @submit,
      div className: 'pure-control-group',
        label for: 'author', 'Name'
        input type: 'text', placeholder: 'your name', ref: 'author'
      div className: 'pure-control-group',
        label for: 'comment', 'Comment'
        textarea placeholder: 'your comment', ref: 'comment'
      div className: 'pure-controls',
        input className: 'pure-button pure-button-primary', type: 'submit', value: 'post'

CommentBox = React.createClass
  render: ->
    div className: 'comment-box',
      h3 {}, 'Comments'
      CommentList()
      CommentForm()

window.CommentBox = CommentBox
