class Hit < Sequel::Model
  def self.top_urls(start_date, end_date)
    select{[:url, DATE(created_at).as(:created_at), count('*').as(:count)]}.
      where("DATE(created_at) BETWEEN ? AND ?", start_date.to_date, end_date.to_date).
      group{[DATE(created_at), url]}
  end

  def self.referrers_for(date, url)
    where("DATE(created_at) = ?", date).
      where(url: url).
      group(:referrer).
      select{[:referrer, count('*').as(:count)]}.
      order(Sequel.desc(:count)).
      limit(5)
  end
end
