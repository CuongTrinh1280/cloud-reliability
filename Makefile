# Global variables
GOCMD       = go
BINARY_NAME = pdpapp
EXTENSION   = exe

# List of usual golang commands
GOBUILD = $(GOCMD) build
GOCLEAN = $(GOCMD) clean
GOTIDY  = $(GOCMD) mod tidy
GOTEST  = $(GOCMD) test
GOGET   = $(GOCMD) get
GOFMT   = $(GOCMD) fmt

# Default task
.PHONY: all
all: build

# Build task
.PHONY: build
build:
	$(GOBUILD) -o $(BINARY_NAME).$(EXTENSION) -v

# Test task
.PHONY: test
test:
	$(GOTEST) -v ./...

# Target with to execute command from specific task
# Note: not really necessary (cause we have been specific the shell name)
.PHONY: clean
# Clean task
clean:
ifneq ("$(wildcard *.exe)", "")
	$(GOCLEAN)
	$(GOTIDY)
	powershell rm $(BINARY_NAME).$(EXTENSION)
else
	$(GOCLEAN)
	$(GOTIDY)
endif

# Format task
.PHONY: fmt
fmt:
	$(GOFMT)

# Run task
.PHONY: run
run:
	$(GOBUILD) -o $(BINARY_NAME).$(EXTENSION) -v ./...
	./$(BINARY_NAME).$(EXTENSION)

# Dependencies
.PHONY: deps
deps:
	$(GOGET) github.com/urfave/cli
	$(GOGET) github.com/boltdb/bolt
	$(GOGET) github.com/google/go-cmp/cmp
	$(GOGET) github.com/vrecan/death/v3
	$(GOGET) golang.org/x/exp/constraints
	$(GOGET) golang.org/x/crypto/ripemd160

# Update all dependencies
.PHONY: update
update:
	$(GOGET) -u
