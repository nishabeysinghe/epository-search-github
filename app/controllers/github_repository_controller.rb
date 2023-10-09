class GithubRepositoryController < ApplicationController
  include Pagination
  
  before_action :initialize_github_service, only: :index

  def index
    repo_name = params[:repo_name]
    response = @github_service.call_for_repositories_by(repo_name)
    items = response[:items] || []

    @repos = process_data(items)
    @repos = paginate_data(@repos)
  end

  private

  def initialize_github_service
    @github_service = GithubRepositoryService.new
  end

  def process_data(items)
    items.map do |item|
      GithubRepositoryDecorator.new(GithubRepository.new(item))
    end
  end

  def paginate_data(data)
    data.then(&paginate)
  end
end
