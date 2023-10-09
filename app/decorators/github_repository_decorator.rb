class GithubRepositoryDecorator < SimpleDelegator
  MAX_DESCRIPTION_LENGTH = 100
  private_constant :MAX_DESCRIPTION_LENGTH

  def header
    "#{name}, by #{owner}"
  end

  def formatted_description
    truncate_description(description)
  end

  def footer
    "language: #{language || 'none'}, license: #{license || 'none'}"
  end

  private

  def truncate_description(description)
    description&.truncate(MAX_DESCRIPTION_LENGTH, separator: ' ')
  end
end
