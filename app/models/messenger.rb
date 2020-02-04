class Messenger < ApplicationRecord
  def self.send_image(image_url, message, fb_user)
    uri = endpoint
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Post.new(uri.path, {
      'Content-Type' => 'application/json',  
      'Authorization' => "Bearer #{generate_jwt_token}"
    })
    req.body = {
      'from' => {'type' => 'messenger', 'id' => ENV['FACEBOOK_PAGE_ID']},
      'to' => {'type' => 'messenger', 'id' => fb_user},
      'message' => {
        'content' => {
          'type' => 'image',
          'image' => {
            'url' => image_url
          }
        }
      }  
    }.to_json

    res = http.request(req)
    puts JSON.parse(res.body)
  end

  def self.send_text_only(message, fb_user)
    uri = endpoint
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Post.new(uri.path, {
      'Content-Type' => 'application/json',  
      'Authorization' => "Bearer #{generate_jwt_token}"
    })
    req.body = {
      'from' => {'type' => 'messenger', 'id' => ENV['FACEBOOK_PAGE_ID']},
      'to' => {'type' => 'messenger', 'id' => fb_user},
      'message' => {
        'content' => {
          'type' => 'text',
          'text' => message
        }
      }  
    }.to_json

    res = http.request(req)
    puts JSON.parse(res.body)
  end

  def self.endpoint
    URI('https://api.nexmo.com/v0.1/messages')
  end

  def self.generate_jwt_token
    claims = {
      application_id: ENV['NEXMO_APPLICATION_ID']
    }
    private_key = File.read('./private.key')
    token = Nexmo::JWT.generate(claims, private_key)
    token
  end
end
