function inizialize(json, chs) {

    //inizialize contents
    const gridContainer = document.querySelector(".choices .grid")

    const products = Object.entries(json);
    let choices
    if (chs !== null)
        choices = Object.entries(chs);

    console.log(chs);
    for (let product of products) {
        //instantiation of the elements
        product = product[1];
        const container = document.createElement("div");
        const title = document.createElement("div");
        const img = document.createElement("img");
        const name = document.createElement("h3");
        const button_ = document.createElement("img");
        const price = document.createElement("p");
        const input = document.createElement("input");
        const label = document.createElement("label");

        //initialization and class assignment
        img.src = product.src;
        price.textContent = product.price + "€";
        name.textContent = product.producer + " " + product.name;
        button_.src = "img/prodotti/outline_shopping_cart_empty_48dp.png";
        input.type = "number";
        input.id = "quantity " + name.textContent;
        input.max = "100";
        input.min = "1";
        input.value = 1;
        container.setAttribute("data-code", product.code);
        label.for = "quantity " + name.textContent;
        label.textContent = "Quantità "

        container.classList.add("productContainer");
        title.classList.add("titleproductContainer");
        button_.classList.add("button");

        //constraction of the elements conteiner

        title.appendChild(name);
        title.appendChild(button_);
        container.appendChild(title);
        container.appendChild(img);
        container.appendChild(price);
        container.appendChild(label);
        container.appendChild(input);


        //assignment of EventListeners to the elements
        button_.addEventListener("click", onClickChoosed);

        gridContainer.appendChild(container);
        //console.log(container);

        if (choices)
            choices.forEach(function(item, index, array) {
                if (item[1] === container.dataset.code)
                    isChoosed(container);
            })

    }

}

function onClickNotChoosed(event) {
    //remove element from choosen
    const favorite = event.currentTarget.parentElement.parentElement;
    const imgButton = favorite.querySelector("img.button");

    //changing the button and the listener before the shifting 
    imgButton.src = "img/baseline_thumb_up_grey_24dp.png"
    imgButton.removeEventListener("click", onClickNotChoosed);
    imgButton.addEventListener("click", onClickChoosed);

    removeFromChoosed(favorite);
}

function onClickChoosed(event) {
    //add element into choosen
    const favorite = event.currentTarget.parentElement.parentElement;
    const imgButton = favorite.querySelector("img.button");

    //changing the button and the listener before the shifting 
    imgButton.src = "img/prodotti/outline_shopping_cart_full_48dp.png";
    imgButton.removeEventListener("click", onClickChoosed);
    imgButton.addEventListener("click", onClickNotChoosed);

    addChoosed(favorite);

}

function addChoosed(favorite) {
    //the function change the position of the element selected, from the choices
    //  to the choosen
    const divFav = document.querySelector("div.choosen");

    if (productInList === 0)
        divFav.classList.remove("hidden");

    divFav.querySelector(".choosen .grid").appendChild(favorite);
    //change the Favorite-counter value 
    productInList += 1;
    fetchChoices("update");
}

function removeFromChoosed(favorite) {
    //the function change the position of the element selected, from the choosen
    //  to the choices
    const divFav = document.querySelector("div.choosen");
    const divChoices = document.querySelector("div.choices .grid");


    divChoices.appendChild(favorite);
    //change the Favorite-counter value 
    productInList -= 1;

    //control the amount of the choosen
    if (productInList === 0)
        divFav.classList.add("hidden");
    fetchChoices("update");
}


function search(event) {
    //search in to the database the product name typed
    const key = event.currentTarget.value.toLowerCase();

    const elements = document.querySelectorAll(".productContainer");


    const params = new URLSearchParams();
    params.append("query", key);

    if (key)
    //search into the databse
        fetch("http://localhost/HM_1/search_product.php?" + params.toString())
        .then(promise => promise.json())
        .then(json => {
            for (const elem of elements) {
                if (!json.length)
                    elem.classList.add("hidden");
                else
                    for (const res of json) {
                        if (elem.dataset.code !== res[0])
                            elem.classList.add("hidden");
                        else
                        if (elem.classList.contains("hidden")) {
                            elem.classList.remove("hidden");
                            break;
                        }

                    }
            }
        })
    else
        for (const elem of elements) {
            if (elem.classList.contains("hidden"))
                elem.classList.remove("hidden");
        }

}

//assignament of the event listener to the HTML-input element
document.querySelector(".choices input").addEventListener("change", search);

//choosen-counter variable
let productInList = 0;

//inizializetion of the poster section


function fetchChoices(option) {
    const productInList = document.querySelectorAll(".choosen .productContainer");

    const params = new URLSearchParams();

    //get the choosen products
    if (option === "update") {
        let i = 0;
        if (productInList.length != 0)
            for (const element of productInList)
                params.append("prodotto" + i++, element.dataset.code);
        else
            params.append("prodotto" + i++, null);


    }

    //retrieve choosen products
    fetch("http://localhost/HM_1/product_list.php?" + params.toString())
        .then(repsonse => repsonse.json()).then(json => {
            //console.log(json);
            const prods = json;
            if (!option)
            //fetch products info from db
                fetch("http://localhost/HM_1/product.php").then(response => response.json()).then(json => {
                console.log(json);
                inizialize(json, prods);
            });
        });

}

function isChoosed(favorite) {
    const imgButton = favorite.querySelector("img.button");

    //changing the button and the listener before the shifting 
    imgButton.src = "img/prodotti/outline_shopping_cart_full_48dp.png";
    imgButton.removeEventListener("click", onClickChoosed);
    imgButton.addEventListener("click", onClickNotChoosed);

    addChoosed(favorite);
}

//fetch products and coockie
fetchChoices();

//assignament of the event listener to the HTML-input element
document.querySelector("input").addEventListener("click", save);

//save the user list
function save(event) {

    const productInList = document.querySelectorAll(".choosen .productContainer");

    const params = new URLSearchParams();

    let i = 0;

    for (const element of productInList) {
        params.append("codice_prodotto", element.dataset.code);
        params.append("quantita", element.querySelector("input").value);

        fetch("save_lista.php?" + params.toString())
            .then(response => response.json())
            .then(json => {
                if (!json)
                    console.log("errore");
                else
                    location.reload()
            });

    }


    fetch("http://localhost/HM_1/product_list.php?prodotto0=null");


}