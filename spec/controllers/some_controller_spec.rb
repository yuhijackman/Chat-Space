require 'spec_helper'

describe SomeController do
  login_user

  it "should have a current_user" do
    expect(subject.current_user).not_to eq nil
  end
end
