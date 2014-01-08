{div} = React.DOM

CommentBox = React.createClass
  render: ->
    div className: 'commentBox',
      'Hello World, I am a comment box'

window.CommentBox = CommentBox
