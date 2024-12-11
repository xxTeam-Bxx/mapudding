// フォーム送信時の処理を追加
document.getElementById('search-form').addEventListener('submit', function(event) {
    // フォームのデフォルト送信をキャンセル（ページ遷移を防ぐ）
    event.preventDefault();
    
    // 選択されたタグを取得（multiple属性のため、複数選択可）
    const selectedTags = Array.from(document.getElementById('tags').selectedOptions)
                                .map(option => option.value); // 各選択肢のvalueを取得
    
    // サーバーに検索リクエストを送信
    fetch('/search', {
        method: 'POST',  // POSTメソッドを使用
        headers: {
            'Content-Type': 'application/json'  // JSON形式で送信
        },
        body: JSON.stringify({ tags: selectedTags })  // 選択したタグをJSON形式にして送信
    })
    .then(response => response.json())  // レスポンスをJSON形式で受け取る
    .then(data => {
        // 結果を表示するためのdivを取得←これはよく分からない
        //const resultsDiv = document.getElementById('results');
        
        // 検索結果をクリア
        resultsDiv.innerHTML = '';  
        
        // 検索結果があれば、それをリスト形式で表示
        data.results.forEach(shop => {
            // 各店舗の情報を表示する要素を作成
            const shopElement = document.createElement('div');
            
            // 店名、住所、ジャンルを表示
            shopElement.textContent = `${shop.name} - ${shop.address} (${shop.genre})`;
            
            // 結果表示エリアに追加
            resultsDiv.appendChild(shopElement);
        });
    })
    .catch(error => {
        // エラーハンドリング
        console.error('Error fetching data:', error);
    });
});
