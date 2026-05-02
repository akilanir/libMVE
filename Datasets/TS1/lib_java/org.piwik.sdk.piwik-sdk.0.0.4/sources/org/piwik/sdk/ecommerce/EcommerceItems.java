package org.piwik.sdk.ecommerce;

import android.support.annotation.Nullable;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONArray;
import org.piwik.sdk.BuildConfig;
import org.piwik.sdk.tools.CurrencyFormatter;

/* loaded from: org.piwik.sdk.piwik-sdk.0.0.4.jar:org/piwik/sdk/ecommerce/EcommerceItems.class */
public class EcommerceItems {
    public Map<String, JSONArray> items = new HashMap();

    public void addItem(String sku, @Nullable String name, @Nullable String category, @Nullable Integer price, @Nullable Integer quantity) {
        if (name == null) {
            name = BuildConfig.FLAVOR;
        }
        if (category == null) {
            category = BuildConfig.FLAVOR;
        }
        if (price == null) {
            price = 0;
        }
        if (quantity == null) {
            quantity = 1;
        }
        JSONArray item = new JSONArray();
        item.put(sku);
        item.put(name);
        item.put(category);
        item.put(CurrencyFormatter.priceString(price.intValue()));
        item.put(quantity.toString());
        this.items.put(sku, item);
    }

    public void removeItem(String sku) {
        this.items.remove(sku);
    }

    public void removeAll() {
        this.items.clear();
    }

    public String toJson() {
        JSONArray jsonItems = new JSONArray();
        for (JSONArray item : this.items.values()) {
            jsonItems.put(item);
        }
        return jsonItems.toString();
    }
}
