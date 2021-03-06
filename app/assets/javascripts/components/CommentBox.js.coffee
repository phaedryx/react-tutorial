{div, span}                    = React.DOM
{h2, h3, h4}                   = React.DOM
{form, label, input, textarea} = React.DOM

Comment = React.createClass
  render: ->
    div className: 'comment',
      h4 className: 'comment-author',
        @props.author
      div className: 'comment-content',
        @props.content

CommentList = React.createClass
  render: ->
    nodes = @props.comments.map (comment) ->
      {author, content} = comment
      Comment({author: author, content: content})
    div className: 'comment-list',
      nodes

CommentForm = React.createClass
  submit: ->
    {author, content} = @refs
    @props.submit(
      author: author.state.value
      content: content.state.value
    )
    author.getDOMNode().value = ''
    content.getDOMNode().value = ''
    false

  render: ->
    form className: 'pure-form pure-form-aligned', onSubmit: @submit,
      div className: 'pure-control-group',
        label for: 'author', 'Name'
        input type: 'text', placeholder: 'your name', ref: 'author'
      div className: 'pure-control-group',
        label for: 'comment', 'Comment'
        textarea placeholder: 'your comment', ref: 'content'
      div className: 'pure-controls',
        input className: 'pure-button pure-button-primary', type: 'submit', value: 'post'

CommentBox = React.createClass
  getInitialState: ->
    {comments: []}

  loadCommentsFromServer: ->
    $.ajax(
      url: @props.url
      dataType: 'json'
      success: (results) => @setState {comments: results.comments}
      error: -> console.log "there was an error"
    )

  submit: (comment) ->
    $.post(@props.url, comment: comment, authenticity_token: window._auth_token)

  componentWillMount: ->
    @loadCommentsFromServer()
    setInterval(@loadCommentsFromServer, @props.pollInterval)

  render: ->
    div className: 'comment-box',
      h3 {}, 'Comments'
      CommentList({comments: @state.comments})
      CommentForm({submit: @submit})

window.CommentBox = CommentBox
