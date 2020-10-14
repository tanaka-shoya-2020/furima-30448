if(document.URL.match(/items/) && document.URL.match(/new/) || document.URL.match(/items/)){
function calculate (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    
    const ItemPrice = itemPrice.value;
    const taxPrice = document.getElementById("add-tax-price");
    const profit   = document.getElementById("profit");
    taxPrice.innerHTML = `${Math.floor(ItemPrice * 0.1)}`;
    profit.innerHTML = `${Math.floor(ItemPrice * 0.9)}`;
  });
}

setInterval(calculate, 1000);

}