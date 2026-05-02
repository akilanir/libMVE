package com.squareup.picasso;

import android.graphics.Bitmap;

/* loaded from: picasso-2.5.2.jar:com/squareup/picasso/Cache.class */
public interface Cache {
    public static final Cache NONE = new Cache() { // from class: com.squareup.picasso.Cache.1
        @Override // com.squareup.picasso.Cache
        public Bitmap get(String key) {
            return null;
        }

        @Override // com.squareup.picasso.Cache
        public void set(String key, Bitmap bitmap) {
        }

        @Override // com.squareup.picasso.Cache
        public int size() {
            return 0;
        }

        @Override // com.squareup.picasso.Cache
        public int maxSize() {
            return 0;
        }

        @Override // com.squareup.picasso.Cache
        public void clear() {
        }

        @Override // com.squareup.picasso.Cache
        public void clearKeyUri(String keyPrefix) {
        }
    };

    Bitmap get(String str);

    void set(String str, Bitmap bitmap);

    int size();

    int maxSize();

    void clear();

    void clearKeyUri(String str);
}
