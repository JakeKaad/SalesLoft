describe Salesloft::Client do
  let(:subject) { described_class.new }

  describe '#people' do
    context 'with a valid request' do
      before { mock_people }
      it 'returns a list of people' do
        expect(subject.people.first.email).to eq 'pat.johnson@example.com'
      end
    end

    #TODO finish testing
    context 'with an invalid request'
  end
end
