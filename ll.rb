#!/usr/bin/env ruby

auth = "cfc57c052a286002ebbff762a83f10c98361b5aa"
userId = "50768a860a09002f1e000006"

require "net/https"
require "uri"

uri = URI.parse("https://www.landlordgame.com/v2-1-0/sharePurchase.php")

i = 0

loop do
  i+=1

  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Post.new(uri.request_uri)
  request.set_form_data({ "shareFB" => "1",
                          "auth" => auth,
                          "userId" => userId,
                          "comment" => "I%20earned%20rent%20of%20%E2%82%AC2%2C025%20on%20Media%20Markt%20from%201%20new%20checkin%21%20%23landlordgame%20www.landlordgame.com",
                          "shareTwitter" => "1",
                          "shareFourSq" => "0"
                          })

  request.add_field 'Content-Type', 'application/x-www-form-urlencoded; charset=utf-8'
  request.add_field 'X-Requested-With', 'XMLHttpRequest'
  request.add_field 'Proxy-Connection', 'close'
  request.add_field 'Accept-Encoding', 'gzip'
  request.add_field 'User-Agent', 'Appcelerator Titanium/2.1.3.GA (iPhone/6.0.1; iPhone OS; fr_BE;)'

  response = http.request(request)

  #p response.body
  #p "#########"
  p "#{i*10} coins"

  sleep 1
end