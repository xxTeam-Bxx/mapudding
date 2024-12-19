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

//ドロップダウンメニュー
// script.js

// カスタムドロップダウン内の項目を取得
const dropdownContent = document.querySelector('.dropdown-content');
const dropdownBtn = document.querySelector('.dropdown-btn');
const inputField = document.getElementById('inputField');

// カスタムドロップダウンの項目がクリックされた時
dropdownContent.addEventListener('click', function(event) {
    const selectedOption = event.target.closest('div');
    
    // クリックされた項目が選択肢なら
    if (selectedOption && selectedOption.dataset.value) {
        toggleSelection(selectedOption.dataset.value);
    }
});

// 項目を選択・解除する関数
function toggleSelection(value) {
    const currentInput = inputField.value.split(', ').filter(v => v !== '');
    
    // 入力フィールドに選ばれた項目が含まれていなければ追加、あれば削除
    if (currentInput.includes(value)) {
        inputField.value = currentInput.filter(v => v !== value).join(', ');
    } else {
        inputField.value = [...currentInput, value].join(', ');
    }
    
    // ボタンのラベルを変更
    const newLabel = inputField.value ? inputField.value : '選択してください';
    dropdownBtn.querySelector('span').textContent = newLabel;
}

