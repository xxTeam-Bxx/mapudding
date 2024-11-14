const puppeteer = require('puppeteer');

async function scrapeTabelog() {
  // Puppeteer でブラウザを起動
  const browser = await puppeteer.launch({ headless: true });
  const page = await browser.newPage();

  // スクレイピング対象の食べログのURL
  const url = 'https://tabelog.com/fukuoka/A4004/A400401/40035559/?vac_net=1&svd=20241113&svt=1900&svps=2'; // 任意の食べログ店舗ページ

  // ページを開く
  await page.goto(url, { waitUntil: 'domcontentloaded' });

  // 店舗情報を取得
  const restaurant = await page.evaluate(() => {
    const name = document.querySelector('.display-name')?.textContent || 'No name'; // 店舗名
    const rating = document.querySelector('.rdheader-rating__score')?.textContent || 'No rating'; // 評価
    const reviews = document.querySelector('.review__count')?.textContent || 'No reviews'; // レビュー数

    return {
      name: name.trim(),
      rating: rating.trim(),
      reviews: reviews.trim(),
    };
  });

  console.log('Restaurant Info:', restaurant);

  // ブラウザを閉じる
  await browser.close();
}

// 実行
scrapeTabelog().catch(console.error);
