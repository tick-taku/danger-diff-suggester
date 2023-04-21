module GitHubDiff
  class Hunk

    def initialize(code:, start_line:, end_line:)
      @code = code
      @start_line = start_line
      @end_line = end_line
    end

    def code
      return @code
    end

    def start_line
      return @start_line
    end

    def end_line
      return @end_line
    end
  end
end
