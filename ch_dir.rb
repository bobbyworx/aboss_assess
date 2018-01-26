# Root path is '/'.
# Path separator is '/'.
# Parent directory is addressable as '..'.
# Directory names consist only of English alphabet letters (A-Z and a-z).
# The function should support both relative and absolute paths.
# The function will not be passed any invalid paths.
# Do not use built-in path-related functions.
class Path
  attr_reader :current_path

  def initialize(path)
    raise 'Unpermitted path' if (path =~ /^(\/?[a-z]+\/?)+$/i).nil?
    @current_path = path
  end

  def cd(new_path)
    raise 'Invalid path' if invalid_path?(new_path)
    return if root_or_current?(new_path)
    compose_path(new_path)
  end

  def compose_path(new_path)
    new_path.split('/').each do |dir|
      case dir
      when '..'
        @current_path = @current_path.rpartition(/\/[a-z]|[A-Z]/)[0]
      when /[a-z]|[A-Z]/
        @current_path += "/#{dir}"
      end
    end
  end

  def root_or_current?(new_path)
    return @current_path if new_path == './'
    return @current_path = new_path if new_path == '/'
  end

  def invalid_path?(new_path)
    !(new_path =~ /^(\/?([a-z]+)|(\.{0,2})\/?)+$/i)
  end
end

path = Path.new('/a/b/c/d')
path.cd('../x/../d/x')
puts path.current_path
