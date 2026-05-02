package com.squareup.picasso;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import com.squareup.picasso.Picasso;

/* loaded from: picasso-2.4.0.jar:com/squareup/picasso/TargetAction.class */
final class TargetAction extends Action<Target> {
    TargetAction(Picasso picasso, Target target, Request data, boolean skipCache, int errorResId, Drawable errorDrawable, String key, Object tag) {
        super(picasso, target, data, skipCache, false, errorResId, errorDrawable, key, tag);
    }

    @Override // com.squareup.picasso.Action
    void complete(Bitmap result, Picasso.LoadedFrom from) {
        if (result == null) {
            throw new AssertionError(String.format("Attempted to complete action with no result!\n%s", this));
        }
        Target target = getTarget();
        if (target != null) {
            target.onBitmapLoaded(result, from);
            if (result.isRecycled()) {
                throw new IllegalStateException("Target callback must not recycle bitmap!");
            }
        }
    }

    @Override // com.squareup.picasso.Action
    void error() {
        Target target = getTarget();
        if (target != null) {
            if (this.errorResId != 0) {
                target.onBitmapFailed(this.picasso.context.getResources().getDrawable(this.errorResId));
            } else {
                target.onBitmapFailed(this.errorDrawable);
            }
        }
    }
}
