.class public Lorg/spongycastle/crypto/tls/OCSPStatusRequest;
.super Ljava/lang/Object;
.source "OCSPStatusRequest.java"


# instance fields
.field protected requestExtensions:Lorg/spongycastle/asn1/x509/Extensions;

.field protected responderIDList:Ljava/util/Vector;


# direct methods
.method public constructor <init>(Ljava/util/Vector;Lorg/spongycastle/asn1/x509/Extensions;)V
    .registers 3
    .param p1, "responderIDList"    # Ljava/util/Vector;
    .param p2, "requestExtensions"    # Lorg/spongycastle/asn1/x509/Extensions;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/OCSPStatusRequest;->responderIDList:Ljava/util/Vector;

    .line 33
    iput-object p2, p0, Lorg/spongycastle/crypto/tls/OCSPStatusRequest;->requestExtensions:Lorg/spongycastle/asn1/x509/Extensions;

    .line 34
    return-void
.end method

.method public static parse(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/OCSPStatusRequest;
    .registers 9
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    new-instance v6, Ljava/util/Vector;

    invoke-direct {v6}, Ljava/util/Vector;-><init>()V

    .line 104
    .local v6, "responderIDList":Ljava/util/Vector;
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16(Ljava/io/InputStream;)I

    move-result v3

    .line 105
    .local v3, "length":I
    if-lez v3, :cond_29

    .line 107
    invoke-static {v3, p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readFully(ILjava/io/InputStream;)[B

    move-result-object v1

    .line 108
    .local v1, "data":[B
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 111
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    :cond_14
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readOpaque16(Ljava/io/InputStream;)[B

    move-result-object v2

    .line 112
    .local v2, "derEncoding":[B
    invoke-static {v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->readDERObject([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v7

    invoke-static {v7}, Lorg/spongycastle/asn1/ocsp/ResponderID;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ocsp/ResponderID;

    move-result-object v5

    .line 113
    .local v5, "responderID":Lorg/spongycastle/asn1/ocsp/ResponderID;
    invoke-virtual {v6, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 115
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v7

    if-gtz v7, :cond_14

    .line 119
    .end local v0    # "buf":Ljava/io/ByteArrayInputStream;
    .end local v1    # "data":[B
    .end local v2    # "derEncoding":[B
    .end local v5    # "responderID":Lorg/spongycastle/asn1/ocsp/ResponderID;
    :cond_29
    const/4 v4, 0x0

    .line 121
    .local v4, "requestExtensions":Lorg/spongycastle/asn1/x509/Extensions;
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16(Ljava/io/InputStream;)I

    move-result v3

    .line 122
    if-lez v3, :cond_3c

    .line 124
    invoke-static {v3, p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readFully(ILjava/io/InputStream;)[B

    move-result-object v2

    .line 125
    .restart local v2    # "derEncoding":[B
    invoke-static {v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->readDERObject([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v7

    invoke-static {v7}, Lorg/spongycastle/asn1/x509/Extensions;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/Extensions;

    move-result-object v4

    .line 129
    .end local v2    # "derEncoding":[B
    :cond_3c
    new-instance v7, Lorg/spongycastle/crypto/tls/OCSPStatusRequest;

    invoke-direct {v7, v6, v4}, Lorg/spongycastle/crypto/tls/OCSPStatusRequest;-><init>(Ljava/util/Vector;Lorg/spongycastle/asn1/x509/Extensions;)V

    return-object v7
.end method


# virtual methods
.method public encode(Ljava/io/OutputStream;)V
    .registers 8
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 61
    iget-object v4, p0, Lorg/spongycastle/crypto/tls/OCSPStatusRequest;->responderIDList:Ljava/util/Vector;

    if-eqz v4, :cond_d

    iget-object v4, p0, Lorg/spongycastle/crypto/tls/OCSPStatusRequest;->responderIDList:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_18

    .line 63
    :cond_d
    invoke-static {v5, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(ILjava/io/OutputStream;)V

    .line 79
    :goto_10
    iget-object v4, p0, Lorg/spongycastle/crypto/tls/OCSPStatusRequest;->requestExtensions:Lorg/spongycastle/asn1/x509/Extensions;

    if-nez v4, :cond_4c

    .line 81
    invoke-static {v5, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(ILjava/io/OutputStream;)V

    .line 90
    :goto_17
    return-void

    .line 67
    :cond_18
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 68
    .local v0, "buf":Ljava/io/ByteArrayOutputStream;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1e
    iget-object v4, p0, Lorg/spongycastle/crypto/tls/OCSPStatusRequest;->responderIDList:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v4

    if-ge v2, v4, :cond_3a

    .line 70
    iget-object v4, p0, Lorg/spongycastle/crypto/tls/OCSPStatusRequest;->responderIDList:Ljava/util/Vector;

    invoke-virtual {v4, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/ocsp/ResponderID;

    .line 71
    .local v3, "responderID":Lorg/spongycastle/asn1/ocsp/ResponderID;
    const-string v4, "DER"

    invoke-virtual {v3, v4}, Lorg/spongycastle/asn1/ocsp/ResponderID;->getEncoded(Ljava/lang/String;)[B

    move-result-object v1

    .line 72
    .local v1, "derEncoding":[B
    invoke-static {v1, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeOpaque16([BLjava/io/OutputStream;)V

    .line 68
    add-int/lit8 v2, v2, 0x1

    goto :goto_1e

    .line 74
    .end local v1    # "derEncoding":[B
    .end local v3    # "responderID":Lorg/spongycastle/asn1/ocsp/ResponderID;
    :cond_3a
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v4

    invoke-static {v4}, Lorg/spongycastle/crypto/tls/TlsUtils;->checkUint16(I)V

    .line 75
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v4

    invoke-static {v4, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(ILjava/io/OutputStream;)V

    .line 76
    invoke-virtual {v0, p1}, Ljava/io/ByteArrayOutputStream;->writeTo(Ljava/io/OutputStream;)V

    goto :goto_10

    .line 85
    .end local v0    # "buf":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "i":I
    :cond_4c
    iget-object v4, p0, Lorg/spongycastle/crypto/tls/OCSPStatusRequest;->requestExtensions:Lorg/spongycastle/asn1/x509/Extensions;

    const-string v5, "DER"

    invoke-virtual {v4, v5}, Lorg/spongycastle/asn1/x509/Extensions;->getEncoded(Ljava/lang/String;)[B

    move-result-object v1

    .line 86
    .restart local v1    # "derEncoding":[B
    array-length v4, v1

    invoke-static {v4}, Lorg/spongycastle/crypto/tls/TlsUtils;->checkUint16(I)V

    .line 87
    array-length v4, v1

    invoke-static {v4, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(ILjava/io/OutputStream;)V

    .line 88
    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write([B)V

    goto :goto_17
.end method

.method public getRequestExtensions()Lorg/spongycastle/asn1/x509/Extensions;
    .registers 2

    .prologue
    .line 49
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/OCSPStatusRequest;->requestExtensions:Lorg/spongycastle/asn1/x509/Extensions;

    return-object v0
.end method

.method public getResponderIDList()Ljava/util/Vector;
    .registers 2

    .prologue
    .line 41
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/OCSPStatusRequest;->responderIDList:Ljava/util/Vector;

    return-object v0
.end method
