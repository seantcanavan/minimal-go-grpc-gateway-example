# Minimal Go GRPC Gateway Example

#### This project combines the following technologies in the simplest example possible:

1. GoLang 1.13 with Go Modules
2. GRPC Hello World example
3. GRPC Gateway annotations added to the Hello World proto
4. Make targets to simplify generating, building, and running the project

#### How to run the code:
1. Run both servers: `make -j 2 grpc-server http-server`
2. Run both clients: `make -j 2 grpc-client http-client`
3. You can also hit the HTTP server via REST: 
    1. `GET: http://localhost:8081/v1/sayhello/Sean`
    2. `GET: http://localhost:8081/v1/saygoodbye/Sean`
    
#### How to make changes:
1. Modify the `helloworld/helloworld.proto` Greeter service with your new RPCs
2. Make sure to annotate the rpc(s) correctly for GRPC Gateway support
3. Run `make protoc` to generate the code for the GRPC and HTTP servers
4. Update `greeter_grpc_server/main.go` with `func (s *server)...` to fulfill the updated Greeter service interface generated by protobuf compiler
5. Update `greeter_grpc_client/main.go` to call your new endpoint via GRPC
6. Update `greeter_http_client/main.go` to call your new endpoint via HTTP
7. Run both servers: `make -j 2 grpc-server http-server`
8. Run both clients: `make -j 2 grpc-client http-client`

#### Resources:
1. https://grpc.io/docs/languages/go/basics/
2. https://kylewbanks.com/blog/running-multiple-make-targets-concurrently
3. https://github.com/grpc-ecosystem/grpc-gateway
4. https://github.com/grpc/grpc-go
5. https://github.com/grpc/grpc-go/tree/master/examples/helloworld