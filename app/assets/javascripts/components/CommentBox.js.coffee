{div, h3, p} = React.DOM

CommentBox = React.createClass
  render: ->
    div className: 'comment-box',
      h3 {},
        "Comments"
      p {},
        'Hello World, I am a comment box'

window.CommentBox = CommentBox
