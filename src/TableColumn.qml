import QtQuick 2.5

/** @brief Definition for a \c Table column. */
Item {
    /** Width of the column.
     *
     * Can be a fixed value or a property binding, for example to
     * \c Table::headerWidth.
     */
    property int columnWidth: 0

    /** Text for the column header. */
    property string headerText: ""

    /** Data role for the column's cells text. */
    property string textRole: ""

    /** Data role for the column'c cells optional data. */
    property string dataRole: ""

    /** Delgate for the column's cells.
     *
     * Default is \c TableCellDelegate.
     */
    property Component cellDelegate: TableCellDelegate {}

    /** Delgate for the column's header.
     *
     * Default is \c TableHeaderDelegate.
     */
    property Component headerDelegate: TableHeaderDelegate {}
}
