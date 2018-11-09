#!/usr/bin/env bash

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = coach.build.release
# -TAGS- = coach,ldflags,build,release
#-SHELL- = bash
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# Installs the applicaation setting main.buildTimestamp at build time.
#
#-SCRIPT- !DO NOT EDIT THIS LINE!
REPO=github.com/alittlebrighter/coach

#cd ${GOPATH}/src/${REPO}
#git checkout master
#git pull

days="$1"
if [ -z "$days" ]; then
	days="15"
fi

buildDir=/tmp/coach-trial-builds
mkdir -p ${buildDir}/experimental

(cd ${GOPATH}/src/${REPO}/cmd/coach-grpc-web/web/coach-ui; npm run build)

declare -a platforms=("linux" "linux-arm" "windows" "darwin")

for p in "${platforms[@]}"
do
    mkdir $buildDir/$p
    cd $buildDir/$p

    os=$p
    arch="amd64"
    if [ $p == "linux-arm" ]; then
   	os="linux"
       arch="arm"
    fi

	ext=""
    if [ $p == "windows" ]; then
    	ext=".exe"
    fi

    CGO_ENABLED=false GOOS=$os GOARCH=$arch go build -o $buildDir/$p/coach${ext} ${REPO}/cmd/coach
    CGO_ENABLED=false GOOS=$os GOARCH=$arch go build -o $buildDir/$p/coach-trader${ext} ${REPO}/cmd/coach-trader
    CGO_ENABLED=false GOOS=$os GOARCH=$arch go build -o $buildDir/$p/experimental/coach-grpc-server${ext} ${REPO}/cmd/coach-grpc-server
    (cd ${GOPATH}/src/${REPO}/cmd/coach-grpc-web; CGO_ENABLED=false GOOS=$os GOARCH=$arch packr build -o $buildDir/$p/experimental/coach-grpc-web${ext} ${REPO}/cmd/coach-grpc-web)

    cp /home/adam/workspace/coach-website/builds/README.md $buildDir/$p/
    cp /home/adam/workspace/coach-website/builds/coach.db $buildDir/$p/
    cp ${GOPATH}/src/${REPO}/protobuf/* $buildDir/$p/experimental/
    if [ $p == "linux" ] && [ $arch == "amd64" ]; then
    	cp /home/adam/workspace/coach-website/builds/Dockerfile $buildDir/$p/
    fi

    zipfile="coach_${os}_${arch}.zip"
    cd $buildDir/$p; zip -r $zipfile ./*; cd ../..
    gsutil cp $buildDir/$p/$zipfile gs://coach-builds/
done

rm -rf $buildDir
