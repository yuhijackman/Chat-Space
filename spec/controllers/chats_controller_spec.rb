require 'rails_helper'

describe ChatsController do

  describe 'GET #index' do
    login_user
    let(:user) { create(:user) }
    let(:group) { create(:group) }

    it "assigns the requested contact to @chat" do
      get :index, group_id: group.id
      expect(assigns(:chat)).to be_a_new(Chat)
    end

     it "assigns the requested contact to @group" do
      get :index, params:{ group_id: group.id }
      expect(assigns(:group)).to eq (group)
    end

     it "assigns the requested contact to @groups" do
      get :index,  params:{ group_id: group.id }
      expect(assigns(:groups)).to eq subject.current_user.groups
    end

    it "renders the :index template" do
      get :index, group_id: group.id
      expect(response).to render_template :index
    end
  end
end
