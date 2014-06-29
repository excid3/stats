records_per_day = 62_500

0.upto(15) do |i|
  records_per_day.times do |count|
    puts "Day #{i} - #{count}" if count % 1000 == 0

    hit = Hit.create(
      url: URLS.sample,
      referrer: REFERRERS.sample,
      created_at: i.days.ago
    )

    hit.update hash: Digest::MD5.hexdigest(hit.values.except(:hash).to_s)
  end
end
