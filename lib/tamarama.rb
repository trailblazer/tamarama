module Tamarama
end

# http://blog.andrewvc.com/quickly-constantize/
# "Net::HTTP".split('::').inject(Object) {|memo,name| memo = memo.const_get(name); memo}
