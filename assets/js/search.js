console.log("SearchImpl.js loaded");

let embeddings = [];
let uniqueCategories = new Set();


// Fetch JSON files on page load
window.addEventListener('load', async () => {
    const nocache = Math.floor(new Date().getTime() / 86400000);
    const embeddingsResponse = await fetch('/db/embeddings.json?nocache=' + nocache);
    embeddings = await embeddingsResponse.json();

    // Decode base64 embeddings
    embeddings.forEach(embedding => {
        embedding.embedding = decodeBase64(embedding.embedding.encoded);
    });
});

document.getElementById('searchButton').addEventListener('click', triggerSearch);
document.getElementById('search').addEventListener('keydown', event => {
    if (event.key === 'Enter') {
        triggerSearch(event);
    }
});

async function triggerSearch(event) {
    const query = document.getElementById('search').value;

    // Get the embedding of the search query
    const queryEmbedding = await getQueryEmbedding(query);

    // Calculate cosine similarity
    const results = embeddings.map(embedding => {
        return {
            id: embedding.id,
            similarity: cosineSimilarity(queryEmbedding, embedding.embedding)
        };
    });

    // Sort results by similarity
    results.sort((a, b) => b.similarity - a.similarity);
    debugger;

    displayResults(results.slice(0, 10));
}

async function getQueryEmbedding(query) {
    let apiKey = localStorage.getItem('openai_api_key');
    if (!apiKey || !apiKey.startsWith('sk-')) {
        apiKey = prompt('Please enter your OpenAI API key:');
        if (apiKey) localStorage.setItem('openai_api_key', apiKey);
        else return;
    }

    const response = await fetch('https://api.openai.com/v1/embeddings', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${apiKey}`
        },
        // CAUTION: model has to be consistent with bin/llmupdatedb.sh
        body: JSON.stringify({
            input: query,
            model: 'text-embedding-3-large',
            encoding_format: 'base64'
        })
    });

    const data = await response.json();
    return decodeBase64(data.data[0].embedding);
}

function decodeBase64(base64) {
    const binaryString = atob(base64);
    const len = binaryString.length;
    const bytes = new Uint8Array(len);
    for (let i = 0; i < len; i++) {
        bytes[i] = binaryString.charCodeAt(i);
    }
    const floats = new Float32Array(bytes.buffer);
    return Array.from(floats);
}

function cosineSimilarity(vecA, vecB) {
    const dotProduct = vecA.reduce((sum, a, idx) => sum + a * vecB[idx], 0);
    const magnitudeA = Math.sqrt(vecA.reduce((sum, val) => sum + val * val, 0));
    const magnitudeB = Math.sqrt(vecB.reduce((sum, val) => sum + val * val, 0));
    return dotProduct / (magnitudeA * magnitudeB);
}

function displayResults(results) {
    const linksContainer = document.getElementById('links');
    linksContainer.innerHTML = '';
    const markdownConverter = new showdown.Converter();

    results.forEach(link => {
        const linkDescrUrl = link.id.replace('.md', '.html');
        const linkElement = document.createElement('div');
        linkElement.classList.add('linkDisplay');
        const title = link?.content?.split('\n')[0] || linkDescrUrl;
        const summary = link?.content?.split('\n')[2];
        const text = link?.content?.split('\n')?.slice(10)?.join('<br>');
        linkElement.innerHTML = `
            <h2><a href="/${linkDescrUrl}">${title}</a></h2>
            <details>
                <summary>${summary}</summary>
                <p>${markdownConverter.makeHtml(text)}</p>
            </details>
        `;
        linksContainer.appendChild(linkElement);
    });

    // scroll so that #search-result is on top of the visible window
    document.getElementById('search-result').scrollIntoView();
}

console.log("SearchImpl.js done");
