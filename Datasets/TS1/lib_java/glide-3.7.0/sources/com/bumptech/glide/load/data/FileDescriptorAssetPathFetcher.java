package com.bumptech.glide.load.data;

import android.content.res.AssetManager;
import android.os.ParcelFileDescriptor;
import java.io.IOException;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/data/FileDescriptorAssetPathFetcher.class */
public class FileDescriptorAssetPathFetcher extends AssetPathFetcher<ParcelFileDescriptor> {
    public FileDescriptorAssetPathFetcher(AssetManager assetManager, String assetPath) {
        super(assetManager, assetPath);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.bumptech.glide.load.data.AssetPathFetcher
    public ParcelFileDescriptor loadResource(AssetManager assetManager, String path) throws IOException {
        return assetManager.openFd(path).getParcelFileDescriptor();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.bumptech.glide.load.data.AssetPathFetcher
    public void close(ParcelFileDescriptor data) throws IOException {
        data.close();
    }
}
