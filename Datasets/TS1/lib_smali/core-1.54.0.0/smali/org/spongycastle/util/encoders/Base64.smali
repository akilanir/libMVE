.class public Lorg/spongycastle/util/encoders/Base64;
.super Ljava/lang/Object;
.source "Base64.java"


# static fields
.field private static final encoder:Lorg/spongycastle/util/encoders/Encoder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 14
    new-instance v0, Lorg/spongycastle/util/encoders/Base64Encoder;

    invoke-direct {v0}, Lorg/spongycastle/util/encoders/Base64Encoder;-><init>()V

    sput-object v0, Lorg/spongycastle/util/encoders/Base64;->encoder:Lorg/spongycastle/util/encoders/Encoder;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decode(Ljava/lang/String;Ljava/io/OutputStream;)I
    .registers 3
    .param p0, "data"    # Ljava/lang/String;
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 152
    sget-object v0, Lorg/spongycastle/util/encoders/Base64;->encoder:Lorg/spongycastle/util/encoders/Encoder;

    invoke-interface {v0, p0, p1}, Lorg/spongycastle/util/encoders/Encoder;->decode(Ljava/lang/String;Ljava/io/OutputStream;)I

    move-result v0

    return v0
.end method

.method public static decode(Ljava/lang/String;)[B
    .registers 7
    .param p0, "data"    # Ljava/lang/String;

    .prologue
    .line 126
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    div-int/lit8 v3, v3, 0x4

    mul-int/lit8 v2, v3, 0x3

    .line 127
    .local v2, "len":I
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0, v2}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 131
    .local v0, "bOut":Ljava/io/ByteArrayOutputStream;
    :try_start_d
    sget-object v3, Lorg/spongycastle/util/encoders/Base64;->encoder:Lorg/spongycastle/util/encoders/Encoder;

    invoke-interface {v3, p0, v0}, Lorg/spongycastle/util/encoders/Encoder;->decode(Ljava/lang/String;Ljava/io/OutputStream;)I
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_12} :catch_17

    .line 138
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    return-object v3

    .line 133
    :catch_17
    move-exception v1

    .line 135
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Lorg/spongycastle/util/encoders/DecoderException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "unable to decode base64 string: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lorg/spongycastle/util/encoders/DecoderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public static decode([B)[B
    .registers 7
    .param p0, "data"    # [B

    .prologue
    .line 103
    array-length v3, p0

    div-int/lit8 v3, v3, 0x4

    mul-int/lit8 v2, v3, 0x3

    .line 104
    .local v2, "len":I
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0, v2}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 108
    .local v0, "bOut":Ljava/io/ByteArrayOutputStream;
    :try_start_a
    sget-object v3, Lorg/spongycastle/util/encoders/Base64;->encoder:Lorg/spongycastle/util/encoders/Encoder;

    const/4 v4, 0x0

    array-length v5, p0

    invoke-interface {v3, p0, v4, v5, v0}, Lorg/spongycastle/util/encoders/Encoder;->decode([BIILjava/io/OutputStream;)I
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_11} :catch_16

    .line 115
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    return-object v3

    .line 110
    :catch_16
    move-exception v1

    .line 112
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Lorg/spongycastle/util/encoders/DecoderException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "unable to decode base64 data: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lorg/spongycastle/util/encoders/DecoderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public static encode([BIILjava/io/OutputStream;)I
    .registers 5
    .param p0, "data"    # [B
    .param p1, "off"    # I
    .param p2, "length"    # I
    .param p3, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    sget-object v0, Lorg/spongycastle/util/encoders/Base64;->encoder:Lorg/spongycastle/util/encoders/Encoder;

    invoke-interface {v0, p0, p1, p2, p3}, Lorg/spongycastle/util/encoders/Encoder;->encode([BIILjava/io/OutputStream;)I

    move-result v0

    return v0
.end method

.method public static encode([BLjava/io/OutputStream;)I
    .registers 5
    .param p0, "data"    # [B
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    sget-object v0, Lorg/spongycastle/util/encoders/Base64;->encoder:Lorg/spongycastle/util/encoders/Encoder;

    const/4 v1, 0x0

    array-length v2, p0

    invoke-interface {v0, p0, v1, v2, p1}, Lorg/spongycastle/util/encoders/Encoder;->encode([BIILjava/io/OutputStream;)I

    move-result v0

    return v0
.end method

.method public static encode([B)[B
    .registers 3
    .param p0, "data"    # [B

    .prologue
    .line 39
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lorg/spongycastle/util/encoders/Base64;->encode([BII)[B

    move-result-object v0

    return-object v0
.end method

.method public static encode([BII)[B
    .registers 9
    .param p0, "data"    # [B
    .param p1, "off"    # I
    .param p2, "length"    # I

    .prologue
    .line 52
    add-int/lit8 v3, p2, 0x2

    div-int/lit8 v3, v3, 0x3

    mul-int/lit8 v2, v3, 0x4

    .line 53
    .local v2, "len":I
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0, v2}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 57
    .local v0, "bOut":Ljava/io/ByteArrayOutputStream;
    :try_start_b
    sget-object v3, Lorg/spongycastle/util/encoders/Base64;->encoder:Lorg/spongycastle/util/encoders/Encoder;

    invoke-interface {v3, p0, p1, p2, v0}, Lorg/spongycastle/util/encoders/Encoder;->encode([BIILjava/io/OutputStream;)I
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_10} :catch_15

    .line 64
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    return-object v3

    .line 59
    :catch_15
    move-exception v1

    .line 61
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Lorg/spongycastle/util/encoders/EncoderException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "exception encoding base64 string: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lorg/spongycastle/util/encoders/EncoderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public static toBase64String([B)Ljava/lang/String;
    .registers 3
    .param p0, "data"    # [B

    .prologue
    .line 19
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lorg/spongycastle/util/encoders/Base64;->toBase64String([BII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toBase64String([BII)Ljava/lang/String;
    .registers 5
    .param p0, "data"    # [B
    .param p1, "off"    # I
    .param p2, "length"    # I

    .prologue
    .line 27
    invoke-static {p0, p1, p2}, Lorg/spongycastle/util/encoders/Base64;->encode([BII)[B

    move-result-object v0

    .line 28
    .local v0, "encoded":[B
    invoke-static {v0}, Lorg/spongycastle/util/Strings;->fromByteArray([B)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
