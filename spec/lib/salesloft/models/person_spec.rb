describe Salesloft::Person do
  describe '#possible_duplicate?' do
    subject { Salesloft::Person.new(nil, 'test@email.com', nil) }
    it 'is true if the email is a duplicate' do
      expect(subject.possible_duplicate?('test@email.com')).to be_truthy
    end

    it 'is true with 1 off char at end' do
      expect(subject.possible_duplicate?('testt@email.com')).to be_truthy
    end

    it 'is true when the person email is one off from end of other email' do
      expect(subject.possible_duplicate?('tes@email.com')).to be_truthy
    end

    it 'is false if there are no matches' do
      expect(subject.possible_duplicate?('notamatch@email.com')).to be_falsey
    end
  end

  describe '.detect_duplicates' do
    let(:people) do
      [
        Salesloft::Person.new(nil, 'test@email.com', nil),
        Salesloft::Person.new(nil, 'tes@email.com', nil),
        Salesloft::Person.new(nil, 'testt@email.com', nil),
        Salesloft::Person.new(nil, 'notamatch@email.com', nil)
      ]
    end

    it 'assigns matches to individual peoples possible duplicate attribute' do
      described_class.detect_duplicates(people)
      expect(people[0].possible_duplicates).to include(
        'tes@email.com',
        'testt@email.com'
      )
    end

    it 'does not assign matches to individual peoples possible duplicate attribute' do
      described_class.detect_duplicates(people)
      expect(people[0].possible_duplicates).to_not include(
                                                     'notamatch@email.com'
                                                   )
    end
  end
end
