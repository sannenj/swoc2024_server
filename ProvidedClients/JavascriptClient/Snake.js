class Snake {
    head = [];
    segments = new Array();
    length = 1;
    name = "";
    kidcount = 0;

    constructor(address, name) {
        console.log("creating new snake: " + name);
        console.log(address);
        this.head = address;
        this.segments.push(address);
        this.name = name;
        console.log("snake is finished: " + name);
    }
}

exports.Snake = Snake;