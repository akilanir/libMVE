.class public Lcom/yalantis/ucrop/task/BitmapLoadTask;
.super Landroid/os/AsyncTask;
.source "BitmapLoadTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "BitmapWorkerTask"


# instance fields
.field private final mBitmapLoadCallback:Lcom/yalantis/ucrop/callback/BitmapLoadCallback;

.field private final mContext:Landroid/content/Context;

.field private mInputUri:Landroid/net/Uri;

.field private final mOutputUri:Landroid/net/Uri;

.field private final mRequiredHeight:I

.field private final mRequiredWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;Landroid/net/Uri;IILcom/yalantis/ucrop/callback/BitmapLoadCallback;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "inputUri"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "outputUri"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "requiredWidth"    # I
    .param p5, "requiredHeight"    # I
    .param p6, "loadCallback"    # Lcom/yalantis/ucrop/callback/BitmapLoadCallback;

    .prologue
    .line 62
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 63
    iput-object p1, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mContext:Landroid/content/Context;

    .line 64
    iput-object p2, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mInputUri:Landroid/net/Uri;

    .line 65
    iput-object p3, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mOutputUri:Landroid/net/Uri;

    .line 66
    iput p4, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mRequiredWidth:I

    .line 67
    iput p5, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mRequiredHeight:I

    .line 68
    iput-object p6, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mBitmapLoadCallback:Lcom/yalantis/ucrop/callback/BitmapLoadCallback;

    .line 69
    return-void
.end method

