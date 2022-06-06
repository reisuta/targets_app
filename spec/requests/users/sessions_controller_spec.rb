require 'rails_helper'

RSpec.describe Users::SessionsController, type: :request do
  let!(:user) { create(:user) }
  let(:user_params) { { email: user.email, password: user.password } }

  describe 'POST #create' do
    context '正常系' do
      subject {  post login_path, params: { user: user_params } }
      it '302が返ってくること' do
        subject
        expect(response).to have_http_status(302)
      end

      it 'rootにリダイレクトされること' do
        subject
        expect(response).to redirect_to root_url
      end
    end

    context '異常系' do
      subject {  post login_path, params: { user: '' } }
      it '200が返ってくること' do
        subject
        expect(response).to have_http_status(200)
      end

      it 'devise/sessions#newにレンダリングされること' do
        subject
        expect(response).to render_template :new
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      post login_path, params: { user: user_params }
    end

    it '303が返ってくること' do
      delete logout_path
      expect(response).to have_http_status(303)
    end

    it '/loginにリダイレクトされること' do
      delete logout_path
      expect(response).to redirect_to login_url
    end
  end
end
