# QMLTable
Table implementation for Qt 5 with QtQuick Components 2

## Goals
QMLTable adds an easy to use and performant table view implementation to QtQuick. Is does not provide as many features as QtQUick Components 1's TableView, but can be used to create simple table views.

## Documentation
QMLTables uses DoxyQML fopr documentation. See https://github.com/agateau/doxyqml

## Usage
To use QMLTable, simply add the QML files to your project. A basic table definition could look like this:

    Item {
        Table {
            id: table
            anchors.fill: parent
            model: tableModel
    
            TableColumn {
                textRole: "name"
                headerText: "Name"
                columnWidth: 200
            }
            TableColumn {
                textRole: "data"
                headerText: "Data"
                columnWidth: table.headerWidth - 200
            }
        }
    
        ListModel {
            id: tableModel
            ListElement {
                name: "Entry 1"
                data: "Some Text"
            }
            ListElement {
                name: "Entry 2"
                data: "More Text"
            }
            ListElement {
                name: "Entry 3"
                data: "Even more text"
            }
        }
    }
