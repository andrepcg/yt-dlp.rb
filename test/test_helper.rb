# frozen_string_literal: true

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

gem 'minitest'
require 'minitest/autorun'
require 'minitest/spec'
require 'nicetest'
require 'fileutils'
require 'yaml'
require 'bundler/setup'

require 'yt-dlp'

TEST_ID = 'gvdf5n-zI14'
TEST_URL = 'https://www.youtube.com/watch?feature=endscreen&v=gvdf5n-zI14'
TEST_URL2 = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
TEST_FILENAME = 'nope.avi.mp4'
TEST_FORMAT = '133'
TEST_GLOB = 'nope*'

def remove_downloaded_files
  Dir.glob('**/*nope*').each do |nope|
    File.delete(nope)
  end
end

def travis_ci?
  !!ENV['TRAVIS']
end
Bundler.require(:extras) if defined?(Bundler) && !travis_ci?
