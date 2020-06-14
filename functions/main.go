package functions

import (
	"log"
)

var app *App

func init() {
	app, err := app.Init()
	if err != nil {
		log.Fatalf("Cannot initialize app: %v", err)
	}
}
