# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::RegistrationsController, type: :controller do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]

    # Generate a fresh RSA key pair for tests
    rsa_private = OpenSSL::PKey::RSA.generate(2048)
    rsa_public = rsa_private.public_key

    # Stub the private_key and public_key methods to return the test keys
    allow(JsonWebToken).to receive_messages(private_key: rsa_private, public_key: rsa_public)
  end

  describe "POST #create" do
    let(:valid_attributes) do
      {
        user: {
          email: "test@example.com",
          password: "password123",
          password_confirmation: "password123",
          name: "Test User"
        }
      }
    end

    let(:invalid_attributes) do
      {
        user: {
          email: "",
          password: "password123",
          password_confirmation: "password123",
          name: ""
        }
      }
    end

    context "with valid params" do
      before do
        allow(controller).to receive(:verify_recaptcha).and_return(true)
      end

      it "creates a new User" do
        expect do
          post :create, params: valid_attributes
        end.to change(User, :count).by(1)
      end

      it "sets the JWT cookie" do
        post :create, params: valid_attributes
        expect(cookies[:cvt]).to be_present
      end
    end

    context "with invalid params" do
      before do
        allow(controller).to receive(:verify_recaptcha).and_return(true)
      end

      it "does not create a new User" do
        expect do
          post :create, params: invalid_attributes
        end.not_to change(User, :count), "Expected not to create a user, but did."
      end
    end
  end

  describe "GET #new" do
    context "if registration is blocked" do
      before do
        allow(Flipper).to receive(:enabled?).with(:block_registration).and_return(true)
        get :new
      end

      it "redirects to the login page" do
        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to eq("Registration is currently blocked")
      end
    end
  end
end
