require 'rest-client'

class SentimentAnalysisService
  def self.predict(text)
    begin
      url = 'http://localhost:5000/predict'  # Use the service name defined in Docker Compose
      response = RestClient.post(url, { text: text }.to_json, { content_type: :json, accept: :json })
      JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end

  def self.assign_analysis(record)
    emojis = {
      'NEGATIVE' => "<i class='bi bi-emoji-frown'></i>",
      'NEUTRAL' => "<i class='bi bi-emoji-expressionless-fill'></i>",
      'POSITIVE' => "<i class='bi bi-emoji-smile'></i>"
    }

    result = predict(record.message)
    return unless result.is_a?(Array)

    response = result.first
    label = response['label'].upcase
    score = response['score']

    record.update(emoji: emojis[label], score: score, label: label)
  end
end


