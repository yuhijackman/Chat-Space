require 'rails_helper'

describe ChatsController do

    login_user
    let(:user) { create(:user) }
    let(:group) { create(:group) }
    let(:invalid_attributes) { FactoryGirl.attributes_for(:chat, body: "") }

  describe 'GET #index' do

    it 'assigns the requested contact to @chat' do
      get :index, params: { group_id: group.id }
      expect(assigns(:chat)).to be_a_new(Chat)
    end

     it 'assigns the requested contact to @group' do
      get :index, params: { group_id: group.id }
      expect(assigns(:group)).to eq (group)
    end

     it 'assigns the requested contact to @groups' do
      get :index,  params: { group_id: group.id }
      expect(assigns(:groups)).to eq subject.current_user.groups
    end

    it 'renders the :index template' do
      get :index, params: { group_id: group.id }
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do

    it 'save the new content in the database' do
      expect{
        post :create, params: { group_id: group.id, chat: attributes_for(:chat) } }.to change(Chat, :count).by(1)
    end

    it 'create a new content' do
    post :create, params: { group_id: group.id, chat: attributes_for(:chat)}
    expect(response).to redirect_to(group_chats_path)
    end

    it 'does not save the new content' do
    post :create, params: { group_id: group.id, chat: invalid_attributes }
    expect(invalid_attributes).to render_template :index, params: { group_id: group.id }
   end
  end
end
