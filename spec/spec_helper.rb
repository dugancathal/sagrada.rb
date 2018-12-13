require 'rspec'
Dir[File.expand_path('../lib', __dir__) + '/**/*.rb'].each {|f| require f }
Dir[File.expand_path('support', __dir__) + '/**/*.rb'].each {|f| require f }

RSpec.configure do |config|

end