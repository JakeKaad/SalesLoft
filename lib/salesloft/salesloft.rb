require 'salesloft/models/person'

module Salesloft
  class Client
    include HTTParty
    base_uri ENV['SALESLOFT_API_URL']

    #TODO move to a config class
    API_KEY = ENV['SALESLOFT_API_KEY']

    attr_reader :options

    def initialize
      @options = {
        headers: {
          'Authorization' => "Bearer #{API_KEY}",
          'Content-Type' => 'application/json'
        }
      }
    end

    def people(opts = {})
      @people ||= get_people(opts)
    end

    private

    def get_people(opts)
      response = self.class.get('/v2/people', options.merge(opts))
      Salesloft::Person.parse_raw_data(response['data'])
    end
  end
end
