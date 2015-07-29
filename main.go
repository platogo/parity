package main

import (
	"github.com/codegangsta/cli"
)

// Version and CommitID are overwritten during the link stage when preparing a
// release.
var (
	Version  = "dev"
	CommitID = "HEAD"

	version = Version + " (" + CommitID + ")" // v0.2 (fc2a1cf)
)

func main() {
	app := cli.NewApp()
	app.Name = ""
	app.Usage = ""
	app.Version = version
	app.RunAndExitOnError()
}
