require_relative 'diff/diff_parser'
require_relative 'client/requester'

module Suggester
  class Suggester

    def initialize(repo:, pr_number:, access_token:)
      @pull_request = GitHubRequester::PullRequest.new(repo: repo, pr_number: pr_number, access_token: access_token)
    end

    def suggest
      diffs = GitHubDiff.parse_from_string
      diffs.each do |diff|
        diff.hunks.each do |hunk|
          @pull_request.create_comment(
            path: diff.file_path,
            body: "```suggestion\n#{hunk.code}\n```",
            line: hunk.end_line,
            start_line: hunk.start_line,
            side: 'RIGHT',
            start_side: 'RIGHT'
          )
        end
      end
    end
  end
end
