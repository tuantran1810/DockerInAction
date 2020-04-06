package main

import (
	"net/http"
)
import "io/ioutil"
import "fmt"

func main() {
	resp, err := http.Get("https://raw.githubusercontent.com/dockerinaction/ch8_multi_stage_build/master/http-client.go")
	if err != nil {
		panic(err)
	}
	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	fmt.Println("response:\n", string(body))
}

