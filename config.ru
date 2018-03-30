require_relative 'application'

# Load controllers
Dir[File.join(File.dirname(__FILE__), 'app/controllers', '**', '*.rb')].sort.each {|file| require file }
 
run Application.router
