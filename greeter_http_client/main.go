package main

import (
	"io"
	"log"
	"net/http"
)

func main() {
	MakeHelloRequest()
	MakeGoodbyeRequest()
}

func MakeHelloRequest() {
	resp, err := http.Get("http://localhost:8081/v1/sayhello/Sean")
	if err != nil {
		log.Fatalln(err)
	}

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		log.Fatalln(err)
	}

	log.Println(string(body))
}

func MakeGoodbyeRequest() {
	resp, err := http.Get("http://localhost:8081/v1/saygoodbye/Sean")
	if err != nil {
		log.Fatalln(err)
	}

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		log.Fatalln(err)
	}

	log.Println(string(body))
}
