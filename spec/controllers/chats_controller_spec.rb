require 'rails_helper'

describe ChatsController do

  describe 'GET #index' do
      login_user
      group = FactoryGirl.create(:group)

    it "renders the :index template" do
      get :index, group_id: group.id
      expect(response).to render_template :index
    end
  end
end
