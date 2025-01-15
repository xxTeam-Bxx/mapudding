// ハンバーガーメニューの開閉処理
const hamburgerMenu = document.getElementById("hamburger-menu");
const menu = document.getElementById("menu");

hamburgerMenu.addEventListener("click", function() {
    menu.classList.toggle("open");
});


function search() {
    const form = document.getElementById('searchForm');
    const checkboxes = form.querySelectorAll('input[name="item"]:checked');
    const selectedItems = Array.from(checkboxes).map(checkbox => checkbox.value);

    const resultsDiv = document.getElementById('results');
    resultsDiv.innerHTML = '';

    if (selectedItems.length > 0) {
        resultsDiv.innerHTML = `<p>選択された項目: ${selectedItems.join(', ')}</p>`;
    } else {
        resultsDiv.innerHTML = '<p>何も選択されていません。</p>';
    }
}

