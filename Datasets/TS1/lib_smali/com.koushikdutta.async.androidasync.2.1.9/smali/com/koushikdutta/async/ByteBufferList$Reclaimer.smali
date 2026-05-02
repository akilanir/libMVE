.class Lcom/koushikdutta/async/ByteBufferList$Reclaimer;
.super Ljava/lang/Object;
.source "ByteBufferList.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/async/ByteBufferList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Reclaimer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Ljava/nio/ByteBuffer;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 404
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 404
    check-cast p1, Ljava/nio/ByteBuffer;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Ljava/nio/ByteBuffer;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/async/ByteBufferList$Reclaimer;->compare(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I

    move-result v0

    return v0
.end method

.method public compare(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I
    .registers 5
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .param p2, "byteBuffer2"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 408
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    if-ne v0, v1, :cond_c

    .line 409
    const/4 v0, 0x0

    .line 412
    :goto_b
    return v0

    .line 410
    :cond_c
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    if-le v0, v1, :cond_18

    .line 411
    const/4 v0, 0x1

    goto :goto_b

    .line 412
    :cond_18
    const/4 v0, -0x1

    goto :goto_b
.end method
