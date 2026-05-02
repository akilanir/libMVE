package com.bumptech.glide.load.resource.file;

import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.engine.Resource;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/resource/file/FileToStreamDecoder.class */
public class FileToStreamDecoder<T> implements ResourceDecoder<File, T> {
    private static final FileOpener DEFAULT_FILE_OPENER = new FileOpener();
    private ResourceDecoder<InputStream, T> streamDecoder;
    private final FileOpener fileOpener;

    public FileToStreamDecoder(ResourceDecoder<InputStream, T> streamDecoder) {
        this(streamDecoder, DEFAULT_FILE_OPENER);
    }

    FileToStreamDecoder(ResourceDecoder<InputStream, T> streamDecoder, FileOpener fileOpener) {
        this.streamDecoder = streamDecoder;
        this.fileOpener = fileOpener;
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public Resource<T> decode(File source, int width, int height) throws IOException {
        InputStream is = null;
        try {
            is = this.fileOpener.open(source);
            Resource<T> result = this.streamDecoder.decode(is, width, height);
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                }
            }
            return result;
        } catch (Throwable th) {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e2) {
                }
            }
            throw th;
        }
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public String getId() {
        return "";
    }

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/resource/file/FileToStreamDecoder$FileOpener.class */
    static class FileOpener {
        FileOpener() {
        }

        public InputStream open(File file) throws FileNotFoundException {
            return new FileInputStream(file);
        }
    }
}
