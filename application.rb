require 'hanami/router'
require_relative 'app/controllers/testing'

class Application
  def self.router
    Hanami::Router.new do
      get '/',        to: ->(env) { [200, {}, ['DNS Check']] }
      #get ':domain', to: ->(env) { [200, {}, ["Post #{env['router.params'][:domain]}"]] }
      get ':domain', to: Testing::Results
    end
  end
end
