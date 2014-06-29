(@start_date..@end_date).each do |date|
  json.set! date do
    json.array! @top_urls[date], partial: "hit", as: :hit
  end
end

