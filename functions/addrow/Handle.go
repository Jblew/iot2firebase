package addrow

import (
	"fmt"
	"strings"

	"github.com/Jblew/iot2firebase/functions/app"
)

// Handle adds row to a place requested by MQTT message
func Handle(app *app.App, payload string, attributes map[string]string) error {
	subfolder := attributes["subFolder"]
	if subfolder == "" {
		return fmt.Errorf("Empty subfolder")
	} else if strings.HasPrefix(subfolder, "publish/") {
		return handlePublish(app, subfolder, payload)
	} else {
		return fmt.Errorf("Unknown subfolder %s", subfolder)
	}

	return nil
}
