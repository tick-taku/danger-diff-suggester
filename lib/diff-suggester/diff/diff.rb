module GitHubDiff
  class Diff

    def initialize(file_path:, hunks:)
      @file_path = file_path
      @hunks = hunks
    end

    def file_path
      return @file_path
    end

    def hunks
      return @hunks
    end
  end
end
