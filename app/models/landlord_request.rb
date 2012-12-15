# TODO : make a singleton
class LandlordRequest

  require "net/https"
  require "uri"

  def self.post( url , data )
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new(uri.request_uri)
    request.add_field 'Content-Type', 'application/x-www-form-urlencoded; charset=utf-8'
    request.add_field 'X-Requested-With', 'XMLHttpRequest'
    request.add_field 'Proxy-Connection', 'close'
    request.add_field 'Accept-Encoding', 'gzip'
    request.add_field 'User-Agent', 'Appcelerator Titanium/2.1.3.GA (iPhone/6.0.1; iPhone OS; fr_BE;)'
    request.set_form_data(data)
    response = http.request(request)
  end

end