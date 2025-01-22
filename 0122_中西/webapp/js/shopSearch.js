

// キーワードを格納するための配列（Array）
let keywordList = [];

// タグ名と画像ファイル名の対応
const tagImages = {
    "コーヒー": "image/coffee.png",
    "チーズ": "image/cheese.png",
    "抹茶": "image/macha.png",
    "パフェ": "image/pafe.png",
    "パンケーキ": "image/pancake.png",
    "プリン": "image/pudding.png",
    "スコーン": "image/scorn.png",
    "ワッフル": "image/waff.png",
    // 駅
    "小倉": "image/kokura.png",
    "門司": "image/moji.png",
    "門司港": "image/mojiko.png",
    "下関": "image/shimonoseki.png",
    "戸畑": "image/tobata.png",
    "博多": "image/hakata.png",
    // 時間
    "朝から": "image/morning.png",
    "昼から": "image/noon.png",
    "夕方から": "image/evning.png",
    "夜から": "image/night.png",
    "夕方まで": "image/evening_fin.png",
    "夜まで": "image/night_fin.png",
    "深夜まで": "image/midnight_fin.png"
};

// ページロード時にセッションから選択されたタグを読み込む
window.onload = function() {
    // ここでセッションからタグリストを取得して表示
    let sessionTags = document.getElementById("sessionTags").value;
    if (sessionTags) {
        keywordList = sessionTags.split(' '); // スペース区切りでタグを分割
        updateKeywordField();
        updateTagList();
    }
};

// タグを入力フィールドに追加する関数
function addKeyword(tag) {
    //var currentValue = document.getElementById("keyword").value;

    // すでにタグが入力されているか確認
    if (keywordList.includes(tag)) {
        return; // 重複するタグは追加しない
    }
    
    // タグをリストに追加
    keywordList.push(tag);
    
    // 入力フィールドを更新
    updateKeywordField();

    // タグをリストに表示
    updateTagList();
}

    // 入力フィールドを更新する関数
function updateKeywordField() {
    document.getElementById("keyword").value = keywordList.join(' ');
}
    
    // キーワードに対応する画像パスを配列に追加
    if (tagImages[tag]) {
        keywordList.push(tagImages[tag]);
    }

    // 画像パスを表示
    displayImages();


// タグをリストに追加する関数
function updateTagList() {
    var tagList = document.getElementById("tagList");
    tagList.innerHTML = ''; // リストをリセット
    
    // タグをリストアイテムとして作成
    keywordList.forEach(function(tag) {
       var tagElement = document.createElement("div");
       //tagElement.textContent = tag;  // タグ名をテキストとして表示
        
    // 画像をボタンに追加するため、ボタン内に画像を表示
    var imagePath = tagImages[tag]; // タグに対応する画像パスを取得
    if (imagePath) {
    var imgElement = document.createElement("img");
    imgElement.src = imagePath;  // 画像パスをsrcに設定
    imgElement.alt = tag;  // 画像にalt属性を設定（アクセシビリティ用）
    imgElement.style.height = "30px";  // 画像のサイズを調整
    //imgElement.style.marginLeft = "10px"; // 画像とボタンテキストの間隔
    tagElement.appendChild(imgElement);  // 画像をdivに追加
    }

// クリックでタグを削除
        tagElement.onclick = function() {
            removeTagFromList(tag, tagElement);
        };
    
    // タグリストに追加
        tagList.appendChild(tagElement);
     });
}

// タグをリストから削除する関数
function removeTagFromList(tag, tagElement) {
    // リストからタグを削除
    const index = keywordList.indexOf(tag);
    if (index > -1) {
        keywordList.splice(index, 1); // タグを削除
    }
    
    
     // 入力フィールドを更新
    updateKeywordField();

    // リストアイテムを削除
    tagElement.remove();

    // 画像パスを再表示
    displayImages();
}
