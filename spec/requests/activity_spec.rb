require 'rails_helper'

RSpec.describe 'Activities', type: :request do
  let!(:activity1) { create(:activity) }
  let(:activity_params) {
 { title: 'test', leader_name: '山田', amount: 2000, is_secret: true, suggestion_summary: 'test', suggestion_detail: 'test2' } }

  describe 'GET index' do
    it 'returns http success' do
      get activities_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET show' do
    it 'returns http success' do
      get activity_path(activity1.id)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET new' do
    it 'returns http success' do
      get new_activity_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET edit' do
    it 'returns http success' do
      get edit_activity_path(activity1.id)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST create' do
    context '正常系' do
      it 'returns http success' do
        post activities_path, params: { activity: activity_params }
        expect(response).to have_http_status(302)
      end

      it '一覧画面にリダイレクトされること' do
        post activities_path, params: { activity: activity_params }
        expect(response).to redirect_to(activities_path)
      end

      it 'レコードの値が一つ増えること' do
        expect do
          post activities_path, params: { activity: activity_params }
        end.to change { Activity.count }.by(1)
      end
    end

    context '異常系' do
      before do
        activity_params[:title] = ''
      end
      it 'レコードが作成できないとき、日本語でエラーメッセージが表示される' do
        activity = Activity.create(title: '', leader_name: '渡辺', amount: 1400, suggestion_summary: 'message', suggestion_detail: 'message2')
        activity.save
        message = activity.errors.full_messages
        expect(message[0]).to eq('タイトル は必須項目です。')
      end

      it '登録画面にレンダリングされること' do
        post activities_path, params: { activity: activity_params }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH update' do
    context '正常系' do
      it 'returns http success' do
        patch activity_path(activity1.id), params: { activity: activity_params }
        expect(response).to have_http_status(302)
      end

      it 'レコードの値が意図したものに更新される' do
        patch activity_path(activity1.id), params: { activity: activity_params }
        expect(activity1.reload[:title]).to eq 'test'
        expect(activity1.reload[:leader_name]).to eq '山田'
        expect(activity1.reload[:amount]).to eq 2000
        expect(activity1.reload[:is_secret]).to eq true
        expect(activity1.reload[:suggestion_summary]).to eq 'test'
        expect(activity1.reload[:suggestion_detail]).to eq 'test2'
      end

      it '詳細画面にリダイレクトされる' do
        patch activity_path(activity1.id), params: { activity: activity_params }
        expect(response).to redirect_to(activity_path)
      end
    end

    context '異常系' do
      before do
          activity_params[:title] = ''
        end
      it 'returns http status' do
        patch activity_path(activity1.id), params: { activity: activity_params }
        expect(response).to have_http_status(422)
      end

      it '値が更新されていないこと' do
        expect do
          patch activity_path(activity1.id), params: { activity: activity_params }
        end.not_to change(activity1.reload, :updated_at)
      end

      it '編集画面にレンダリングされる' do
        patch activity_path(activity1.id), params: { activity: activity_params }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    it 'レコードの値が一つ減ること' do
      expect do
        delete activity_path(activity1.id)
      end.to change { Activity.count }.by(-1)
    end

    it '一覧画面にリダイレクトされること' do
      delete activity_path(activity1.id)
      expect(response).to redirect_to(activities_path)
    end
  end
end
