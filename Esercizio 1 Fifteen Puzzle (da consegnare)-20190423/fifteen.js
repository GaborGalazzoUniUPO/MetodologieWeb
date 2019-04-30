(function () {
    'use strict';

    // Construction CONST
    const PUZZLE_DIM = 100;
    const NUM_COL = 4;
    const NUM_ROW = 4;
    const GRID_DIM = NUM_COL * NUM_ROW;

    // For shuffle algorithm
    const NUM_SHUFFLE = 100;
    const RANDOM_VALUE = 2;

    //Engine const
    const GAME_MATRIX = [GRID_DIM];

    /**
     * Return if the index piece of he gameMatrix can be moved
     * @param {indexber} index The index of the piece in gameMatrix
     * @returns {boolean} the piece can be moved
     */
    function canMove(index) {
        let selectedPosition = GAME_MATRIX[index];
        let emptyPosition = GAME_MATRIX[GRID_DIM - 1];
        if (selectedPosition.x === emptyPosition.x) {
            return Math.abs(selectedPosition.y - emptyPosition.y) === 1;
        }
        if (selectedPosition.y === emptyPosition.y) {
            return Math.abs(selectedPosition.x - emptyPosition.x) === 1;
        }
        return false;
    }

    /**
     * Mve a piece of the puzzle if it can be moved
     * @param {indexber} index The index of the piece in gameMatrix to move
     * @param {Element} div The DOM element reference to the piece
     */
    function movePiece(index, div) {
        if (!canMove(index)) {
            return;
        }
        let selectedPosition = GAME_MATRIX[index];
        let emptyPosition = GAME_MATRIX[GRID_DIM - 1];
        let xOffset = 0;
        let yOffset = 0;
        if (selectedPosition.x === emptyPosition.x) {
            yOffset = selectedPosition.y - emptyPosition.y;
        }
        if (selectedPosition.y === emptyPosition.y) {
            xOffset = selectedPosition.x - emptyPosition.x;
        }
        // Swap the position data
        let temp = GAME_MATRIX[index];
        GAME_MATRIX[index] = GAME_MATRIX[GRID_DIM - 1];
        GAME_MATRIX[GRID_DIM - 1] = temp;
        //Move piece in the DOM
        if (yOffset !== 0) {
            div.style.top = (parseInt(div.style.top, 10) - yOffset * PUZZLE_DIM) + "px";
        }
        if (xOffset !== 0) {
            div.style.left = (parseInt(div.style.left, 10) - xOffset * PUZZLE_DIM) + "px";
        }
        // Win Check
        let win = true;
        for (let i = 0; i < GRID_DIM; i++) {
            if (GAME_MATRIX[i].x !== i % NUM_COL || GAME_MATRIX[i].y !== Math.floor(i / NUM_ROW)) {
                win = false;
                break;
            }
        }
        if (win) {
            let r = confirm("Hai vinto!\nVuoi fare un anuova partita?");
            if (r) {
                shuffle();
            }
        }
    }

    /**
     * Shuffle the puzzle
     */
    function shuffle() {
        for (let j = 0; j < NUM_SHUFFLE; j++) {
            for (let i = 0; i < GAME_MATRIX.length; i++) {
                if (i === PUZZLE_DIM - 1) {
                    continue;
                }
                if (canMove(i) && (Math.floor(Math.random() * RANDOM_VALUE) === 0)) {
                    movePiece(i, document.getElementById("piece_" + i));
                }
            }
        }
    }

    /**
     * Init the the document for the game.
     */
    window.addEventListener('DOMContentLoaded', function () {
        document.getElementById("shufflebutton").onclick = shuffle;
        // Initiailize game engine
        for (let i = 0; i < GRID_DIM; i++) {
            GAME_MATRIX[i] = {
                x: i % NUM_COL,
                y: Math.floor(i / NUM_ROW)
            };
        }
        // Initialize document
        let puzzleArea = document.getElementById("puzzlearea");
        let divs = puzzleArea.getElementsByTagName("div");
        for (let div of divs) {
            let index = parseInt(div.innerText, 10) - 1;
            let x = index % NUM_COL;
            let y = Math.floor(index / NUM_ROW);
            div.style.backgroundImage = "url('background.jpg')";
            div.style.backgroundPositionX = (-x * PUZZLE_DIM) + "px";
            div.style.backgroundPositionY = (-y * PUZZLE_DIM) + "px";
            div.style.left = (x * PUZZLE_DIM) + "px";
            div.style.top = (y * PUZZLE_DIM) + "px";
            div.position = "absolute";
            div.id = "piece_" + index;
            div.onmouseenter = function () {
                if (canMove(index)) {
                    div.classList.add("hover");
                }
            };
            div.onmouseleave = function () {
                div.classList.remove("hover");
            };
            div.onclick = function () {
                movePiece(index, div);
            };
        }
    });

})();
