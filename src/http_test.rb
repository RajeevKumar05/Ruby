require "net/http"
require "json"


payload = Hash.new

url = URI.parse("http://localhost:3006/v1/places/xyz_outlook/events")
http = Net::HTTP.new(url.host,url.port)

#http.use_ssl = true
#http.verify_mode = OpenSSL::SSL::VERIFY_NONE


#Create appointments

req =  Net::HTTP::Post.new("#{url.path}")
req["HTTP_X_REQUEST_ID"] = "32cb7ae34156dd40a0174a7fd1016216"
req["Content-Type"] = "application/json"
for i in 9..200
	payload[:reservation_id] = "#{500 + i}"
	req_json = payload.to_json
	puts "Sending -- "
	puts req_json
	req.body=req_json
	res = http.request(req)
	puts "Response -- "
	puts res.body
	puts
	puts
	sleep(1)
end



#Get appointments list
url = URI.parse("http://localhost:3006/v1/places/xyz_outlook/events?service_id=1234_outlook")
http = Net::HTTP.new(url.host,url.port)
req =  Net::HTTP::Get.new("#{url.path}?#{url.query}")
req["HTTP_X_REQUEST_ID"] = "32cb7ae34156dd40a0174a7fd1016216"
req["Content-Type"] = "application/json"
res = http.request(req)
puts "Total events returned is : #{JSON.parse(res.body).length}"


