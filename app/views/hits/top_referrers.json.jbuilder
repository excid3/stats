@top_urls.each do |date, records|
  top_urls_for_day = records.sort_by{ |r| r.values.count }.take(10)

  json.set! date do
    json.array! top_urls_for_day do |record|
      json.partial! "hit", hit: record

      json.set! "referrers" do
        json.array!(Hit.referrers_for(date, record.url).to_a) do |hit|
          json.url hit.referrer
          json.visits hit.values[:count]
        end
      end
    end
  end
end

