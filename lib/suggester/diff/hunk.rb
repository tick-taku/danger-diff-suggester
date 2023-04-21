module GitHubDiff
  class Hunk
    def initialize(code:, start_line:, end_line:)
      @code = code
      @start_line = start_line
      @end_line = end_line
    end
  end
end
