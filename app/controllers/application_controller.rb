# class ApplicationController < ActionController::API
# end


class ApplicationController < ActionController::API
  include Knock::Authenticable
end
