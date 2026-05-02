.class public final Lorg/apache/commons/compress/archivers/zip/ZipShort;
.super Ljava/lang/Object;
.source "ZipShort.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field private static final BYTE_1_MASK:I = 0xff00

.field private static final BYTE_1_SHIFT:I = 0x8

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final value:I


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "value"    # I

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipShort;->value:I

    .line 43
    return-void
.end method

.method public constructor <init>([B)V
    .registers 3
    .param p1, "bytes"    # [B

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/archivers/zip/ZipShort;-><init>([BI)V

    .line 51
    return-void
.end method

.method public constructor <init>([BI)V
    .registers 4
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    invoke-static {p1, p2}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue([BI)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipShort;->value:I

    .line 60
    return-void
.end method

.method public static getBytes(I)[B
    .registers 3
    .param p0, "value"    # I

    .prologue
    .line 87
    const/4 v1, 0x2

    new-array v0, v1, [B

    .line 88
    .local v0, "result":[B
    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 89
    return-object v0
.end method

.method public static getValue([B)I
    .registers 2
    .param p0, "bytes"    # [B

    .prologue
    .line 123
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue([BI)I

    move-result v0

    return v0
.end method

.method public static getValue([BI)I
    .registers 5
    .param p0, "bytes"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 112
    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    shl-int/lit8 v1, v1, 0x8

    const v2, 0xff00

    and-int v0, v1, v2

    .line 113
    .local v0, "value":I
    aget-byte v1, p0, p1

    and-int/lit16 v1, v1, 0xff

    add-int/2addr v0, v1

    .line 114
    return v0
.end method

.method public static putShort(I[BI)V
    .registers 5
    .param p0, "value"    # I
    .param p1, "buf"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 101
    and-int/lit16 v0, p0, 0xff

    int-to-byte v0, v0

    aput-byte v0, p1, p2

    .line 102
    add-int/lit8 v0, p2, 0x1

    const v1, 0xff00

    and-int/2addr v1, p0

    shr-int/lit8 v1, v1, 0x8

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 103
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 151
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 152
    :catch_5
    move-exception v0

    .line 154
    .local v0, "cnfe":Ljava/lang/CloneNotSupportedException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 133
    if-eqz p1, :cond_7

    instance-of v1, p1, Lorg/apache/commons/compress/archivers/zip/ZipShort;

    if-nez v1, :cond_8

    .line 136
    .end local p1    # "o":Ljava/lang/Object;
    :cond_7
    :goto_7
    return v0

    .restart local p1    # "o":Ljava/lang/Object;
    :cond_8
    iget v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipShort;->value:I

    check-cast p1, Lorg/apache/commons/compress/archivers/zip/ZipShort;

    .end local p1    # "o":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue()I

    move-result v2

    if-ne v1, v2, :cond_7

    const/4 v0, 0x1

    goto :goto_7
.end method

.method public getBytes()[B
    .registers 5

    .prologue
    .line 67
    const/4 v1, 0x2

    new-array v0, v1, [B

    .line 68
    .local v0, "result":[B
    const/4 v1, 0x0

    iget v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipShort;->value:I

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 69
    const/4 v1, 0x1

    iget v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipShort;->value:I

    const v3, 0xff00

    and-int/2addr v2, v3

    shr-int/lit8 v2, v2, 0x8

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 70
    return-object v0
.end method

.method public getValue()I
    .registers 2

    .prologue
    .line 78
    iget v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipShort;->value:I

    return v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 145
    iget v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipShort;->value:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 160
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ZipShort value: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipShort;->value:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
