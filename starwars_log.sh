#!/bin/bash
set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

lines=100
log_file=/var/log/system.log

x_deg=20deg
font_size=11px
font_color="rgb(196,250,199)"

while getopts "f:n:x:s:c:h" opt; do
  case $opt in
    f)
      test -r "${OPTARG}" || { echo "Readable file is required as -f argument" ; exit 2; }
      log_file="${OPTARG}"
      ;;
    n)
      test -n "${OPTARG}" || { echo "Argument is not valid" ; exit 2; }
      lines="${OPTARG}"
      ;;
    x)
      test -n "${OPTARG}" || { echo "Argument is not valid" ; exit 2; }
      x_deg="${OPTARG}"
      ;;
    s)
      test -n "${OPTARG}" || { echo "Argument is not valid" ; exit 2; }
      font_size="${OPTARG}"
      ;;
    c)
      test -n "${OPTARG}" || { echo "Argument is not valid" ; exit 2; }
      font_color="${OPTARG}"
      ;;
    h)
      echo -e "Usage:\n$0 [-f file] [-n lines] [-x <css perspective degs>] [-s <css font size>] [-c <css font color>]"
      exit 0
      ;;
    \?)
      echo "Invalid option: -${OPTARG}" >&2
      exit 1
      ;;
  esac
done

the_sed="s#%assets#file://${SCRIPT_DIR}/assets/#g; s/%x_deg/${x_deg}/g; s/%font_size/${font_size}/g; s/%font_color/${font_color}/g"

echo "<html><head>"
echo "<style>"
cat "${SCRIPT_DIR}/assets/css/logs.css" | sed "${the_sed}"
echo "</style>"
echo "</head>"
echo "<body><pre>"
tail -n ${lines} "${log_file}" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g; s/"/\&quot;/g; s/'"'"'/\&#39;/g'
echo "</pre></body>"
echo "</html>"
