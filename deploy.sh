readonly storage_account="${DEPLOY_STORAGE_ACCOUNT_NAME}"
readonly storage_account_key="${DEPLOY_STORAGE_ACCOUNT_KEY}"
readonly blob_container="${DEPLOY_BLOB_CONTAINER}"
readonly python_scripts_dir="${DEPLOY_PYTHON_SCRIPTS_DIR}"

set -euf -o pipefail

log() {
  echo "$@" >&2
}

check_preconditions() {
  if [ -z "${storage_account}" ] ||
     [ -z "${storage_account_key}" ] ||
     [ -z "${blob_container}" ||
     [ -z "${python_scripts_dir}" ]; then
    log "Azure credentials not set. Cannot update storage with scripts."
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
