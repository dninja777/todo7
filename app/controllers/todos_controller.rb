class TodosController < ApplicationController

def index
	@todos = Todo.all
end

def new
	@todo = Todo.new
end

def create
	@todo = Todo.new(todo_params)
	if @todo.save
		flash[:notice] = "Todo was created successfully!"
	@todo.save
	redirect_to todo_path(@todo)
else
	flash[:danger] = "Todo was not created"
	render 'new'
end
end

def show
	@todo = Todo.find(params[:id])
end

def edit
	@todo = Todo.find(params[:id])
end

def update
	@todo = Todo.find(params[:id])
	if @todo = Todo.update(todo_params)
	flash[:notice] = "Todo was updated"
	redirect_to todo_path(@todo)
else
	render 'edit'
end	
end



	private
	def todo_params
		params.require(:todo).permit(:name, :description)
	end

	

end