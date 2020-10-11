class SampleJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Sidekiq::Logging.logger.info "サンプルジョブを実行しました"
    Sidekiq::Logging.logger.info args[0]
  end
end
