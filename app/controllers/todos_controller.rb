class TodosController < ApplicationController

before_action :find_todo, only: [:edit, :update, :show, :destroy]

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
	
end

def edit
	
end

def update
	
	if @todo = Todo.update(todo_params)
	flash[:notice] = "Todo was updated"
	redirect_to todo_path(@todo)
else
	render 'edit'
end	
end

def destroy

@todo.destroy
flash[:notice] = "todo was deleted successfully"
redirect_to todos_path
end



	private
	def todo_params
		params.require(:todo).permit(:name, :description)
	end

	def find_todo
		@todo = Todo.find(params[:id])
	end

	

end