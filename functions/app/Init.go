package app

import (
	"context"
	"fmt"
	"log"

	firebase "firebase.google.com/go"
)

// Init initializes the app
func Init(config Config) (App, error) {
	app := &App{}
	ctx := context.Background()
	conf := &firebase.Config{}
	app.firebase, err := firebase.NewApp(ctx, conf)
	if err != nil {
		return nil, fmt.Errorf("firebase.NewApp: %v", err)
	}
	app.firestore, err = app.Firestore(ctx)
	if err != nil {
		return nil, fmt.Errorf("app.Firestore: %v", err)
	}
	return app
}
