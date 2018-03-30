require 'resolv'

dns = Resolv::DNS.new(:nameserver => ['8.8.8.8','8.8.4.4'])
domain = env['router.params'][:domain]

puts "A record:"
dns.each_resource(domain, Resolv::DNS::Resource::IN::A) do |a|
  puts a.address
end

puts
puts

puts "NS records:"
dns.each_resource(domain, Resolv::DNS::Resource::IN::NS) do |ns|
  puts ns.name
end

puts
puts

puts "TXT records:"
dns.each_resource(domain, Resolv::DNS::Resource::IN::TXT) do |txt|
  puts txt.strings
end

puts
puts

puts "MX records:" 
dns.each_resource(domain, Resolv::DNS::Resource::IN::MX) do |mail_server|
  puts mail_server.exchange
end

puts
puts

puts "MX A record:"
dns.each_resource(domain, Resolv::DNS::Resource::IN::MX) do |mail_server|
  mxa = mail_server.exchange
  dns.each_resource(mxa, Resolv::DNS::Resource::IN::A) do |mx_a|
    puts mx_a.address
  end
end

