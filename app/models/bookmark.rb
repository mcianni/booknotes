class Bookmark < ActiveRecord::Base
  belongs_to :card
  validates :card_id, presence: true
  validates :title,   presence: true
  validates :url,     presence: true
  
  mount_uploader :screenshot, ScreenshotUploader

  after_create :enqueue_screenshot_job

  private
    def enqueue_screenshot_job
      Delayed::Job.enqueue ScreenshotJob.new(self, tmp_path)
    end

    def tmp_path
      "#{Rails.root}/tmp/screenshots/#{self.id}.png"
    end
end
