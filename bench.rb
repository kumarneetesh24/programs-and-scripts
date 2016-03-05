require 'benchmark'

include Benchmark
LOOP_COUNT = 1_000_000

bmbm(12) do |test|
	test.report("inline:") do
		LOOP_COUNT.times do |x|
		# nothing
		end
	end

	test.report("method:") do
		def method
		# nothing
		end
		LOOP_COUNT.times do |x|
		method
		end
	end
end
