.class Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser$RandomAccessReader;
.super Ljava/lang/Object;
.source "ImageHeaderParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RandomAccessReader"
.end annotation


# instance fields
.field private final data:Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>([B)V
    .registers 4
    .param p1, "data"    # [B

    .prologue
    .line 296
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 297
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser$RandomAccessReader;->data:Ljava/nio/ByteBuffer;

    .line 298
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser$RandomAccessReader;->data:Ljava/nio/ByteBuffer;

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 299
    return-void
.end method


# virtual methods
.method public getInt16(I)S
    .registers 3
    .param p1, "offset"    # I

    .prologue
    .line 314
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser$RandomAccessReader;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->getShort(I)S

    move-result v0

    return v0
.end method

.method public getInt32(I)I
    .registers 3
    .param p1, "offset"    # I

    .prologue
    .line 310
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser$RandomAccessReader;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v0

    return v0
.end method

.method public length()I
    .registers 2

    .prologue
    .line 306
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser$RandomAccessReader;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    array-length v0, v0

    return v0
.end method

.method public order(Ljava/nio/ByteOrder;)V
    .registers 3
    .param p1, "byteOrder"    # Ljava/nio/ByteOrder;

    .prologue
    .line 302
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/bitmap/ImageHeaderParser$RandomAccessReader;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 303
    return-void
.end method
