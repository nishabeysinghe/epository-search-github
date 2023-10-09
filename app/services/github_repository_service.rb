class GithubRepositoryService
  API_BASE_URL = 'https://api.github.com/'.freeze
  CACHE_EXPIRATION = 1.hour

  def initialize
    @conn = Faraday.new(url: API_BASE_URL, request: { timeout: 5, open_timeout: 2 })
  end

  def call_for_repositories_by(repo_name)
    Rails.cache.fetch([repo_name], expires_in: CACHE_EXPIRATION) do
      response = conn.get("/search/repositories?q=#{repo_name}#&sort=stars&order=desc")
      handle_response(response)
    end
  rescue Faraday::ConnectionFailed, Faraday::TimeoutError => e
    Rails.logger.error("GithubRepositoryService: Failed to connect to GitHub API: #{e.message}")
    {}
  end

  private

  attr_reader :conn

  def sort_by_stars
    '&sort=stars&order=desc'
  end

  def handle_response(response)
    if response.success?
      parse_data(response)
    else
      Rails.logger.error("GithubRepositoryService: GitHub API request failed with status #{response.status}")
      {}
    end
  end

  def parse_data(response)
    JSON.parse(response.body || '{}', symbolize_names: true)
  end
end
