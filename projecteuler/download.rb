require "harvestman"

problem_id = 2

class Problem
  attr_accessor :title, :wording

  def initialize(**opts)
    @problem_id = opts[:id]
  end

  def download
    Harvestman.crawl("https://projecteuler.net/problem=#{problem_id}") do
      @title = css("#content > h2").inner_text
      @wording = css(".problem_content").inner_text
    end
  end
end

def main
  "[ERROR] You need to specify a problem ID" if ARGV.empty?

  id = ARGV[0]
  problem = Problem.new(id: id)
  # parei aqui
end

puts main()
