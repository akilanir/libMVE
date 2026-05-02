package com.bumptech.glide.request.target;

import com.bumptech.glide.util.Util;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/request/target/SimpleTarget.class */
public abstract class SimpleTarget<Z> extends BaseTarget<Z> {
    private final int width;
    private final int height;

    public SimpleTarget() {
        this(Target.SIZE_ORIGINAL, Target.SIZE_ORIGINAL);
    }

    public SimpleTarget(int width, int height) {
        this.width = width;
        this.height = height;
    }

    @Override // com.bumptech.glide.request.target.Target
    public final void getSize(SizeReadyCallback cb) {
        if (!Util.isValidDimensions(this.width, this.height)) {
            throw new IllegalArgumentException("Width and height must both be > 0 or Target#SIZE_ORIGINAL, but given width: " + this.width + " and height: " + this.height + ", either provide dimensions in the constructor or call override()");
        }
        cb.onSizeReady(this.width, this.height);
    }
}
