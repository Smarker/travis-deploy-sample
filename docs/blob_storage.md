# Azure Blob Storage

Blob Storage is preferred when storing large amounts of unstructured data.

## Ideal Data to Store in Blob Storage

* images
* documents
* files for distributed access
* streaming video or audio
* writing to log files
* archival data

 For more information on Blob Storage, refer to its [Azure documentation](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blobs-introduction).

## Requirements for Blob Storage

* [Azure Storage Account](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-python#create-a-storage-account-by-using-the-azure-portal)
* `container` to hold blobs (think of a `container` like a `folder`)
* blobs (data)

 For more information on uploading, downloading blobs, etc. refer to this [quickstart tutorial](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-python).
  The [sample application](https://github.com/Azure-Samples/storage-blobs-python-quickstart) is on github.

## Visualizing Data

* [Azure Storage Explorer](https://azure.microsoft.com/en-us/features/storage-explorer/) can be used to manage blobs, files, tables, etc. in an Azure Storage Account
* [Azure CLI 2.0 with Azure Storage](https://docs.microsoft.com/en-us/azure/storage/common/storage-azure-cli)