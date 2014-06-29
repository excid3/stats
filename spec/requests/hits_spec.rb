require "rails_helper"

describe "Hits API" do
  context "when no records" do
    before { Hit.where.destroy }

    it "responds with an empty json object" do
      get "/top_urls.json"

      expect(response).to be_success
      expect(json).to eq({
        1.days.ago.to_date.to_s => [],
        2.days.ago.to_date.to_s => [],
        3.days.ago.to_date.to_s => [],
        4.days.ago.to_date.to_s => [],
        5.days.ago.to_date.to_s => [],
      })
    end

    it "responds with an empty json object" do
      get "/top_referrers.json"

      expect(response).to be_success
      expect(json).to eq({
        1.days.ago.to_date.to_s => [],
        2.days.ago.to_date.to_s => [],
        3.days.ago.to_date.to_s => [],
        4.days.ago.to_date.to_s => [],
        5.days.ago.to_date.to_s => [],
      })
    end
  end

  context "when records" do
    before {
      Hit.where.destroy

      @first = FactoryGirl.create(:hit, created_at: 1.days.ago)
      @second = FactoryGirl.create(:hit, created_at: 2.days.ago)
      @third = FactoryGirl.create(:hit, created_at: 3.days.ago, referrer: nil)
    }

    it "responds with the number of page views per URL grouped by day for the past 5 days" do
      get "/top_urls.json"

      expect(response).to be_success
      expect(json).to eq({
        1.days.ago.to_date.to_s => [{"url" => @first.url, "visits" => 1}],
        2.days.ago.to_date.to_s => [{"url" => @second.url, "visits" => 1}],
        3.days.ago.to_date.to_s => [{"url" => @third.url, "visits" => 1}],
        4.days.ago.to_date.to_s => [],
        5.days.ago.to_date.to_s => [],
      })
    end

    it "responds with the top 5 referrers for the top 10 urls grouped by day for the past 5 days" do
      get "/top_referrers.json"

      expect(response).to be_success
      expect(json).to eq({
        1.days.ago.to_date.to_s => [
          {"url" => @first.url, "visits" => 1, "referrers" => [
            {"url" => @first.referrer, "visits" => 1}
          ]}
        ],
        2.days.ago.to_date.to_s => [
          {"url" => @second.url, "visits" => 1, "referrers" => [
            {"url" => @second.referrer, "visits" => 1}
          ]}
        ],
        3.days.ago.to_date.to_s => [
          {"url" => @third.url, "visits" => 1, "referrers" => [
            {"url" => @third.referrer, "visits" => 1}
          ]}
        ],
        4.days.ago.to_date.to_s => [],
        5.days.ago.to_date.to_s => [],
      })
    end
  end
end
