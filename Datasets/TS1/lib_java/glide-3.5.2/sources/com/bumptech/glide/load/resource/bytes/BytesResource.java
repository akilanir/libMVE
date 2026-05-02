package com.bumptech.glide.load.resource.bytes;

import com.bumptech.glide.load.engine.Resource;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/resource/bytes/BytesResource.class */
public class BytesResource implements Resource<byte[]> {
    private final byte[] bytes;

    public BytesResource(byte[] bytes) {
        if (bytes == null) {
            throw new NullPointerException("Bytes must not be null");
        }
        this.bytes = bytes;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.bumptech.glide.load.engine.Resource
    public byte[] get() {
        return this.bytes;
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public int getSize() {
        return this.bytes.length;
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public void recycle() {
    }
}
