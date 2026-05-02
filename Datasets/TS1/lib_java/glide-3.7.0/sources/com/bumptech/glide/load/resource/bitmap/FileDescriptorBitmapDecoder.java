package com.bumptech.glide.load.resource.bitmap;

import android.content.Context;
import android.graphics.Bitmap;
import android.os.ParcelFileDescriptor;
import com.bumptech.glide.Glide;
import com.bumptech.glide.load.DecodeFormat;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import java.io.IOException;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/resource/bitmap/FileDescriptorBitmapDecoder.class */
public class FileDescriptorBitmapDecoder implements ResourceDecoder<ParcelFileDescriptor, Bitmap> {
    private final VideoBitmapDecoder bitmapDecoder;
    private final BitmapPool bitmapPool;
    private DecodeFormat decodeFormat;

    public FileDescriptorBitmapDecoder(Context context) {
        this(Glide.get(context).getBitmapPool(), DecodeFormat.DEFAULT);
    }

    public FileDescriptorBitmapDecoder(Context context, DecodeFormat decodeFormat) {
        this(Glide.get(context).getBitmapPool(), decodeFormat);
    }

    public FileDescriptorBitmapDecoder(BitmapPool bitmapPool, DecodeFormat decodeFormat) {
        this(new VideoBitmapDecoder(), bitmapPool, decodeFormat);
    }

    public FileDescriptorBitmapDecoder(VideoBitmapDecoder bitmapDecoder, BitmapPool bitmapPool, DecodeFormat decodeFormat) {
        this.bitmapDecoder = bitmapDecoder;
        this.bitmapPool = bitmapPool;
        this.decodeFormat = decodeFormat;
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public Resource<Bitmap> decode(ParcelFileDescriptor source, int width, int height) throws IOException {
        Bitmap bitmap = this.bitmapDecoder.decode(source, this.bitmapPool, width, height, this.decodeFormat);
        return BitmapResource.obtain(bitmap, this.bitmapPool);
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public String getId() {
        return "FileDescriptorBitmapDecoder.com.bumptech.glide.load.data.bitmap";
    }
}
