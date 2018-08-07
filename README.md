# Ease Batch AI Training with Travis

`Azure Batch AI` does not update storage with changes to local training scripts.
 To update future `Batch AI` training jobs with local changes, these scripts
  must be reuploaded to `Azure Blob`, `Azure Files`, or your custom storage
   option. That way, future jobs will look at the most recent scripts when
    performing training (or testing).

`upload_scripts.sh` will upload a python scripts directory to an
  `Azure Blob Storage container`. (this can be further customized to upload to
   `Azure Files` or any other storage option)

## Setup

1. Enable `Travis CI` in your github repository
2. Set [Travis CI environment variables as repository settings](https://docs.travis-ci.com/user/environment-variables/#defining-variables-in-repository-settings)
    * `STORAGE_ACCOUNT_NAME`
    * `STORAGE_ACCOUNT_KEY`
    * `BLOB_CONTAINER`
    * `PYTHON_SCRIPTS_DIR`
3. Add `upload_scripts.sh` to your project's root directory
4. Confirm that your `setup.py` includes `blobxfer` as a dependency
5. Add a `script` section to your `travis.yml`:

   ```sh
      script:
        - pytest
        - bash upload_scripts.sh
   ```
