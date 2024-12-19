// キーワードを格納するための配列（Array）
let keywordList = [];

// タグを入力フィールドに追加する関数
function addKeyword(tag) {
    var currentValue = document.getElementById("keyword").value;

    // すでにタグが入力されているか確認
    if (currentValue.includes(tag)) {
        return; // 重複するタグは追加しない
    }
    
    // すでにタグが入力されている場合、空白で区切って追加する
    if (currentValue) {
        currentValue += " " + tag;
    } else {
        // 初めてタグが追加される場合はそのまま設定
        currentValue = tag;
    }

    // 入力フィールドにタグをセット
    document.getElementById("keyword").value = currentValue;

    // タグをリストに追加
    addTagToList(tag);
}

// タグをリストに追加する関数
function addTagToList(tag) {
    var tagList = document.getElementById("tagList");
    
    // タグをリストアイテムとして作成
    var button = document.createElement("button");
    button.textContent = tag;
    button.onclick = function() {
        removeTagFromList(tag, button);
    };
    
    // リストに追加
    tagList.appendChild(button);
}

// タグをリストから削除する関数
function removeTagFromList(tag, liElement) {
    var currentValue = document.getElementById("keyword").value;
    currentValue = currentValue.replace(tag, "").replace("  ", " "); // 不要なスペースを削除
    document.getElementById("keyword").value = currentValue.trim(); // 前後のスペースを削除

    // リストアイテムを削除
    liElement.remove();
}
