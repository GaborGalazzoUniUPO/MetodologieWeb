'use strict';

let gameMatrix;

const PUZZLE_DIM = 100;
const NUM_COL = 4;
const NUM_ROW = 4;
const GRID_DIM = NUM_COL * NUM_ROW;

function initGameEngine() {
    gameMatrix = new Array(GRID_DIM);
    for (let i = 0; i < GRID_DIM; i++) {
        gameMatrix[i] = {
            x: i % NUM_COL,
            y: Math.floor(i / NUM_ROW)
        };
    }
}

function canMove(num) {

    let selectedPosition = gameMatrix[num];
    let emptyPosition = gameMatrix[GRID_DIM-1];
    if (selectedPosition.x === emptyPosition.x) {
        return Math.abs(selectedPosition.y - emptyPosition.y) === 1;
    }
    if (selectedPosition.y === emptyPosition.y) {
        return Math.abs(selectedPosition.x - emptyPosition.x) === 1;
    }
    return false;
}

function showCanMove(num, div) {
    if (canMove(num))
        div.classList.add("hover");
}

function hideCanMove(div) {
    div.classList.remove("hover");
}

function winCheck() {
    let win = true;
    for (let i = 0; i < GRID_DIM; i++)
        if (gameMatrix[i].x !== i % NUM_COL || gameMatrix[i].y !== Math.floor(i / NUM_ROW)) {
            win = false;
            break;
        }
    if (win) {
        let r = confirm("Hai vinto!\nVuoi fare un anuova partita?");
        if (r) {
            shuffle();
        }
    }
}

function movePiece(num, div) {
    if (!canMove(num))
        return;

    let selectedPosition = gameMatrix[num];
    let emptyPosition = gameMatrix[GRID_DIM - 1];
    let xOffset = 0;
    let yOffset = 0;
    if (selectedPosition.x === emptyPosition.x) {
        yOffset = selectedPosition.y - emptyPosition.y;
    }
    if (selectedPosition.y === emptyPosition.y) {
        xOffset = selectedPosition.x - emptyPosition.x;
    }

    // Salvo le nuove posizioni delle celle
    let temp = gameMatrix[num];
    gameMatrix[num] = gameMatrix[GRID_DIM -1];
    gameMatrix[GRID_DIM - 1] = temp;

    if (yOffset !== 0)
        div.style.top = (parseInt(div.style.top, 10) - yOffset * PUZZLE_DIM) + "px";
    if (xOffset !== 0)
        div.style.left = (parseInt(div.style.left, 10) - xOffset * PUZZLE_DIM) + "px";

    winCheck();
}

function initPuzzle() {
    let puzzleArea = document.getElementById("puzzlearea");
    let divs = puzzleArea.getElementsByTagName("div");
    for (let div of divs) {
        let num = parseInt(div.innerText, 10) - 1;
        let x = num % NUM_COL;
        let y = Math.floor(num / NUM_ROW);
        div.style.backgroundImage = "url('background.jpg')";
        div.style.backgroundPositionX = (-x * PUZZLE_DIM) + "px";
        div.style.backgroundPositionY = (-y * PUZZLE_DIM) + "px";
        div.style.left = (x * PUZZLE_DIM) + "px";
        div.style.top = (y * PUZZLE_DIM) + "px";
        div.position = "absolute";
        div.id = "piece_"+num;

        div.onmouseenter = function (ev) {
            showCanMove(num, div);
        };
        div.onmouseleave = function (ev) {
            hideCanMove(div);
        };
        div.onclick = function () {
            movePiece(num, div);
        }
    }
}

function shuffle() {
    for (let j = 0; j < 100; j++) {
        for (let i = 0; i < gameMatrix.length; i++) {
            if (i === PUZZLE_DIM -1)
                continue;
            if (canMove(i) && (Math.floor(Math.random() * 2) === 0)) {
                movePiece(i, document.getElementById("piece_"+i));
                console.log(i);
            }
        }
    }
}

function init() {
    document.getElementById("shufflebutton").onclick = shuffle;
    initGameEngine();
    initPuzzle();
}

window.addEventListener('DOMContentLoaded', function () {
    init();
});
