class ApiLog < ApplicationRecord
    PARAMS_TO_FILTER = %w(method start_time end_time)
    scope :filter_by_time, -> (start_time, end_time) { where("created_at > ? and created_at < ?", start_time, end_time) }
    scope :filter_by_method, -> (method) { where("method = ?", method) }

    def self.filter_logs(params)
        if params.include?(PARAMS_TO_FILTER)
            where('method LIKE ? or (created_at > ? and created_at < ?)', params[:method], params[:start_time], params[:end_time]).limit(params[:size]).offset(params[:size] * (params[:page].to_i - 1))
        else
            ApiLog.all.limit(params[:size]).offset(params[:size] * (params[:page].to_i - 1))
        end
    end        
end
