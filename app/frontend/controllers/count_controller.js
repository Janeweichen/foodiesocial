import { Controller } from 'stimulus'

export default class extends Controller {
 static targets = ['quantity']
 plus(event){
   event.preventDefault();
  //  let count = this.quantityTarget.parseInt;
   let elem = this.quantityTarget;
  //  let count = count+1;
   count++;
   elem.value = count;
   console.log(count);
 };
 minus(event){
  event.preventDefault();
  console.log('jj');
 };
}