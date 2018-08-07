# Ease Batch AI Training with Travis

`Azure Batch AI` does not update storage with changes to local training scripts. To update future `Batch AI` training jobs with local changes, these scripts must be reuploaded to `Azure Blob`, `Azure Files`, or your custom storage option. That way, future jobs will look at the most recent scripts when performing training (or testing). `deploy.sh` contains a basic `Travis CI` deployment configuration that will upload a python scripts directory to an `Azure Blob Storage container`. (this can be further customized to upload to `Azure Files` or any other storage option)

## Setup

1. Configure your repository so that it includes the `Travis CI App`
2. Set [Travis CI environment variables as repository settings](https://docs.travis-ci.com/user/environment-variables/#defining-variables-in-repository-settings)
    * `DEPLOY_STORAGE_ACCOUNT_NAME`
    * `DEPLOY_STORAGE_ACCOUNT_KEY`
    * `DEPLOY_BLOB_CONTAINER`
    * `DEPLOY_PYTHON_SCRIPTS_DIR`
3. Add `deploy.sh` to your project's root directory
4. Confirm that your `setup.py` includes `blobxfer` as a dependency
5. Add a `deploy` section to your `travis.yml`:

   ```sh
    deploy:
      provider: script
      script: bash deploy.sh
      on:
        repo: <github username>/<github repo name>
   ```

If your Travis build is successful, `deploy.sh` will be run on of your
 repository. `deploy.sh` will upload the `scripts` directory to your chosen
 Azure blob container.
