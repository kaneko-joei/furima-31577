window.addEventListener('load', () => {
  // 金額を入力した数値をpriceInputという変数に格納する
const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1 );

    const ProfitDom = document.getElementById("profit");
    ProfitDom.innerHTML = Math.floor(inputValue - inputValue * 0.1 );

 })
  
})
