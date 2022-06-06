class TechnologiesController < ApplicationController
  before_action :set_technology, only: [:show, :edit, :update, :destroy]

  def index
    @q = Technology.ransack(params[:q])
    @technologies = @q.result.order(id: :desc).page(params[:page]).per(5)
  end

  def show
  end

  def new
    @technology = Technology.new
  end

  def create
    @technology = Technology.new(technology_params)
    if @technology.save
      flash[:success] = "使用技術「#{@technology.name}」が作成されました"
      redirect_to technologies_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @technology.update(technology_params)
      flash[:success] = "使用技術「#{@technology.name}」が更新されました"
      redirect_to technology_path(@technology.id)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    if @technology.destroy
      flash[:success] = "使用技術「#{@technology.name}」が削除されました"
      redirect_to technologies_path
    end
  end

  private
    def technology_params
      params.require(:technology).permit(:name)
    end

    def set_technology
      @technology = Technology.find(params[:id])
    end
end
