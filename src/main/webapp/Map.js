
// APIキーの設定
var platform = new H.service.Platform({
    apikey: 'ccQWRj5RH3xHismKP44GCM7TlYv3QkaBnlZvSiXL4ek',
});

// ベクタータイルサービスオブジェクトが日本のデータを提供するコアエンポイントを使用するように設定
var omvService = platform.getOMVService({ path: 'v2/vectortiles/core/mc' });
var baseUrl = "https://js.api.here.com/v3/3.1/styles/omv/oslo/japan/";

// 日本のデータを表示するためのマップスタイルを設定
var style = new H.map.Style(`${baseUrl}normal.day.yaml`, baseUrl);

//  ベースマップ用のプロバイダとレイヤーを設定
var omvProvider = new H.service.omv.Provider(omvService, style);
var omvlayer = new H.map.layer.TileLayer(omvProvider, { max: 22 });

// 地図を表示
var map = new H.Map(document.getElementById('mapContainer'), omvlayer, {
    zoom: 17,
    center: { lat: 33.888950935458965, lng: 130.87929482686297 },
});

// 地図の動作機能（パンやズームなど）の追加
window.addEventListener('resize', () => map.getViewPort().resize());
var behavior = new H.mapevents.Behavior(new H.mapevents.MapEvents(map));

// 住所検索用の関数
function getGeocoder() {
    const val = document.querySelector('#geocoder').value;
    const service = platform.getSearchService();
    
// 検索した住所をURLパラメータとして地図ページに渡す
	window.location.href = `Sample2.html?address=${encodeURIComponent(address)}`;
                
                
    service.geocode(
        {
            q: val,
        },
        (result) => {
            /* 地図から既存のマーカーを削除する
            if (map.getObjects().length > 0) {
                map.getObjects().forEach((i) => {
                    if (i.getRemoteId().includes('marker')) {
                        map.removeObject(i);
                    }
                });
            }
            */
            // 各位置のマーカーを追加する
            result.items.forEach((item, index) => {
                const marker = new H.map.Marker(item.position);
                marker.setRemoteId('marker' + index);

                map.addObject(marker);
            });
        },
        alert
    );
}

// 施設検索用の関数
function landmarkGeocode() {
    var geocoder = platform.getSearchService(),
        landmarkGeocodingParameters = {
            q: document.querySelector('#landmark').value,
            at: [map.getCenter().lat, map.getCenter().lng],
            limit: 5,
        };

    geocoder.discover(landmarkGeocodingParameters, addLocationsToMap, onError);
}

// エラーが発生した場合の処理
function onError(error) {
    alert("Can't reach the remote server");
}

// APIの結果が返される際の関数
function addLocationsToMap(result) {
    const locations = result.items;

    // 地図から既存のマーカーを削除する
    if (map.getObjects().length > 0) {
        map.getObjects().forEach((i) => {
            if (i.getRemoteId().includes('discover')) {
                map.removeObject(i);
            }
        });
    }

    // APIの結果にマーカーを追加する
    for (let i = 0; i < locations.length; i += 1) {
        let location = locations[i];
        marker = new H.map.Marker(location.position);
        marker.setRemoteId('discover' + i.toString());
        map.addObject(marker);
    }
}

// 経路検索用の関数
function getRouting() {
    let origin;
    let destination;

    const onError = (error) => {
        console.log(error.message);
    };

    // 経路検索APIを呼び出し
    const router = platform.getRoutingService(null, 8);

    // APIのリスポンスを処理するためのコールバック関数
    const onResult = function (result) {
        // 経路が検索されていることを確保
        if (result.routes.length) {
            // 既存の経路を削除する
            if (map.getObjects().length > 0) {
                const id_list = ['route', 'start', 'dest'];
                map.getObjects().forEach((i) => {
                    if (id_list.includes(i.getRemoteId())) {
                        map.removeObject(i);
                    }
                });
            }

            result.routes[0].sections.forEach((section) => {
                // 経路をLinestring方式に変換する
                const linestring = H.geo.LineString.fromFlexiblePolyline(
                    section.polyline
                );

                // 経路をPolyline形式に変換
                const routeLine = new H.map.Polyline(linestring, {
                    style: {
                        strokeColor: 'blue',
                        lineWidth: 3,
                    },
                });

                // 出発地のマーカー
                const startMarker = new H.map.Marker(
                    section.departure.place.location
                );

                // 目的地のマーカー
                const endMarker = new H.map.Marker(
                    section.arrival.place.location
                );

                routeLine.setRemoteId('route');
                startMarker.setRemoteId('start');
                endMarker.setRemoteId('dest');

                // マーカーとPolylineを地図上に追加する
                map.addObjects([routeLine, startMarker, endMarker]);
            });
        }
    };

    const routingParameters = {
        transportMode: 'car',
        // 経路がリスポンスから返されるようにする
        return: 'polyline',
    };

    // 経路を計算するコールバック関数
    const calculateRoute = () => {
        // 出発地と到着地点の両方が入力されていることを確保
        if (!origin || !destination) return;

        // 出発地と目的地を検索パラメーターに追加
        routingParameters.origin = origin;
        routingParameters.destination = destination;

        router.calculateRoute(routingParameters, onResult, onError);
    };

    // 住所検索サービスを取得
    const service = platform.getSearchService();

    // 出発地の住所検索
    service.geocode(
        {
            q: document.querySelector('#start').value,
        },
        (result) => {
            origin =
                result.items[0].position.lat +
                ',' +
                result.items[0].position.lng;
            calculateRoute();
        },
        onError
    );

    // 目的地の住所検索
    service.geocode(
        {
            q: document.querySelector('#goal').value,
        },
        (result) => {
            destination =
                result.items[0].position.lat +
                ',' +
                result.items[0].position.lng;
            calculateRoute();
        },
        onError
    );
}