class MembersOnlyArticlesControllerSerializer < ActiveModel::Serializer
  attributes :id
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
before_action :authorize

private
def record_not_found
  render json: { error: "Article not found" }, status: 404
end

def authorize
  render json: { error: "Not authorized" }, status: 401 unless session.include? :user_id
end
end
