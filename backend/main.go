// dga2 is a simple Golang Dart Angular2 web app.
package main

import (
	"encoding/json"
	"log"
	"net/http"
)

func main() {
	http.Handle("/", http.FileServer(http.Dir("./app/web/")))

	http.HandleFunc("/api/hello", helloWorld)
	http.ListenAndServe(":8080", nil)
}

// helloWorld handler returns a json response with a 'Hello, World' message.
//
func helloWorld(w http.ResponseWriter, r *http.Request) {
	data := struct {
		Message string
	}{
		"Hello, World",
	}

	if err := json.NewEncoder(w).Encode(data); err != nil {
		log.Println(err)
	}
}
