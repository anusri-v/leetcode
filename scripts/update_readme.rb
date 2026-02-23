#!/usr/bin/env ruby
# frozen_string_literal: true

# Updates README.md with current problem counts and problem lists.

DIFFICULTIES = %w[easy medium hard].freeze
BADGE_COLORS = { 'easy' => '5CB85C', 'medium' => 'F0AD4E', 'hard' => 'D9534F' }.freeze
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
  total = problems.values.sum(&:size)
  badges = DIFFICULTIES.map do |diff|
    color = BADGE_COLORS[diff]
    "![#{diff.capitalize}](https://img.shields.io/badge/#{diff.capitalize}-#{problems[diff].size}-#{color}?style=for-the-badge)"
  end
  badges << "![Total](https://img.shields.io/badge/Total-#{total}-007EC6?style=for-the-badge)"

  <<~STATS
    <div align="center">

    | #{badges.join(' | ')} |
    |#{badges.map { ':---:' }.join('|')}|

    </div>
  STATS
end

def build_problem_list(problems)
  sections = DIFFICULTIES.map do |diff|
    files = problems[diff]
    open_attr = files.any? ? ' open' : ''
    header = "<details#{open_attr}>\n<summary><b>#{diff.capitalize}</b> (#{files.size})</summary>"

    if files.empty?
      "#{header}\n\nNo problems solved yet.\n\n</details>"
    else
      rows = files.each_with_index.map do |f, i|
        "| #{i + 1} | [#{titleize(f)}](#{diff}/#{f}) |"
      end
      <<~SECTION.chomp
        #{header}

        | # | Problem |
        |---|---------|
        #{rows.join("\n")}

        </details>
      SECTION
    end
  end
  sections.join("\n\n")
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
