# Function definitions.
fn_prepend_to_path() {

  # Check if exactly one argument was passed.
  if [[ "$#" -ne 1 ]]; then

    echo -e 'Usage: fn_prepend_to_path <directory_path>'
    return 1

  fi

  # Initialize a local variable that captures the argument.
  local path_to_be_added="${1}"

  # Expand '~' to '$HOME' if present.
  # This is because a path like '~/.local' will be taken literally if not expanded.
  path_to_be_added="${path_to_be_added/#\~/$HOME}"

  # Check if the path passed as an argument actually exists.
  if [[ -d "${path_to_be_added}" ]]; then

    case ":$PATH:" in

      # If the existing 'PATH' variable already contains this path, do nothing.
      *":${path_to_be_added}:"*) ;;

      # Otherwise, prepend the path to the 'PATH' variable.
      *) PATH="${path_to_be_added}:${PATH}" ;;

    esac

  fi

}
