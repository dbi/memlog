require "memlog/version"

module Memlog

  def self.included(base)
    base.around_filter :record_memory if base.respond_to? :around_filter
  end

  def record_memory(&block)
    rss_before_action = memory_usage
    yield
    rss_after_action = memory_usage
    log_memory(rss_before_action, rss_after_action)
  end

  private

  def memory_usage
    if File.exists?("/proc/#{Process.pid}/status")
      File.open("/proc/#{Process.pid}/status") do |process_status|
        while rss = process_status.gets
          return rss.split[1].to_i if rss.include?("VmRSS")
        end
      end
    else
      `ps -o rss= -p #{Process.pid}`.to_i
    end
  end

  def log_memory(before, after)
    logger.info("#{Time.now.strftime "%Y-%m-%d %H:%M:%S"}\tMemory: #{sprintf("%+d", after - before)} KB\tNow: #{after} KB\tPID:#{Process.pid}\t#{request.method} #{request.url}")
  end

end
