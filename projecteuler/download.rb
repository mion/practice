require "harvestman"
require "pry"

problem_id = 2

class ProblemDownloader
  attr_accessor :title, :wording

  def initialize(id)
    @problem_id = id
  end

  def download
    puts "Downloading problem with ID = '#{@problem_id}'"
    result = {}
    Harvestman.crawl("https://projecteuler.net/problem=#{@problem_id}") do
      result[:title] = css("#content > h2").inner_text.strip
      result[:wording] = css(".problem_content").inner_text.strip
    end
    result
  end
end

def main
  return "[ERROR] You need to specify a problem ID" if ARGV.empty?

  id = ARGV[0]
  problem_downloader = ProblemDownloader.new(id)
  problem = problem_downloader.download
  title = problem[:title]
  lines = problem[:wording].split("\n")
  puts ";" * 80
  puts ";; #{title}"
  lines.each do |line|
    puts ";;\t #{line}"
  end
  puts ";" * 80
  puts "\n#lang racket\n"
end

puts main()
