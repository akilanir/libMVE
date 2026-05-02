.class public Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "RequestedCertificate.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1Choice;


# static fields
.field public static final attributeCertificate:I = 0x1

.field public static final certificate:I = -0x1

.field public static final publicKeyCertificate:I


# instance fields
.field private attributeCert:[B

.field private cert:Lorg/spongycastle/asn1/x509/Certificate;

.field private publicKeyCert:[B


# direct methods
.method public constructor <init>(I[B)V
    .registers 5
    .param p1, "type"    # I
    .param p2, "certificateOctets"    # [B

    .prologue
    .line 119
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    new-instance v1, Lorg/spongycastle/asn1/DEROctetString;

    invoke-direct {v1, p2}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-direct {v0, p1, v1}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;-><init>(Lorg/spongycastle/asn1/ASN1TaggedObject;)V

    .line 120
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1TaggedObject;)V
    .registers 5
    .param p1, "tagged"    # Lorg/spongycastle/asn1/ASN1TaggedObject;

    .prologue
    const/4 v1, 0x1

    .line 90
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 91
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v0

    if-nez v0, :cond_15

    .line 93
    invoke-static {p1, v1}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;->publicKeyCert:[B

    .line 103
    :goto_14
    return-void

    .line 95
    :cond_15
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v0

    if-ne v0, v1, :cond_26

    .line 97
    invoke-static {p1, v1}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;->attributeCert:[B

    goto :goto_14

    .line 101
    :cond_26
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown tag number: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/Certificate;)V
    .registers 2
    .param p1, "certificate"    # Lorg/spongycastle/asn1/x509/Certificate;

    .prologue
    .line 113
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 114
    iput-object p1, p0, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;->cert:Lorg/spongycastle/asn1/x509/Certificate;

    .line 115
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;
    .registers 4
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 61
    if-eqz p0, :cond_6

    instance-of v0, p0, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;

    if-eqz v0, :cond_9

    .line 63
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;

    .line 72
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_8
    return-object p0

    .line 66
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_9
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v0, :cond_18

    .line 68
    new-instance v0, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;

    invoke-static {p0}, Lorg/spongycastle/asn1/x509/Certificate;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/Certificate;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;-><init>(Lorg/spongycastle/asn1/x509/Certificate;)V

    move-object p0, v0

    goto :goto_8

    .line 70
    :cond_18
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v0, :cond_25

    .line 72
    new-instance v0, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;

    check-cast p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;-><init>(Lorg/spongycastle/asn1/ASN1TaggedObject;)V

    move-object p0, v0

    goto :goto_8

    .line 75
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_25
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "illegal object in getInstance: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 76
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;
    .registers 4
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 81
    if-nez p1, :cond_a

    .line 83
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "choice item must be explicitly tagged"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 86
    :cond_a
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getCertificateBytes()[B
    .registers 5

    .prologue
    .line 137
    iget-object v1, p0, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;->cert:Lorg/spongycastle/asn1/x509/Certificate;

    if-eqz v1, :cond_25

    .line 141
    :try_start_4
    iget-object v1, p0, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;->cert:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/Certificate;->getEncoded()[B
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_9} :catch_b

    move-result-object v1

    .line 152
    :goto_a
    return-object v1

    .line 143
    :catch_b
    move-exception v0

    .line 145
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can\'t decode certificate: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 148
    .end local v0    # "e":Ljava/io/IOException;
    :cond_25
    iget-object v1, p0, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;->publicKeyCert:[B

    if-eqz v1, :cond_2c

    .line 150
    iget-object v1, p0, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;->publicKeyCert:[B

    goto :goto_a

    .line 152
    :cond_2c
    iget-object v1, p0, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;->attributeCert:[B

    goto :goto_a
.end method

.method public getType()I
    .registers 2

    .prologue
    .line 124
    iget-object v0, p0, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;->cert:Lorg/spongycastle/asn1/x509/Certificate;

    if-eqz v0, :cond_6

    .line 126
    const/4 v0, -0x1

    .line 132
    :goto_5
    return v0

    .line 128
    :cond_6
    iget-object v0, p0, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;->publicKeyCert:[B

    if-eqz v0, :cond_c

    .line 130
    const/4 v0, 0x0

    goto :goto_5

    .line 132
    :cond_c
    const/4 v0, 0x1

    goto :goto_5
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 5

    .prologue
    .line 171
    iget-object v0, p0, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;->publicKeyCert:[B

    if-eqz v0, :cond_12

    .line 173
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v1, 0x0

    new-instance v2, Lorg/spongycastle/asn1/DEROctetString;

    iget-object v3, p0, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;->publicKeyCert:[B

    invoke-direct {v2, v3}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 179
    :goto_11
    return-object v0

    .line 175
    :cond_12
    iget-object v0, p0, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;->attributeCert:[B

    if-eqz v0, :cond_24

    .line 177
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v1, 0x1

    new-instance v2, Lorg/spongycastle/asn1/DEROctetString;

    iget-object v3, p0, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;->attributeCert:[B

    invoke-direct {v2, v3}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ILorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_11

    .line 179
    :cond_24
    iget-object v0, p0, Lorg/spongycastle/asn1/isismtt/ocsp/RequestedCertificate;->cert:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Certificate;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    goto :goto_11
.end method
