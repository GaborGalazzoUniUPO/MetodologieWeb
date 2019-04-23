let gameMatrix;

function initGameEngine() {
    gameMatrix = new Array(16);
    for (let i = 0; i < 16; i++) {
        gameMatrix[i] = {
            x: i % 4,
            y: Math.floor(i / 4),
            div: null
        };
    }
}

function canMove(num) {

    let selectedPosition = gameMatrix[num];
    let emptyPosition = gameMatrix[15];
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
    for (let i = 0; i < 16; i++)
        if (gameMatrix[i].x !== i % 4 || gameMatrix[i].y !== Math.floor(i / 4)) {
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
    let emptyPosition = gameMatrix[15];
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
    gameMatrix[num] = gameMatrix[15];
    gameMatrix[15] = temp;
    gameMatrix[num].div = div;
    gameMatrix[15].div = null;

    if (yOffset !== 0)
        div.style.top = (parseInt(div.style.top, 10) - yOffset * 100) + "px";
    if (xOffset !== 0)
        div.style.left = (parseInt(div.style.left, 10) - xOffset * 100) + "px";

    winCheck();
}

function initPuzzle() {
    let puzzleArea = document.getElementById("puzzlearea");
    let divs = puzzleArea.getElementsByTagName("div");
    for (let div of divs) {
        let num = parseInt(div.innerText, 10) - 1;
        let x = num % 4;
        let y = Math.floor(num / 4);
        div.style.backgroundImage = "url('background.jpg')";
        div.style.backgroundPositionX = (-x * 100) + "px";
        div.style.backgroundPositionY = (-y * 100) + "px";
        div.style.left = (x * 100) + "px";
        div.style.top = (y * 100) + "px";
        div.position = "absolute";
        gameMatrix[num].div = div;

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
            if(i === 15)
                continue;
            if (canMove(i) && (Math.floor(Math.random()*2)===0)) {
                movePiece(i, gameMatrix[i].div);
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
