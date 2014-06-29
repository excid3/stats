Sequel.migration do
  change do

    create_table :hits do
      primary_key :id
      String :url
      String :referrer
      DateTime :created_at
      String :hash

      index :url
      index :created_at
    end

  end
end
