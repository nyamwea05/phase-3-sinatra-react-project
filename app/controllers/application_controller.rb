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

put "/tasks/:id" do
  task = Task.find(params[:id])
  if task.update(
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
  else
    status 400
    { message: "Failed to update task." }.to_json
  end
end

delete "/tasks/:id" do
  task = Task.find(params[:id])
  if task.destroy
    { message: "Task successfully deleted." }.to_json
  else
    status 400
    { message: "Failed to delete task." }.to_json
  end
end