require 'rails_helper'

describe GithubRepositoryDecorator, type: :presenter do
  let(:repository_data) do
    {
      name: 'example-repo',
      description: 'This is a long description that needs to be truncated.This is a long description that needs to be truncated.This is a long description that needs to be truncated.',
      language: 'Ruby',
      owner: { login: 'user1' },
      license: { name: 'MIT License' }
    }
  end

  let(:repository) { GithubRepository.new(repository_data) }
  let(:decorator) { described_class.new(repository) }

  describe 'it should formate the header' do
    it 'formats the header correctly' do
      expect(decorator.header).to eq('example-repo, by user1')
    end
  end

  describe 'it should formate the description' do
    it 'truncates and formats the description correctly' do
      expect(decorator.formatted_description).to eq('This is a long description that needs to be truncated.This is a long description that needs to be...')
    end
  end

  describe 'it should formate the footer' do
    it 'formats the footer correctly' do
      expect(decorator.footer).to eq('language: Ruby, license: MIT License')
    end
  end
end
