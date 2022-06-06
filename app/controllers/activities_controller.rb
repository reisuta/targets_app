class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def index
    @q = Activity.ransack(params[:q])
    @activities = @q.result.page(params[:page]).per(5)
  end

  def show
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      flash[:success] = '活動を作成しました'
      redirect_to activities_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      flash[:success] = '活動を更新しました'
      redirect_to activity_path(@activity.id)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @activity.destroy
    flash[:success] = '活動を削除しました'
    redirect_to activities_path
  end

  private
    def activity_params
      params.require(:activity).permit(:title, :leader_name, :amount, :is_secret, :suggestion_summary, :suggestion_detail, :comment,
:started_at, :ended_at, :portrait)
    end

    def set_activity
      @activity = Activity.find(params[:id])
    end
end
