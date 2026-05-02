package com.squareup.picasso;

import android.graphics.Bitmap;
import com.squareup.picasso.Picasso;

/* loaded from: picasso-2.4.0.jar:com/squareup/picasso/GetAction.class */
class GetAction extends Action<Void> {
    GetAction(Picasso picasso, Request data, boolean skipCache, String key, Object tag) {
        super(picasso, null, data, skipCache, false, 0, null, key, tag);
    }

    @Override // com.squareup.picasso.Action
    void complete(Bitmap result, Picasso.LoadedFrom from) {
    }

    @Override // com.squareup.picasso.Action
    public void error() {
    }
}
