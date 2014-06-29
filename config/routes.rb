Rails.application.routes.draw do
  get "/top_urls", to: "hits#top_urls"
  get "/top_referrers", to: "hits#top_referrers"
end
