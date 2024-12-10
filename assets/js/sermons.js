const { DefaultAzureCredential } = require("@azure/identity");
const { BlobServiceClient } = require("@azure/storage-blob");

const account = "<account>";
const defaultAzureCredential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${account}.blob.core.windows.net`,
  defaultAzureCredential
);

const containerName = "<container name>";

async function main() {
  const containerClient = blobServiceClient.getContainerClient(containerName);

  let i = 1;
  const blobs = containerClient.listBlobsFlat();
  for await (const blob of blobs) {
    console.log(`Blob ${i++}: ${blob.name}`);
  }
}

main();