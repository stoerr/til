console.log("SearchImpl.js loaded");

class SearchImpl {

    constructor() {
        console.log("SearchImpl constructor");
    }

    bind() {
        console.log("SearchImpl bind");
    }

};

const search = new SearchImpl();
search.bind();

console.log("SearchImpl.js done");
