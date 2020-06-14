package app

import (
	firebase "firebase.google.com/go"
	"firebase.google.com/go/firestore"
)

var client *firestore.Client

type App struct {
	firestore *firestore.Client
	firebase  *firebase.App
}
