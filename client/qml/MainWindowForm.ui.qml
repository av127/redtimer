import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Item {
    id: mainForm
    width: 270
    height: 400

    Layout.minimumWidth: 250
    Layout.minimumHeight: 400

    property alias activity: activity
    property alias counter: counter
    property alias counterMouseArea: counterMouseArea
    property alias description: description
    property alias issueStatus: issueStatus
    property alias quickPick: quickPick
    property alias selectIssue: selectIssue
    property alias settings: settings
    property alias startStop: startStop

    ToolBar {
        id: toolBar
        objectName: "toolBar"
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top

        ToolButton {
            id: createIssue
            objectName: "createIssue"
            text: "Create &new issue"
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 0
            anchors.left: parent.left
            tooltip: "Create new issue"
            iconSource: "/open-iconic/svg/plus.svg"
        }

        ToolButton {
            id: reload
            objectName: "reload"
            text: "&Reload"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: settings.left
            tooltip: "Reload"
            iconSource: "/open-iconic/svg/reload.svg"
        }

        ToolButton {
            id: settings
            objectName: "settings"
            text: "&Settings"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            tooltip: "Open Settings"
            iconSource: "/open-iconic/svg/cog.svg"
        }
    }

    ColumnLayout {
        id: columnLayout1
        anchors.rightMargin: 5
        anchors.leftMargin: 5
        anchors.bottomMargin: 5
        anchors.topMargin: 5
        anchors.top: toolBar.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left

        RowLayout {
            id: rowLayout1
            Layout.fillWidth: true

            ComboBox {
                id: quickPick
                objectName: "quickPick"
                Layout.fillWidth: true
                editable: true
                model: recentIssuesModel
                textRole: "text"
                focus: true
            }

            ToolButton {
                id: selectIssue
                objectName: "selectIssue"
                iconSource: "/open-iconic/svg/list.svg"
                tooltip: "Select issue from list"
            }
        }

        GroupBox {
            id: groupBox1
            Layout.fillHeight: true
            Layout.fillWidth: true
            title: qsTr("Issue data")

            ColumnLayout {
                id: columnLayout2
                anchors.fill: parent

                TextField {
                    id: issueId
                    objectName: "issueId"
                    Layout.fillWidth: true
                    readOnly: true
                    placeholderText: qsTr("ID")
                }

                TextField {
                    id: subject
                    readOnly: true
                    Layout.fillWidth: true
                    objectName: "subject"
                    placeholderText: qsTr("Subject")
                }

                TextArea {
                    id: description
                    text: ""
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                    Layout.fillWidth: true
                    objectName: "description"
                    readOnly: true
                }

                TextField {
                    id: version
                    objectName: "version"
                    Layout.fillWidth: true
                    readOnly: true
                    placeholderText: qsTr("Target version")
                }



            }



        }

        RowLayout {
            id: rowLayout2
            Layout.fillWidth: true

            ToolButton {
                id: startStop
                objectName: "startStop"
                isDefault: true
                iconSource: "/open-iconic/svg/media-play.svg"
                tooltip: "Start time tracking"
                activeFocusOnPress: true
            }

            TextField {
                id: counter
                objectName: "counter"
                text: "00:00:00"
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                Layout.fillWidth: true
                
                MouseArea {
                    id: counterMouseArea
                    anchors.fill: parent
                }
            }
        }

        ComboBox {
            id: activity
            Layout.fillWidth: true
            objectName: "activity"
            model: activityModel
            textRole: "name"
        }

        ComboBox {
            id: issueStatus
            Layout.fillWidth: true
            objectName: "issueStatus"
            model: issueStatusModel
            textRole: "name"
        }





    }
}

