document.addEventListener("DOMContentLoaded", () => {
    // タグに対応する画像のマッピングを定義
    const imageMap = {
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

    // タグアイテムをすべて取得
    const tagItems = Array.from(document.querySelectorAll(".tag-item"));

    // 各タグアイテムに対して画像を設定
    tagItems.forEach(tagItem => {
        // タグIDからタグ名を取得
        const tagId = tagItem.id;
        const tag = tagId.replace("tag-", "");

        // 対応する画像URLを取得
        const imageUrl = imageMap[tag] || "image/kokura.jpg"; // デフォルト画像を設定

        // 画像要素があれば設定
        const imageElement = tagItem.querySelector("img");
        if (imageElement) {
            imageElement.src = imageUrl;
            imageElement.alt = tag;
        }
    });
});
