@top_urls.each do |key, value|
  json.set! key do
    json.array! value, partial: "hit", as: :hit
  end
end

