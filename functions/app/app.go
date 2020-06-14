package app

import (
	"context"
	"cloud.google.com/go/firestore"
	firebase "firebase.google.com/go"
)

// App is main class for functions
type App struct {
	Firebase  *firebase.App
	Firestore *firestore.Client
	Context context.Context
}
