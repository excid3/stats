FactoryGirl.define do
  to_create { |i| i.save }

  factory :hit do
    url { URLS.sample }
    referrer { REFERRERS.sample }
    created_at { 2.days.ago }
  end
end
