require 'rails_helper'
include RandomData

RSpec.describe AdvertisementsController, :type => :controller do
  let (:my_advert) {Advertisement.create!(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_price)}

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_advert] to @advert" do
      get :index
      expect(assigns(:advertisements)).to eq([my_advert])
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @advert" do
      get :new
      expect(assigns(:advertisement)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of Advertisement by 1" do
      expect{post :create, post: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_price}}.to change(Advertisement,:count).by(1)
    end

    it "assigns the new post to @post" do
      post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price}
      expect(response).to redirect_to Advertisement.last
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, {id: my_advert.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: my_advert.id}
      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      get :show, {id: my_advert}
      expect(assigns(:advertisement)).to eq(my_advert)
    end
  end



#  describe "GET create" do
#    it "returns http success" do
#      get :create
#      expect(response).to have_http_status(:success)
#    end
#  end

end
