package functions

import (
	"context"
	"log"
	"time"
)

// PubSubMessage is the payload of a Pub/Sub event.
type PubSubMessage struct {
	Data        []byte `json:"data"`
	Attributes  map[string]string
	PublishTime time.Time
}

// AddRowOnPubSub adds row to a place requested by MQTT message
func AddRowOnPubSub(ctx context.Context, msg PubSubMessage) error {
	payloadStr := string(msg.Data)

	/*_, _, err := client.Collection("users").Add(ctx, map[string]interface{}{
		"first": "Ada",
		"last":  "Lovelace",
		"born":  1815,
	})
	if err != nil {
		log.Fatalf("Failed adding alovelace: %v", err)
	}*/

	log.Printf("AddRowOnPubSub, str: %s!, attributes: %v, publishTime= %v", payloadStr, msg.Attributes, msg.PublishTime)

	return nil
}
