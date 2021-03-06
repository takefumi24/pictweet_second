require 'rails_helper'

describe TweetsController do
  describe 'Get #new' do
    it "new.html.erbに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "@tweetに正しい値が入っていること" do
      # factory_botを使ったインスタンス作成
      tweet = create(:tweet)
      # 擬似的なリクエストをして、idというキーのバリューに作成したインスタンスのidをセット
      get :edit, params: {id: tweet}
      # リクエストされたeditアクションの中で定義されている@tweetが、先程作成したtweetと一致しているか
      expect(assigns(:tweet)).to eq tweet
    end

    it "edit.html.erbに遷移すること" do
      tweet = create(:tweet)
      get :edit, params: {id: tweet}
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "@tweetに正しい値が入っていること" do
      tweets = create_list(:tweet, 3)
      get :index
      expect(assigns(:tweets)).to match(tweets.sort{|a, b| b.created_at <=> a.created_at })
    end

    it "index.html.erbに遷移すること" do
    end
  end
end
