function post () {
  const price = document.getElementById("item-price");
  price.addEventListener("input", () =>{
    const priceValue = price.value;

    const addTaxPrice = document.getElementById("add-tax-price")
    const tax = (Math.floor(priceValue * 0.1))
    addTaxPrice.innerHTML = tax;

    const profit = document.getElementById("profit");
    profit.innerHTML = (Math.floor(priceValue - tax));

  });
};

window.addEventListener('turbo:load', post);