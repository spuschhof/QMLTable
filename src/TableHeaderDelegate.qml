import QtQuick 2.5
import QtQuick.Layouts 1.1

/** Default delegate used for \c Table header cells.
 *
 * If you create your own delegate, not inhereting from \c TableHeaderDelegate,
 * add the \c column and \c useHeaderFont properties to your delegate's base
 * item.
 *
 * If you want to use the table's default header font, the base item of delegate
 * also needs a \c font property.
 */
Text {
    /** Setting whether the cell uses the table's default header font.
     *
     * Set to \c false if you want your delegate to use its own font.
     */
    property bool useHeaderFont: true

    /** Index of the table column. Set by the \c Table. */
    property int column: 0

    anchors.top: parent.top
    anchors.horizontalCenter: parent.horizontalCenter
    width: parent.width
    horizontalAlignment: Text.AlignHCenter
    wrapMode: Text.NoWrap
    elide: Text.ElideNone
}
