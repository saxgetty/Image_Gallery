function setFlashMessageFadeOut(flashMessageElement) {

    setTimeout(() => {

        let currentOpacity = 1.0;
        let timer = setInterval(() => {

            if(currentOpacity < 0.05) {
                clearInterval(timer);
                flashElement.remove();
            }

            currentOpacity = currentOpacity - 0.05;
            flashElement.style.opacity = currentOpacity;
        }, 10);
    }, 2000);
}

function addFlashFromFrontEnd(message) {

    let flashMessageDiv = document.createElement('div');
    let innerFlashDiv = document.createElement('div');
    let innerTextNode = document.createTextNode(message);
    innerFlashDiv.appendChild(innerTextNode);
    flashMessageDiv.appendChild(innerFlashDiv);
    flashMessageDiv.setAttribute('id', 'flash-message');
    innerFlashDiv.setAttribute('class', 'alert alert-info');
    document.getElementsByTagName('body')[0].appendChild(flashMessageDiv);
    setFlashMessageFadeOut(flashMessageDiv);
}

let flashElement = document.getElementById('flash-message');

if (flashElement) {
    setFlashMessageFadeOut(flashElement);
}