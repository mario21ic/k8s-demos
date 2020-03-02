package main

import (
    "fmt"
    "os"
)

func main() {
    fmt.Println("hello:", os.Getenv("hello"))

    //os.Setenv("foo", "1")
    //fmt.Println("foo:", os.Getenv("foo"))
}