.method private downloadFile(Landroid/net/Uri;Landroid/net/Uri;)V
    .registers 11
    .param p1, "inputUri"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "outputUri"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 151
    new-instance v0, Lokhttp3/OkHttpClient;

    invoke-direct {v0}, Lokhttp3/OkHttpClient;-><init>()V

    .line 153
    .local v0, "client":Lokhttp3/OkHttpClient;
    const/4 v5, 0x0

    .line 154
    .local v5, "source":Lokio/BufferedSource;
    const/4 v4, 0x0

    .line 155
    .local v4, "sink":Lokio/Sink;
    const/4 v3, 0x0

    .line 157
    .local v3, "response":Lokhttp3/Response;
    :try_start_8
    new-instance v6, Lokhttp3/Request$Builder;

    invoke-direct {v6}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v6

    invoke-virtual {v6}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v2

    .line 160
    .local v2, "request":Lokhttp3/Request;
    invoke-virtual {v0, v2}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v6

    invoke-interface {v6}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v3

    .line 161
    invoke-virtual {v3}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v6

    invoke-virtual {v6}, Lokhttp3/ResponseBody;->source()Lokio/BufferedSource;

    move-result-object v5

    .line 163
    iget-object v6, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-virtual {v6, p2}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v1

    .line 164
    .local v1, "outputStream":Ljava/io/OutputStream;
    if-eqz v1, :cond_57

    .line 165
    invoke-static {v1}, Lokio/Okio;->sink(Ljava/io/OutputStream;)Lokio/Sink;

    move-result-object v4

    .line 166
    invoke-interface {v5, v4}, Lokio/BufferedSource;->readAll(Lokio/Sink;)J
    :try_end_3c
    .catchall {:try_start_8 .. :try_end_3c} :catchall_5f

    .line 171
    invoke-static {v5}, Lcom/yalantis/ucrop/util/BitmapLoadUtils;->close(Ljava/io/Closeable;)V

    .line 172
    invoke-static {v4}, Lcom/yalantis/ucrop/util/BitmapLoadUtils;->close(Ljava/io/Closeable;)V

    .line 173
    if-eqz v3, :cond_4b

    .line 174
    invoke-virtual {v3}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v6

    invoke-static {v6}, Lcom/yalantis/ucrop/util/BitmapLoadUtils;->close(Ljava/io/Closeable;)V

    .line 178
    :cond_4b
    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->dispatcher()Lokhttp3/Dispatcher;

    move-result-object v6

    invoke-virtual {v6}, Lokhttp3/Dispatcher;->cancelAll()V

    .line 182
    iget-object v6, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mOutputUri:Landroid/net/Uri;

    iput-object v6, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mInputUri:Landroid/net/Uri;

    .line 183
    return-void

    .line 168
    :cond_57
    :try_start_57
    new-instance v6, Ljava/lang/NullPointerException;

    const-string v7, "OutputStream for given output Uri was null"

    invoke-direct {v6, v7}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_5f
    .catchall {:try_start_57 .. :try_end_5f} :catchall_5f

    .line 171
    .end local v1    # "outputStream":Ljava/io/OutputStream;
    .end local v2    # "request":Lokhttp3/Request;
    :catchall_5f
    move-exception v6

    invoke-static {v5}, Lcom/yalantis/ucrop/util/BitmapLoadUtils;->close(Ljava/io/Closeable;)V

    .line 172
    invoke-static {v4}, Lcom/yalantis/ucrop/util/BitmapLoadUtils;->close(Ljava/io/Closeable;)V

    .line 173
    if-eqz v3, :cond_6f

    .line 174
    invoke-virtual {v3}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v7

    invoke-static {v7}, Lcom/yalantis/ucrop/util/BitmapLoadUtils;->close(Ljava/io/Closeable;)V

    :cond_6f
    throw v6
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;
    .registers 17
    .param p1, "params"    # [Ljava/lang/Void;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 74
    iget-object v11, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mInputUri:Landroid/net/Uri;

    if-eqz v11, :cond_8

    iget-object v11, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mOutputUri:Landroid/net/Uri;

    if-nez v11, :cond_16

    .line 75
    :cond_8
    new-instance v11, Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;

    const/4 v12, 0x0

    new-instance v13, Ljava/lang/NullPointerException;

    const-string v14, "Uri cannot be null"

    invoke-direct {v13, v14}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-direct {v11, v12, v13}, Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;-><init>(Landroid/graphics/Bitmap;Ljava/lang/Exception;)V

    .line 147
    :goto_15
    return-object v11

    .line 78
    :cond_16
    const-string v11, "http"

    iget-object v12, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mInputUri:Landroid/net/Uri;

    invoke-virtual {v12}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_32

    const-string v11, "https"

    iget-object v12, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mInputUri:Landroid/net/Uri;

    invoke-virtual {v12}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_39

    .line 80
    :cond_32
    :try_start_32
    iget-object v11, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mInputUri:Landroid/net/Uri;

    iget-object v12, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mOutputUri:Landroid/net/Uri;

    invoke-direct {p0, v11, v12}, Lcom/yalantis/ucrop/task/BitmapLoadTask;->downloadFile(Landroid/net/Uri;Landroid/net/Uri;)V
    :try_end_39
    .catch Ljava/lang/NullPointerException; {:try_start_32 .. :try_end_39} :catch_71
    .catch Ljava/io/IOException; {:try_start_32 .. :try_end_39} :catch_71

    .line 89
    :cond_39
    :try_start_39
    iget-object v11, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mContext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v11

    iget-object v12, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mInputUri:Landroid/net/Uri;

    const-string v13, "r"

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;
    :try_end_46
    .catch Ljava/io/FileNotFoundException; {:try_start_39 .. :try_end_46} :catch_80

    move-result-object v10

    .line 95
    .local v10, "parcelFileDescriptor":Landroid/os/ParcelFileDescriptor;
    if-eqz v10, :cond_88

    .line 96
    invoke-virtual {v10}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v7

    .line 101
    .local v7, "fileDescriptor":Ljava/io/FileDescriptor;
    new-instance v9, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v9}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 102
    .local v9, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v11, 0x1

    iput-boolean v11, v9, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 103
    const/4 v11, 0x0

    invoke-static {v7, v11, v9}, Landroid/graphics/BitmapFactory;->decodeFileDescriptor(Ljava/io/FileDescriptor;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 104
    iget v11, v9, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    const/4 v12, -0x1

    if-eq v11, v12, :cond_63

    iget v11, v9, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    const/4 v12, -0x1

    if-ne v11, v12, :cond_96

    .line 105
    :cond_63
    new-instance v11, Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;

    const/4 v12, 0x0

    new-instance v13, Ljava/lang/IllegalArgumentException;

    const-string v14, "Bounds for bitmap could not be retrieved from Uri"

    invoke-direct {v13, v14}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-direct {v11, v12, v13}, Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;-><init>(Landroid/graphics/Bitmap;Ljava/lang/Exception;)V

    goto :goto_15

    .line 81
    .end local v7    # "fileDescriptor":Ljava/io/FileDescriptor;
    .end local v9    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v10    # "parcelFileDescriptor":Landroid/os/ParcelFileDescriptor;
    :catch_71
    move-exception v2

    .line 82
    .local v2, "e":Ljava/lang/Exception;
    const-string v11, "BitmapWorkerTask"

    const-string v12, "Downloading failed"

    invoke-static {v11, v12, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 83
    new-instance v11, Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;

    const/4 v12, 0x0

    invoke-direct {v11, v12, v2}, Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;-><init>(Landroid/graphics/Bitmap;Ljava/lang/Exception;)V

    goto :goto_15

    .line 90
    .end local v2    # "e":Ljava/lang/Exception;
    :catch_80
    move-exception v2

    .line 91
    .local v2, "e":Ljava/io/FileNotFoundException;
    new-instance v11, Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;

    const/4 v12, 0x0

    invoke-direct {v11, v12, v2}, Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;-><init>(Landroid/graphics/Bitmap;Ljava/lang/Exception;)V

    goto :goto_15

    .line 98
    .end local v2    # "e":Ljava/io/FileNotFoundException;
    .restart local v10    # "parcelFileDescriptor":Landroid/os/ParcelFileDescriptor;
    :cond_88
    new-instance v11, Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;

    const/4 v12, 0x0

    new-instance v13, Ljava/lang/NullPointerException;

    const-string v14, "ParcelFileDescriptor was null for given Uri"

    invoke-direct {v13, v14}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-direct {v11, v12, v13}, Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;-><init>(Landroid/graphics/Bitmap;Ljava/lang/Exception;)V

    goto :goto_15

    .line 108
    .restart local v7    # "fileDescriptor":Ljava/io/FileDescriptor;
    .restart local v9    # "options":Landroid/graphics/BitmapFactory$Options;
    :cond_96
    iget v11, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mRequiredWidth:I

    iget v12, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mRequiredHeight:I

    invoke-static {v9, v11, v12}, Lcom/yalantis/ucrop/util/BitmapLoadUtils;->calculateInSampleSize(Landroid/graphics/BitmapFactory$Options;II)I

    move-result v11

    iput v11, v9, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 109
    const/4 v11, 0x0

    iput-boolean v11, v9, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 111
    const/4 v1, 0x0

    .line 113
    .local v1, "decodeSampledBitmap":Landroid/graphics/Bitmap;
    const/4 v0, 0x0

    .line 114
    .local v0, "decodeAttemptSuccess":Z
    :goto_a5
    if-nez v0, :cond_bd

    .line 116
    const/4 v11, 0x0

    :try_start_a8
    invoke-static {v7, v11, v9}, Landroid/graphics/BitmapFactory;->decodeFileDescriptor(Ljava/io/FileDescriptor;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_ab
    .catch Ljava/lang/OutOfMemoryError; {:try_start_a8 .. :try_end_ab} :catch_ae

    move-result-object v1

    .line 117
    const/4 v0, 0x1

    goto :goto_a5

    .line 118
    :catch_ae
    move-exception v3

    .line 119
    .local v3, "error":Ljava/lang/OutOfMemoryError;
    const-string v11, "BitmapWorkerTask"

    const-string v12, "doInBackground: BitmapFactory.decodeFileDescriptor: "

    invoke-static {v11, v12, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 120
    iget v11, v9, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    add-int/lit8 v11, v11, 0x1

    iput v11, v9, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    goto :goto_a5

    .line 124
    .end local v3    # "error":Ljava/lang/OutOfMemoryError;
    :cond_bd
    if-nez v1, :cond_ce

    .line 125
    new-instance v11, Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;

    const/4 v12, 0x0

    new-instance v13, Ljava/lang/IllegalArgumentException;

    const-string v14, "Bitmap could not be decoded from Uri"

    invoke-direct {v13, v14}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-direct {v11, v12, v13}, Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;-><init>(Landroid/graphics/Bitmap;Ljava/lang/Exception;)V

    goto/16 :goto_15

    .line 128
    :cond_ce
    sget v11, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v12, 0x10

    if-lt v11, v12, :cond_d7

    .line 129
    invoke-static {v10}, Lcom/yalantis/ucrop/util/BitmapLoadUtils;->close(Ljava/io/Closeable;)V

    .line 132
    :cond_d7
    iget-object v11, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mContext:Landroid/content/Context;

    iget-object v12, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mInputUri:Landroid/net/Uri;

    invoke-static {v11, v12}, Lcom/yalantis/ucrop/util/BitmapLoadUtils;->getExifOrientation(Landroid/content/Context;Landroid/net/Uri;)I

    move-result v5

    .line 133
    .local v5, "exifOrientation":I
    invoke-static {v5}, Lcom/yalantis/ucrop/util/BitmapLoadUtils;->exifToDegrees(I)I

    move-result v4

    .line 134
    .local v4, "exifDegrees":I
    invoke-static {v5}, Lcom/yalantis/ucrop/util/BitmapLoadUtils;->exifToTranslation(I)I

    move-result v6

    .line 136
    .local v6, "exifTranslation":I
    new-instance v8, Landroid/graphics/Matrix;

    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    .line 137
    .local v8, "matrix":Landroid/graphics/Matrix;
    if-eqz v4, :cond_f2

    .line 138
    int-to-float v11, v4

    invoke-virtual {v8, v11}, Landroid/graphics/Matrix;->preRotate(F)Z

    .line 140
    :cond_f2
    const/4 v11, 0x1

    if-eq v6, v11, :cond_fb

    .line 141
    int-to-float v11, v6

    const/high16 v12, 0x3f800000    # 1.0f

    invoke-virtual {v8, v11, v12}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 143
    :cond_fb
    invoke-virtual {v8}, Landroid/graphics/Matrix;->isIdentity()Z

    move-result v11

    if-nez v11, :cond_10d

    .line 144
    new-instance v11, Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;

    invoke-static {v1, v8}, Lcom/yalantis/ucrop/util/BitmapLoadUtils;->transformBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;)Landroid/graphics/Bitmap;

    move-result-object v12

    const/4 v13, 0x0

    invoke-direct {v11, v12, v13}, Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;-><init>(Landroid/graphics/Bitmap;Ljava/lang/Exception;)V

    goto/16 :goto_15

    .line 147
    :cond_10d
    new-instance v11, Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;

    const/4 v12, 0x0

    invoke-direct {v11, v1, v12}, Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;-><init>(Landroid/graphics/Bitmap;Ljava/lang/Exception;)V

    goto/16 :goto_15
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 35
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/yalantis/ucrop/task/BitmapLoadTask;->doInBackground([Ljava/lang/Void;)Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;)V
    .registers 4
    .param p1, "result"    # Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 187
    iget-object v0, p1, Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;->mBitmapWorkerException:Ljava/lang/Exception;

    if-nez v0, :cond_c

    .line 188
    iget-object v0, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mBitmapLoadCallback:Lcom/yalantis/ucrop/callback/BitmapLoadCallback;

    iget-object v1, p1, Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;->mBitmapResult:Landroid/graphics/Bitmap;

    invoke-interface {v0, v1}, Lcom/yalantis/ucrop/callback/BitmapLoadCallback;->onBitmapLoaded(Landroid/graphics/Bitmap;)V

    .line 192
    :goto_b
    return-void

    .line 190
    :cond_c
    iget-object v0, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask;->mBitmapLoadCallback:Lcom/yalantis/ucrop/callback/BitmapLoadCallback;

    iget-object v1, p1, Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;->mBitmapWorkerException:Ljava/lang/Exception;

    invoke-interface {v0, v1}, Lcom/yalantis/ucrop/callback/BitmapLoadCallback;->onFailure(Ljava/lang/Exception;)V

    goto :goto_b
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 35
    check-cast p1, Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/yalantis/ucrop/task/BitmapLoadTask;->onPostExecute(Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;)V

    return-void
.end method
