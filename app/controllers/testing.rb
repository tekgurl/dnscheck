require 'hanami/controller'
require 'resolv'

module Testing
#  attr_reader :domain

  class Results
    include ::Hanami::Action

    def call(params)
      self.body = func
    end

    def func
      dns = Resolv::DNS.new(:nameserver => ['8.8.8.8','8.8.4.4'])
      dns.each_resource(params[:domain], Resolv::DNS::Resource::IN::A) do |a|
        a = a.address.to_s
        return "#{params[:domain]}   A :  #{a}"
      end
    end
  end
end
