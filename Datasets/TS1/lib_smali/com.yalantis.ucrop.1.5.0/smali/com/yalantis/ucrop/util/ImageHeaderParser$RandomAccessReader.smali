.class Lcom/yalantis/ucrop/util/ImageHeaderParser$RandomAccessReader;
.super Ljava/lang/Object;
.source "ImageHeaderParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yalantis/ucrop/util/ImageHeaderParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RandomAccessReader"
.end annotation


# instance fields
.field private final data:Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>([BI)V
    .registers 5
    .param p1, "data"    # [B
    .param p2, "length"    # I

    .prologue
    .line 287
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 288
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    iput-object v0, p0, Lcom/yalantis/ucrop/util/ImageHeaderParser$RandomAccessReader;->data:Ljava/nio/ByteBuffer;

    .line 291
    return-void
.end method


# virtual methods
.method public getInt16(I)S
    .registers 3
    .param p1, "offset"    # I

    .prologue
    .line 306
    iget-object v0, p0, Lcom/yalantis/ucrop/util/ImageHeaderParser$RandomAccessReader;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->getShort(I)S

    move-result v0

    return v0
.end method

.method public getInt32(I)I
    .registers 3
    .param p1, "offset"    # I

    .prologue
    .line 302
    iget-object v0, p0, Lcom/yalantis/ucrop/util/ImageHeaderParser$RandomAccessReader;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v0

    return v0
.end method

.method public length()I
    .registers 2

    .prologue
    .line 298
    iget-object v0, p0, Lcom/yalantis/ucrop/util/ImageHeaderParser$RandomAccessReader;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    return v0
.end method

.method public order(Ljava/nio/ByteOrder;)V
    .registers 3
    .param p1, "byteOrder"    # Ljava/nio/ByteOrder;

    .prologue
    .line 294
    iget-object v0, p0, Lcom/yalantis/ucrop/util/ImageHeaderParser$RandomAccessReader;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 295
    return-void
.end method
