require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's email and password" do
        post :create, params: { user: { email: "rex@bodoia.com", password: "" } }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
  end
end
