'use strict';

const fs = require('fs');

process.stdin.resume();
process.stdin.setEncoding('utf-8');

let inputString = '';
let currentLine = 0;

process.stdin.on('data', function(inputStdin) {
  inputString += inputStdin;
});

process.stdin.on('end', function() {
  inputString = inputString.split('\n');
  main();
});

function readLine() {
  return inputString[currentLine++];
}

class NotesStore {
    //add your code here
     constructor() {
    this.notes = {
      completed: [],
      active: [],
      others: []
    };
  }

  addNote(state, name) {
    if (!state) {
      throw new Error("State cannot be empty");
    }

    if (!name) {
      throw new Error("Name cannot be empty");
    }

    if (!this.notes.hasOwnProperty(state)) {
      throw new Error(`Invalid state ${state}`);
    }

    this.notes[state].push(name);
  }

  getNotes(state) {
    if (!this.notes.hasOwnProperty(state)) {
      throw new Error(`Invalid state ${state}`);
    }

    return this.notes[state];
  }
}

function main() {
    const ws = fs.createWriteStream(process.env.OUTPUT_PATH);
    
    const obj = new NotesStore();
    const operationCount = parseInt(readLine().trim());
    
    for(let i = 1; i <= operationCount; i++) {
        const operationInfo = readLine().trim().split(' ');
        try {
            if (operationInfo[0] === 'addNote') {
                obj.addNote(operationInfo[1], operationInfo[2] || '');
            } else if (operationInfo[0] === 'getNotes') {
                const res = obj.getNotes(operationInfo[1]);
                if (res.length === 0) {
                    ws.write('No Notes\n');
                } else {
                    ws.write(${res.join(',')}\n);
                }
            }
        } catch (e) {
            ws.write(${e}\n);
        }
    }
    ws.end();
}