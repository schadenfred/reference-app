module CupriteHelper

  def pause
    page.driver.pause
  end

  # def debug(*args)
  #   page.driver.debug(*args)
  # end

  # def debug(binding = nil)
  #   $stdout.puts "🔎 Open Chrome inspector at http://localhost:3333"
  #   return binding.break if binding

  #   page.driver.pause
  # end

  # def debug(binding = nil)
  #   $stdout.puts '-------------------------------------------------'
  #   $stdout.puts "🔎 Open Chrome inspector at http://localhost:3333"
  #   $stdout.puts '-------------------------------------------------'
  #   $stdout.puts ''
  #   return debugger if debugger

  #   page.driver.pause
  # end
end
