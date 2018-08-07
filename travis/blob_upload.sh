readonly storage_account="${STORAGE_ACCOUNT_NAME}"
readonly storage_account_key="${STORAGE_ACCOUNT_KEY}"
readonly blob_container="${BLOB_CONTAINER}"
readonly python_scripts_dir="${PYTHON_SCRIPTS_DIR}"

set -euf -o pipefail

log() {
  echo "$@" >&2
}

check_preconditions() {
  if [ -z "${storage_account}" ] ||
     [ -z "${storage_account_key}" ] ||
     [ -z "${blob_container}" ] ||
     [ -z "${python_scripts_dir}" ]; then
    log "Azure credentials not set. Cannot update blob storage with scripts."
    exit 1
  fi
}

upload_scripts() {
  blobxfer upload \
  --storage-account "${storage_account}" \
  --storage-account-key "${storage_account_key}" \
  --remote-path "${blob_container}" \
  --local-path "${python_scripts_dir}"
}

check_preconditions
upload_scripts
