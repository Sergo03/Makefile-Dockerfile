REGISTRY=sergo03
APP_NAME=app
SRC.PATH=.
SRC_FILE=$(SRC_PATH)/main.go
BUILD_PATH=./bin
TARGETARCH=amd64
VERSION=v1.0.0

linux:
	gofmt -s -w ./
	go get
	CGO_ENABLED=0 GOOS=linux GOARCH=${TARGETARCH} go build -v -o $(BUILD_PATH)/$(APP_NAME) $(SRC_FILE)

windows:
	gofmt -s -w ./
	go get
	CGO_ENABLED=0 GOOS=windows GOARCH=${TARGETARCH} go build -v -o $(BUILD_PATH)/$(APP_NAME) $(SRC_FILE)

macOS:
	gofmt -s -w ./
	go get
	CGO_ENABLED=0 GOOS=darwin GOARCH=${TARGETARCH} go build -v -o $(BUILD_PATH)/$(APP_NAME) $(SRC_FILE)

arm:
	gofmt -s -w ./
	go get
	CGO_ENABLED=0 GOOS=arm GOARCH=${TARGETARCH} go build -v -o $(BUILD_PATH)/$(APP_NAME) $(SRC_FILE)

image:
	docker build . -t ${REGISTRY}/${APP_NAME}:${VERSION}-${TARGETARCH}

push:
	docker push ${REGISTRY}/${APP_NAME}:${VERSION}-${TARGETARCH}

clean:
	docker rmi ${REGISTRY}/${APP_NAME}:${VERSION}-${TARGETARCH}


