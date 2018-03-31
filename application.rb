require 'hanami/router'
require_relative 'app/controllers/testing'

class Application
  def self.router
    Hanami::Router.new do
      get '/', to: ->(env) { [200, {'Content-Type' => 'text/html'}, ['DNS Check']] }
      get ':domain', to: Testing::Results
    end
  end
end
