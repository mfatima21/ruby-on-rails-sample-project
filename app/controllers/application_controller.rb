class ApplicationController < ActionController::API
    before_action :authenticate_request
    around_action :collect_metrics
    attr_reader :current_user


    around_action :collect_metrics

    def collect_metrics
      start = Time.now
      yield
      duration = Time.now - start
      @api_log = ApiLog.new({method: action_name, route: controller_name })
      Rails.logger.info "#{controller_name}##{action_name}: #{duration}s"
    end

    private
   
    def authenticate_request
        @current_user = AuthorizeApiRequest.call(request.headers).result
        render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end
end