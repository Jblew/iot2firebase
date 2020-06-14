package functions

import (
	"context"
	"log"
)

// PubSubMessage is the payload of a Pub/Sub event.
type PubSubMessage struct {
	Data []byte `json:"data"`
}

// AddRowOnPubSub adds row to a place requested by MQTT message
func AddRowOnPubSub(ctx context.Context, msg PubSubMessage) error {
	payloadStr := string(msg.Data)

	log.Printf("AddRowOnPubSub, str: %s!", payloadStr)
	return nil
}
