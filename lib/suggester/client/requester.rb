require 'net/https'
require 'json'

module GitHubRequester
  class PullRequest

    def initialize(repo:, pr_number:, access_token:)
      @uri = URI.parse("https://api.github.com/repos/#{repo}/pulls/#{pr_number}/comments")
      @request = Net::HTTP::Post.new(@uri)
      @request['Accept'] = 'application/vnd.github+json'
      @request['Authorization'] = "Bearer #{access_token}"
      @request['X-GitHub-Api-Version'] = '2022-11-28'
    end

    def create_comment(path:, body:, commit_id:, line:, start_line:, side:, start_side:)
      @request.body = {
        'commit_id': commit_id,
        'path': path,
        'body': body,
        'line': line,
        'start_line': start_line,
        'side': side,
        'start_side': start_side
      }.to_json

      response = Net::HTTP.start(@uri.host, @uri.port, use_ssl: @uri.scheme == 'https') do |http|
        http.request(@request)
      end
      return response
    end
  end
end
