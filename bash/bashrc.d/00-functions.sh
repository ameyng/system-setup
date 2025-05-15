# Function definitions.

# Exit on any error.
# Exit if any unset variable is used/referenced.
# set -eu

fn_prepend_to_path() {

  # Check if exactly one argument was passed.
  if [ "${#}" -ne 1 ]; then

    echo 'Usage: fn_prepend_to_path <directory_path>'
    return 1

  fi

  # Store the argument to the function in a variable.
  path_to_be_added="${1}"

  # Expand '~' to '$HOME' if present.
  # This is because a path like '~/.local' will be taken literally if not expanded.
  # We are explicitly disabling 'ShellCheck' check 'SC2088'.
  # The below code block is not to perform tilde '~' expansion, but to explicitly check for it and safely handle it.
  # shellcheck disable=SC2088
  case "${path_to_be_added}" in

    # If the argument passed is just the tilde '~' character.
    '~') path_to_be_added="${HOME}" ;;

    # If the argument passed is a tilde '~' character followed by something else.
    '~/'*) path_to_be_added="${HOME}/${path_to_be_added#~/}" ;;

    # Default case, do nothing.
    *) ;;

  esac


  # Check if the path passed as an argument actually exists.
  if [ -d "${path_to_be_added}" ]; then

    case ":${PATH}:" in

      # If the existing 'PATH' variable already contains this path, do nothing.
      *":${path_to_be_added}:"*) ;;

      # Otherwise, prepend the path to the 'PATH' variable.
      *) PATH="${path_to_be_added}:${PATH}" ;;

    esac

  fi

  # Unset used variables.
  unset path_to_be_added

}
