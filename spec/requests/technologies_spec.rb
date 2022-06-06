require 'rails_helper'

RSpec.describe 'Technologies', type: :request do
  let!(:technology1) { create(:technology) }
  let!(:user) { create(:user) }
  before do
    sign_in user
  end

  describe 'index' do
    it '適切なステータスコードを返す' do
      get technologies_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'show' do
    it '適切なステータスコードを返す' do
      get technology_path(technology1.id)
      expect(response).to have_http_status(200)
    end
  end

  describe 'new' do
    it '適切なステータスコード' do
      get new_technology_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'create' do
    let(:technology_params) { { name: 'test' } }
    context '正常系' do
      it '適切なステータスコードを返す' do
        post technologies_path, params: { technology: technology_params }
        expect(response).to have_http_status(302)
      end

      it '一覧画面にリダイレクトされる' do
        post technologies_path, params: { technology: technology_params }
        expect(response).to redirect_to(technologies_path)
      end

      it 'レコードが一つ増える' do
        expect do
          post technologies_path, params: { technology: technology_params }
        end.to change { Technology.count }.by(1)
      end
    end

    context '異常系' do
      before do
        technology_params[:name] = ''
      end

      it '適切なステータスコードを返す' do
        post technologies_path, params: { technology: technology_params }
        expect(response).to have_http_status(422)
      end

      it '登録画面にレンダリングされること' do
        post technologies_path, params: { technology: technology_params }
        expect(response).to render_template :new
      end
    end
  end

  describe 'edit' do
    context '正常系' do
      it '適切なステータスコードを返す' do
        get edit_technology_path(technology1.id)
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'update' do
    let(:technology_update_params) { { name: 'test2' } }
    context '正常系' do
      it '適切なステータスコードを返す' do
        patch technology_path(technology1.id), params: { technology: technology_update_params }
        expect(response).to have_http_status(302)
      end

      it 'レコードの値が意図したものに更新される' do
        patch technology_path(technology1.id), params: { technology: technology_update_params }
        expect(technology1.reload[:name]).to eq 'test2'
      end

      it '詳細画面にリダイレクトされる' do
        patch technology_path(technology1.id), params: { technology: technology_update_params }
        expect(response).to redirect_to(technology_path(technology1.id))
      end
    end

    context '異常系の場合' do
      before do
        technology_update_params[:name] = ''
      end
      it '適切なステータスコードを返す' do
        patch technology_path(technology1.id), params: { technology: technology_update_params }
        expect(response).to have_http_status(422)
      end

      it '値が更新されていないこと' do
        expect do
          patch technology_path(technology1.id), params: { technology: technology_update_params }
        end.not_to change(technology1.reload, :updated_at)
      end

      it '編集画面にレンダリングされる' do
        patch technology_path(technology1.id), params: { technology: technology_update_params }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'destroy' do
    it 'レコードの値が一つ減ること' do
      expect do
        delete technology_path(technology1.id)
      end.to change { Technology.count }.by(-1)
    end

    it '一覧画面にリダイレクトされること' do
      delete technology_path(technology1.id)
      expect(response).to redirect_to(technologies_path)
    end
  end
end
