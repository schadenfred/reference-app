# frozen_string_literal: true

require 'rake'

module RakeTaskHelper
  def run_task(task_name)
    @task_name = task_name
    @output = capture_subprocess_io { Rake::Task[task_name].execute }
  end
end
