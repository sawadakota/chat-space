require 'rails_helper'

describe MessagesController do
  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    it "saves the new contact in the database" do
      expect{
        post :create, message: attributes_for(:message)
      }.to change(Message, :count).by(1)
    end

    it "redirects to messages#index" do
      expect{
        post :create, message: attributes_for(:message)
      .to redirect_to root_path
    end

  end
end
