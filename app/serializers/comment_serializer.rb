class CommentSerializer < ActiveModel::Serializer
  attributes :author, :content
end
