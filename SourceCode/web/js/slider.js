$(document).ready(function () {
    var slides = $('.slide');
    var indicators = $('.slide-indicator li');
    function showSlide(index) {
        slides.removeClass('slide-active');
        slides.eq(index).addClass('slide-active');
        indicators.removeClass('active');
        indicators.eq(index).addClass('active');
    }

    function nextSlide() {
        var currentIndex = slides.filter('.slide-active').index();
        var nextIndex = (currentIndex + 1) % slides.length;
        showSlide(nextIndex);
    }

    setInterval(nextSlide, 3000); // Change the interval (in milliseconds) as needed
});
$(document).ready(function () {
    $('#myCarousel').carousel({
        interval: 3000 // Thời gian chờ giữa các ảnh (3 giây)
    });
});
