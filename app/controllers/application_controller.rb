class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  before do
    response.headers["Access-Control-Allow-Origin"]="*"
  end
  get '/projects' do
    projects = Project.all
    projects.to_json
  end
  
  # Add routes
  get '/users' do 
    users = User.all
        users.to_json
  end

  post '/users' do
    user = User.create(
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    user.to_json
  end

  patch '/users/:id' do
    user = User.find(params[:id])
    user.update(
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    user.to_json
  end

  delete '/users/:id' do
    user = User.find(params[:id])
    user.destroy
    user.to_json
  end

  # Members
  get '/project-members' do 
    members = ProjectMember.all
    members.to_json
  end

  post '/project-members' do
    member = ProjectMember.create(
      username: params[:username],
      email: params[:email],
      user_id: params[:user.id],
      project_id: params[:project.id]
    )
    member.to_json
  end

  patch '/project-members/:id' do
    member = ProjectMember.find(params[:id])
    member.update(
      username: params[:username],
      email: params[:email],
      user_id: params[:user.id],
      project_id: params[:project.id]
    )
      member.to_json 
  end

  delete '/project-members/:id' do
    member = ProjectMember.find(params[:id])
    member.destroy
    member.to_json
  end

  # Projects
  get '/projects' do 
    projects = Project.all
    projects.to_json
  end
  
  patch '/projects/:id' do
    project = Project.find(params[:id])
    project.update(
      username: params[:username],
      title: params[:title],
      description: params[:description]
    )
    project.to_json
  end

  delete '/projects/:id' do
    project = Project.find(params[:id])
    project.destroy
    project.to_json
  end

  get '/members' do
    pa = ProjectMember.all
    pa.to_json
  end

  post '/signIn' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id # Set the user ID in the session
      puts "#{session[:user_id]}"
      status 200
      { user_id: user.id, name: user.name }.to_json
    else
      status 401
      { error: 'Invalid credentials' }.to_json
    end
  end

  post '/users' do
    user = User.create(
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    if user.valid?
      status 201
      user.to_json
    else
      status 400
      { error: 'Failed to create user' }.to_json
    end
  end

  get '/projects/:project_id/members' do
    project = Project.find(params[:project_id])
    members = project.members
    members.to_json(include: :project)
  end

  post '/projects' do
    project = Project.create(
      username: params[:username],
      title: params[:title],
      description: params[:description]
    )

    if project.valid?
      status 201
      project.to_json
    else
      status 400
      { error: 'Failed to create project' }.to_json
    end
  end

end