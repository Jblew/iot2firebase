package addrow

import (
	"fmt"
	"strings"
)

// Handle adds row to a place requested by MQTT message
func Handle(app *App, payload string, Attributes map[string]string) error {
	payloadStr := string(msg.Data)
	printDebug(msg)

	subfolder := msg.Attributes["subFolder"]
	if subfolder == "" {
		return fmt.Errorf("Empty subfolder")
	} else if strings.HasPrefix(subfolder, "publish/") {
		return handlePublish(subfolder, payloadStr)
	} else {
		return fmt.Errorf("Unknown subfolder %s", subfolder)
	}

	return nil
}
