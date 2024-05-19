RSpec.describe String do
  before do
    stub_request(:post, ENV['HUGGINGFACE_TWITTER_ROBERTA_URL'])
      .to_return(status: 200, body: '[[{ "label": "POSITIVE", "score": 0.5 }, { "label": "NEUTRAL", "score": 0.3 }, { "label": "NEGATIVE", "score": 0.2 }]]')
  end

  it 'calculates the emotion score correctly' do
    expect('happy'.emo_eval).to eq(0)
  end

  context 'when the response is not successful' do
    before do
      stub_request(:post, ENV['HUGGINGFACE_TWITTER_ROBERTA_URL'])
        .to_return(status: 500)
    end

    it 'returns an error message' do
      expect('happy'.emo_eval).to eq(0.5)
    end
  end

  context 'when the response cannot be parsed' do
    before do
      stub_request(:post, ENV['HUGGINGFACE_TWITTER_ROBERTA_URL'])
        .to_return(status: 200, body: 'not json')
    end

    it 'returns an error message' do
      expect('happy'.emo_eval).to eq(0.5)
    end
  end
end
