/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

const formData = new Map();

const priceOfPackage = new Map();
const capacityOfPackage = new Map();
const listOfSelectedPackage= new Map();

const listOfSelectedTheme = new Map();

const listOfSelectedTimeSlot = new Map();

const priceOfProduct = new Map();
const listOfSelectedProducts = new Map();

const timeSlots = generateTimeSlots();

let maxCapacity = 0;
let totalAmount = 0;

function submitForm() {
    let form = document.createElement('form');
    let slotTime = '';
    form.method = 'POST';
    form.action = 'MainController';
    formData.set('numberOfKids', document.getElementById('ticketForKids').value);
    formData.set('numberOfAdults', document.getElementById('ticketForAdults').value);
    formData.set('date', document.getElementById('date').value);
    formData.set('note', document.getElementById('note').value);
    formData.set('status', 'Pending');
    formData.set('btAction', 'Book')
    formData.forEach((value, key) => {
        let input = document.createElement('input');
        input.type = 'hidden';
        input.name = key;
        input.value = value;
        form.appendChild(input);
    });

    document.body.appendChild(form);
    form.submit();
}
function addToFormData(name, value) {
    formData.set(name, value);
}

function addToListOfSelectedPackage(packageId, status) {
    listOfSelectedPackage.set(packageId, status);
}

function addToCapacityOfPackage(packageId, capacity) {
    capacityOfPackage.set(packageId, capacity);
}

function addToPriceOfPackage(packageId, price) {
    priceOfPackage.set(packageId, price);
}

function addToListOfSelectedTheme(themeId, status) {
    listOfSelectedTheme.set(themeId, status);
}

function addToPriceOfProduct(productId, price) {
    priceOfProduct.set(productId, price);
}

function addToListOfSelectedTimeSlot(timeSlot, status) {
    listOfSelectedTimeSlot.set(timeSlot, status);
}

function addPackageToCart(packageId, element) {
    if (element.innerText === "Select") {
        element.innerText = 'Selected';
        element.classList.add("bg-pink-500");
        element.classList.remove("bg-[#FFD3E0]");
        addToFormData("packageId", packageId);
        maxCapacity = 0;
        listOfSelectedPackage.forEach((value, key) => {
            if (key !== (packageId)) {
                listOfSelectedPackage[key] = false;
                document.getElementById(key).innerText = "Select";
                document.getElementById(key).classList.remove("bg-pink-500");
                document.getElementById(key).classList.add("bg-[#FFD3E0]");
            } else {
                listOfSelectedPackage.set(packageId, true);
                maxCapacity = capacityOfPackage.get(packageId);
            }
        });
    } else {
        element.innerText = "Select";
        element.classList.remove("bg-pink-500");
        element.classList.add("bg-[#FFD3E0]");
        listOfSelectedPackage.set(packageId, false);
        maxCapacity = 0;
    }
    checkCapacity();
}

function addThemeToCart(themeId, element) {
    if (element.innerText === "Select") {
        element.innerText = "Selected";
        element.classList.add("bg-pink-500");
        element.classList.remove("bg-[#FFD3E0]");
        addToFormData("themeId", themeId);
        listOfSelectedTheme.forEach((value, key) => {
            if (key !== (themeId)) {
                listOfSelectedTheme[key] = false;
                document.getElementById(key).innerText = "Select";
                document.getElementById(key).classList.remove("bg-pink-500");
                document.getElementById(key).classList.add("bg-[#FFD3E0]");
            } else {
                listOfSelectedTheme.set(themeId, true);
            }
        });
    } else {
        element.innerText = "Select";
        element.classList.remove("bg-pink-500");
        element.classList.add("bg-[#FFD3E0]");
        listOfSelectedTheme.set(themeId, false);
    }
}



document.getElementById('ticketForKids').addEventListener('input', function() {
    checkCapacity();
});

document.getElementById('ticketForAdults').addEventListener('input', function() {
    checkCapacity();
});

