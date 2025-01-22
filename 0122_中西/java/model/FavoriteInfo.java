
package model;

public class FavoriteInfo {
    private String storeName;
    private String address;

    // コンストラクタ
    public FavoriteInfo(String storeName, String address) {
        this.storeName = storeName;
        this.address = address;
    }

    // ゲッターとセッター
    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    // toString メソッドをオーバーライド
    @Override
    public String toString() {
        return "店舗名: " + storeName + ", 住所: " + address;
    }
}
