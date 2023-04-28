module GitHubDiff
  class Hunk

    def initialize(body:, start_line:, end_line:)
      @body = body
      @start_line = start_line
      @end_line = end_line
    end

    def body
      return @body
    end

    def start_line
      return @start_line
    end

    def end_line
      return @end_line
    end
  end
end
