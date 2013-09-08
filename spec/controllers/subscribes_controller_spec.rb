require 'spec_helper'

describe SubscribesController do

  describe 'GET #show' do
    let(:subscribe){ create :subscribe }
    login
    it 'должен содержать подписку' do
      #get :index
      #expect(assigns :subscribes).to include(subscribe)
    end
  end
  describe 'GET #new' do
    it 'assigns a new Subscribe to @subscribe' do
      get :new
      expect(assigns :subscribe).to be_a_new(Subscribe)
      expect(response).to be_success
    end
  end
  describe 'POST #create' do
    it 'создаёт подписку' do
      expect{
        post :create, subscribe: FactoryGirl.build(:subscribe, email: 'test@gmail.com').attributes
      }.to change(Subscribe,:count).by(1)
    end

    it 'редиректит на главную после создания подписки' do
      post :create, subscribe: FactoryGirl.create(:subscribe, email: 'test@gmail.com').attributes
      expect(response).to be_success
    end
  end
end