// import Swiper JS
import Swiper, { Navigation } from 'swiper';
// import Swiper styles

const initSwiper = () => {
  const swiper = new Swiper('.swiper', {
    modules: [Navigation],
    direction: 'horizontal',
    allowTouchMove: false,
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  });
}

export { initSwiper };
