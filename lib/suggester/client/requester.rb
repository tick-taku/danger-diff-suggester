require 'net/https'
require 'json'
require 'octokit'

module GitHubRequester
  class PullRequest

    def initialize(repo:, pr_number:, access_token:)
      octokit_client = Octokit::Client.new(access_token: access_token)
      @pr = octokit_client.pull_request(repo, pr_number)

      @uri = URI.parse("https://api.github.com/repos/#{repo}/pulls/#{@pr.number}/comments")
      @request = Net::HTTP::Post.new(@uri)
      @request['Accept'] = 'application/vnd.github+json'
      @request['Authorization'] = "Bearer #{access_token}"
      @request['X-GitHub-Api-Version'] = '2022-11-28'
    end

    def create_comment(path:, body:, line:, start_line:, side:, start_side:)
      @request.body = {
        'commit_id': @pr.commit_id,
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
