require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before do # beforeブロックを修正
    @user = create(:user)
    @post = create(:post) # 追加
  end

  describe 'GET /posts/new' do
    context 'ログインしていない場合' do
      it 'HTTPステータス302を返す' do
        get '/posts/new'
        expect(response).to have_http_status(302)
      end

      it 'ログインページにリダイレクトされる' do
        get '/posts/new'
        expect(response).to redirect_to '/users/sign_in'
      end
    end

    context 'ログインしている場合' do
      before { sign_in @user }
      it 'HTTPステータス200を返す' do
        get '/posts/new'
        expect(response).to have_http_status(200)
      end

      it 'ログインページにリダイレクトされない' do
        get '/posts/new'
        expect(response).not_to redirect_to '/users/sign_in'
      end
    end
  end

  describe 'GET /posts/:id' do
    context 'ログインしていない場合' do
      it 'HTTPステータス200を返す' do
        get "/posts/#{@post.id}"
        expect(response).to have_http_status '200'
      end
    end
    context 'ログインしている場合' do
      it 'HTTPステータス200を返す' do
        sign_in @user
        get "/posts/#{@post.id}"
        expect(response).to have_http_status '200'
      end
    end
  end

  describe 'GET /posts/:id/edit' do
    context '修正している場合' do
      it 'HTTPステータス200を返す' do
        get "/posts/#{@post.id}/edit"
        expect(response).to have_http_status '200'
      end
    end
  end

  describe 'GET /' do # 修正
    context 'ログインしていない場合' do
      it 'HTTPステータス200を返す' do
        get '/' # 修正
        expect(response).to have_http_status '200'
      end
    end
    context 'ログインしている場合' do
      it 'HTTPステータス200を返す' do
        sign_in @user
        get '/' # 修正
        expect(response).to have_http_status '200'
      end
    end
  end
  # describe 'ナビゲーションバーの検証' do
  #   context 'ログインしていない場合' do
  #     before { visit '/' }

  #     it 'ログ一覧リンクを表示する' do
  #       expect(page).to have_link('ログ一覧', href: '/posts')
  #     end

  #     it 'ログ投稿リンクを表示しない' do
  #       expect(page).not_to have_link('ログ投稿', href: '/posts/new')
  #     end
  #   end

  #   context 'ログインしている場合' do
  #     before do
  #       user = create(:user) # ログイン用のユーザーを作成
  #       sign_in user # 作成したユーザーでログイン
  #       visit '/'
  #     end

  #     it 'ログ一覧リンクを表示する' do
  #       expect(page).to have_link('ログ一覧', href: '/posts')
  #     end

  #     it 'ログ投稿リンクを表示する' do
  #       expect(page).to have_link('ログ投稿', href: '/posts/new')
  #     end
  #   end
  # end
end