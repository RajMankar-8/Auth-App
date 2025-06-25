class PostSerializer < ActiveModel::Serializer
  attributes :id, :version, :title, :content, :summary

  belongs_to :user

  def summary
    5+6
  end

  def version
	"V1 Version Serializer"
  end
end