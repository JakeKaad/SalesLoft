module Salesloft
  class Person
    attr_accessor :name, :email, :job_title, :possible_duplicates

    def initialize(name, email, job_title)
      @name = name
      @email = email
      @job_title = job_title
      @possible_duplicates = []
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

    def self.detect_duplicates(people)
      # nil guard
      return [] if people.empty?

      # Brute force for now.. use fuzzy search to reduce n+1

      people.each do |person|
        people.each do |duplicate_person|
          next if person.email == duplicate_person.email

          if person.possible_duplicate?(duplicate_person.email)
            person.possible_duplicates << duplicate_person.email
          end
        end
      end
    end

    # Replace with some sort of fuzzy search, vector search, solr, elasticsearch etc
    # This will only detect if typos are at the beginning or end of the username.
    # Does not detect  typos anywhere else,
    # ie teest@emailcom and test@email.com are not detected
    def possible_duplicate?(other_email)
      email_username = email.split('@').first
      other_email_username = other_email.split('@').first

      return(
        other_email.include?(email_username) ||
          email.include?(other_email_username)
      )
    end

    def to_hash
      { 'name' => name, 'email' => email, 'job_title' => job_title }
    end
  end
end
