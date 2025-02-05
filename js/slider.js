// slider.js

let currentIndex = 0; // 現在のスライドのインデックス

// スライドを移動する関数
function moveSlide(direction) {
    const slides = document.querySelectorAll('.carousel-item'); // スライドの要素を取得
    const totalSlides = slides.length; // スライドの総数

    // direction に基づいてスライドを移動
    currentIndex = (currentIndex + direction + totalSlides) % totalSlides;

    // 全てのスライドを非表示にする
    slides.forEach(slide => {
        slide.style.display = 'none';
    });

    // 現在のスライドを表示
    slides[currentIndex].style.display = 'block';
}

// ページが読み込まれた後、最初のスライドを表示
document.addEventListener('DOMContentLoaded', function() {
    moveSlide(0); // 最初のスライドを表示
});