function checkCapacity() {
    const ticketForKids = parseInt(document.getElementById('ticketForKids').value);
    const ticketForAdults = parseInt(document.getElementById('ticketForAdults').value);
    const totalTickets = ticketForKids + ticketForAdults;

    if (totalTickets > maxCapacity) {
        const warningMessage = document.getElementById('warningCapacity');
        warningMessage.textContent = 'Total number of tickets exceeds maximum capacity of your selected package.';
        warningMessage.classList.remove('hidden');
    } else {
        const warningMessage = document.getElementById('warningCapacity');
        warningMessage.classList.add('hidden');
    }
}

function showSuccessToast() {
    let toast = document.getElementById('toast-popup');
    toast.classList.remove('hidden');
    setTimeout(function(){
        toast.classList.add('fade-out');
    }, 3000); // 3 seconds timeout, adjust as needed
}

function addProductToCart(productId) {
    const quantity = document.getElementById('quantity_' + productId).value;
    let toast = document.getElementById('toast-popup');
    let totalOfQuantity = 0;
    if (quantity > 0 && !listOfSelectedProducts.has(productId)) {
        listOfSelectedProducts.set(productId, quantity);
        totalAmount +=  parseInt(quantity) * parseInt(priceOfProduct.get(productId));
        toast.classList.remove('fade-out');
        showSuccessToast();
    } else if (quantity > 0 && listOfSelectedProducts.has(productId)) {
        totalOfQuantity = parseInt(quantity) + parseInt(listOfSelectedProducts.get(productId));
        totalAmount +=   totalOfQuantity * parseInt(priceOfProduct.get(productId));
        listOfSelectedProducts.set(productId, totalOfQuantity);
        toast.classList.remove('fade-out');
        showSuccessToast();
    }
}



function generateTimeSlots() {
    let timeSlots = [];

    for (let i = 9; i <= 21; i += 2) {
        let slot = `${i}:00 - ${i + 2}:00`;
        timeSlots.push(slot);
    }
    return timeSlots;
}

function displayTimeSlots(timeSlots) {
    let timeSlotsContainer = document.getElementById('timeSlotsContainer');
    timeSlotsContainer.innerHTML = '';
    timeSlots.forEach(slot => {
        let slotElement = document.createElement('div');
        slotElement.textContent = slot;
        addToListOfSelectedTimeSlot(slot, false);
        slotElement.classList.add('text-center','cursor-pointer','rounded-md','bg-[#FFD3E0]', 'p-2',
            'lg:hover:bg-pink-500', 'lg:hover:text-white', 'lg:hover:shadow-lg');
        slotElement.setAttribute('id', slot);
        slotElement.addEventListener('click',() => {
            if (slotElement.classList.contains('bg-pink-500')) {
                slotElement.classList.remove('bg-pink-500');
                slotElement.classList.remove('text-white');
                slotElement.classList.add('bg-[#FFD3E0]');
                addToListOfSelectedTimeSlot(slot, false);
            } else {
                addToFormData("timeSlot", slot);
                slotElement.classList.add('bg-pink-500');
                slotElement.classList.add('text-white');
                slotElement.classList.remove('bg-[#FFD3E0]');
                addToListOfSelectedTimeSlot(slot, true);
                listOfSelectedTimeSlot.forEach((value, key) => {
                    if (key !== (slot)) {
                        listOfSelectedTimeSlot.set(key, false);
                        document.getElementById(key).classList.remove("bg-pink-500");
                        document.getElementById(key).classList.remove("text-white");
                        document.getElementById(key).classList.add("bg-[#FFD3E0]");
                    } else {
                        listOfSelectedTimeSlot.set(slot, true);
                    }
                });
            }
        })
        timeSlotsContainer.appendChild(slotElement);
    });
}

displayTimeSlots(timeSlots);

function decreaseQuantity(productId) {
    var input = document.getElementById('quantity_' + productId);
    if (input.value > 0) {
        input.value = parseInt(input.value) - 1;
    }
    input.innerText = input.value;
}

function increaseQuantity(productId) {
    var input = document.getElementById('quantity_' + productId);
    input.value = parseInt(input.value) + 1;
    input.innerText = input.value;
}