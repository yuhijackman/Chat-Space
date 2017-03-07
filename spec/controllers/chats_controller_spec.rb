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
    context 'with valid attributes' do
      it 'save the new content in the database' do
        expect{
        post :create, params: { group_id: group.id, chat: attributes_for(:chat) } }.to change(Chat, :count).by(1)
      end

      it 'successfully create to the render :index template ' do
        post :create, params: { group_id: group.id, chat: attributes_for(:chat)}
        expect(response).to redirect_to(group_chats_path)
      end
    end

    context "with invalid attributes" do
      it 'can  not create to render the same template' do
        post :create, params: { group_id: group.id, chat: invalid_attributes }
        expect(invalid_attributes).to render_template :index, params: { group_id: group.id }
      end

      it 'can not save the chat' do
        expect{ post :create, params: { group_id: group.id, chat: invalid_attributes } }.to change(Chat, :count).by(0)
      end

      it 'shows alert a message' do
        post :create, params: { group_id: group.id, chat: invalid_attributes }
        expect(flash[:alert]).to include('メッセージを入力して下さい')
      end
    end
  end
end
