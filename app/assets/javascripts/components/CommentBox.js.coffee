{div, form, h3, h4, p, span, textarea} = React.DOM

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
  render: ->
    form className: 'comment-form',
      textarea {},
        'Hello World, I am a CommentForm'

CommentBox = React.createClass
  render: ->
    div className: 'comment-box',
      h3 {}, 'Comments'
      CommentList()
      CommentForm()

window.CommentBox = CommentBox
