package com.danikula.videocache.file;

import android.text.TextUtils;
import com.danikula.videocache.ProxyCacheUtils;

/* loaded from: videocache-2.3.3.jar:com/danikula/videocache/file/Md5FileNameGenerator.class */
public class Md5FileNameGenerator implements FileNameGenerator {
    private static final int MAX_EXTENSION_LENGTH = 4;

    @Override // com.danikula.videocache.file.FileNameGenerator
    public String generate(String url) {
        String extension = getExtension(url);
        String name = ProxyCacheUtils.computeMD5(url);
        return TextUtils.isEmpty(extension) ? name : name + "." + extension;
    }

    private String getExtension(String url) {
        int dotIndex = url.lastIndexOf(46);
        int slashIndex = url.lastIndexOf(47);
        return (dotIndex == -1 || dotIndex <= slashIndex || (dotIndex + 2) + MAX_EXTENSION_LENGTH <= url.length()) ? "" : url.substring(dotIndex + 1, url.length());
    }
}
