class LinesController < ApplicationController
  before_action :client_area
  def new
    @line=current_user.lines.build
  end
  def create
    @line=current_user.lines.build(line_params)
    if @line.save
      redirect_to @line
    else
    end
  end

  def index
    @line=current_user.lines.build
    @lines=Line.all
  end

  def show
    @line=Line.find(params[:id])
    times=0.0
    Line.all.each do|line|
      times+=line.time
    end
    @time=times/Line.all.count
    @lines_before_you=Line.order(created_at: :desc).where("created_at <=?",@line.created_at).count
    @time=@time*@lines_before_you
  end

  def destroy

  end

  private
  def client_area
    redirect_to root_path unless current_user
  end
  def line_params
    params.require(:line).permit(:time,:line_number)
  end
end
