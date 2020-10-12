function calculate (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    
    const ItemPrice = itemPrice.value;
    const taxPrice = document.getElementById("add-tax-price");
    const profit   = document.getElementById("profit");
    taxPrice.innerHTML = `${ItemPrice * 0.1}`;
    profit.innerHTML = `${ItemPrice * 0.9}`;
  });
}

setInterval(calculate, 1000);