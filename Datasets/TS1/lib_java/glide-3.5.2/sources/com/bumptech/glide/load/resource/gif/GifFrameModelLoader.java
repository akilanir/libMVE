package com.bumptech.glide.load.resource.gif;

import com.bumptech.glide.Priority;
import com.bumptech.glide.gifdecoder.GifDecoder;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.model.ModelLoader;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/resource/gif/GifFrameModelLoader.class */
class GifFrameModelLoader implements ModelLoader<GifDecoder, GifDecoder> {
    GifFrameModelLoader() {
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public DataFetcher<GifDecoder> getResourceFetcher(GifDecoder model, int width, int height) {
        return new GifFrameDataFetcher(model);
    }

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/resource/gif/GifFrameModelLoader$GifFrameDataFetcher.class */
    private static class GifFrameDataFetcher implements DataFetcher<GifDecoder> {
        private final GifDecoder decoder;

        public GifFrameDataFetcher(GifDecoder decoder) {
            this.decoder = decoder;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.bumptech.glide.load.data.DataFetcher
        public GifDecoder loadData(Priority priority) {
            return this.decoder;
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public void cleanup() {
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public String getId() {
            return String.valueOf(this.decoder.getCurrentFrameIndex());
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public void cancel() {
        }
    }
}
