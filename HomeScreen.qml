import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

ApplicationWindow {
    id: homePage
    width: 900
    height: 600
    visible: true
    title: "Home Screen"
    color: "white"

    ColumnLayout {
        anchors.fill: parent

        // Breadcrumb navigation
        RowLayout {
            id: breadcrumb
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            spacing: 10
            Layout.alignment: Layout.Center
            Text {
                text: "Landing Page"
                color: stackLayout.currentIndex === 0 ? "#761f84" : "gray"
                font.bold: stackLayout.currentIndex === 0
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        stackLayout.currentIndex = 0
                    }
                }
            }

            Text {
                text: "  "
                color: "black"
            }

            Text {
                text: "Create Room"
                color: stackLayout.currentIndex === 1 ? "#761f84" : "gray"
                font.bold: stackLayout.currentIndex === 1
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        stackLayout.currentIndex = 1
                    }
                }
            }

            Text {
                text: "  "
                color: "black"
            }

            Text {
                text: "Join Room"
                color: stackLayout.currentIndex === 2 ? "#761f84" : "gray"
                font.bold: stackLayout.currentIndex === 2
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        stackLayout.currentIndex = 2
                    }
                }
            }
        }

        // StackLayout with pages
        StackLayout {
            id: stackLayout
            Layout.fillWidth: true
            Layout.fillHeight: true

            LandingChat {
                id: item1
            }
            CreateChatRoom {
                id: item2
                onRoomCreated: function (groupId) {
                    var component = Qt.createComponent("Main.qml")
                    var window = component.createObject(null, {
                                                            "groupId": groupId
                                                        })
                    homePage.close()
                }
            }

            JoinChatRoom {
                id: item3
                onRoomJoined: function (groupId) {
                    var component = Qt.createComponent("Main.qml")
                    var window = component.createObject(null, {
                                                            "groupId": groupId
                                                        })
                    homePage.close()
                }
                // onRoomWaiting: {
                //     var component = Qt.createComponent("LoadingPage.qml")
                //     var window = component.createObject()
                // }
            }
        }
    }
}
