##To test the Dockerfile written in Dockerfile, you can follwo the following steps:##

Run the following command to build the iamge-
docker build -t api-image:1.0 .
 
Run the follwoing command to run the above created image in a container.
docker run --name api-container api-image:1.0

Run the follwoing connand to view the running container locally-
docker ps OR docker conatiner ls
