#!/usr/bin/env bash

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = coach.build.trial
# -TAGS- = coach,ldflags,build,trial
#-SHELL- = bash
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# Installs the application setting trial.buildTimestamp at build time to limit application use to two weeks.
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

	cd ${GOPATH}/src/${REPO}
    CGO_ENABLED=false GOOS=$os GOARCH=$arch go build -o $buildDir/$p/coach${ext} ./cmd/coach
    CGO_ENABLED=false GOOS=$os GOARCH=$arch go build -o $buildDir/$p/coach-trader${ext} ./cmd/coach-trader
    CGO_ENABLED=false GOOS=$os GOARCH=$arch go build -o $buildDir/$p/experimental/coach-grpc-server${ext} .//cmd/coach-grpc-server
    (cd ${GOPATH}/src/${REPO}/cmd/coach-grpc-web; CGO_ENABLED=false GOOS=$os GOARCH=$arch packr build -o $buildDir/$p/experimental/coach-grpc-web${ext} .)

    cp /home/adam/workspace/coach-website/builds/README.md $buildDir/$p/
    cp /home/adam/workspace/coach-website/builds/coach.db $buildDir/$p/
    cp ${GOPATH}/src/${REPO}/protobuf/* $buildDir/$p/experimental/
    if [ $p == "linux" ] && [ $arch == "amd64" ]; then
    	cp /home/adam/workspace/coach-website/builds/Dockerfile $buildDir/$p/
    fi

    zipfile="coach_${os}_${arch}_trial.zip"
    cd $buildDir/$p; zip -r $zipfile ./*; cd ../..
    gsutil cp $buildDir/$p/$zipfile gs://coach.alittlebrighter.io/downloads/
done

rm -rf $buildDir
