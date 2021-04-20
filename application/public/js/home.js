async function loadGrid() {

    try {
        var response = await axios.get('https://jsonplaceholder.typicode.com/albums/2/photos'); // Load 
        size = response.data.length; // Store the size of the loaded data
        displayCount(size); // Display the size we stored
        response.data.forEach(Element => { // For each element in response, make a photo card
            makePhotoCard(Element.title, Element.thumbnailUrl, Element.id);
        });
    }
    catch(err){ // If the try fails, catch the err and print it to the console
        console.log(err);
    }
}

function fadeOut(id) {

    var target = document.getElementById(`${id}`);
    var effect = setInterval(function() {
        if (!target.style.opacity) { // Check to make sure that it exists (has opacity)
            target.style.opacity = 1; // If it doesn't, set it
        }

        if (target.style.opacity > 0) { // If it exists (has opacity)
            target.style.opacity -= 0.5; // Decrease the opacity to 0 so it fades away
        }
        else { 
            clearInterval(effect);
            removeDiv(`${id}`);
            displayCount(--size);
        }
    }, 200);
} 

function makePhotoCard(title, url, id) {

    document.getElementById("cardContainer").insertAdjacentHTML("beforeend", 
        `
        <div class="items" id="photo-${id}" onclick="fadeOut('photo-${id}')">
            <img src="${url}.jpeg" alt="${title}" class="images">
            <p> F </p>
            <p> U </p>
            <p> N </p>
            <p> ${title} </p>
        </div>
        `    
    );
}

// Removes Div
function removeDiv(id) {

    var remove = document.getElementById(`${id}`);
    remove.parentNode.removeChild(remove);
}

// Running count of the currently displayed cards after they are clicked and faded
function displayCount(size) {

    document.getElementById('itemCount').innerHTML = `<p id="numCards"> There are ${size} photo(s) being shown </p>`;
}

// Calls the creation of our grid
loadGrid();