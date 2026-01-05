import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
	id: root

	// Theme
	property color colBg: "#232136"
	property color colFg: "#2a273f"
	property color colMuted: "#6e6a86"
	property color colCyan: "#9ccfd8"
	property color colBlue: "#3e8fb0"
	property color colYellow: "#f6c177"
	property string fontFamily: "Iosevka Nerd Font"
	property int fontSize: 16

	// System data
	property int cpuUsage: 0
	property int memUsage: 0
	property var lastCpuIdle: 0
	property var lastCpuTotal: 0

	Process {
		id: memProc
		command: ["sh", "-c", "free | grep Mem"]
		stdout: SplitParser {
			onRead: data => {
				if (!data) return
				var parts = data.trim().split(/\s+/)
				var total = parseInt(parts[1]) || 1
				var used = parseInt(parts[2]) || 0
				memUsage = Math.round(100 * used / total)
			}
		}
		Component.onCompleted: running = true
	}

	Process {
		id: cpuProc
		command: ["sh", "-c", "head -1 /proc/stat"]
		stdout: SplitParser {
			onRead: data => {
				if (!data) return
				var p = data.trim().split(/\s+/)
				var idle = parseInt(p[4]) + parseInt(p[5])
				var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0)
				if (lastCpuTotal > 0) {
					cpuUsage = Math.round(100 * (1 - (idle - lastCpuIdle) / (total - lastCpuTotal)))
				}
				lastCpuTotal = total
				lastCpuIdle = idle
			}
		}
		Component.onCompleted: running = true
	}

	// Update your timer to run both processes
	Timer {
		interval: 2000
		running: true
		repeat: true
		onTriggered: {
			cpuProc.running = true
			memProc.running = true
		}
	}

	anchors.top: true
	anchors.left: true
	anchors.right: true
	implicitHeight: 20
	color: root.colBg

	RowLayout {
		anchors.fill: parent
		anchors.margins: 0
		spacing: 4

		// Workspaces
		Repeater {
			model: 10
			Text {
				property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
				property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
				text: index + 1
				color: isActive ? root.colCyan : (ws ? root.colBlue : root.colMuted)
				font { family: root.fontFamily; pixelSize: root.fontSize; bold: true }
				MouseArea {
					anchors.fill: parent
					onClicked: Hyprland.dispatch("workspace " + (index + 1))
				}
			}
		}

		Item { Layout.fillWidth: true }

		// CPU
		Text {
			text: "CPU: " + cpuUsage + "%"
			color: root.colYellow
			font { family: root.fontFamily; pixelSize: root.fontSize; bold: true }
		}

		Text {
			text: " :: "
			color: root.colMuted
			font { family: root.fontFamily; pixelSize: root.fontSize; bold: true }
		}

		// Memory
		Text {
			text: "Mem: " + memUsage + "%"
			color: root.colCyan
			font { family: root.fontFamily; pixelSize: root.fontSize; bold: true }
		}

		Text {
			text: " :: "
			color: root.colMuted
			font { family: root.fontFamily; pixelSize: root.fontSize; bold: true }
		}

		// Clock
		Text {
			id: clock
			color: root.colBlue
			font { family: root.fontFamily; pixelSize: root.fontSize; bold: true }
			text: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
			Timer {
				interval: 1000
				running: true
				repeat: true
				onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
			}
		}
	}
}
