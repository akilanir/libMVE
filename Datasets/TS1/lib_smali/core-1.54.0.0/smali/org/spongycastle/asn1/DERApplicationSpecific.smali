.class public Lorg/spongycastle/asn1/DERApplicationSpecific;
.super Lorg/spongycastle/asn1/ASN1ApplicationSpecific;
.source "DERApplicationSpecific.java"


# direct methods
.method public constructor <init>(ILorg/spongycastle/asn1/ASN1Encodable;)V
    .registers 4
    .param p1, "tag"    # I
    .param p2, "object"    # Lorg/spongycastle/asn1/ASN1Encodable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1, p2}, Lorg/spongycastle/asn1/DERApplicationSpecific;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 46
    return-void
.end method

.method public constructor <init>(ILorg/spongycastle/asn1/ASN1EncodableVector;)V
    .registers 5
    .param p1, "tagNo"    # I
    .param p2, "vec"    # Lorg/spongycastle/asn1/ASN1EncodableVector;

    .prologue
    .line 90
    const/4 v0, 0x1

    invoke-static {p2}, Lorg/spongycastle/asn1/DERApplicationSpecific;->getEncodedVector(Lorg/spongycastle/asn1/ASN1EncodableVector;)[B

    move-result-object v1

    invoke-direct {p0, v0, p1, v1}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;-><init>(ZI[B)V

    .line 91
    return-void
.end method

.method public constructor <init>(I[B)V
    .registers 4
    .param p1, "tag"    # I
    .param p2, "octets"    # [B

    .prologue
    .line 31
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lorg/spongycastle/asn1/DERApplicationSpecific;-><init>(ZI[B)V

    .line 32
    return-void
.end method

.method public constructor <init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V
    .registers 6
    .param p1, "constructed"    # Z
    .param p2, "tag"    # I
    .param p3, "object"    # Lorg/spongycastle/asn1/ASN1Encodable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 61
    if-nez p1, :cond_c

    invoke-interface {p3}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Primitive;->isConstructed()Z

    move-result v0

    if-eqz v0, :cond_15

    :cond_c
    const/4 v0, 0x1

    :goto_d
    invoke-static {p1, p3}, Lorg/spongycastle/asn1/DERApplicationSpecific;->getEncoding(ZLorg/spongycastle/asn1/ASN1Encodable;)[B

    move-result-object v1

    invoke-direct {p0, v0, p2, v1}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;-><init>(ZI[B)V

    .line 62
    return-void

    .line 61
    :cond_15
    const/4 v0, 0x0

    goto :goto_d
.end method

.method constructor <init>(ZI[B)V
    .registers 4
    .param p1, "isConstructed"    # Z
    .param p2, "tag"    # I
    .param p3, "octets"    # [B

    .prologue
    .line 17
    invoke-direct {p0, p1, p2, p3}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;-><init>(ZI[B)V

    .line 18
    return-void
.end method

.method private static getEncodedVector(Lorg/spongycastle/asn1/ASN1EncodableVector;)[B
    .registers 7
    .param p0, "vec"    # Lorg/spongycastle/asn1/ASN1EncodableVector;

    .prologue
    .line 95
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 97
    .local v0, "bOut":Ljava/io/ByteArrayOutputStream;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_6
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1EncodableVector;->size()I

    move-result v3

    if-eq v2, v3, :cond_38

    .line 101
    :try_start_c
    invoke-virtual {p0, v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->get(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/ASN1Object;

    const-string v4, "DER"

    invoke-virtual {v3, v4}, Lorg/spongycastle/asn1/ASN1Object;->getEncoded(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/io/ByteArrayOutputStream;->write([B)V
    :try_end_1b
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_1b} :catch_1e

    .line 97
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 103
    :catch_1e
    move-exception v1

    .line 105
    .local v1, "e":Ljava/io/IOException;
    new-instance v3, Lorg/spongycastle/asn1/ASN1ParsingException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "malformed object: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lorg/spongycastle/asn1/ASN1ParsingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 108
    .end local v1    # "e":Ljava/io/IOException;
    :cond_38
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    return-object v3
.end method

.method private static getEncoding(ZLorg/spongycastle/asn1/ASN1Encodable;)[B
    .registers 7
    .param p0, "explicit"    # Z
    .param p1, "object"    # Lorg/spongycastle/asn1/ASN1Encodable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    invoke-interface {p1}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    const-string v4, "DER"

    invoke-virtual {v3, v4}, Lorg/spongycastle/asn1/ASN1Primitive;->getEncoded(Ljava/lang/String;)[B

    move-result-object v0

    .line 69
    .local v0, "data":[B
    if-eqz p0, :cond_d

    .line 78
    .end local v0    # "data":[B
    :goto_c
    return-object v0

    .line 75
    .restart local v0    # "data":[B
    :cond_d
    invoke-static {v0}, Lorg/spongycastle/asn1/DERApplicationSpecific;->getLengthOfHeader([B)I

    move-result v1

    .line 76
    .local v1, "lenBytes":I
    array-length v3, v0

    sub-int/2addr v3, v1

    new-array v2, v3, [B

    .line 77
    .local v2, "tmp":[B
    const/4 v3, 0x0

    array-length v4, v2

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v0, v2

    .line 78
    goto :goto_c
.end method


# virtual methods
.method encode(Lorg/spongycastle/asn1/ASN1OutputStream;)V
    .registers 5
    .param p1, "out"    # Lorg/spongycastle/asn1/ASN1OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 116
    const/16 v0, 0x40

    .line 117
    .local v0, "classBits":I
    iget-boolean v1, p0, Lorg/spongycastle/asn1/DERApplicationSpecific;->isConstructed:Z

    if-eqz v1, :cond_8

    .line 119
    or-int/lit8 v0, v0, 0x20

    .line 122
    :cond_8
    iget v1, p0, Lorg/spongycastle/asn1/DERApplicationSpecific;->tag:I

    iget-object v2, p0, Lorg/spongycastle/asn1/DERApplicationSpecific;->octets:[B

    invoke-virtual {p1, v0, v1, v2}, Lorg/spongycastle/asn1/ASN1OutputStream;->writeEncoded(II[B)V

    .line 123
    return-void
.end method
