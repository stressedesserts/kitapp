class ToolsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    # find the question associated with the favourite
    @bag = Bag.find params[:bag_id]
    # create a new favourite based on the current_user from devise
    @tool = @bag.tools.create(tool_params)
    # assign the bag id to the tool question_id column
    redirect_to bag_path(@bag)
  end

  def destroy
    # find the favourite created by the current user by passing in the the favourite_id
    @tool = current_user.tools.find(params[:id])
    # destroy the favourite
    tool.destroy
    # redirect to the question that had been favourited and prompt the user that it has been done
    redirect_to tool.bag, notice: 'Tool destroyed.'
  end

  def index
    @bag = Bag.find params[:bag_id]
    @tools = Tool.all
  end

  def new
    @tool = Tool.new
  end

  private
    def tool_params
      params.require(:tool).permit(:description, :link, :name)
    end

end
