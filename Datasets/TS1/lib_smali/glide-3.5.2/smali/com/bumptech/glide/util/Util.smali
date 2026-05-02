.class public final Lcom/bumptech/glide/util/Util;
.super Ljava/lang/Object;
.source "Util.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/util/Util$1;
    }
.end annotation


# static fields
.field private static final HEX_CHAR_ARRAY:[C

.field private static final SHA_1_CHARS:[C

.field private static final SHA_256_CHARS:[C


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 17
    const-string v0, "0123456789abcdef"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/util/Util;->HEX_CHAR_ARRAY:[C

    .line 19
    const/16 v0, 0x40

    new-array v0, v0, [C

    sput-object v0, Lcom/bumptech/glide/util/Util;->SHA_256_CHARS:[C

    .line 21
    const/16 v0, 0x28

    new-array v0, v0, [C

    sput-object v0, Lcom/bumptech/glide/util/Util;->SHA_1_CHARS:[C

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    return-void
.end method

.method public static assertBackgroundThread()V
    .registers 2

    .prologue
    .line 136
    invoke-static {}, Lcom/bumptech/glide/util/Util;->isOnBackgroundThread()Z

    move-result v0

    if-nez v0, :cond_e

    .line 137
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "YOu must call this method on a background thread"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 139
    :cond_e
    return-void
.end method

.method public static assertMainThread()V
    .registers 2

    .prologue
    .line 127
    invoke-static {}, Lcom/bumptech/glide/util/Util;->isOnMainThread()Z

    move-result v0

    if-nez v0, :cond_e

    .line 128
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "You must call this method on the main thread"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 130
    :cond_e
    return-void
.end method

.method private static bytesToHex([B[C)Ljava/lang/String;
    .registers 7
    .param p0, "bytes"    # [B
    .param p1, "hexChars"    # [C

    .prologue
    .line 45
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_21

    .line 46
    aget-byte v2, p0, v0

    and-int/lit16 v1, v2, 0xff

    .line 47
    .local v1, "v":I
    mul-int/lit8 v2, v0, 0x2

    sget-object v3, Lcom/bumptech/glide/util/Util;->HEX_CHAR_ARRAY:[C

    ushr-int/lit8 v4, v1, 0x4

    aget-char v3, v3, v4

    aput-char v3, p1, v2

    .line 48
    mul-int/lit8 v2, v0, 0x2

    add-int/lit8 v2, v2, 0x1

    sget-object v3, Lcom/bumptech/glide/util/Util;->HEX_CHAR_ARRAY:[C

    and-int/lit8 v4, v1, 0xf

    aget-char v3, v3, v4

    aput-char v3, p1, v2

    .line 45
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 50
    .end local v1    # "v":I
    :cond_21
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, p1}, Ljava/lang/String;-><init>([C)V

    return-object v2
.end method

.method public static createQueue(I)Ljava/util/Queue;
    .registers 2
    .param p0, "size"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I)",
            "Ljava/util/Queue",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 159
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0, p0}, Ljava/util/ArrayDeque;-><init>(I)V

    return-object v0
.end method

.method public static getBitmapByteSize(IILandroid/graphics/Bitmap$Config;)I
    .registers 5
    .param p0, "width"    # I
    .param p1, "height"    # I
    .param p2, "config"    # Landroid/graphics/Bitmap$Config;

    .prologue
    .line 87
    mul-int v0, p0, p1

    invoke-static {p2}, Lcom/bumptech/glide/util/Util;->getBytesPerPixel(Landroid/graphics/Bitmap$Config;)I

    move-result v1

    mul-int/2addr v0, v1

    return v0
.end method

.method public static getBitmapByteSize(Landroid/graphics/Bitmap;)I
    .registers 3
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .prologue
    .line 71
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_c

    .line 74
    :try_start_6
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getAllocationByteCount()I
    :try_end_9
    .catch Ljava/lang/NullPointerException; {:try_start_6 .. :try_end_9} :catch_b

    move-result v0

    .line 79
    :goto_a
    return v0

    .line 75
    :catch_b
    move-exception v0

    .line 79
    :cond_c
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getRowBytes()I

    move-result v1

    mul-int/2addr v0, v1

    goto :goto_a
.end method

.method private static getBytesPerPixel(Landroid/graphics/Bitmap$Config;)I
    .registers 4
    .param p0, "config"    # Landroid/graphics/Bitmap$Config;

    .prologue
    .line 92
    if-nez p0, :cond_4

    .line 93
    sget-object p0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 97
    :cond_4
    sget-object v1, Lcom/bumptech/glide/util/Util$1;->$SwitchMap$android$graphics$Bitmap$Config:[I

    invoke-virtual {p0}, Landroid/graphics/Bitmap$Config;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_16

    .line 107
    const/4 v0, 0x4

    .line 109
    .local v0, "bytesPerPixel":I
    :goto_10
    return v0

    .line 99
    .end local v0    # "bytesPerPixel":I
    :pswitch_11
    const/4 v0, 0x1

    .line 100
    .restart local v0    # "bytesPerPixel":I
    goto :goto_10

    .line 103
    .end local v0    # "bytesPerPixel":I
    :pswitch_13
    const/4 v0, 0x2

    .line 104
    .restart local v0    # "bytesPerPixel":I
    goto :goto_10

    .line 97
    nop

    :pswitch_data_16
    .packed-switch 0x1
        :pswitch_11
        :pswitch_13
        :pswitch_13
    .end packed-switch
.end method

.method public static getSize(Landroid/graphics/Bitmap;)I
    .registers 2
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 63
    invoke-static {p0}, Lcom/bumptech/glide/util/Util;->getBitmapByteSize(Landroid/graphics/Bitmap;)I

    move-result v0

    return v0
.end method

.method public static isOnBackgroundThread()Z
    .registers 1

    .prologue
    .line 152
    invoke-static {}, Lcom/bumptech/glide/util/Util;->isOnMainThread()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static isOnMainThread()Z
    .registers 2

    .prologue
    .line 145
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private static isValidDimension(I)Z
    .registers 2
    .param p0, "dimen"    # I

    .prologue
    .line 120
    if-gtz p0, :cond_6

    const/high16 v0, -0x80000000

    if-ne p0, v0, :cond_8

    :cond_6
    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static isValidDimensions(II)Z
    .registers 3
    .param p0, "width"    # I
    .param p1, "height"    # I

    .prologue
    .line 116
    invoke-static {p0}, Lcom/bumptech/glide/util/Util;->isValidDimension(I)Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-static {p1}, Lcom/bumptech/glide/util/Util;->isValidDimension(I)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public static sha1BytesToHex([B)Ljava/lang/String;
    .registers 2
    .param p0, "bytes"    # [B

    .prologue
    .line 38
    sget-object v0, Lcom/bumptech/glide/util/Util;->SHA_1_CHARS:[C

    invoke-static {p0, v0}, Lcom/bumptech/glide/util/Util;->bytesToHex([B[C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static sha256BytesToHex([B)Ljava/lang/String;
    .registers 2
    .param p0, "bytes"    # [B

    .prologue
    .line 31
    sget-object v0, Lcom/bumptech/glide/util/Util;->SHA_256_CHARS:[C

    invoke-static {p0, v0}, Lcom/bumptech/glide/util/Util;->bytesToHex([B[C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
