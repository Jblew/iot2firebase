package app

import (
	"context"
	"fmt"

	firebase "firebase.google.com/go"
)

// Init initializes the app
func Init(config Config) (*App, error) {
	ctx := context.Background()
	conf := &firebase.Config{}

	firebase, err := firebase.NewApp(ctx, conf)
	if err != nil {
		return nil, fmt.Errorf("firebase.NewApp: %v", err)
	}

	firestore, err := firebase.Firestore(ctx)
	if err != nil {
		return nil, fmt.Errorf("app.Firestore: %v", err)
	}

	return &App{
		Firebase:  firebase,
		Firestore: firestore,
	}, nil
}
