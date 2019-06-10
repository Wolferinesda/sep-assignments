require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

n = 10000
l_list = LinkedList.new


Benchmark.bm do |x|

  x.report("create array: ") { Array.new(n, "item") }
  x.report("create linked-list: ") {n.times do l_list.add_to_tail(Node.new("item")); end}
end

array = Array.new(n, "item")

Benchmark.bm do |x|

  x.report("5000th element of array: ") {array[4999]}
  x.report("5000th node of linked-list: ") {l_list.find_node(5000)}
end

Benchmark.bm do |x|
  x.report("remove 5000th element of array: ") {array.delete_at(4999)}
  x.report("remove 5000th node of linked-list: ") {l_list.delete(l_list.find_node(5000))}
end
