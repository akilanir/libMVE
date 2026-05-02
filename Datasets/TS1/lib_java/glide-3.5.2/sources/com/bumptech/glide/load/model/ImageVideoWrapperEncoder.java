package com.bumptech.glide.load.model;

import android.os.ParcelFileDescriptor;
import com.bumptech.glide.load.Encoder;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/model/ImageVideoWrapperEncoder.class */
public class ImageVideoWrapperEncoder implements Encoder<ImageVideoWrapper> {
    private final Encoder<InputStream> streamEncoder;
    private final Encoder<ParcelFileDescriptor> fileDescriptorEncoder;
    private String id;

    public ImageVideoWrapperEncoder(Encoder<InputStream> streamEncoder, Encoder<ParcelFileDescriptor> fileDescriptorEncoder) {
        this.streamEncoder = streamEncoder;
        this.fileDescriptorEncoder = fileDescriptorEncoder;
    }

    @Override // com.bumptech.glide.load.Encoder
    public boolean encode(ImageVideoWrapper data, OutputStream os) {
        if (data.getStream() != null) {
            return this.streamEncoder.encode(data.getStream(), os);
        }
        return this.fileDescriptorEncoder.encode(data.getFileDescriptor(), os);
    }

    @Override // com.bumptech.glide.load.Encoder
    public String getId() {
        if (this.id == null) {
            this.id = this.streamEncoder.getId() + this.fileDescriptorEncoder.getId();
        }
        return this.id;
    }
}
