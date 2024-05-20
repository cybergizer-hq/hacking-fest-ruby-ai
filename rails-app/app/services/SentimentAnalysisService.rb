require 'rest-client'

class SentimentAnalysisService
  def self.predict(text)
    begin
      url = 'http://flask_app:5000/predict'  # Use the service name defined in Docker Compose
      response = RestClient.post(url, { text: text }.to_json, { content_type: :json, accept: :json })
      JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end

  def self.assign_analysis(record)
    emojis = {
      'POSITIVE' => "<i class='bi bi-emoji-smile'></i>",
      'NEUTRAL' => "<i class='bi bi-emoji-expressionless-fill'></i>",
      'NEGATIVE' => "<i class='bi bi-emoji-frown'></i>"
    }

    result = SentimentAnalysisService.predict(text)
    return unless result.is_a?(Array)

    response = result.first
    label = response['label']
    score = response['score']

    label = 'NEUTRAL' if score >= 33 && score <= 66
    record.update(emoji: emojis[label], score: score, label: label)
  end
end


