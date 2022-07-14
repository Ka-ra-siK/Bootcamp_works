const images = document.querySelectorAll('.product__image');
images.forEach(item => {
  item.addEventListener('mouseenter', event => {
    document.querySelectorAll('.product__image--main').forEach(mainPhoto => {
      mainPhoto.setAttribute('src', item.getAttribute('src'));
    })
  });
});
