require 'rails_helper'

RSpec.describe HomeController, type: :request do
  context 'GET #index' do

    it 'renders the index template' do
      get root_path

      expect(response).to render_template(:index)
    end
  end
end