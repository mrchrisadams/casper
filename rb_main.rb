#
# rb_main.rb
# casper
#
# Created by Chris Adams on 06/04/2010.
# Copyright Headshift Ltd. 2010. All rights reserved.
#

# Loading the Cocoa framework. If you need to load more frameworks, you can
# do that here too.
 framework 'Cocoa'

# 
NSLog File.expand_path("../vendor/*/lib", __FILE__)
dir_path = NSBundle.mainBundle.resourcePath.fileSystemRepresentation
Dir[File.join(dir_path, "vendor/*/lib")].each do |directory|
 NSLog "Adding " + directory
  $LOAD_PATH.unshift(directory)
end

p $:

require 'ghost'

# Loading all the Ruby project files.
main = File.basename(__FILE__, File.extname(__FILE__))
dir_path = NSBundle.mainBundle.resourcePath.fileSystemRepresentation
Dir.glob(File.join(dir_path, '*.{rb,rbo}')).map { |x| File.basename(x, File.extname(x)) }.uniq.each do |path|
  if path != main
    require(path)
  end
end

# Starting the Cocoa main loop.
NSApplicationMain(0, nil)

require 'pp'

NSLog Host.list
