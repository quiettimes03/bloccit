require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do

  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }

  let(:sponsored_post) { my_topic.sponsoredpost.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }


  describe "GET #show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: sponsored_post.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id: sponsored_post.id
      expect(response).to render_template :show
    end

    it "assigns sponsored_post to @sponsoredpost" do
      get :show, topic_id: my_topic.id, id: sponsored_post.id
      expect(assigns(:post)).to eq(sponsored_post)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, topic_id: my_topic.id
      expect(response).to render_template :new
    end

    it "instantiates @sponsored_post" do
      get :new, topic_id: my_topic.id
      expect(assigns(:sponsoredpost)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of Post by 1" do
      expect{post :create, topic_id: my_topic.id, sponsoredpost: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Post,:count).by(1)
    end

    it "assigns the new sponsoredpost to @sponsoredpost" do
      post :create, topic_id: my_topic.id, sponsoredpost: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(assigns(:sponsoredpost)).to eq SponsoredPost.last
    end

    it "redirects to the new post" do
      post :create, topic_id: my_topic.id, sponsoredpost: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(response).to redirect_to [my_topic, SponsoredPost.last]
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, topic_id: my_topic.id, id: sponsored_post.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, topic_id: my_topic.id, id: sponsored_post.id
      expect(response).to render_template :edit
    end

    it "assigns sponsoredpost the the updated @sponsoredpost" do
      get :edit, topic_id: my_topic.id, id: sponsored_post.id
      sponsoredpost_instance = assigns(:sponsoredpost)
      expect(sponsoredpost_instance.id).to eq sponsored_post.id
      expect(sponsoredpost_instance.title).to eq sponsored_post.title
      expect(sponsoredpost_instance.body).to eq sponsored_post.body
    end
  end

  describe "PUT update" do
    it "updates sponsoredpost with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, topic_id: my_topic.id, id: sponsored_post.id, sponsoredpost: {title: new_title, body: new_body}

      updated_sponsor = assigns(:post)
      expect(updated_sponsor.id).to eq sponsored_post.id
      expect(updated_sponsor.title).to eq new_title
      expect(updated_sponsor.body).to eq new_body
    end

    it "redirects to the updated post" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, topic_id: my_topic.id, id: sponsored_post.id, sponsoredpost: {title: new_title, body: new_body}
      expect(response).to redirect_to [my_topic, sponsored_post]
    end
  end

  describe "DELETE destroy" do
    it "deletes the sponsoredpost" do
      delete :destroy, topic_id: my_topic.id, id: sponsored_post.id
      count = SponsoredPost.where({id: sponsored_post.id}).size
      expect(count).to eq 0
    end

    it "redirects to topics show" do
      delete :destroy, topic_id: my_topic.id, id: sponsored_post.id
      expect(response).to redirect_to my_topic
    end
  end

end
