package com.bumptech.glide.load.model;

import android.os.ParcelFileDescriptor;
import java.io.InputStream;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/model/ImageVideoWrapper.class */
public class ImageVideoWrapper {
    private final InputStream streamData;
    private final ParcelFileDescriptor fileDescriptor;

    public ImageVideoWrapper(InputStream streamData, ParcelFileDescriptor fileDescriptor) {
        this.streamData = streamData;
        this.fileDescriptor = fileDescriptor;
    }

    public InputStream getStream() {
        return this.streamData;
    }

    public ParcelFileDescriptor getFileDescriptor() {
        return this.fileDescriptor;
    }
}
