# fbprophet AWS Lambda layer builder

Helper to create a lambda layer that contains [fbprophet](https://facebook.github.io/prophet/) fbprophet. The catch with fbprohet is that it's needs to be installed on an environment that is similar to the target environment. It also relies on pystan, Stan on the other hand requires a C++ compiler. 

The idea is to install the dependency in the correct environment by using a docker image which matches the lambda environment [environment](https://hub.docker.com/r/lambci/lambda/), remove the unnecessary files to keep the layer as small as possible and package everything together that it can be uploaded to S3 and added as a lambda layer.

### Usage:
1. update the `requirements.txt` with your libraries of choice
2. run the `run.sh` script
3. a `layer.zip` will be created in this directory and can be uploaded to S3
