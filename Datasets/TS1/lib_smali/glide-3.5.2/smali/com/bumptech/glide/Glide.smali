.class public Lcom/bumptech/glide/Glide;
.super Ljava/lang/Object;
.source "Glide.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/Glide$ClearTarget;
    }
.end annotation


# static fields
.field private static final DEFAULT_DISK_CACHE_DIR:Ljava/lang/String; = "image_manager_disk_cache"

.field static final DEFAULT_DISK_CACHE_SIZE:I = 0xfa00000

.field private static final TAG:Ljava/lang/String; = "Glide"

.field private static volatile glide:Lcom/bumptech/glide/Glide;


# instance fields
.field private final bitmapCenterCrop:Lcom/bumptech/glide/load/resource/bitmap/CenterCrop;

.field private final bitmapFitCenter:Lcom/bumptech/glide/load/resource/bitmap/FitCenter;

.field private final bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

.field private final bitmapPreFiller:Lcom/bumptech/glide/load/engine/prefill/BitmapPreFiller;

.field private final dataLoadProviderRegistry:Lcom/bumptech/glide/provider/DataLoadProviderRegistry;

.field private final decodeFormat:Lcom/bumptech/glide/load/DecodeFormat;

.field private final drawableCenterCrop:Lcom/bumptech/glide/load/resource/gifbitmap/GifBitmapWrapperTransformation;

.field private final drawableFitCenter:Lcom/bumptech/glide/load/resource/gifbitmap/GifBitmapWrapperTransformation;

.field private final engine:Lcom/bumptech/glide/load/engine/Engine;

.field private final imageViewTargetFactory:Lcom/bumptech/glide/request/target/ImageViewTargetFactory;

.field private final loaderFactory:Lcom/bumptech/glide/load/model/GenericLoaderFactory;

.field private final mainHandler:Landroid/os/Handler;

.field private final memoryCache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

.field private final transcoderRegistry:Lcom/bumptech/glide/load/resource/transcode/TranscoderRegistry;


