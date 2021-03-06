    function inizialize(json, prefs) {
        //inizialize contents
        const gridContainer = document.querySelector(".choices .grid")

        const affiliates = Object.entries(json);
        let preferencies
        if (prefs !== null)
            preferencies = Object.entries(prefs);

        console.log(prefs);
        for (let affiliate of affiliates) {
            //instantiation of the elements
            affiliate = affiliate[1];
            const container = document.createElement("div");
            const title = document.createElement("div");
            const img = document.createElement("img");
            const city = document.createElement("h3");
            const button_ = document.createElement("img");
            const address = document.createElement("p");
            const clickableText = document.createElement("h4");
            const clickableTextClose = document.createElement("h5");

            //initialization and class assignment
            img.src = affiliate.src;
            address.textContent = affiliate.address;
            clickableText.textContent = "Scopri dove";
            city.textContent = affiliate.title
            button_.src = "img/baseline_thumb_up_grey_24dp.png";
            clickableTextClose.textContent = "Chiudi";

            container.classList.add("customerPoint");
            title.classList.add("titleCustomerPoint");
            button_.classList.add("button");
            img.classList.add("city");
            clickableText.classList.add("details");
            address.classList.add("hidden");
            clickableTextClose.classList.add("hidden")

            //constraction of the elements conteiner

            title.appendChild(city);
            title.appendChild(button_);
            container.appendChild(title);
            container.appendChild(img);
            container.appendChild(clickableText);
            container.appendChild(address);
            container.appendChild(clickableTextClose);

            //assignment of EventListeners to the elements
            button_.addEventListener("click", onClickPreference);
            clickableText.addEventListener("click", oncClickText);
            clickableTextClose.addEventListener("click", onClickClose);

            gridContainer.appendChild(container);
            console.log(container);

            if (preferencies)
                preferencies.forEach(function(item, index, array) {
                    if (item[1] === city.textContent)
                        isPreferred(container);
                })

        }

    }

    function onClickNotPreference(event) {
        //remove element from favorites
        const favorite = event.currentTarget.parentElement.parentElement;
        const imgButton = favorite.querySelector("img.button");

        favorite.querySelector("h4.details").classList.remove("hidden");
        //changing the button and the listener before the shifting 
        imgButton.src = "img/baseline_thumb_up_grey_24dp.png"
        imgButton.removeEventListener("click", onClickNotPreference);
        imgButton.addEventListener("click", onClickPreference);

        removeFromFavorite(favorite);
    }

    function onClickPreference(event) {
        //add element into favorites
        const favorite = event.currentTarget.parentElement.parentElement;
        const imgButton = favorite.querySelector("img.button");

        favorite.querySelector("h4.details").classList.add("hidden");
        //changing the button and the listener before the shifting 
        imgButton.src = "img/outline_thumb_down_grey_24dp.png";
        imgButton.removeEventListener("click", onClickPreference);
        imgButton.addEventListener("click", onClickNotPreference);

        addFavorite(favorite);

    }

    function oncClickText(event) {
        //show the address(description)
        event.currentTarget.classList.add("hidden");
        const contanier = event.currentTarget.parentElement;
        contanier.querySelector("p").classList.remove("hidden");
        contanier.querySelector("h5").classList.remove("hidden");
    }

    function addFavorite(favorite) {
        //the function change the position of the element selected, from the choices
        //  to the favorites
        const divFav = document.querySelector("div.favorites");

        if (favoritesElements === 0)
            divFav.classList.remove("hidden");

        divFav.querySelector(".favorites .grid").appendChild(favorite);
        //change the Favorite-counter value 
        favoritesElements += 1;
        fetchPrefs("update");
    }

    function removeFromFavorite(favorite) {
        //the function change the position of the element selected, from the favorites
        //  to the choices
        const divFav = document.querySelector("div.favorites");
        const divChoices = document.querySelector("div.choices .grid");


        divChoices.appendChild(favorite);
        //change the Favorite-counter value 
        favoritesElements -= 1;

        //control the amount of the favorites
        if (favoritesElements === 0)
            divFav.classList.add("hidden");
        fetchPrefs("update");
    }

    function onClickClose(event) {
        //close the address(description)
        event.currentTarget.classList.add("hidden");
        const contanier = event.currentTarget.parentElement;
        contanier.querySelector("p").classList.add("hidden");
        contanier.querySelector("h5").classList.add("hidden");
        contanier.querySelector("h4").classList.remove("hidden");
    }



    function search(event) {
        //search in to the cities name the key value from the HTML-input element
        const key = event.currentTarget.value.toLowerCase();

        //select all 
        const elements = document.querySelectorAll(".titleCustomerPoint h3");

        //if they not match , hides the element, else it's showed up
        for (let elem of elements) {
            if (elem.textContent.toLowerCase().search(key) == -1)
                elem.parentElement.parentElement.classList.add("hidden");
            else
            if (elem.parentElement.parentElement.classList.contains("hidden"))
                elem.parentElement.parentElement.classList.remove("hidden");
        }


    }

    //assignament of the event listener to the HTML-input element
    document.querySelector("input").addEventListener("keyup", search);

    //favorites-counter variable
    let favoritesElements = 0;

    //inizializetion of the poster section


    function fetchPrefs(option) {
        //manage favorite customer point
        const favoritesElements = document.querySelectorAll(".favorites .titleCustomerPoint h3");

        const params = new URLSearchParams();

        if (option === "update") {
            let i = 0;
            if (favoritesElements.length != 0)
                for (const element of favoritesElements)
                    params.append("citta" + i++, element.textContent);
            else
                params.append("citta" + i++, null);


        }

        // API -> save and load a coockie of favorite customer point
        fetch("http://localhost/HM_1/favorites_customer_point.php?" + params.toString())
            .then(repsonse => repsonse.json()).then(json => {
                //console.log(json);
                const prefs = json;
                if (!option)
                //API -> load info about customer point
                    fetch("http://localhost/HM_1/content.php").then(response => response.json()).then(json => {
                    console.log(json);
                    inizialize(json, prefs);
                });
            });


    }

    function isPreferred(favorite) {
        //change state
        const imgButton = favorite.querySelector("img.button");

        favorite.querySelector("h4.details").classList.add("hidden");
        //changing the button and the listener before the shifting 
        imgButton.src = "img/outline_thumb_down_grey_24dp.png";
        imgButton.removeEventListener("click", onClickPreference);
        imgButton.addEventListener("click", onClickNotPreference);

        addFavorite(favorite);
    }

    fetchPrefs();