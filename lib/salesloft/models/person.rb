module Salesloft
  class Person
    attr_accessor :name, :email, :job_title

    def initialize(name, email, job_title)
      @name = name
      @email = email
      @job_title = job_title
    end

    def self.parse_raw_data(data)
      data.map do |person_data|
        new(
          person_data['display_name'],
          person_data['email_address'],
          person_data['title']
        )
      end
    end
  end
end
