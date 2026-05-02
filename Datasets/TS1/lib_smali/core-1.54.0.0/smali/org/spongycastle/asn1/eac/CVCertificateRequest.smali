.class public Lorg/spongycastle/asn1/eac/CVCertificateRequest;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "CVCertificateRequest.java"


# static fields
.field public static ZeroArray:[B

.field private static bodyValid:I

.field private static signValid:I


# instance fields
.field ProfileId:I

.field certificate:[B

.field private certificateBody:Lorg/spongycastle/asn1/eac/CertificateBody;

.field encoded:[B

.field encodedAuthorityReference:[B

.field private innerSignature:[B

.field iso7816PubKey:Lorg/spongycastle/asn1/eac/PublicKeyDataObject;

.field keyOid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field private outerSignature:[B

.field protected overSignerReference:Ljava/lang/String;

.field signOid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field strCertificateHolderReference:Ljava/lang/String;

.field private valid:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 30
    sput v2, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->bodyValid:I

    .line 31
    const/4 v0, 0x2

    sput v0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->signValid:I

    .line 104
    new-array v0, v2, [B

    aput-byte v1, v0, v1

    sput-object v0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->ZeroArray:[B

    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1ApplicationSpecific;)V
    .registers 5
    .param p1, "request"    # Lorg/spongycastle/asn1/ASN1ApplicationSpecific;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 35
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 25
    iput-object v1, p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->innerSignature:[B

    .line 26
    iput-object v1, p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->outerSignature:[B

    .line 101
    iput-object v1, p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->signOid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 102
    iput-object v1, p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->keyOid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 142
    iput-object v1, p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->certificate:[B

    .line 143
    iput-object v1, p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->overSignerReference:Ljava/lang/String;

    .line 152
    iput-object v1, p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->iso7816PubKey:Lorg/spongycastle/asn1/eac/PublicKeyDataObject;

    .line 36
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getApplicationTag()I

    move-result v1

    const/16 v2, 0x67

    if-ne v1, v2, :cond_45

    .line 38
    const/16 v1, 0x10

    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getObject(I)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v0

    .line 40
    .local v0, "seq":Lorg/spongycastle/asn1/ASN1Sequence;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ApplicationSpecific;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->initCertBody(Lorg/spongycastle/asn1/ASN1ApplicationSpecific;)V

    .line 42
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ApplicationSpecific;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getContents()[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->outerSignature:[B

    .line 48
    .end local v0    # "seq":Lorg/spongycastle/asn1/ASN1Sequence;
    :goto_44
    return-void

    .line 46
    :cond_45
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->initCertBody(Lorg/spongycastle/asn1/ASN1ApplicationSpecific;)V

    goto :goto_44
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/eac/CVCertificateRequest;
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 82
    instance-of v1, p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;

    if-eqz v1, :cond_7

    .line 84
    check-cast p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;

    .line 98
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 86
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_32

    .line 90
    :try_start_9
    new-instance v1, Lorg/spongycastle/asn1/eac/CVCertificateRequest;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ApplicationSpecific;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/eac/CVCertificateRequest;-><init>(Lorg/spongycastle/asn1/ASN1ApplicationSpecific;)V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_12} :catch_14

    move-object p0, v1

    goto :goto_6

    .line 92
    :catch_14
    move-exception v0

    .line 94
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/spongycastle/asn1/ASN1ParsingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unable to parse data: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/spongycastle/asn1/ASN1ParsingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 98
    .end local v0    # "e":Ljava/io/IOException;
    :cond_32
    const/4 p0, 0x0

    goto :goto_6
.end method

.method private initCertBody(Lorg/spongycastle/asn1/ASN1ApplicationSpecific;)V
    .registers 8
    .param p1, "request"    # Lorg/spongycastle/asn1/ASN1ApplicationSpecific;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getApplicationTag()I

    move-result v3

    const/16 v4, 0x21

    if-ne v3, v4, :cond_64

    .line 55
    const/16 v3, 0x10

    invoke-virtual {p1, v3}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getObject(I)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v2

    .line 56
    .local v2, "seq":Lorg/spongycastle/asn1/ASN1Sequence;
    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "en":Ljava/util/Enumeration;
    :goto_16
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_81

    .line 58
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ApplicationSpecific;

    move-result-object v1

    .line 59
    .local v1, "obj":Lorg/spongycastle/asn1/ASN1ApplicationSpecific;
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getApplicationTag()I

    move-result v3

    sparse-switch v3, :sswitch_data_82

    .line 70
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid tag, not an CV Certificate Request element:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getApplicationTag()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 62
    :sswitch_48
    invoke-static {v1}, Lorg/spongycastle/asn1/eac/CertificateBody;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/eac/CertificateBody;

    move-result-object v3

    iput-object v3, p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->certificateBody:Lorg/spongycastle/asn1/eac/CertificateBody;

    .line 63
    iget v3, p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->valid:I

    sget v4, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->bodyValid:I

    or-int/2addr v3, v4

    iput v3, p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->valid:I

    goto :goto_16

    .line 66
    :sswitch_56
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getContents()[B

    move-result-object v3

    iput-object v3, p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->innerSignature:[B

    .line 67
    iget v3, p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->valid:I

    sget v4, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->signValid:I

    or-int/2addr v3, v4

    iput v3, p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->valid:I

    goto :goto_16

    .line 76
    .end local v0    # "en":Ljava/util/Enumeration;
    .end local v1    # "obj":Lorg/spongycastle/asn1/ASN1ApplicationSpecific;
    .end local v2    # "seq":Lorg/spongycastle/asn1/ASN1Sequence;
    :cond_64
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "not a CARDHOLDER_CERTIFICATE in request:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getApplicationTag()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 78
    .restart local v0    # "en":Ljava/util/Enumeration;
    .restart local v2    # "seq":Lorg/spongycastle/asn1/ASN1Sequence;
    :cond_81
    return-void

    .line 59
    :sswitch_data_82
    .sparse-switch
        0x37 -> :sswitch_56
        0x4e -> :sswitch_48
    .end sparse-switch
.end method


# virtual methods
.method public getCertificateBody()Lorg/spongycastle/asn1/eac/CertificateBody;
    .registers 2

    .prologue
    .line 120
    iget-object v0, p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->certificateBody:Lorg/spongycastle/asn1/eac/CertificateBody;

    return-object v0
.end method

.method public getInnerSignature()[B
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->innerSignature:[B

    return-object v0
.end method

.method public getOuterSignature()[B
    .registers 2

    .prologue
    .line 139
    iget-object v0, p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->outerSignature:[B

    return-object v0
.end method

.method public getPublicKey()Lorg/spongycastle/asn1/eac/PublicKeyDataObject;
    .registers 2

    .prologue
    .line 129
    iget-object v0, p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->certificateBody:Lorg/spongycastle/asn1/eac/CertificateBody;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/eac/CertificateBody;->getPublicKey()Lorg/spongycastle/asn1/eac/PublicKeyDataObject;

    move-result-object v0

    return-object v0
.end method

.method public hasOuterSignature()Z
    .registers 2

    .prologue
    .line 147
    iget-object v0, p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->outerSignature:[B

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 8

    .prologue
    .line 156
    new-instance v1, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 158
    .local v1, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v2, p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->certificateBody:Lorg/spongycastle/asn1/eac/CertificateBody;

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 162
    :try_start_a
    new-instance v2, Lorg/spongycastle/asn1/DERApplicationSpecific;

    const/4 v3, 0x0

    const/16 v4, 0x37

    new-instance v5, Lorg/spongycastle/asn1/DEROctetString;

    iget-object v6, p0, Lorg/spongycastle/asn1/eac/CVCertificateRequest;->innerSignature:[B

    invoke-direct {v5, v6}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-direct {v2, v3, v4, v5}, Lorg/spongycastle/asn1/DERApplicationSpecific;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_1c} :catch_24

    .line 169
    new-instance v2, Lorg/spongycastle/asn1/DERApplicationSpecific;

    const/16 v3, 0x21

    invoke-direct {v2, v3, v1}, Lorg/spongycastle/asn1/DERApplicationSpecific;-><init>(ILorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v2

    .line 164
    :catch_24
    move-exception v0

    .line 166
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "unable to convert signature!"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
