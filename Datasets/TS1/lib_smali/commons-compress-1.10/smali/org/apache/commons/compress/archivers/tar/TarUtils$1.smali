.class final Lorg/apache/commons/compress/archivers/tar/TarUtils$1;
.super Ljava/lang/Object;
.source "TarUtils.java"

# interfaces
.implements Lorg/apache/commons/compress/archivers/zip/ZipEncoding;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/compress/archivers/tar/TarUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public canEncode(Ljava/lang/String;)Z
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 48
    const/4 v0, 0x1

    return v0
.end method

.method public decode([B)Ljava/lang/String;
    .registers 9
    .param p1, "buffer"    # [B

    .prologue
    .line 62
    array-length v4, p1

    .line 63
    .local v4, "length":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 65
    .local v5, "result":Ljava/lang/StringBuilder;
    move-object v0, p1

    .local v0, "arr$":[B
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_9
    if-ge v2, v3, :cond_f

    aget-byte v1, v0, v2

    .line 66
    .local v1, "b":B
    if-nez v1, :cond_14

    .line 72
    .end local v1    # "b":B
    :cond_f
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 69
    .restart local v1    # "b":B
    :cond_14
    and-int/lit16 v6, v1, 0xff

    int-to-char v6, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 65
    add-int/lit8 v2, v2, 0x1

    goto :goto_9
.end method

.method public encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 51
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 52
    .local v2, "length":I
    new-array v0, v2, [B

    .line 55
    .local v0, "buf":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    if-ge v1, v2, :cond_13

    .line 56
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    int-to-byte v3, v3

    aput-byte v3, v0, v1

    .line 55
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 58
    :cond_13
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    return-object v3
.end method
