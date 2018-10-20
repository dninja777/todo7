class TodosController < ApplicationController


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


	private
	def todo_params
		params.require(:todo).permit(:name, :description)
	end

	def find_todo

	end

end