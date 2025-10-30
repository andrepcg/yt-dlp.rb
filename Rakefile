# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rake/testtask'
require 'erb'

Rake::TestTask.new do |t|
  t.pattern = 'test/**/*_test.rb'
end

task default: [:test]

desc 'Start an interactive console with the gem loaded'
task :console do
  exec 'irb', '-Ilib', '-ryt-dlp'
end

namespace :binaries do
  def get_binaries(version)
    puts 'Updating python script'
    system("wget -O ./vendor/bin/yt-dlp https://github.com/yt-dlp/yt-dlp/releases/download/#{version}/yt-dlp")
    puts 'Updating Windows EXE'
    system("wget -O ./vendor/bin/yt-dlp.exe https://github.com/yt-dlp/yt-dlp/releases/download/#{version}/yt-dlp.exe")
  end

  desc 'Get binaries for specific version (run with `rake binaries:version[2015.07.07]`)'
  task :version, [:ver] do |_t, a|
    get_binaries(a[:ver])
  end

  desc 'Get latest version'
  task :latest do
    # title = "Release yt-dlp 2025.10.22 · yt-dlp/yt-dlp"
    title = `curl -sL https://github.com/yt-dlp/yt-dlp/releases/latest | grep -oE '<title>[^<]+</title>' | sed 's/<title>//;s/<\\/title>//'`.strip
    puts "Title: #{title}"
    latest_version = title.match(/yt-dlp (\d+\.\d+\.\d+)/)[1]
    puts "Latest version: #{latest_version}"
    get_binaries(latest_version)
  end
end

__END__
# Version file
