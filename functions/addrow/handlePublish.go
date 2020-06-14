package addrow

import (
	"encoding/json"
	"fmt"
	"strings"
	"time"

	"github.com/Jblew/iot2firebase/functions/app"
)

func handlePublish(app *app.App, subfolder string, payload string) error {
	collName, err := getFirestoreCol(subfolder)
	if err != nil {
		return err
	}
	docName := getFirestoreDoc()
	docRef := app.Firestore.Collection(collName).Doc(docName)

	var payloadObjmap map[string]interface{}
	err = json.Unmarshal([]byte(payload), &payloadObjmap)

	_, err = docRef.Create(app.Context, payloadObjmap)
	if err != nil {
		return fmt.Errorf("Errr while publishing to firestore (col=%s, doc=%s): %v", collName, docName, err)
	}

	return nil
}

func getFirestoreCol(subfolder string) (string, error) {
	subfolderParts := strings.SplitN(subfolder, "/", 2)
	if len(subfolderParts) < 2 {
		return "", fmt.Errorf("Missing subfolder for firestore collection")
	}
	return subfolderParts[1], nil
}

func getFirestoreDoc() string {
	timestampMs := time.Now().UnixNano() / 1000000
	return fmt.Sprintf("%d", timestampMs)
}
