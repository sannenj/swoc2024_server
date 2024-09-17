class Cell {
    address = [];
    hasFood = false;
    hasPlayer = false;

    constructor(address, hasFood, hasPlayer) {
        this.hasFood = hasFood;
        this.hasPlayer = hasPlayer;
        this.address = address;
    }
}
exports.Cell = Cell;
