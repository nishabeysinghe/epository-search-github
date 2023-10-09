class GithubRepository
  attr_reader :name, :description, :repo_url, :language, :stargazers_count,:forks_count, :owner, :license

  def initialize(data)
    @name = data[:name]
    @description = data[:description]
    @repo_url = data[:html_url]
    @language = data[:language]
    @stargazers_count = data[:stargazers_count]
    @forks_count = data[:forks_count]
    @owner = data.dig(:owner, :login)
    @license = data.dig(:license, :name)
  end
end
