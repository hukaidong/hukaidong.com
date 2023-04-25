import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["cards", "grid", "columnSet"]

    connect() {
        $(this.columnSetTarget).dropdown(
            {
                onChange: (value) => {
                    this._setColumnCount(value);
                }
            }
        );

        this._setColumnCount($(this.columnSetTarget).dropdown('get value'));
    }

    _setColumnCount(value) {
        let columnWord = value.split(',')[1]
        let columnCount = parseInt(value[0])

        // create columns html elemnets
        let columns = []
        for (let i = 0; i < columnCount; i++) {
            let column = document.createElement('div');
            column.className = `column`;
            columns.push(column);
        }

        // move cards to columns
        let cards = this.cardsTarget.children
        for (let i = 0; i < cards.length; i++) {
            columns[i % columnCount].appendChild(cards[i].cloneNode(true))
        }

        // attach columns to grid
        this.gridTarget.className = `ui ${columnWord} column stackable grid`
        this.gridTarget.innerHTML = ''
        for (let i = 0; i < columnCount; i++) {
            this.gridTarget.appendChild(columns[i])
        }
        console.log(columns)
    }
}
