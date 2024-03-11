import QtQuick

ThemeProperty {
	id: themeProperty

	function getValue() {
		return toColorStr(main[mainPropKey])
	}
}
