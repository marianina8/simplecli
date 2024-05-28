package main

import (
    "fmt"
    "runtime"
)

func main() {
    fmt.Printf("Operating System: %s\nArchitecture: %s\n", runtime.GOOS, runtime.GOARCH)
}