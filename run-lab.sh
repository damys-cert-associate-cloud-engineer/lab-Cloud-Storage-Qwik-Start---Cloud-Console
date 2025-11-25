#!/bin/bash
# Set all variables to start de script
PROJECT=$(gcloud config get-value project)
BUCKET_NAME="$PROJECT-bucket"
REGION="us-east1"
ZONE="us-east1-c"
IMAGE_NAME="kitten.png"

# Create a BUCKET by command line
gsutil mb -c standard -l $REGION gs://$BUCKET_NAME

# set Uniform for Access control and uncheck
gsutil uniformbucketlevelaccess set on gs://$BUCKET_NAME/


# move image to test the service in Bucket via cloud
# 1. Download the image
curl -o $IMAGE_NAME https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fphotos%2Fphoto-image-art&psig=AOvVaw1L-wyPdG3DRoaFGjuw6sTG&ust=1764195247174000&source=images&opi=89978449
# 2. Upload to the GCP bucket
gsutil cp $IMAGE_NAME gs://$BUCKET_NAME/$IMAGE_NAME
# 3. (Optional) Remove the local file
rm $IMAGE_NAME
