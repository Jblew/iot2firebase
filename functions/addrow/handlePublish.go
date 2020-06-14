package addrow

import (
	"fmt"
	"json"
	"strings"
	"time"

	"google.golang.org/appengine/log"
)

func handlePublish(app *App, subfolder string, payload string) error {
	collName, err := getFirestoreCol(subfolder)
	if err != nil {
		return err
	}
	docName := getFirestoreDoc()
	docRef := app.Firestore.Collection(firestoreCol).Doc(firestoreDoc)

	var payloadObjmap map[string]interface{}
	err := json.Unmarshal([]byte(payload), &payloadObjmap)

	_, _, err := docRef.Create(ctx, payloadObjmap)
	if err != nil {
		return fmt.Errorf("Errr while publishing to firestore (col=%s, doc=%s): %v", collName, docName, err)
	}

	return nil
}

func getFirestoreCol(subfolder string) (string, error) {
	subfolderParts = strings.SplitN(subfolder, "/", 2)
	if len(subfolderParts) < 2 {
		return "", log.Errorf("Missing subfolder for firestore collection")
	}
	return subfolderParts[1]
}

func getFirestoreDoc() string {
	timestampMs := time.Now().UnixNano() / 1000000
	return fmt.Sprintf("%d", timestampMs)
}
