function handleSubmit(event) {
  const clickedButton = event.submitter; // 押されたボタン要素
  const form = event.target; // フォーム要素

  // ボタンの name 属性に応じて送信先を切り替える
  if (clickedButton.name === 'comment') {
    form.action = 'Board'; // サーブレット1のURL
  } else if (clickedButton.name === 'favorite') {
    form.action = 'FavoriteServlet'; // サーブレット2のURL
  }
}
