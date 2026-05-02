.class public Lorg/spongycastle/crypto/tls/Certificate;
.super Ljava/lang/Object;
.source "Certificate.java"


# static fields
.field public static final EMPTY_CHAIN:Lorg/spongycastle/crypto/tls/Certificate;


# instance fields
.field protected certificateList:[Lorg/spongycastle/asn1/x509/Certificate;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 26
    new-instance v0, Lorg/spongycastle/crypto/tls/Certificate;

    const/4 v1, 0x0

    new-array v1, v1, [Lorg/spongycastle/asn1/x509/Certificate;

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/Certificate;-><init>([Lorg/spongycastle/asn1/x509/Certificate;)V

    sput-object v0, Lorg/spongycastle/crypto/tls/Certificate;->EMPTY_CHAIN:Lorg/spongycastle/crypto/tls/Certificate;

    return-void
.end method

.method public constructor <init>([Lorg/spongycastle/asn1/x509/Certificate;)V
    .registers 4
    .param p1, "certificateList"    # [Lorg/spongycastle/asn1/x509/Certificate;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    if-nez p1, :cond_d

    .line 35
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'certificateList\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 38
    :cond_d
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/Certificate;->certificateList:[Lorg/spongycastle/asn1/x509/Certificate;

    .line 39
    return-void
.end method

.method public static parse(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/Certificate;
    .registers 10
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 108
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint24(Ljava/io/InputStream;)I

    move-result v7

    .line 109
    .local v7, "totalLength":I
    if-nez v7, :cond_9

    .line 111
    sget-object v8, Lorg/spongycastle/crypto/tls/Certificate;->EMPTY_CHAIN:Lorg/spongycastle/crypto/tls/Certificate;

    .line 131
    :goto_8
    return-object v8

    .line 114
    :cond_9
    invoke-static {v7, p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readFully(ILjava/io/InputStream;)[B

    move-result-object v2

    .line 116
    .local v2, "certListData":[B
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 118
    .local v1, "buf":Ljava/io/ByteArrayInputStream;
    new-instance v4, Ljava/util/Vector;

    invoke-direct {v4}, Ljava/util/Vector;-><init>()V

    .line 119
    .local v4, "certificate_list":Ljava/util/Vector;
    :goto_17
    invoke-virtual {v1}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v8

    if-lez v8, :cond_2d

    .line 121
    invoke-static {v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readOpaque24(Ljava/io/InputStream;)[B

    move-result-object v5

    .line 122
    .local v5, "derEncoding":[B
    invoke-static {v5}, Lorg/spongycastle/crypto/tls/TlsUtils;->readDERObject([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    .line 123
    .local v0, "asn1Cert":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-static {v0}, Lorg/spongycastle/asn1/x509/Certificate;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/Certificate;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_17

    .line 126
    .end local v0    # "asn1Cert":Lorg/spongycastle/asn1/ASN1Primitive;
    .end local v5    # "derEncoding":[B
    :cond_2d
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v8

    new-array v3, v8, [Lorg/spongycastle/asn1/x509/Certificate;

    .line 127
    .local v3, "certificateList":[Lorg/spongycastle/asn1/x509/Certificate;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_34
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v8

    if-ge v6, v8, :cond_45

    .line 129
    invoke-virtual {v4, v6}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/spongycastle/asn1/x509/Certificate;

    aput-object v8, v3, v6

    .line 127
    add-int/lit8 v6, v6, 0x1

    goto :goto_34

    .line 131
    :cond_45
    new-instance v8, Lorg/spongycastle/crypto/tls/Certificate;

    invoke-direct {v8, v3}, Lorg/spongycastle/crypto/tls/Certificate;-><init>([Lorg/spongycastle/asn1/x509/Certificate;)V

    goto :goto_8
.end method


# virtual methods
.method protected cloneCertificateList()[Lorg/spongycastle/asn1/x509/Certificate;
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 136
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/Certificate;->certificateList:[Lorg/spongycastle/asn1/x509/Certificate;

    array-length v1, v1

    new-array v0, v1, [Lorg/spongycastle/asn1/x509/Certificate;

    .line 137
    .local v0, "result":[Lorg/spongycastle/asn1/x509/Certificate;
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/Certificate;->certificateList:[Lorg/spongycastle/asn1/x509/Certificate;

    array-length v2, v0

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 138
    return-object v0
.end method

.method public encode(Ljava/io/OutputStream;)V
    .registers 8
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    new-instance v1, Ljava/util/Vector;

    iget-object v4, p0, Lorg/spongycastle/crypto/tls/Certificate;->certificateList:[Lorg/spongycastle/asn1/x509/Certificate;

    array-length v4, v4

    invoke-direct {v1, v4}, Ljava/util/Vector;-><init>(I)V

    .line 80
    .local v1, "derEncodings":Ljava/util/Vector;
    const/4 v3, 0x0

    .line 81
    .local v3, "totalLength":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_a
    iget-object v4, p0, Lorg/spongycastle/crypto/tls/Certificate;->certificateList:[Lorg/spongycastle/asn1/x509/Certificate;

    array-length v4, v4

    if-ge v2, v4, :cond_23

    .line 83
    iget-object v4, p0, Lorg/spongycastle/crypto/tls/Certificate;->certificateList:[Lorg/spongycastle/asn1/x509/Certificate;

    aget-object v4, v4, v2

    const-string v5, "DER"

    invoke-virtual {v4, v5}, Lorg/spongycastle/asn1/x509/Certificate;->getEncoded(Ljava/lang/String;)[B

    move-result-object v0

    .line 84
    .local v0, "derEncoding":[B
    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 85
    array-length v4, v0

    add-int/lit8 v4, v4, 0x3

    add-int/2addr v3, v4

    .line 81
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 88
    .end local v0    # "derEncoding":[B
    :cond_23
    invoke-static {v3}, Lorg/spongycastle/crypto/tls/TlsUtils;->checkUint24(I)V

    .line 89
    invoke-static {v3, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint24(ILjava/io/OutputStream;)V

    .line 91
    const/4 v2, 0x0

    :goto_2a
    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v4

    if-ge v2, v4, :cond_3f

    .line 93
    invoke-virtual {v1, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [B

    move-object v0, v4

    check-cast v0, [B

    .line 94
    .restart local v0    # "derEncoding":[B
    invoke-static {v0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeOpaque24([BLjava/io/OutputStream;)V

    .line 91
    add-int/lit8 v2, v2, 0x1

    goto :goto_2a

    .line 96
    .end local v0    # "derEncoding":[B
    :cond_3f
    return-void
.end method

.method public getCertificateAt(I)Lorg/spongycastle/asn1/x509/Certificate;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 52
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/Certificate;->certificateList:[Lorg/spongycastle/asn1/x509/Certificate;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getCertificateList()[Lorg/spongycastle/asn1/x509/Certificate;
    .registers 2

    .prologue
    .line 47
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/Certificate;->cloneCertificateList()[Lorg/spongycastle/asn1/x509/Certificate;

    move-result-object v0

    return-object v0
.end method

.method public getLength()I
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/Certificate;->certificateList:[Lorg/spongycastle/asn1/x509/Certificate;

    array-length v0, v0

    return v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 66
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/Certificate;->certificateList:[Lorg/spongycastle/asn1/x509/Certificate;

    array-length v0, v0

    if-nez v0, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method
