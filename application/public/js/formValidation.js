// Global Variables
const form = document.getElementById("form");
const username = document.getElementById("setUsername");
const password = document.getElementById("setPassword");
const confirmPassword = document.getElementById("setConfirmPw");
const email = document.getElementById("setEmail");

form.addEventListener("submit", e => {

    // Local Variables
    let outputMessages = [];
    let readyToSubmit = true;

    // e.preventDefault();

    // Regex Expressions
    let regexReq1 = /^[A-Za-z]/; // Username begins with a character
    let regexReq2 = /.*[a-zA-Z0-9]{3}/; // Username has at least 3 alphanumeric characters
    let regexReq3 = /[A-Z]/; // Password has at least 1 upper case letter
    let regexReq4 = /[0-9]/; // Password has at least 1 number
    let regexReq5 = /[/*-+!@#$^&]/; // Password has 1 of the following special characters (/*-+!@#$^&*)

    // 1. Username begins with a character
    if (username.value && !username.value[0].match(regexReq1)) {
        outputMessages.push("❌ Username must begin with a character\n");
        readyToSubmit = false;
    }
    else {
        outputMessages.push("✔️ Username begins with a character\n");
    }

    // 2. Username has at least 3 alphanumeric characters
    if (username.value.match(regexReq2)) {
        outputMessages.push("✔️ Username has at least 3 alphanumeric characters\n");
    }
    else {
        outputMessages.push("❌ Username must have at least 3 alphanumeric characters\n");
        readyToSubmit = false;
    }

    // 3. Password has at least 8 characters
    if (password.value.length > 8) {
        outputMessages.push("✔️ Password has at least 8 characters\n");
    }
    else {
        outputMessages.push("❌ Password must have at least 8 characters\n");
        readyToSubmit = false;
    }

    // 4. Password has at least 1 upper case letter
    if (password.value.match(regexReq3)) {
        outputMessages.push("✔️ Password has at least 1 upper case letter\n");
    }
    else {
        outputMessages.push("❌ Password must have at least 1 upper case letter\n");
        readyToSubmit = false;
    }

    // 5. Password has at least 1 number
    if (password.value.match(regexReq4)) {
        outputMessages.push("✔️ Password has at least 1 number\n");
    }
    else {
        outputMessages.push("❌ Password must have at least 1 number\n");
        readyToSubmit = false;
    }

    // 6. Password has 1 of the following special characters (/*-+!@#$^&*)
    if (password.value.match(regexReq5)) {
        outputMessages.push("✔️ Password has 1 of the following special characters (/*-+!@#$^&*)\n");
    }
    else {
        outputMessages.push("❌ Password must have 1 of the following special characters (/*-+!@#$^&*)\n");
        readyToSubmit = false;
    }

    // 7. Password must be confirmed and match
    if (password.value == confirmPassword.value) {
        outputMessages.push("✔️ Passwords match\n"); 
    }
    else {
        outputMessages.push("❌ Passwords must match\n");
        readyToSubmit = false;
    }

    // Displays Alert Box
    if (outputMessages.length) {
        // If all fields are filled out correctly, alert that and show it was a success, otherwise failure
        if (readyToSubmit == true) {
            // e.preventDefault();
            outputMessages.push("\n\t\t\t\t\t\t✨SUCCESS✨")
            alert(outputMessages.join(""));
        }
        else {
            e.preventDefault();
            outputMessages.push("\n\t\t\t\t\t\t\t❗️FAILED❗️")
            alert(outputMessages.join(""));
        }
    }
});