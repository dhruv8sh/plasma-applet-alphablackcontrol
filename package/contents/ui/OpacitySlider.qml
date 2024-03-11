import QtQuick
import QtQuick.Layouts
import org.kde.plasma.components as PlasmaComponents

RowLayout {
	id: opacitySliderItem

	property alias label: label
	property alias valueLabel: valueLabel

	property alias text: label.text
	property alias value: opacitySlider.value

	property var setValueFunc: function() {}

	property alias minimumValue: opacitySlider.from
	property alias maximumValue: opacitySlider.to
	property alias stepSize: opacitySlider.stepSize

	PlasmaComponents.Label {
		id: label
		text: "Label:"
	}
	PlasmaComponents.Slider {
		id: opacitySlider
		from: 0
		to: 1
		stepSize: 0.01
		Layout.fillWidth: true
		Layout.fillHeight: true
		onValueChanged: {
			if (!(main.configLoaded && popupView.loaded)) return;

			opacitySliderItem.setValueFunc(value)
		}
	}
	PlasmaComponents.Label {
		id: valueLabel
		text: opacitySliderItem.formatValue(opacitySlider.value)
		opacity: 0.6
		Layout.preferredWidth: widthMetrics.width

		TextMetrics {
			id: widthMetrics
			text: opacitySliderItem.formatValue(opacitySlider.to)
			font: valueLabel.font
		}
	}

	function formatValue(val) {
		return Math.round(val * 100) + '%'
	}
}
