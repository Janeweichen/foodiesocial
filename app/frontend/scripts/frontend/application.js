import bulmaCarousel from 'bulma-carousel';

document.addEventListener('turbolinks:load', () => {
    let element = document.querySelector('#carousel-photo');
    if (element){
        bulmaCarousel.attach('#carousel-photo', {
            slidesToScroll: 1,
            slidesToShow: 3,
            infinite: true,
            autoplay: true
        });
    }
});