# direct methods
.method constructor <init>(Lcom/bumptech/glide/load/engine/Engine;Lcom/bumptech/glide/load/engine/cache/MemoryCache;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Landroid/content/Context;Lcom/bumptech/glide/load/DecodeFormat;)V
    .registers 16
    .param p1, "engine"    # Lcom/bumptech/glide/load/engine/Engine;
    .param p2, "memoryCache"    # Lcom/bumptech/glide/load/engine/cache/MemoryCache;
    .param p3, "bitmapPool"    # Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;
    .param p4, "context"    # Landroid/content/Context;
    .param p5, "decodeFormat"    # Lcom/bumptech/glide/load/DecodeFormat;

    .prologue
    .line 205
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    new-instance v4, Lcom/bumptech/glide/request/target/ImageViewTargetFactory;

    invoke-direct {v4}, Lcom/bumptech/glide/request/target/ImageViewTargetFactory;-><init>()V

    iput-object v4, p0, Lcom/bumptech/glide/Glide;->imageViewTargetFactory:Lcom/bumptech/glide/request/target/ImageViewTargetFactory;

    .line 95
    new-instance v4, Lcom/bumptech/glide/load/resource/transcode/TranscoderRegistry;

    invoke-direct {v4}, Lcom/bumptech/glide/load/resource/transcode/TranscoderRegistry;-><init>()V

    iput-object v4, p0, Lcom/bumptech/glide/Glide;->transcoderRegistry:Lcom/bumptech/glide/load/resource/transcode/TranscoderRegistry;

    .line 206
    iput-object p1, p0, Lcom/bumptech/glide/Glide;->engine:Lcom/bumptech/glide/load/engine/Engine;

    .line 207
    iput-object p3, p0, Lcom/bumptech/glide/Glide;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    .line 208
    iput-object p2, p0, Lcom/bumptech/glide/Glide;->memoryCache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

    .line 209
    iput-object p5, p0, Lcom/bumptech/glide/Glide;->decodeFormat:Lcom/bumptech/glide/load/DecodeFormat;

    .line 210
    new-instance v4, Lcom/bumptech/glide/load/model/GenericLoaderFactory;

    invoke-direct {v4, p4}, Lcom/bumptech/glide/load/model/GenericLoaderFactory;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/bumptech/glide/Glide;->loaderFactory:Lcom/bumptech/glide/load/model/GenericLoaderFactory;

    .line 211
    new-instance v4, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v4, p0, Lcom/bumptech/glide/Glide;->mainHandler:Landroid/os/Handler;

    .line 212
    new-instance v4, Lcom/bumptech/glide/load/engine/prefill/BitmapPreFiller;

    invoke-direct {v4, p2, p3, p5}, Lcom/bumptech/glide/load/engine/prefill/BitmapPreFiller;-><init>(Lcom/bumptech/glide/load/engine/cache/MemoryCache;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/DecodeFormat;)V

    iput-object v4, p0, Lcom/bumptech/glide/Glide;->bitmapPreFiller:Lcom/bumptech/glide/load/engine/prefill/BitmapPreFiller;

    .line 214
    new-instance v4, Lcom/bumptech/glide/provider/DataLoadProviderRegistry;

    invoke-direct {v4}, Lcom/bumptech/glide/provider/DataLoadProviderRegistry;-><init>()V

    iput-object v4, p0, Lcom/bumptech/glide/Glide;->dataLoadProviderRegistry:Lcom/bumptech/glide/provider/DataLoadProviderRegistry;

    .line 216
    new-instance v3, Lcom/bumptech/glide/load/resource/bitmap/StreamBitmapDataLoadProvider;

    invoke-direct {v3, p3, p5}, Lcom/bumptech/glide/load/resource/bitmap/StreamBitmapDataLoadProvider;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/DecodeFormat;)V

    .line 218
    .local v3, "streamBitmapLoadProvider":Lcom/bumptech/glide/load/resource/bitmap/StreamBitmapDataLoadProvider;
    iget-object v4, p0, Lcom/bumptech/glide/Glide;->dataLoadProviderRegistry:Lcom/bumptech/glide/provider/DataLoadProviderRegistry;

    const-class v5, Ljava/io/InputStream;

    const-class v6, Landroid/graphics/Bitmap;

    invoke-virtual {v4, v5, v6, v3}, Lcom/bumptech/glide/provider/DataLoadProviderRegistry;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/provider/DataLoadProvider;)V

    .line 220
    new-instance v0, Lcom/bumptech/glide/load/resource/bitmap/FileDescriptorBitmapDataLoadProvider;

    invoke-direct {v0, p3, p5}, Lcom/bumptech/glide/load/resource/bitmap/FileDescriptorBitmapDataLoadProvider;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/DecodeFormat;)V

    .line 222
    .local v0, "fileDescriptorLoadProvider":Lcom/bumptech/glide/load/resource/bitmap/FileDescriptorBitmapDataLoadProvider;
    iget-object v4, p0, Lcom/bumptech/glide/Glide;->dataLoadProviderRegistry:Lcom/bumptech/glide/provider/DataLoadProviderRegistry;

    const-class v5, Landroid/os/ParcelFileDescriptor;

    const-class v6, Landroid/graphics/Bitmap;

    invoke-virtual {v4, v5, v6, v0}, Lcom/bumptech/glide/provider/DataLoadProviderRegistry;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/provider/DataLoadProvider;)V

    .line 224
    new-instance v2, Lcom/bumptech/glide/load/resource/bitmap/ImageVideoDataLoadProvider;

    invoke-direct {v2, v3, v0}, Lcom/bumptech/glide/load/resource/bitmap/ImageVideoDataLoadProvider;-><init>(Lcom/bumptech/glide/provider/DataLoadProvider;Lcom/bumptech/glide/provider/DataLoadProvider;)V

    .line 226
    .local v2, "imageVideoDataLoadProvider":Lcom/bumptech/glide/load/resource/bitmap/ImageVideoDataLoadProvider;
    iget-object v4, p0, Lcom/bumptech/glide/Glide;->dataLoadProviderRegistry:Lcom/bumptech/glide/provider/DataLoadProviderRegistry;

    const-class v5, Lcom/bumptech/glide/load/model/ImageVideoWrapper;

    const-class v6, Landroid/graphics/Bitmap;

    invoke-virtual {v4, v5, v6, v2}, Lcom/bumptech/glide/provider/DataLoadProviderRegistry;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/provider/DataLoadProvider;)V

    .line 228
    new-instance v1, Lcom/bumptech/glide/load/resource/gif/GifDrawableLoadProvider;

    invoke-direct {v1, p4, p3}, Lcom/bumptech/glide/load/resource/gif/GifDrawableLoadProvider;-><init>(Landroid/content/Context;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)V

    .line 230
    .local v1, "gifDrawableLoadProvider":Lcom/bumptech/glide/load/resource/gif/GifDrawableLoadProvider;
    iget-object v4, p0, Lcom/bumptech/glide/Glide;->dataLoadProviderRegistry:Lcom/bumptech/glide/provider/DataLoadProviderRegistry;

    const-class v5, Ljava/io/InputStream;

    const-class v6, Lcom/bumptech/glide/load/resource/gif/GifDrawable;

    invoke-virtual {v4, v5, v6, v1}, Lcom/bumptech/glide/provider/DataLoadProviderRegistry;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/provider/DataLoadProvider;)V

    .line 232
    iget-object v4, p0, Lcom/bumptech/glide/Glide;->dataLoadProviderRegistry:Lcom/bumptech/glide/provider/DataLoadProviderRegistry;

    const-class v5, Lcom/bumptech/glide/load/model/ImageVideoWrapper;

    const-class v6, Lcom/bumptech/glide/load/resource/gifbitmap/GifBitmapWrapper;

    new-instance v7, Lcom/bumptech/glide/load/resource/gifbitmap/ImageVideoGifDrawableLoadProvider;

    invoke-direct {v7, v2, v1, p3}, Lcom/bumptech/glide/load/resource/gifbitmap/ImageVideoGifDrawableLoadProvider;-><init>(Lcom/bumptech/glide/provider/DataLoadProvider;Lcom/bumptech/glide/provider/DataLoadProvider;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)V

    invoke-virtual {v4, v5, v6, v7}, Lcom/bumptech/glide/provider/DataLoadProviderRegistry;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/provider/DataLoadProvider;)V

    .line 235
    iget-object v4, p0, Lcom/bumptech/glide/Glide;->dataLoadProviderRegistry:Lcom/bumptech/glide/provider/DataLoadProviderRegistry;

    const-class v5, Ljava/io/InputStream;

    const-class v6, Ljava/io/File;

    new-instance v7, Lcom/bumptech/glide/load/resource/file/StreamFileDataLoadProvider;

    invoke-direct {v7}, Lcom/bumptech/glide/load/resource/file/StreamFileDataLoadProvider;-><init>()V

    invoke-virtual {v4, v5, v6, v7}, Lcom/bumptech/glide/provider/DataLoadProviderRegistry;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/provider/DataLoadProvider;)V

    .line 237
    const-class v4, Ljava/io/File;

    const-class v5, Landroid/os/ParcelFileDescriptor;

    new-instance v6, Lcom/bumptech/glide/load/model/file_descriptor/FileDescriptorFileLoader$Factory;

    invoke-direct {v6}, Lcom/bumptech/glide/load/model/file_descriptor/FileDescriptorFileLoader$Factory;-><init>()V

    invoke-virtual {p0, v4, v5, v6}, Lcom/bumptech/glide/Glide;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)V

    .line 238
    const-class v4, Ljava/io/File;

    const-class v5, Ljava/io/InputStream;

    new-instance v6, Lcom/bumptech/glide/load/model/stream/StreamFileLoader$Factory;

    invoke-direct {v6}, Lcom/bumptech/glide/load/model/stream/StreamFileLoader$Factory;-><init>()V

    invoke-virtual {p0, v4, v5, v6}, Lcom/bumptech/glide/Glide;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)V

    .line 239
    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const-class v5, Landroid/os/ParcelFileDescriptor;

    new-instance v6, Lcom/bumptech/glide/load/model/file_descriptor/FileDescriptorResourceLoader$Factory;

    invoke-direct {v6}, Lcom/bumptech/glide/load/model/file_descriptor/FileDescriptorResourceLoader$Factory;-><init>()V

    invoke-virtual {p0, v4, v5, v6}, Lcom/bumptech/glide/Glide;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)V

    .line 240
    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const-class v5, Ljava/io/InputStream;

    new-instance v6, Lcom/bumptech/glide/load/model/stream/StreamResourceLoader$Factory;

    invoke-direct {v6}, Lcom/bumptech/glide/load/model/stream/StreamResourceLoader$Factory;-><init>()V

    invoke-virtual {p0, v4, v5, v6}, Lcom/bumptech/glide/Glide;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)V

    .line 241
    const-class v4, Ljava/lang/Integer;

    const-class v5, Landroid/os/ParcelFileDescriptor;

    new-instance v6, Lcom/bumptech/glide/load/model/file_descriptor/FileDescriptorResourceLoader$Factory;

    invoke-direct {v6}, Lcom/bumptech/glide/load/model/file_descriptor/FileDescriptorResourceLoader$Factory;-><init>()V

    invoke-virtual {p0, v4, v5, v6}, Lcom/bumptech/glide/Glide;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)V

    .line 242
    const-class v4, Ljava/lang/Integer;

    const-class v5, Ljava/io/InputStream;

    new-instance v6, Lcom/bumptech/glide/load/model/stream/StreamResourceLoader$Factory;

    invoke-direct {v6}, Lcom/bumptech/glide/load/model/stream/StreamResourceLoader$Factory;-><init>()V

    invoke-virtual {p0, v4, v5, v6}, Lcom/bumptech/glide/Glide;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)V

    .line 243
    const-class v4, Ljava/lang/String;

    const-class v5, Landroid/os/ParcelFileDescriptor;

    new-instance v6, Lcom/bumptech/glide/load/model/file_descriptor/FileDescriptorStringLoader$Factory;

    invoke-direct {v6}, Lcom/bumptech/glide/load/model/file_descriptor/FileDescriptorStringLoader$Factory;-><init>()V

    invoke-virtual {p0, v4, v5, v6}, Lcom/bumptech/glide/Glide;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)V

    .line 244
    const-class v4, Ljava/lang/String;

    const-class v5, Ljava/io/InputStream;

    new-instance v6, Lcom/bumptech/glide/load/model/stream/StreamStringLoader$Factory;

    invoke-direct {v6}, Lcom/bumptech/glide/load/model/stream/StreamStringLoader$Factory;-><init>()V

    invoke-virtual {p0, v4, v5, v6}, Lcom/bumptech/glide/Glide;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)V

    .line 245
    const-class v4, Landroid/net/Uri;

    const-class v5, Landroid/os/ParcelFileDescriptor;

    new-instance v6, Lcom/bumptech/glide/load/model/file_descriptor/FileDescriptorUriLoader$Factory;

    invoke-direct {v6}, Lcom/bumptech/glide/load/model/file_descriptor/FileDescriptorUriLoader$Factory;-><init>()V

    invoke-virtual {p0, v4, v5, v6}, Lcom/bumptech/glide/Glide;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)V

    .line 246
    const-class v4, Landroid/net/Uri;

    const-class v5, Ljava/io/InputStream;

    new-instance v6, Lcom/bumptech/glide/load/model/stream/StreamUriLoader$Factory;

    invoke-direct {v6}, Lcom/bumptech/glide/load/model/stream/StreamUriLoader$Factory;-><init>()V

    invoke-virtual {p0, v4, v5, v6}, Lcom/bumptech/glide/Glide;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)V

    .line 247
    const-class v4, Ljava/net/URL;

    const-class v5, Ljava/io/InputStream;

    new-instance v6, Lcom/bumptech/glide/load/model/stream/StreamUrlLoader$Factory;

    invoke-direct {v6}, Lcom/bumptech/glide/load/model/stream/StreamUrlLoader$Factory;-><init>()V

    invoke-virtual {p0, v4, v5, v6}, Lcom/bumptech/glide/Glide;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)V

    .line 248
    const-class v4, Lcom/bumptech/glide/load/model/GlideUrl;

    const-class v5, Ljava/io/InputStream;

    new-instance v6, Lcom/bumptech/glide/load/model/stream/HttpUrlGlideUrlLoader$Factory;

    invoke-direct {v6}, Lcom/bumptech/glide/load/model/stream/HttpUrlGlideUrlLoader$Factory;-><init>()V

    invoke-virtual {p0, v4, v5, v6}, Lcom/bumptech/glide/Glide;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)V

    .line 249
    const-class v4, [B

    const-class v5, Ljava/io/InputStream;

    new-instance v6, Lcom/bumptech/glide/load/model/stream/StreamByteArrayLoader$Factory;

    invoke-direct {v6}, Lcom/bumptech/glide/load/model/stream/StreamByteArrayLoader$Factory;-><init>()V

    invoke-virtual {p0, v4, v5, v6}, Lcom/bumptech/glide/Glide;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)V

    .line 251
    iget-object v4, p0, Lcom/bumptech/glide/Glide;->transcoderRegistry:Lcom/bumptech/glide/load/resource/transcode/TranscoderRegistry;

    const-class v5, Landroid/graphics/Bitmap;

    const-class v6, Lcom/bumptech/glide/load/resource/bitmap/GlideBitmapDrawable;

    new-instance v7, Lcom/bumptech/glide/load/resource/transcode/GlideBitmapDrawableTranscoder;

    invoke-virtual {p4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-direct {v7, v8, p3}, Lcom/bumptech/glide/load/resource/transcode/GlideBitmapDrawableTranscoder;-><init>(Landroid/content/res/Resources;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)V

    invoke-virtual {v4, v5, v6, v7}, Lcom/bumptech/glide/load/resource/transcode/TranscoderRegistry;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;)V

    .line 253
    iget-object v4, p0, Lcom/bumptech/glide/Glide;->transcoderRegistry:Lcom/bumptech/glide/load/resource/transcode/TranscoderRegistry;

    const-class v5, Lcom/bumptech/glide/load/resource/gifbitmap/GifBitmapWrapper;

    const-class v6, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    new-instance v7, Lcom/bumptech/glide/load/resource/transcode/GifBitmapWrapperDrawableTranscoder;

    new-instance v8, Lcom/bumptech/glide/load/resource/transcode/GlideBitmapDrawableTranscoder;

    invoke-virtual {p4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-direct {v8, v9, p3}, Lcom/bumptech/glide/load/resource/transcode/GlideBitmapDrawableTranscoder;-><init>(Landroid/content/res/Resources;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)V

    invoke-direct {v7, v8}, Lcom/bumptech/glide/load/resource/transcode/GifBitmapWrapperDrawableTranscoder;-><init>(Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;)V

    invoke-virtual {v4, v5, v6, v7}, Lcom/bumptech/glide/load/resource/transcode/TranscoderRegistry;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;)V

    .line 257
    new-instance v4, Lcom/bumptech/glide/load/resource/bitmap/CenterCrop;

    invoke-direct {v4, p3}, Lcom/bumptech/glide/load/resource/bitmap/CenterCrop;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)V

    iput-object v4, p0, Lcom/bumptech/glide/Glide;->bitmapCenterCrop:Lcom/bumptech/glide/load/resource/bitmap/CenterCrop;

    .line 258
    new-instance v4, Lcom/bumptech/glide/load/resource/gifbitmap/GifBitmapWrapperTransformation;

    iget-object v5, p0, Lcom/bumptech/glide/Glide;->bitmapCenterCrop:Lcom/bumptech/glide/load/resource/bitmap/CenterCrop;

    invoke-direct {v4, p3, v5}, Lcom/bumptech/glide/load/resource/gifbitmap/GifBitmapWrapperTransformation;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/Transformation;)V

    iput-object v4, p0, Lcom/bumptech/glide/Glide;->drawableCenterCrop:Lcom/bumptech/glide/load/resource/gifbitmap/GifBitmapWrapperTransformation;

    .line 260
    new-instance v4, Lcom/bumptech/glide/load/resource/bitmap/FitCenter;

    invoke-direct {v4, p3}, Lcom/bumptech/glide/load/resource/bitmap/FitCenter;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)V

    iput-object v4, p0, Lcom/bumptech/glide/Glide;->bitmapFitCenter:Lcom/bumptech/glide/load/resource/bitmap/FitCenter;

    .line 261
    new-instance v4, Lcom/bumptech/glide/load/resource/gifbitmap/GifBitmapWrapperTransformation;

    iget-object v5, p0, Lcom/bumptech/glide/Glide;->bitmapFitCenter:Lcom/bumptech/glide/load/resource/bitmap/FitCenter;

    invoke-direct {v4, p3, v5}, Lcom/bumptech/glide/load/resource/gifbitmap/GifBitmapWrapperTransformation;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/Transformation;)V

    iput-object v4, p0, Lcom/bumptech/glide/Glide;->drawableFitCenter:Lcom/bumptech/glide/load/resource/gifbitmap/GifBitmapWrapperTransformation;

    .line 262
    return-void
