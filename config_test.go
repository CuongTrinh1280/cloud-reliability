package main

import (
	"fmt"
	"testing"
)

func TestFilePathWalkDir(t *testing.T) {
	actual, err := WalkCfgDir("")
	if err != nil {
		t.Errorf("Cannot read directory!")
	}
	if actual != nil {
		fmt.Printf("actual: %v\n", actual)
	}
}

func TestFilePathAnyDir(t *testing.T) {
	actual, err := WalkCfgDir(".")
	if err != nil {
		t.Errorf("Cannot read directory!")
	}
	if actual != nil {
		fmt.Printf("actual: %v\n", actual)
	}
}

func TestIOReadFilePath(t *testing.T) {
	expected := []string{"node1", "node2", "node3"}
	files, _ := WalkCfgDir("")
	actual, err := ReadPaths(files)
	if err != nil {
		t.Errorf("Cannot read directory!")
	}
	if actual != nil {
		fmt.Printf("actual: %v %v\n", actual, len(actual))
		fmt.Printf("expected: %v\n", expected)
	}
}
