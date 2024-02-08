.PHONY: hello-world hello-world-gateway server protoc grpc-server http-server http-client grpc-client

build: clean tidy
	go build ./...
	env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -ldflags="-s -w" -o bin/greeter_grpc_client greeter_grpc_client/main.go
	env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -ldflags="-s -w" -o bin/greeter_grpc_server greeter_grpc_server/main.go
	env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -ldflags="-s -w" -o bin/greeter_http_client greeter_http_client/main.go
	env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -ldflags="-s -w" -o bin/greeter_http_server greeter_http_server/main.go

clean:
	rm -rfv ./bin

# Run the commands required to generate all the GRPC boilerplate code
# Note these files have been generated already and are included in ./helloworld/
protoc: hello-world hello-world-gateway

server: grpc-server http-server

client: grpc-client http-client

hello-world:
	protoc --go_out=plugins=grpc:. --go_opt=paths=source_relative helloworld/helloworld.proto

hello-world-gateway:
	protoc -I. --grpc-gateway_out=logtostderr=true,paths=source_relative:./ helloworld/helloworld.proto

grpc-server:
	go run ./greeter_grpc_server/main.go

http-server:
	go run ./greeter_http_server/main.go

http-client:
	go run ./greeter_http_client/main.go

grpc-client:
	go run ./greeter_grpc_client/main.go

tidy:
	go mod tidy
