require 'git_diff'
require_relative 'hunk'
require_relative 'diff'

module GitHubDiff

  def parse_from_string
    diffs = get_diff_string.files.map { |file|
      hunks = file.hunks.map { |hunk| hunk(hunk) }
      Diff.new(file_path: file.b_path, hunks: hunks)
    }
    return diffs
  end

  def get_diff_string
    return ::GitDiff.from_string(`git diff --unified=0 HEAD`)
  end

  def hunk(hunk)
    addition_lines = hunk.lines.select{|l| l.content.start_with?('+')}.map do |line|
      line.content.scan(/^\+([^+].*)/)
    end
    target_range = hunk.range_info.new_range
    return Hunk.new(code: addition_lines.join("\n"), start_line: target_range.start, end_line: target_range.start + target_range.number_of_lines)
  end

  module_function :parse_from_string
  module_function :get_diff_string
  module_function :hunk
end
