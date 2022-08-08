class ApiLogsController < ApplicationController
  before_action :set_api_log, only: %i[ show update destroy ]

  # GET /api_logs
  def index
    params[:page] = 1 if !params.include?("page")
    params[:size] = 10 if !params.include?("size")
    
    @api_logs = ApiLog.filter_logs(params)
    render json: @api_logs
  end

  # GET /api_logs/1
  def show
    render json: @api_log
  end

  # POST /api_logs
  def create
    @api_log = ApiLog.new(api_log_params)

    if @api_log.save
      render json: @api_log, status: :created, location: @api_log
    else
      render json: @api_log.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api_logs/1
  def update
    if @api_log.update(api_log_params)
      render json: @api_log
    else
      render json: @api_log.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api_logs/1
  def destroy
    @api_log.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_log
      @api_log = ApiLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_log_params
      params.require(:api_log).permit(:method, :route, :req)
    end
end