.end method

.method public static buildFileDescriptorModelLoader(Ljava/lang/Class;Landroid/content/Context;)Lcom/bumptech/glide/load/model/ModelLoader;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Landroid/content/Context;",
            ")",
            "Lcom/bumptech/glide/load/model/ModelLoader",
            "<TT;",
            "Landroid/os/ParcelFileDescriptor;",
            ">;"
        }
    .end annotation

    .prologue
    .line 568
    .local p0, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-class v0, Landroid/os/ParcelFileDescriptor;

    invoke-static {p0, v0, p1}, Lcom/bumptech/glide/Glide;->buildModelLoader(Ljava/lang/Class;Ljava/lang/Class;Landroid/content/Context;)Lcom/bumptech/glide/load/model/ModelLoader;

    move-result-object v0

    return-object v0
.end method

.method public static buildFileDescriptorModelLoader(Ljava/lang/Object;Landroid/content/Context;)Lcom/bumptech/glide/load/model/ModelLoader;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Landroid/content/Context;",
            ")",
            "Lcom/bumptech/glide/load/model/ModelLoader",
            "<TT;",
            "Landroid/os/ParcelFileDescriptor;",
            ">;"
        }
    .end annotation

    .prologue
    .line 578
    .local p0, "model":Ljava/lang/Object;, "TT;"
    const-class v0, Landroid/os/ParcelFileDescriptor;

    invoke-static {p0, v0, p1}, Lcom/bumptech/glide/Glide;->buildModelLoader(Ljava/lang/Object;Ljava/lang/Class;Landroid/content/Context;)Lcom/bumptech/glide/load/model/ModelLoader;

    move-result-object v0

    return-object v0
