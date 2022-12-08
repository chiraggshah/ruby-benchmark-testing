require 'benchmark/ips'


Benchmark.ips do |x|
  x.report('block') { (1..100).map { |i| i.to_s } }
  x.report('symbol_to_proc') { (1..100).map(&:to_s) }
  x.compare!
end


# Warming up --------------------------------------
#                block     6.920k i/100ms
#       symbol_to_proc     7.857k i/100ms
# Calculating -------------------------------------
#                block     68.819k (± 2.6%) i/s -    346.000k in   5.031579s
#       symbol_to_proc     78.391k (± 1.8%) i/s -    392.850k in   5.013296s

# Comparison:
#       symbol_to_proc:    78391.2 i/s
#                block:    68819.1 i/s - 1.14x  (± 0.00) slower
