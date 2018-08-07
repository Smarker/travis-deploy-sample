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

1. [Enable Travis CI](https://docs.travis-ci.com/user/getting-started/#to-get-started-with-travis-ci) in your github repository
2. Set [Travis CI environment variables as repository settings](https://docs.travis-ci.com/user/environment-variables/#defining-variables-in-repository-settings)
    * `STORAGE_ACCOUNT_NAME`
    * `STORAGE_ACCOUNT_KEY`
    * `BLOB_CONTAINER`
    * `PYTHON_SCRIPTS_DIR`
3. Create a script to upload your python scripts to your choice of storage. For example, you can use the `upload_scripts.sh` script to upload a directory specified by `PYTHON_SCRIPTS_DIR` to `Azure Blob Storage`
4. Create a `setup.py` script. Confirm that `setup.py` includes all dependencies neccessary in your upload script. For example, `upload_scripts.sh` uses `blobxfer` for asynchronous uploads, so this dependency is included in `setup.py`.
5. Add a `script` section to your `travis.yml` and point it to your upload script:

   ```sh
      script:
        - pytest
        - bash <upload script>
   ```