.end method

.method public static buildModelLoader(Ljava/lang/Class;Ljava/lang/Class;Landroid/content/Context;)Lcom/bumptech/glide/load/model/ModelLoader;
    .registers 5
    .param p2, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "Y:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/Class",
            "<TY;>;",
            "Landroid/content/Context;",
            ")",
            "Lcom/bumptech/glide/load/model/ModelLoader",
            "<TT;TY;>;"
        }
    .end annotation

    .prologue
    .line 513
    .local p0, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p1, "resourceClass":Ljava/lang/Class;, "Ljava/lang/Class<TY;>;"
    if-nez p0, :cond_14

    .line 514
    const-string v0, "Glide"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 515
    const-string v0, "Glide"

    const-string v1, "Unable to load null model, setting placeholder only"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 517
    :cond_12
    const/4 v0, 0x0

    .line 519
    :goto_13
    return-object v0

    :cond_14
    invoke-static {p2}, Lcom/bumptech/glide/Glide;->get(Landroid/content/Context;)Lcom/bumptech/glide/Glide;

    move-result-object v0

    invoke-direct {v0}, Lcom/bumptech/glide/Glide;->getLoaderFactory()Lcom/bumptech/glide/load/model/GenericLoaderFactory;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/bumptech/glide/load/model/GenericLoaderFactory;->buildModelLoader(Ljava/lang/Class;Ljava/lang/Class;)Lcom/bumptech/glide/load/model/ModelLoader;

    move-result-object v0

    goto :goto_13
