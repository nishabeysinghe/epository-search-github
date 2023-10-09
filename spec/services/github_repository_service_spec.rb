require 'rails_helper'

RSpec.describe GithubRepositoryService do
  describe '#call_for_repositories_by' do
  it 'fetches repositories by name and caches the result', vcr: { cassette_name: 'github_repository_service/call_for_repositories_by' } do
    VCR.use_cassette('github_repository_service/call_for_repositories_by', record: :new_episodes) do
        service = GithubRepositoryService.new
        WebMock.disable_net_connect!(allow_localhost: true)
        result1 = service.call_for_repositories_by('rails')
        expect(result1).to include(:items)
        expect(result1).to be_a(Hash)
        allow(WebMock).to receive(:stub_request)

        WebMock.disable_net_connect!(allow_localhost: true)
        result2 = service.call_for_repositories_by('rails')
        expect(result2).to include(:items)
        expect(result2).to be_a(Hash)

        #testing the cache
        expect(WebMock).not_to receive(:stub_request)
      end
    end
  end
end
