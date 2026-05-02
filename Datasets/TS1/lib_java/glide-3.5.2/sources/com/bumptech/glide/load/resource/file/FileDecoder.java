package com.bumptech.glide.load.resource.file;

import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.engine.Resource;
import java.io.File;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/resource/file/FileDecoder.class */
public class FileDecoder implements ResourceDecoder<File, File> {
    @Override // com.bumptech.glide.load.ResourceDecoder
    public Resource<File> decode(File source, int width, int height) {
        return new FileResource(source);
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public String getId() {
        return "";
    }
}
