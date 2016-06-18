import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0
import QtQml.Models 2.2

/** @brief Simple and fast table implementation for QtQuick Components 2.
 *
 * The \c Table object provides an easy to use replacement for the QtQUick
 * Components 1 TableView.
 */
Item {
    id: table
    /** type:TableColumn Table column definitions for the table. */
    default property alias columns: columnCont.children

    /** type:Font Default font for the table header.
     *
     * Set the \c TableHeaderDelegate::useHeaderFont property to \c false to use
     * another font in the delegate.
     */
    property alias headerFont: headerBase.font

    /** type:int Width of the table header in pixel. */
    readonly property alias headerWidth: header.width

    /** type:int Column spacin in pixel. */
    property alias columnSpacing: headerRow.spacing

    /** Background color for table rows. */
    property color baseRowColor: "transparent"

    /** Alternating background color for table rows.
     *
     * Used if \c alternatingRowColors is set to \c true.
     */
    property color alternatingRowColor: "#55cccccc"

    /** Set to \c true to use alternating row colors. */
    property bool alternatingRowColors: true

    /** type:Font Default font used for table cells.
     *
     * Set the \c TableCellDelegate::useTableFont property to \c false to use
     * another font in the delegate.
     */
    property alias tableFont: tableBase.font

    /** type:model Model used fot the table. */
    property alias model: tableView.model

    /** Vertical scroll bar item. */
    property ScrollBar verticalScrollBar: null

    /** Horizontal scroll bar item. */
    property ScrollBar horizontalScrollBar: null

    Text {
        id: headerBase
        visible: false
    }
    Text {
        id: tableBase
        visible: false
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            id: header
            Layout.fillWidth: true
            Layout.minimumHeight: headerRep.height + 6
            Layout.maximumHeight: headerRep.height + 6
            color: "#00000000"

            RowLayout {
                id: headerRow
                spacing: 4
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left

                Repeater {
                    id: headerRep
                    model: columns
                    delegate: Item {
                        id: headerCont
                        Layout.minimumWidth: columns[index].columnWidth
                        Layout.maximumWidth: columns[index].columnWidth
                        height: childrenRect.height

                        Component.onCompleted: {
                            var obj = columns[index].headerDelegate.
                                createObject(headerCont,
                                             {text: columns[index].headerText,
                                              column: index});

                            if(obj.useHeaderFont) {
                                obj.font = Qt.binding(function() {
                                    return headerFont;});
                            }
                        }
                    }

                    Component.onCompleted: {
                        height = itemAt(0).height;
                    }
                }
            }

            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2
                height: 2
                color: "black"
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true

            ListView {
                id: tableView
                anchors.fill: parent

                ScrollBar.vertical: table.verticalScrollBar
                ScrollBar.horizontal: table.horizontalScrollBar

                delegate: Rectangle {
                    id: rowDelegate
                    color: alternatingRowColors
                           ? ((index % 2 === 0) ? alternatingRowColor
                                                : baseRowColor)
                           : baseRowColor
                    height: childrenRect.height + 4
                    width: childrenRect.width

                    RowLayout {
                        id: tableRow
                        spacing: columnSpacing
                        anchors.top: parent.top
                        anchors.topMargin: 4
                    }

                    Component.onCompleted: {
                        for(var i = 0; i < columns.length; i++) {
                            var obj = columns[i].cellDelegate.createObject(
                                tableRow,
                                {text: model[columns[i].textRole],
                                 itemData: model[columns[i].dataRole],
                                 column: i,
                                 row: index,
                                 cellWidth: Qt.binding(function() {
                                     return columns[this.column].
                                            columnWidth;})});

                            if(obj.useTableFont) {
                                obj.font = Qt.binding(function() {
                                    return tableFont;});
                            }
                        }
                    }
                }
            }
        }
    }

    Item {
        id: columnCont
    }
}