.end method

.method public static buildModelLoader(Ljava/lang/Object;Ljava/lang/Class;Landroid/content/Context;)Lcom/bumptech/glide/load/model/ModelLoader;
    .registers 4
    .param p2, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "Y:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/lang/Class",
            "<TY;>;",
            "Landroid/content/Context;",
            ")",
            "Lcom/bumptech/glide/load/model/ModelLoader",
            "<TT;TY;>;"
        }
    .end annotation

    .prologue
    .line 537
    .local p0, "model":Ljava/lang/Object;, "TT;"
    .local p1, "resourceClass":Ljava/lang/Class;, "Ljava/lang/Class<TY;>;"
    if-eqz p0, :cond_b

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    :goto_6
    invoke-static {v0, p1, p2}, Lcom/bumptech/glide/Glide;->buildModelLoader(Ljava/lang/Class;Ljava/lang/Class;Landroid/content/Context;)Lcom/bumptech/glide/load/model/ModelLoader;

    move-result-object v0

    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public static buildStreamModelLoader(Ljava/lang/Class;Landroid/content/Context;)Lcom/bumptech/glide/load/model/ModelLoader;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Landroid/content/Context;",
            ")",
            "Lcom/bumptech/glide/load/model/ModelLoader",
            "<TT;",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation

    .prologue
    .line 547
    .local p0, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-class v0, Ljava/io/InputStream;

    invoke-static {p0, v0, p1}, Lcom/bumptech/glide/Glide;->buildModelLoader(Ljava/lang/Class;Ljava/lang/Class;Landroid/content/Context;)Lcom/bumptech/glide/load/model/ModelLoader;

    move-result-object v0

    return-object v0
.end method

.method public static buildStreamModelLoader(Ljava/lang/Object;Landroid/content/Context;)Lcom/bumptech/glide/load/model/ModelLoader;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Landroid/content/Context;",
            ")",
            "Lcom/bumptech/glide/load/model/ModelLoader",
            "<TT;",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation

    .prologue
    .line 557
    .local p0, "model":Ljava/lang/Object;, "TT;"
    const-class v0, Ljava/io/InputStream;

    invoke-static {p0, v0, p1}, Lcom/bumptech/glide/Glide;->buildModelLoader(Ljava/lang/Object;Ljava/lang/Class;Landroid/content/Context;)Lcom/bumptech/glide/load/model/ModelLoader;

    move-result-object v0

    return-object v0
.end method

.method public static clear(Landroid/view/View;)V
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 439
    new-instance v0, Lcom/bumptech/glide/Glide$ClearTarget;

    invoke-direct {v0, p0}, Lcom/bumptech/glide/Glide$ClearTarget;-><init>(Landroid/view/View;)V

    .line 440
    .local v0, "viewTarget":Lcom/bumptech/glide/request/target/Target;, "Lcom/bumptech/glide/request/target/Target<*>;"
    invoke-static {v0}, Lcom/bumptech/glide/Glide;->clear(Lcom/bumptech/glide/request/target/Target;)V

    .line 441
    return-void
.end method

.method public static clear(Lcom/bumptech/glide/request/FutureTarget;)V
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/FutureTarget",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 422
    .local p0, "target":Lcom/bumptech/glide/request/FutureTarget;, "Lcom/bumptech/glide/request/FutureTarget<*>;"
    invoke-interface {p0}, Lcom/bumptech/glide/request/FutureTarget;->clear()V

    .line 423
    return-void
.end method

