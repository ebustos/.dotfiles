require 'rubygems'
# require 'bond'
# require 'bond/completion'

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:LOAD_MODULES] = [] unless IRB.conf.key?(:LOAD_MODULES)
unless IRB.conf[:LOAD_MODULES].include?('irb/completion')
    IRB.conf[:LOAD_MODULES] << 'irb/completion'
end

require 'wirble'

Wirble.init
Wirble.colorize

#
# step 2 : install wirble gem 
# sudo gem install wirble 


 #!/usr/bin/ruby
# # coding: utf-8
#
# require
# ‘rubygems’
# require
# ‘wirble’
#
# #
# Include
# tab-completion
# in
# irb
# #require
# ‘irb/completion’
#
# #instead
# I
# choose
# Bond
# require
# ‘bond’
# require
# ‘bond/completion’
# …
#
