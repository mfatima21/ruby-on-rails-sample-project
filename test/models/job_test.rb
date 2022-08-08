require "test_helper"

class JobTest < ActiveSupport::TestCase
  test "Job creation" do
    @job = Job.new()
    assert_not @job.save

    @job.name = "test job"
    @job.priority = 1
    @job.status = "completed"
    assert_not @job.valid?
    assert @job.errors.full_messages, "Status completed should be one of these in_queue, in_progress, failed, done."

    @job.status = "done"
    assert @job.valid?
    assert @job.save
  end
end
