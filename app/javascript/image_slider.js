document.addEventListener("DOMContentLoaded", function () {
  const sliderImages = document.querySelectorAll(".slider-image");
  let currentIndex = 0;

  function slideImages() {
    sliderImages[currentIndex].classList.remove("visible");
    currentIndex = (currentIndex + 1) % sliderImages.length;
    sliderImages[currentIndex].classList.add("visible");
  }

  setInterval(slideImages, 5000); // 5秒ごとに画像を切り替える
});