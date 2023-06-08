class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  post "/tasks" do
    pp params
      task = Task.create(
        text: params[:text],
        title: params[:title],
        category: params[:category],
        due_date: params[:dueDate],
        start_time: params[:startTime],
        end_time: params[:endTime],
        priority: params[:priority],
        description: params[:description]
      )
      task.to_json

  end
  get "/task" do

    task=Task.all
    task.to_json
  end
  
  # ... other routes
end

