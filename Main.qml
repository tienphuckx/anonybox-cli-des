import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Universal
import QtQuick.Effects
import QtQuick.Dialogs

ApplicationWindow {
    visible: true
    width: 1200
    height: 800
    title: "Chat Application"

    property QtObject sharedSettings: Settings {}

    // Material.theme: Material.Light
    Drawer {
        id: sidebar
        width: 300
        height: parent.height
        edge: Qt.LeftEdge
        modal: false
        background: Rectangle {
            color: sharedSettings.user_drawer
        }

        Column {
            anchors.fill: parent
            anchors.topMargin: 50

            // User avatar
            Rectangle {
                width: parent.width
                height: 150
                color: "transparent"

                ImageRounded {
                    x: parent.width / 2 - r_width / 2
                    source: "https://placehold.co/100x100"
                    r_width: 100
                    r_height: 100
                }
            }

            // Chat Button
            Rectangle {
                id: chatButton
                width: parent.width
                height: 50
                color: "transparent" // Same as the parent by default

                radius: 10
                Row {
                    anchors.fill: parent
                    spacing: 10
                    Rectangle {
                        width: 20
                        color: "transparent"
                        height: parent.height
                    }

                    MyIcon {
                        m_source: "qrc:/images/audio_11781833.gif"
                        m_height: 32
                        m_width: 32
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    Rectangle {
                        height: parent.height
                        color: "transparent"
                        width: parent.width * 0.8
                        Text {
                            id: txtChatColor
                            text: "Chat"
                            color: sharedSettings.txt_color
                            font.pixelSize: 18
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        chatButton.color = sharedSettings.hover_color
                        txtChatColor.color = sharedSettings.txt_color
                    }
                    onExited: {

                        chatButton.color = "transparent"
                        txtChatColor.color = sharedSettings.txt_color
                    }
                    onClicked: {

                        // Handle click
                    }
                }
            }

            // Another Button
            Rectangle {
                id: anotherButton
                width: parent.width
                height: 50
                color: "transparent" // Same as the parent by default
                radius: 10

                Row {
                    anchors.fill: parent
                    spacing: 10
                    Rectangle {
                        width: 20
                        color: "transparent"
                        height: parent.height
                    }

                    MyIcon {
                        m_source: "qrc:/images/comments_16903656.gif"
                        m_height: 32
                        m_width: 32
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    Rectangle {
                        height: parent.height
                        color: "transparent"
                        width: parent.width * 0.8
                        Text {
                            id: txtAnotherBtn
                            text: "Dark Mode"
                            color: sharedSettings.txt_color
                            font.pixelSize: 18
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        anotherButton.color = sharedSettings.hover_color
                        txtAnotherBtn.color = sharedSettings.txt_color
                    }
                    onExited: {

                        anotherButton.color = "transparent"
                        txtAnotherBtn.color = sharedSettings.txt_color
                    }
                    onClicked: {
                        console.log("Dark mode: " + sharedSettings.darkMode)
                        sharedSettings.darkMode = !sharedSettings.darkMode
                    }
                }
            }
        }
    }

    // Main Chat
    Rectangle {
        width: parent.width
        height: parent.height
        color: sharedSettings.mainbg

        ColumnLayout {
            anchors.fill: parent
            width: parent.width
            height: parent.height

            RowLayout {
                width: parent.width
                height: parent.height

                // Chat Session
                ChatSession {
                    settings: sharedSettings
                }

                // ChatContent
                ChatContent {
                    settings: sharedSettings
                }
            }
        }
    }
}
