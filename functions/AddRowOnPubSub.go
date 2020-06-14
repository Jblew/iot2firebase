package functions

import (
	"context"
	"log"
	"time"

	"github.com/Jblew/iot2firebase/functions/addrow"
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
	printDebug(msg)

	return addrow.Handle(application, payloadStr, msg.Attributes)
}

func printDebug(msg PubSubMessage) {
	payloadStr := string(msg.Data)
	log.Printf("AddRowOnPubSub, str: %s!, attributes: %v, publishTime= %v", payloadStr, msg.Attributes, msg.PublishTime)
}
