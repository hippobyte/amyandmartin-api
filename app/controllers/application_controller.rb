# frozen_string_literal: true

#
# ApplicationController
#
class ApplicationController < ActionController::API
  def info_for_paper_trail
    { user_ip: request.remote_ip, user_agent: request.user_agent }
  end
end
