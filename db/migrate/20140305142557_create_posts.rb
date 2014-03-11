# See http://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html
Sequel.migration do
  change do
  	#create a databased named posts
    create_table :posts do
    	# define the attributes of the database
      primary_key :id
      text :body, :null => false
      datetime :created_at, :null => false
      datetime :updated_at, :null => false
      int :votes, :default => 0
    end
  end
end
