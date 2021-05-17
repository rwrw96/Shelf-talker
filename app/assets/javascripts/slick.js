$(function() {
    $('.slider').slick({
      autoplay: true,
      autoplaySpeed: 1500,
      // speed: 2000,
      swipeToSlide: true,
      // dots: false,
      arrows: false,          
      centerMode: true,
      centerPadding: '60px',
      slidesToShow: 3,
      responsive: [
        {
          breakpoint: 768,
          settings: {
            arrows: false,
            centerMode: true,
            centerPadding: '40px',
            slidesToShow: 3
          }
        },
        {
          breakpoint: 480,
          settings: {
            arrows: false,
            centerMode: true,
            centerPadding: '40px',
            slidesToShow: 1
          }
        }
      ]
    })
});			