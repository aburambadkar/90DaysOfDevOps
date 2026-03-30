TASK 1 Observations:

#Building Image:

docker build -t go-heavy:v1 

#Checking the size:
docker images | grep go-heavy

The size of go-heavy is 844MB. This is because the base image which has been used has packaged the entire Go compiler, 
the linker, and all the Debian build utilities just to run one tiny executable file.

TASK 2 Observations:

We used golang:alpine based image as builder because we wanted our build process to be faster. 
Your CI/CD pipeline doesn't have to download 800MB just to start the build.

The previous base image used was debian based comes whichcomes with the compilers, headers, libraries
 and tools that are not required for this simple hello app program.

If you used the standard golang:1.21 in Stage 1 and alpine in Stage 2, your final image would still be the same size (~10MB), 
because Stage 1 is thrown away at the end anyway! We only use Alpine in the first stage to make the build process itself faster

Task 3 & 4 Observations:

Note: Many people think latest means "the most recent image pushed." It does not. It is just a default name. If you push v2.0 but forget to tag it as latest, 
someone pulling without a tag will still get the old version!

Task 5 Observations:

By default, Docker containers run as root. If a hacker escapes the container, they could have root access to your host machine. Adding USER appuser means the process 
runs with limited privileges—it can't install packages or modify system files. 

After building you image use the below command to check the user for the app:

docker run --rm go-non-root whoami