.method public static clear(Lcom/bumptech/glide/request/target/Target;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/target/Target",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 408
    .local p0, "target":Lcom/bumptech/glide/request/target/Target;, "Lcom/bumptech/glide/request/target/Target<*>;"
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    .line 409
    invoke-interface {p0}, Lcom/bumptech/glide/request/target/Target;->getRequest()Lcom/bumptech/glide/request/Request;

    move-result-object v0

    .line 410
    .local v0, "request":Lcom/bumptech/glide/request/Request;
    if-eqz v0, :cond_c

    .line 411
    invoke-interface {v0}, Lcom/bumptech/glide/request/Request;->clear()V

    .line 413
    :cond_c
    return-void
.end method

.method public static get(Landroid/content/Context;)Lcom/bumptech/glide/Glide;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 147
    sget-object v5, Lcom/bumptech/glide/Glide;->glide:Lcom/bumptech/glide/Glide;

    if-nez v5, :cond_51

    .line 148
    const-class v6, Lcom/bumptech/glide/Glide;

    monitor-enter v6

    .line 149
    :try_start_7
    sget-object v5, Lcom/bumptech/glide/Glide;->glide:Lcom/bumptech/glide/Glide;

    if-nez v5, :cond_50

    .line 150
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 151
    .local v0, "applicationContext":Landroid/content/Context;
    new-instance v5, Lcom/bumptech/glide/module/ManifestParser;

    invoke-direct {v5, v0}, Lcom/bumptech/glide/module/ManifestParser;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5}, Lcom/bumptech/glide/module/ManifestParser;->parse()Ljava/util/List;

    move-result-object v4

    .line 153
    .local v4, "modules":Ljava/util/List;, "Ljava/util/List<Lcom/bumptech/glide/module/GlideModule;>;"
    new-instance v1, Lcom/bumptech/glide/GlideBuilder;

    invoke-direct {v1, v0}, Lcom/bumptech/glide/GlideBuilder;-><init>(Landroid/content/Context;)V

    .line 154
    .local v1, "builder":Lcom/bumptech/glide/GlideBuilder;
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_21
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_34

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bumptech/glide/module/GlideModule;

    .line 155
    .local v3, "module":Lcom/bumptech/glide/module/GlideModule;
    invoke-interface {v3, v0, v1}, Lcom/bumptech/glide/module/GlideModule;->applyOptions(Landroid/content/Context;Lcom/bumptech/glide/GlideBuilder;)V

    goto :goto_21

    .line 162
    .end local v0    # "applicationContext":Landroid/content/Context;
    .end local v1    # "builder":Lcom/bumptech/glide/GlideBuilder;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "module":Lcom/bumptech/glide/module/GlideModule;
    .end local v4    # "modules":Ljava/util/List;, "Ljava/util/List<Lcom/bumptech/glide/module/GlideModule;>;"
    :catchall_31
    move-exception v5

    monitor-exit v6
    :try_end_33
    .catchall {:try_start_7 .. :try_end_33} :catchall_31

    throw v5

    .line 157
    .restart local v0    # "applicationContext":Landroid/content/Context;
    .restart local v1    # "builder":Lcom/bumptech/glide/GlideBuilder;
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v4    # "modules":Ljava/util/List;, "Ljava/util/List<Lcom/bumptech/glide/module/GlideModule;>;"
    :cond_34
    :try_start_34
    invoke-virtual {v1}, Lcom/bumptech/glide/GlideBuilder;->createGlide()Lcom/bumptech/glide/Glide;

    move-result-object v5

    sput-object v5, Lcom/bumptech/glide/Glide;->glide:Lcom/bumptech/glide/Glide;

    .line 158
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_50

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bumptech/glide/module/GlideModule;

    .line 159
    .restart local v3    # "module":Lcom/bumptech/glide/module/GlideModule;
    sget-object v5, Lcom/bumptech/glide/Glide;->glide:Lcom/bumptech/glide/Glide;

    invoke-interface {v3, v0, v5}, Lcom/bumptech/glide/module/GlideModule;->registerComponents(Landroid/content/Context;Lcom/bumptech/glide/Glide;)V

    goto :goto_3e

    .line 162
    .end local v0    # "applicationContext":Landroid/content/Context;
    .end local v1    # "builder":Lcom/bumptech/glide/GlideBuilder;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "module":Lcom/bumptech/glide/module/GlideModule;
    .end local v4    # "modules":Ljava/util/List;, "Ljava/util/List<Lcom/bumptech/glide/module/GlideModule;>;"
    :cond_50
    monitor-exit v6
    :try_end_51
    .catchall {:try_start_34 .. :try_end_51} :catchall_31

    .line 165
    :cond_51
    sget-object v5, Lcom/bumptech/glide/Glide;->glide:Lcom/bumptech/glide/Glide;

    return-object v5
.end method

.method private getLoaderFactory()Lcom/bumptech/glide/load/model/GenericLoaderFactory;
    .registers 2

    .prologue
    .line 331
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->loaderFactory:Lcom/bumptech/glide/load/model/GenericLoaderFactory;

    return-object v0
.end method

.method public static getPhotoCacheDir(Landroid/content/Context;)Ljava/io/File;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 113
    const-string v0, "image_manager_disk_cache"

    invoke-static {p0, v0}, Lcom/bumptech/glide/Glide;->getPhotoCacheDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static getPhotoCacheDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "cacheName"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 126
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    .line 127
    .local v0, "cacheDir":Ljava/io/File;
    if-eqz v0, :cond_20

    .line 128
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 129
    .local v1, "result":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v3

    if-nez v3, :cond_1f

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_1e

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_1f

    :cond_1e
    move-object v1, v2

    .line 138
    .end local v1    # "result":Ljava/io/File;
    :cond_1f
    :goto_1f
    return-object v1

    .line 135
    :cond_20
    const-string v3, "Glide"

    const/4 v4, 0x6

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_30

    .line 136
    const-string v3, "Glide"

    const-string v4, "default disk cache dir is null"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_30
    move-object v1, v2

    .line 138
    goto :goto_1f
.end method

.method public static isSetup()Z
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 178
    sget-object v0, Lcom/bumptech/glide/Glide;->glide:Lcom/bumptech/glide/Glide;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static setup(Lcom/bumptech/glide/GlideBuilder;)V
    .registers 3
    .param p0, "builder"    # Lcom/bumptech/glide/GlideBuilder;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 193
    invoke-static {}, Lcom/bumptech/glide/Glide;->isSetup()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 194
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Glide is already setup, check with isSetup() first"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 197
    :cond_e
    invoke-virtual {p0}, Lcom/bumptech/glide/GlideBuilder;->createGlide()Lcom/bumptech/glide/Glide;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/Glide;->glide:Lcom/bumptech/glide/Glide;

    .line 198
    return-void
.end method

