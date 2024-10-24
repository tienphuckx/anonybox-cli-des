import QtQuick
import QtQuick.Controls

QtObject {
    property bool darkMode: false
    property color mainbg: darkMode ? "#1e001f" : "#f5f7fb"
    property color bg_chatcontent_color: darkMode ? "#271932" : "#edeff0"
    property color bg_chatsession_color: darkMode ? "#271932" : "#ffffff"
    property color txt_color: darkMode ? "#f8ebfa" : "#232323"
    property color messsagebox_chat_receiver: darkMode ? "#4c4c4c" : "#e5e7eb"
    property color messsagebox_chat_sender: darkMode ? "#9b4ad5" : "#9b4ad5"
    property color message_txt_sender: darkMode ? "white" : "#4d226b"
    property color drawer_color: darkMode ? "#1a0b26" : "#f1f5f9"
    property color user_drawer: darkMode ? "#1a0b26" : "#f1f5f9"
    property color hover_color: darkMode ? "#674f68" : "#e5e7eb"
    property color choose_color: darkMode ? "#472948" : "#f8e8ff"
    property color border_color: darkMode ? "#3e4042" : "#e0e0e0"
    property color message_input: darkMode ? "#6d666f" : "#ffffff"
}
