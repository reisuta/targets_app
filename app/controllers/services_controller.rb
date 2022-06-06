class ServicesController < ApplicationController
  def index
    @q = Service.ransack(params[:q])
    @services = @q.result.page(params[:page]).per(5)
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      flash[:success] = 'サービスを作成しました'
      redirect_to services_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      flash[:success] = 'サービスを更新しました'
      redirect_to service_path(@service.id)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @service = Service.find(params[:id]).destroy
    flash[:success] = 'サービスを削除しました'
    redirect_to services_path
  end

  private
    def service_params
      params.require(:service).permit(:name)
    end
end