.method static tearDown()V
    .registers 1

    .prologue
    .line 202
    const/4 v0, 0x0

    sput-object v0, Lcom/bumptech/glide/Glide;->glide:Lcom/bumptech/glide/Glide;

    .line 203
    return-void
.end method

.method public static with(Landroid/app/Activity;)Lcom/bumptech/glide/RequestManager;
    .registers 3
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 620
    invoke-static {}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->get()Lcom/bumptech/glide/manager/RequestManagerRetriever;

    move-result-object v0

    .line 621
    .local v0, "retriever":Lcom/bumptech/glide/manager/RequestManagerRetriever;
    invoke-virtual {v0, p0}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->get(Landroid/app/Activity;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    return-object v1
.end method

.method public static with(Landroid/app/Fragment;)Lcom/bumptech/glide/RequestManager;
    .registers 3
    .param p0, "fragment"    # Landroid/app/Fragment;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 645
    invoke-static {}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->get()Lcom/bumptech/glide/manager/RequestManagerRetriever;

    move-result-object v0

    .line 646
    .local v0, "retriever":Lcom/bumptech/glide/manager/RequestManagerRetriever;
    invoke-virtual {v0, p0}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->get(Landroid/app/Fragment;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    return-object v1
.end method

.method public static with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 608
    invoke-static {}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->get()Lcom/bumptech/glide/manager/RequestManagerRetriever;

    move-result-object v0

    .line 609
    .local v0, "retriever":Lcom/bumptech/glide/manager/RequestManagerRetriever;
    invoke-virtual {v0, p0}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->get(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    return-object v1
.end method

.method public static with(Landroid/support/v4/app/Fragment;)Lcom/bumptech/glide/RequestManager;
    .registers 3
    .param p0, "fragment"    # Landroid/support/v4/app/Fragment;

    .prologue
    .line 657
    invoke-static {}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->get()Lcom/bumptech/glide/manager/RequestManagerRetriever;

    move-result-object v0

    .line 658
    .local v0, "retriever":Lcom/bumptech/glide/manager/RequestManagerRetriever;
    invoke-virtual {v0, p0}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->get(Landroid/support/v4/app/Fragment;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    return-object v1
.end method

.method public static with(Landroid/support/v4/app/FragmentActivity;)Lcom/bumptech/glide/RequestManager;
    .registers 3
    .param p0, "activity"    # Landroid/support/v4/app/FragmentActivity;

    .prologue
    .line 632
    invoke-static {}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->get()Lcom/bumptech/glide/manager/RequestManagerRetriever;

    move-result-object v0

    .line 633
    .local v0, "retriever":Lcom/bumptech/glide/manager/RequestManagerRetriever;
    invoke-virtual {v0, p0}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->get(Landroid/support/v4/app/FragmentActivity;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method buildDataProvider(Ljava/lang/Class;Ljava/lang/Class;)Lcom/bumptech/glide/provider/DataLoadProvider;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "Z:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/Class",
            "<TZ;>;)",
            "Lcom/bumptech/glide/provider/DataLoadProvider",
            "<TT;TZ;>;"
        }
    .end annotation

    .prologue
    .line 295
    .local p1, "dataClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "decodedClass":Ljava/lang/Class;, "Ljava/lang/Class<TZ;>;"
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->dataLoadProviderRegistry:Lcom/bumptech/glide/provider/DataLoadProviderRegistry;

    invoke-virtual {v0, p1, p2}, Lcom/bumptech/glide/provider/DataLoadProviderRegistry;->get(Ljava/lang/Class;Ljava/lang/Class;)Lcom/bumptech/glide/provider/DataLoadProvider;

    move-result-object v0

    return-object v0
.end method

.method buildImageViewTarget(Landroid/widget/ImageView;Ljava/lang/Class;)Lcom/bumptech/glide/request/target/Target;
    .registers 4
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/widget/ImageView;",
            "Ljava/lang/Class",
            "<TR;>;)",
            "Lcom/bumptech/glide/request/target/Target",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 299
    .local p2, "transcodedClass":Ljava/lang/Class;, "Ljava/lang/Class<TR;>;"
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->imageViewTargetFactory:Lcom/bumptech/glide/request/target/ImageViewTargetFactory;

    invoke-virtual {v0, p1, p2}, Lcom/bumptech/glide/request/target/ImageViewTargetFactory;->buildTarget(Landroid/widget/ImageView;Ljava/lang/Class;)Lcom/bumptech/glide/request/target/Target;

    move-result-object v0

    return-object v0
.end method

.method buildTranscoder(Ljava/lang/Class;Ljava/lang/Class;)Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Z:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TZ;>;",
            "Ljava/lang/Class",
            "<TR;>;)",
            "Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder",
            "<TZ;TR;>;"
        }
    .end annotation

    .prologue
    .line 291
    .local p1, "decodedClass":Ljava/lang/Class;, "Ljava/lang/Class<TZ;>;"
    .local p2, "transcodedClass":Ljava/lang/Class;, "Ljava/lang/Class<TR;>;"
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->transcoderRegistry:Lcom/bumptech/glide/load/resource/transcode/TranscoderRegistry;

    invoke-virtual {v0, p1, p2}, Lcom/bumptech/glide/load/resource/transcode/TranscoderRegistry;->get(Ljava/lang/Class;Ljava/lang/Class;)Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;

    move-result-object v0

    return-object v0
.end method

.method public clearMemory()V
    .registers 2

    .prologue
    .line 371
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;->clearMemory()V

    .line 372
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->memoryCache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/cache/MemoryCache;->clearMemory()V

    .line 373
    return-void
.end method

.method getBitmapCenterCrop()Lcom/bumptech/glide/load/resource/bitmap/CenterCrop;
    .registers 2

    .prologue
    .line 307
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->bitmapCenterCrop:Lcom/bumptech/glide/load/resource/bitmap/CenterCrop;

    return-object v0
.end method

.method getBitmapFitCenter()Lcom/bumptech/glide/load/resource/bitmap/FitCenter;
    .registers 2

    .prologue
    .line 311
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->bitmapFitCenter:Lcom/bumptech/glide/load/resource/bitmap/FitCenter;

    return-object v0
.end method

.method public getBitmapPool()Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;
    .registers 2

    .prologue
    .line 287
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    return-object v0
.end method

.method getDecodeFormat()Lcom/bumptech/glide/load/DecodeFormat;
    .registers 2

    .prologue
    .line 327
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->decodeFormat:Lcom/bumptech/glide/load/DecodeFormat;

    return-object v0
.end method

.method getDrawableCenterCrop()Lcom/bumptech/glide/load/resource/gifbitmap/GifBitmapWrapperTransformation;
    .registers 2

    .prologue
    .line 315
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->drawableCenterCrop:Lcom/bumptech/glide/load/resource/gifbitmap/GifBitmapWrapperTransformation;

    return-object v0
.end method

.method getDrawableFitCenter()Lcom/bumptech/glide/load/resource/gifbitmap/GifBitmapWrapperTransformation;
    .registers 2

    .prologue
    .line 319
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->drawableFitCenter:Lcom/bumptech/glide/load/resource/gifbitmap/GifBitmapWrapperTransformation;

    return-object v0
.end method

.method getEngine()Lcom/bumptech/glide/load/engine/Engine;
    .registers 2

    .prologue
    .line 303
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->engine:Lcom/bumptech/glide/load/engine/Engine;

    return-object v0
.end method

.method getMainHandler()Landroid/os/Handler;
    .registers 2

    .prologue
    .line 323
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->mainHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public varargs preFillBitmapPool([Lcom/bumptech/glide/load/engine/prefill/PreFillType$Builder;)V
    .registers 3
    .param p1, "bitmapAttributeBuilders"    # [Lcom/bumptech/glide/load/engine/prefill/PreFillType$Builder;

    .prologue
    .line 361
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->bitmapPreFiller:Lcom/bumptech/glide/load/engine/prefill/BitmapPreFiller;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/engine/prefill/BitmapPreFiller;->preFill([Lcom/bumptech/glide/load/engine/prefill/PreFillType$Builder;)V

    .line 362
    return-void
.end method

.method public register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "Y:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/Class",
            "<TY;>;",
            "Lcom/bumptech/glide/load/model/ModelLoaderFactory",
            "<TT;TY;>;)V"
        }
    .end annotation

    .prologue
    .line 472
    .local p1, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "resourceClass":Ljava/lang/Class;, "Ljava/lang/Class<TY;>;"
    .local p3, "factory":Lcom/bumptech/glide/load/model/ModelLoaderFactory;, "Lcom/bumptech/glide/load/model/ModelLoaderFactory<TT;TY;>;"
    iget-object v1, p0, Lcom/bumptech/glide/Glide;->loaderFactory:Lcom/bumptech/glide/load/model/GenericLoaderFactory;

    invoke-virtual {v1, p1, p2, p3}, Lcom/bumptech/glide/load/model/GenericLoaderFactory;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoaderFactory;

    move-result-object v0

    .line 473
    .local v0, "removed":Lcom/bumptech/glide/load/model/ModelLoaderFactory;, "Lcom/bumptech/glide/load/model/ModelLoaderFactory<TT;TY;>;"
    if-eqz v0, :cond_b

    .line 474
    invoke-interface {v0}, Lcom/bumptech/glide/load/model/ModelLoaderFactory;->teardown()V

    .line 476
    :cond_b
    return-void
.end method

.method public setMemoryCategory(Lcom/bumptech/glide/MemoryCategory;)V
    .registers 4
    .param p1, "memoryCategory"    # Lcom/bumptech/glide/MemoryCategory;

    .prologue
    .line 397
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->memoryCache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

    invoke-virtual {p1}, Lcom/bumptech/glide/MemoryCategory;->getMultiplier()F

    move-result v1

    invoke-interface {v0, v1}, Lcom/bumptech/glide/load/engine/cache/MemoryCache;->setSizeMultiplier(F)V

    .line 398
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    invoke-virtual {p1}, Lcom/bumptech/glide/MemoryCategory;->getMultiplier()F

    move-result v1

    invoke-interface {v0, v1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;->setSizeMultiplier(F)V

    .line 399
    return-void
.end method

.method public trimMemory(I)V
    .registers 3
    .param p1, "level"    # I

    .prologue
    .line 381
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    invoke-interface {v0, p1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;->trimMemory(I)V

    .line 382
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->memoryCache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

    invoke-interface {v0, p1}, Lcom/bumptech/glide/load/engine/cache/MemoryCache;->trimMemory(I)V

    .line 383
    return-void
.end method

.method public unregister(Ljava/lang/Class;Ljava/lang/Class;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "Y:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/Class",
            "<TY;>;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 491
    .local p1, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "resourceClass":Ljava/lang/Class;, "Ljava/lang/Class<TY;>;"
    iget-object v1, p0, Lcom/bumptech/glide/Glide;->loaderFactory:Lcom/bumptech/glide/load/model/GenericLoaderFactory;

    invoke-virtual {v1, p1, p2}, Lcom/bumptech/glide/load/model/GenericLoaderFactory;->unregister(Ljava/lang/Class;Ljava/lang/Class;)Lcom/bumptech/glide/load/model/ModelLoaderFactory;

    move-result-object v0

    .line 492
    .local v0, "removed":Lcom/bumptech/glide/load/model/ModelLoaderFactory;, "Lcom/bumptech/glide/load/model/ModelLoaderFactory<TT;TY;>;"
    if-eqz v0, :cond_b

    .line 493
    invoke-interface {v0}, Lcom/bumptech/glide/load/model/ModelLoaderFactory;->teardown()V

    .line 495
    :cond_b
    return-void
.end method
