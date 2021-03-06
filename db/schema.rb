Sequel.migration do
  change do
    create_table(:hits) do
      primary_key :id, :type=>"int(11)"
      column :url, "varchar(255)"
      column :referrer, "varchar(255)"
      column :created_at, "datetime"
      column :hash, "varchar(255)"
      
      index [:created_at]
      index [:url]
    end
    
    create_table(:schema_migrations) do
      column :filename, "varchar(255)", :null=>false
      
      primary_key [:filename]
    end
  end
end
Sequel.migration do
  change do
    self << "INSERT INTO `schema_migrations` (`filename`) VALUES ('20140629015932_create_hits.rb')"
  end
end
