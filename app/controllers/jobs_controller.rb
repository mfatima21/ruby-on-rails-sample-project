class JobsController < SecuredController
  skip_before_action :authorize_request, only: [:show]
  before_action :set_job, only: %i[ show update destroy execute_job]

  # GET /jobs
  def index
    @jobs = Job.order_by_priority.order_by_time
    render json: @jobs
  end

  # GET /jobs/1
  def show
    render json: @job
  end

  # POST /jobs
  def create
    @job = Job.new(job_params)

    if @job.save
      render json: @job, status: :created, location: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /jobs/1
  def update
    if @job.update(job_params)
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # DELETE /jobs/1
  def destroy
    @job.destroy
  end

  # POST /jobs/execute_job
  def execute_job
    response = @job.execute_job
    render json: @job, location: response
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:name, :status, :priority)
    end
end
