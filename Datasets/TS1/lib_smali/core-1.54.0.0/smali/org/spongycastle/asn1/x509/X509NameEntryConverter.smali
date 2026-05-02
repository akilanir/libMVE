.class public abstract Lorg/spongycastle/asn1/x509/X509NameEntryConverter;
.super Ljava/lang/Object;
.source "X509NameEntryConverter.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected canBePrintable(Ljava/lang/String;)Z
    .registers 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 102
    invoke-static {p1}, Lorg/spongycastle/asn1/DERPrintableString;->isPrintableString(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected convertHexEncoded(Ljava/lang/String;I)Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 11
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "off"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x61

    .line 65
    invoke-static {p1}, Lorg/spongycastle/util/Strings;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 66
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, p2

    div-int/lit8 v5, v5, 0x2

    new-array v1, v5, [B

    .line 67
    .local v1, "data":[B
    const/4 v2, 0x0

    .local v2, "index":I
    :goto_10
    array-length v5, v1

    if-eq v2, v5, :cond_50

    .line 69
    mul-int/lit8 v5, v2, 0x2

    add-int/2addr v5, p2

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 70
    .local v3, "left":C
    mul-int/lit8 v5, v2, 0x2

    add-int/2addr v5, p2

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 72
    .local v4, "right":C
    if-ge v3, v7, :cond_3a

    .line 74
    add-int/lit8 v5, v3, -0x30

    shl-int/lit8 v5, v5, 0x4

    int-to-byte v5, v5

    aput-byte v5, v1, v2

    .line 80
    :goto_2c
    if-ge v4, v7, :cond_44

    .line 82
    aget-byte v5, v1, v2

    add-int/lit8 v6, v4, -0x30

    int-to-byte v6, v6

    or-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v1, v2

    .line 67
    :goto_37
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    .line 78
    :cond_3a
    add-int/lit8 v5, v3, -0x61

    add-int/lit8 v5, v5, 0xa

    shl-int/lit8 v5, v5, 0x4

    int-to-byte v5, v5

    aput-byte v5, v1, v2

    goto :goto_2c

    .line 86
    :cond_44
    aget-byte v5, v1, v2

    add-int/lit8 v6, v4, -0x61

    add-int/lit8 v6, v6, 0xa

    int-to-byte v6, v6

    or-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v1, v2

    goto :goto_37

    .line 90
    .end local v3    # "left":C
    .end local v4    # "right":C
    :cond_50
    new-instance v0, Lorg/spongycastle/asn1/ASN1InputStream;

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    .line 92
    .local v0, "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v5

    return-object v5
.end method

.method public abstract getConvertedValue(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;
.end method
