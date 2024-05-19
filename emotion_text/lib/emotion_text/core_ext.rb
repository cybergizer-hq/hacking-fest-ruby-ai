require 'net/http'
require 'uri'
require 'json'
require 'dotenv/load'

class String
  def emo_eval
    check_response_status(response)
    emotions = extract_emotions(parsed_response(response))
    calculate_emotion_score(emotions)
  rescue JSON::ParserError
    0.5
  rescue StandardError => _e
    0.5
  end

  private

  def response
    send_request(self)
  end

  def parsed_response(response)
    JSON.parse(response.body)
  end

  def send_request(text)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri, headers)
    request.body = { inputs: text }.to_json
    http.request(request)
  end

  def uri
    URI(ENV['HUGGINGFACE_TWITTER_ROBERTA_URL'])
  end

  def headers
    {
      'Authorization' => "Bearer #{ENV['HUGGINGFACE_API_KEY']}",
      'Content-Type' => 'application/json'
    }
  end

  def check_response_status(response)
    raise "Unexpected response code #{response.code}" unless response.is_a?(Net::HTTPSuccess)
  end

  def extract_emotions(parsed_response)
    emotions = {}
    parsed_response[0].each do |emotion|
      case emotion['label']
      when 'LABEL_0'
        emotions[:negative] = emotion['score']
      when 'LABEL_1'
        emotions[:neutral] = emotion['score']
      when 'LABEL_2'
        emotions[:positive] = emotion['score']
      end
    end
    emotions
  end

  def calculate_emotion_score(emotions)
    emotions.sum { |emotion, score| score * weights[emotion] }
  end

  def weights
    { positive: 0, neutral: 0.5, negative: 1 }
  end
end
