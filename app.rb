# Note: the name of this file (app.rb) is irrelevant.

# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__

# takes me to the home directory which is indexl.htlml
get '/' do
  posts = Post.reverse_order(:created_at).all
  erb :index, :locals => {:posts => posts}
end

#creates the posts object in the database then redirect it to the home directory
post '/posts' do
  Post.create(:body => params[:body])
  redirect to('/')
end

#post request in html to submit a request to the server to update the vote
post '/posts/:id/upvote' do
	post = Post.where(:id => params[:id]).first
	post.votes = post.votes + 1
	post.save
	redirect to('/')
end

post '/posts/:id/downvote' do
	post = Post.where(:id => params[:id]).first
	post.votes = post.votes - 1
	post.save
	redirect to('/')
end

post '/posts/:id/delete' do
	post = Post.where(:id => params[:id]).first
	post.delete
	redirect to("/")
end


#use the link to get the file then render the contents
get '/todo' do
  erb :todo
end
