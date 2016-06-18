import QtQuick 2.5
import QtQuick.Layouts 1.1

/** @brief Default delegate used for \c Table cells.
 *
 * If you create your own delegate, not inhereting from \c TableCellDelegate,
 * add the \c column, \c row, \c itemData, \c cellWidth and \c useTableFont
 * properties to your delegate's base item and set \c Layout.minimumWidth and
 * \c Layout.maximumWidth to \c cellWidth.
 *
 * If you want to use the table's default font, the base item of delegate also
 * needs a \c font property.
 */
Text {
    /** Index of the table column. Set by the \c Table. */
    property int column: 0

    /** Index of the table row. Set by the \c Table. */
    property int row: 0

    /** Data of the table call. Set by the \c Table.
     *
     * The itemData field is filled with the model data for the role provided
     * with \c TableColumn::dataRole.
     */
    property string itemData: ""

    /** Width of the table cell. Set by the \c Table. */
    property int cellWidth: 0

    /** Setting whether the cell uses the table's default font.
     *
     * Set to \c false if you want your delegate to use its own font.
     */
    property bool useTableFont: true

    wrapMode: Text.WordWrap
    elide: Text.ElideNone
    Layout.minimumWidth: cellWidth
    Layout.maximumWidth: cellWidth
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignLeft
}
