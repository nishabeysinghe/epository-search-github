require 'rails_helper'

#even though this is not an active record model following this way to make the test structure consistent
describe GithubRepository, type: :model do
  let(:repository_data) do
    {
      name: 'example-repo',
      description: 'An example repository',
      html_url: 'https://github.com/example/example-repo',
      language: 'Ruby',
      stargazers_count: 42,
      forks_count: 10,
      owner: { login: 'user1' },
      license: { name: 'MIT License' }
    }
  end

  subject { described_class.new(repository_data) }

  describe '#initialize' do
    it 'sets attributes based on data' do
      expect(subject.name).to eq('example-repo')
      expect(subject.description).to eq('An example repository')
      expect(subject.repo_url).to eq('https://github.com/example/example-repo')
      expect(subject.language).to eq('Ruby')
      expect(subject.stargazers_count).to eq(42)
      expect(subject.forks_count).to eq(10)
      expect(subject.owner).to eq('user1')
      expect(subject.license).to eq('MIT License')
    end
  end
end
