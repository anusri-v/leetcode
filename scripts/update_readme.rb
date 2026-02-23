#!/usr/bin/env ruby
# frozen_string_literal: true

# Updates README.md with current problem counts and problem lists.

DIFFICULTIES = %w[easy medium hard].freeze
ROOT = File.expand_path('..', __dir__)

def titleize(filename)
  File.basename(filename, '.rb').split('-').map(&:capitalize).join(' ')
end

def collect_problems
  DIFFICULTIES.each_with_object({}) do |diff, hash|
    dir = File.join(ROOT, diff)
    files = Dir.glob(File.join(dir, '*.rb')).sort.map { |f| File.basename(f) }
    hash[diff] = files
  end
end

def build_stats(problems)
  rows = DIFFICULTIES.map do |diff|
    "| #{diff.capitalize} | #{problems[diff].size} |"
  end
  total = problems.values.sum(&:size)
  rows << "| **Total** | **#{total}** |"

  <<~TABLE
    | Difficulty | Count |
    |------------|-------|
    #{rows.join("\n")}
  TABLE
end

def build_problem_list(problems)
  sections = DIFFICULTIES.map do |diff|
    files = problems[diff]
    heading = "### #{diff.capitalize}"
    if files.empty?
      "#{heading}\nNo problems solved yet."
    else
      rows = files.each_with_index.map do |f, i|
        "| #{i + 1} | [#{titleize(f)}](#{diff}/#{f}) |"
      end
      <<~SECTION
        #{heading}
        | # | Problem |
        |---|---------|
        #{rows.join("\n")}
      SECTION
    end
  end
  sections.join("\n")
end

problems = collect_problems
readme_path = File.join(ROOT, 'README.md')
content = File.read(readme_path)

stats = build_stats(problems).strip
content.sub!(/<!-- stats-start -->.*<!-- stats-end -->/m, "<!-- stats-start -->\n#{stats}\n<!-- stats-end -->")

problem_list = build_problem_list(problems).strip
content.sub!(/<!-- problems-start -->.*<!-- problems-end -->/m, "<!-- problems-start -->\n#{problem_list}\n<!-- problems-end -->")

File.write(readme_path, content)
puts "README.md updated: #{problems.values.sum(&:size)} problems"
