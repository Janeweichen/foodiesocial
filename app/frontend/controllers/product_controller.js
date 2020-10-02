import { Controller } from 'stimulus'
import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = ['quantity', 'sku', 'addToCartButton']
  
  add_to_cart(evt){
    evt.preventDefault();
    let product_id = this.data.get("id");
    let sku = this.skuTarget.value;
    let quantity = this.quantityTarget.value;
    
    if (quantity > 0) {
      this.addToCartButtonTarget.classList.add('is-loading');
      let data = new FormData();
      data.append("id", product_id) ;
      data.append("sku", sku) ;
      data.append("quantity", quantity) ;

      Rails.ajax({
        url: "/api/v1/cart",
        data,
        type: "POST",
        success: resp => {
          if (resp.status === 'ok')  {
            let item_count = resp.items || 0;
            let evt = new CustomEvent('addToCart', { 'detail': { item_count } }) ;
            document.dispatchEvent(evt); 
          }
        },
        error: err => {
          console.log(err);
        },

        complete: () => {
          this.addToCartButtonTarget.classList.remove('is-loading');
        }

      });
    }
  }

  plus(event){
    event.preventDefault();
    let q = Number(this.quantityTarget.value);
    this.quantityTarget.value = q + 1 ;
  };
  minus(event){
  event.preventDefault();
  let q = Number(this.quantityTarget.value);
  if (q > 1) {
    this.quantityTarget.value = q - 1 ;
  }
  };
}