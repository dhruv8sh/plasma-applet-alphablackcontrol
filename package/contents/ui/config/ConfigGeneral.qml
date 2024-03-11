import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import ".."
import "../lib"

ConfigPage {
	id: page
	showAppletVersion: true

	ConfigSection {
		Label {
			text: i18n("Thanks for using the AlphaBlack theme.")
		}
	}
}
