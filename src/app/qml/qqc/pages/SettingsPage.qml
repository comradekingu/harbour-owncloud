import QtQuick 2.0
import QtQuick.Controls 2.2
import harbour.owncloud 1.0

Page {
    id: pageRoot
    focus: true

    readonly property bool destroyable : false

    property AccountWorkers accountWorkers : null
    property AccountDb accountDb : null

    Flickable {
        anchors.fill: parent

//        PullDownMenu {
//            id: pulley
//            MenuItem {
//                text: qsTr("Reset connection settings")
//                onClicked: {
//                    accountWorkers.transferQueue.stop()
//                    accountWorkers.settings.resetSettings();
//                    pageStack.clear();
//                    pageStack.push(accountSelection);
//                }
//            }
//        }

        Column {
            spacing: paddingSmall
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }

            CheckBox {
                id: autoLoginSwitch
                text: qsTr("Automatically log in to your ownCloud server when starting the app", "Login automatically description")
                width: parent.width
                checked: accountWorkers.account.autoLogin
                onClicked: accountWorkers.account.autoLogin = checked
            }

            CheckBox {
                id: notificationSwitch
                text: qsTr("Show global notifications when transfering files", "Notifications description")
                width: parent.width
                checked: accountWorkers.account.notifications
                onClicked: accountWorkers.account.notifications = checked
            }

            CheckBox {
                id: cameraUploadSwitch
                text: qsTr("Automatically save camera photos to your ownCloud instance when on WiFi", "Camera photo backups escription")
                width: parent.width
                visible: daemonCtrl.daemonInstalled
                checked: accountWorkers.account.uploadAutomatically
                onClicked: accountWorkers.account.uploadAutomatically = checked
            }

            CheckBox {
                id: mobileCameraUploadSwitch
                text: qsTr("Also automatically backup camera photos when connected via 2G, 3G or LTE", "hoto backups via mobile internet connection description")
                width: parent.width
                visible: daemonCtrl.daemonInstalled
                enabled: cameraUploadSwitch.checked
                checked: accountWorkers.account.mobileUpload
                onClicked: accountWorkers.account.mobileUpload = checked
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: paddingLarge
                Button {
                    text: qsTr("Clear cache")
                    onClicked: accountWorkers.cacheProvider.clearCache()
                }

                Button {
                    text: qsTr("OK")
                    onClicked: accountDb.updateAccount(accountWorkers.account)
                }
            }
        }
    }
}
