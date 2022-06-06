require 'rails_helper'

RSpec.describe 'Services', type: :request do
  let!(:service1) { create(:service) }
  let!(:user) { create(:user) }
  before do
    sign_in user
  end

  describe 'index' do
    it '適切なステータスコードを返す' do
      get services_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'show' do
    it '適切なステータスコードを返す' do
      get service_path(service1.id)
      expect(response).to have_http_status(200)
    end
  end

  describe 'new' do
    it '適切なステータスコードを返す' do
      get new_service_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'create' do
    let(:service_params) { { name: 'test' } }
    context '正常系' do
      it '適切なステータスコードを返す' do
        post services_path, params: { service: service_params }
        expect(response).to have_http_status(302)
      end

      it '一覧画面にリダイレクトされる' do
        post services_path, params: { service: service_params }
        expect(response).to redirect_to(services_path)
      end

      it 'レコードが一つ増える' do
        expect do
          post services_path, params: { service: service_params }
        end.to change { Service.count }.by(1)
      end
    end

    context '異常系' do
      before do
        service_params[:name] = ''
      end

      it '適切なステータスコードを返す' do
        post services_path, params: { service: service_params }
        expect(response).to have_http_status(422)
      end

      it '登録画面にレンダリングされること' do
        post services_path, params: { service: service_params }
        expect(response).to render_template :new
      end
    end
  end

  describe 'edit' do
    context '正常系' do
      it '適切なステータスコードを返す' do
        get edit_service_path(service1.id)
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'update' do
    let(:service_update_params) { { name: 'test2' } }
    context '正常系' do
      it '適切なステータスコードを返す' do
        patch service_path(service1.id), params: { service: service_update_params }
        expect(response).to have_http_status(302)
      end

      it 'レコードの値が意図したものに更新される' do
        patch service_path(service1.id), params: { service: service_update_params }
        expect(service1.reload[:name]).to eq 'test2'
      end

      it '詳細画面にリダイレクトされる' do
        patch service_path(service1.id), params: { service: service_update_params }
        expect(response).to redirect_to(service_path(service1.id))
      end
    end


    context '異常系の場合' do
      before do
        service_update_params[:name] = ''
      end
      it '適切なステータスコードを返す' do
        patch service_path(service1.id), params: { service: service_update_params }
        expect(response).to have_http_status(422)
      end

      it '値が更新されていないこと' do
        expect do
          patch service_path(service1.id), params: { service: service_update_params }
        end.not_to change(service1.reload, :updated_at)
      end

      it '編集画面にレンダリングされる' do
        patch service_path(service1.id), params: { service: service_update_params }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'destroy' do
    it 'レコードの値が一つ減ること' do
      expect do
        delete service_path(service1.id)
      end.to change { Service.count }.by(-1)
    end

    it '一覧画面にリダイレクトされること' do
      delete service_path(service1.id)
      expect(response).to redirect_to(services_path)
    end
  end
end
