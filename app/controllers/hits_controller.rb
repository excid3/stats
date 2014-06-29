class HitsController < ApplicationController
  before_action :set_date_range
  layout false

  def top_urls
    @top_urls  = Hit.top_urls(@start_date, @end_date).to_a.group_by(&:created_at)
  end

  def top_referrers
    @top_urls = Hit.top_urls(@start_date, @end_date).to_a.group_by(&:created_at)
  end

  private

    def set_date_range
      @start_date = 5.days.ago.to_date
      @end_date   = 1.day.ago.to_date
    end
end
