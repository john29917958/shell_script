#!/bin/sh

log() {
  echo "[INFO] $1"
}

print_exit_message() {
  log "Program finished."
}

exit_if_failed() {
  result=$1
  error_message="$2"
  if [ $result -ne 0 ]; then
    echo "[ERROR] $error_message"
    log "Exiting."
    exit 1
  fi
}

url="$(echo "$1" | xargs)"
if [ -z "$url" ]; then
  echo "Please provide an URL to the web page to be downloaded."
  exit 0
fi

log "Program starts."
trap print_exit_message EXIT
log "Checks if temp directory for downloading web page script exists."
save_dir="/tmp/download_web_page/"
if [ ! -d "$save_dir" ]; then
  log "Temp directory for downloading web page script does not exist, create " \
    "the directory."
  mkdir "$save_dir"
  exit_if_failed $? "Failed to create the temp directory for downloading web \
    page."
else
  log "Temp directory exists, continues program execution."
fi
file_name="$(echo "$url" | sed -E 's/(https?:\/\/)(.*)/\2/')"
file_path="${save_dir}${file_name}"
error_message=$(curl --no-progress-meter -o "$file_path" "$url" 2>&1)
exit_if_failed $? "Failed to download the web page to local: $error_message"
log "Web page downloaded, please refer to $file_path."
