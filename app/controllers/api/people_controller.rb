class Api::PeopleController < Api::BaseController
  before_action :authorize_request

  def index
    people = salesloft_client.people
    render json: people.map(&:to_hash)
  end

  private

  def salesloft_client
    @salesloft_client ||= Salesloft::Client.new
  end

  def authorize_request
    return true if Rails.env.development?

    #TODO Add authorization code
    #TODO Create proper error class
    #TODO Handle error and return JSON error object
    raise StandardError, 'Unauthorized Request'
  end
end
