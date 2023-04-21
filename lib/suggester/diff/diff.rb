module GitHubDiff
  class Diff
    def initialize(file_path:, hunks:)
      @file_path = file_path
      @hunks = hunks
    end
  end
end
