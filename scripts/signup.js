//FUNCTIONS

function checkEmail(event) {
    //EMAIL CONTROL
    if (!validateEmail(email.value)) {
        const error = "email non valida !";
        errors.push(error);
        setError(email);
    }

    fetch("http://localhost/HM_1/emailFree.php", {
        method: "post",

        body: new FormData(signupForm)
    }).then(promise => promise.json()).then(json => {
        if (!json) {
            const error = "email già presente !";
            errors.push(error);
            setError(email);
        }
    });
}

function checkPassword(event) {
    //PASSWORD CONTROL
    if (!validatePassword(password.value)) {
        const error = "la password non è di un formato corretto";
        errors.push(error);
        setError(password);
    }

}

function checkConfirmPassoword(event) {
    //CONFIRM PASSWORD CONTROL
    if (password.value !== confirmPassoword.value) {
        const error = "le passoword non sono uguali";
        errors.push(error);
        setError(confirmPassoword);
    }
}

function validateEmail(email) {
    const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
}

function validatePassword(password) {
    const re = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/;
    return re.test(String(password));
}


function setError(element) {
    element.classList.add("error");
}

function resetError(event) {
    event.currentTarget.classList.remove("error")
}

function checkValues(event) {
    event.preventDefault();
    for (element of elementList) {
        if (element.value === "") {
            const error = "L'elemento " + element.name + " è vuoto !";
            errors.push(error);
            setError(element);
        }
    }
}



function checkForm(event) {
    error_display.innerHTML = "";
    error_display.classList.add("hidden");
    checkValues(event);
    if (errors.length !== 0) {
        event.preventDefault();
        error_display.classList.remove("hidden");
        for (let i = 0; i < errors.length; i++) {
            const er = errors[i];
            const element = document.createElement("p");

            element.textContent = er;

            error_display.append(element);

        }

        errors = [];
        return;
    }

    document.forms["signup"].submit();

    //myusername/email : admin 
    //mypassword : admin
}

//CONSTANTS AND VARIABLES
let errors = Array();

//EVENT LISTENERS
const email = document.querySelector(".email input");
email.addEventListener('blur', checkEmail);

const password = document.querySelector(".password input");
password.addEventListener('blur', checkPassword);

const confirmPassoword = document.querySelector(".confirm_password input");
confirmPassoword.addEventListener('blur', checkConfirmPassoword);

const signupForm = document.forms["signup"];
signupForm.addEventListener("submit", checkForm);
const elementList = document.querySelectorAll("input");

const error_display = document.querySelector(".error_display");

for (element of elementList) {
    element.addEventListener("focus", resetError);
}