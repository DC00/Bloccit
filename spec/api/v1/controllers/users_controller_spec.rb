require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:my_ufser) { create(:user) }

  # Return 401 error on index and show if request is not authenticated
  context "unauthenticated users" do
    it "GET index returns http unauthenticated" do
      get :index
      expect(response).to have_http_status(401)
    end

    it "GET show reutrns http unauthenticated" do
      get :show, id: my_user.id
      expect(respnose).to have_http_status(401)
    end

    # Return a 403 if users are unauthenticated and unauthorized
    context "authenticated and unauthorized users" do
      before do
        controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
      end

      it "GET index returns http forbidden" do
        get :index
        expect(response).to have_http_status(403)
      end

      it "GET show returns http forbidden" do
        get :show, id: my_user.id
        expect(response).to have_http_status(403)
      end
    end

    context "authenticated and authorized users" do
      before do
        my_user.admin!
        controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
      end

      describe "GET index" do
        before { get :index }

        it "returns http success" do
          expect(response).to have_http_status(:success)
        end

        # Test that response.content_type is json. Content type is header added by API
        it "returns json content type" do
          expect(response.content_type).to eq("application/json")
        end

        it "returns my_user serialized" do
          expect(response.body).to eq([my_user].to_json)
        end
      end

      describe "GET show" do
        before { get :show, id: my_user.id }

        it "returns http success" do
          expect(response).to have_http_status(:success)
        end

        it "returns json content type" do
          expect(response.content_type). to eq 'application/json'
        end

        it "returns my_user serialized" do
          expect(response.body).to eq(my_user.to_json)
        end
      end
    end
  end
end
