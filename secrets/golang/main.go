package main

import (
    "fmt"
    "os"
    "net/http"
    "log"
)

func ServeHTTP(w http.ResponseWriter, r *http.Request) {
    //os.Setenv("foo", "1")
    //fmt.Println("foo:", os.Getenv("foo"))
    responseData := os.Getenv("hello")
    responseString := string(responseData)
    fmt.Fprint(w, responseString)
}

func main() {
    log.Printf("### func main ###")
    http.HandleFunc("/", ServeHTTP)
    if err := http.ListenAndServe("0.0.0.0:8080", nil); err != nil {
        log.Fatal(err)
    }
}
