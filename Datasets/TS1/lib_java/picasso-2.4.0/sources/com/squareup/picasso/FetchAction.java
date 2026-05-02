package com.squareup.picasso;

import android.graphics.Bitmap;
import com.squareup.picasso.Picasso;

/* loaded from: picasso-2.4.0.jar:com/squareup/picasso/FetchAction.class */
class FetchAction extends Action<Object> {
    private final Object target;

    FetchAction(Picasso picasso, Request data, boolean skipCache, String key, Object tag) {
        super(picasso, null, data, skipCache, false, 0, null, key, tag);
        this.target = new Object();
    }

    @Override // com.squareup.picasso.Action
    void complete(Bitmap result, Picasso.LoadedFrom from) {
    }

    @Override // com.squareup.picasso.Action
    public void error() {
    }

    @Override // com.squareup.picasso.Action
    Object getTarget() {
        return this.target;
    }
}
