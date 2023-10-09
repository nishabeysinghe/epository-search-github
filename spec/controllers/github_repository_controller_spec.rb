require 'rails_helper'

RSpec.describe GithubRepositoryController, type: :request do
  context 'GET #index' do
    before do
      allow(controller).to receive(:initialize_github_service)
      allow(controller).to receive(:initialize_github_service).and_call_original
    end

    #to be written
    end
  end
end
