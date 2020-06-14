package app

import (
	"cloud.google.com/go/firestore"
	firebase "firebase.google.com/go"
)

// App is main class for functions
type App struct {
	firebase  *firebase.App
	firestore *firestore.Client
}
