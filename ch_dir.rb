# Root path is '/'.
# Path separator is '/'.
# Parent directory is addressable as '..'.
# Directory names consist only of English alphabet letters (A-Z and a-z).
# The function should support both relative and absolute paths.
# The function will not be passed any invalid paths.
# Do not use built-in path-related functions.
class Path
  # getter for reading the current_path attribute
  attr_reader :current_path

  # raise with a message in case of an invalid path
  def initialize(path)
    raise 'Unpermitted path' if (path =~ /^(\/?[a-z]+\/?)+$/i).nil?
    @current_path = path
  end

  def cd(new_path)
    # check validity of new_paths passed as an argument and
    # raise a runtime error if invalid
    raise 'Invalid path' if invalid_path?(new_path)

    # don't compose the new path and return the current or root path
    return if root_or_current?(new_path)
    compose_path(new_path)
  end

  def compose_path(new_path)
    # get an array of substrings
    new_path.split('/').each do |dir|
      case dir
      when '..'
        # get the rid of rightmost occurrence and return previous directory
        @current_path = @current_path.rpartition(/\/[a-z]|[A-Z]/)[0]
      when /[a-z]|[A-Z]/
        # append passed in directory to the current path
        @current_path += "/#{dir}"
      end
    end
  end

  # return current path or root path
  def root_or_current?(new_path)
    return @current_path if new_path == './'
    return @current_path = new_path if new_path == '/'
  end

  # check for invalid paths.
  # adding / at the end of the path in case is not present so I can
  # validate it with the following regex.
  def invalid_path?(new_path)
    new_path += '/' unless new_path[-1] == '/'
    !(new_path =~ /^(\/?([a-z]+)|(\.{0,2})\/+)+$/i)
  end
end

path = Path.new('/a/b/c/d')
path.cd('../x')
puts path.current_path
