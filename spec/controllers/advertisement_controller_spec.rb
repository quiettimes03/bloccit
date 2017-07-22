require 'rails_helper'

RSpec.describe AdvertisementController, type: :controller do
  let(:my_ads) {Advertisement.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 50)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_ads] to @advertisements" do
      get :index
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_ads.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: my_ads.id}
      expect(repsonse).to render_template :show
    end

    it "assigns my_ads to @advertisements" do
      get :show, {id: my_ads.id}
      expects(assigns(:post)).to eq(my_ads)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @advertisements" do
      get :new
      expect(assigns(:advertisements)).not_to be_nil
    end
  end

  describe "GET #create" do
    it "increases the number of advertisements by 1" do
        expect{advertisements :create, advertisements: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_number}}.to change(Advertisement, :count).by(1)
    end

    it "assigns the new ad to advertisements" do
      advertisements :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_number}
      expect(assigns(:advertisements)).to eq Advertisement.last
    end

    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
