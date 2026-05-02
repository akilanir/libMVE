.class public Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SubjectKeyIdentifier.java"


# instance fields
.field private keyidentifier:[B


# direct methods
.method protected constructor <init>(Lorg/spongycastle/asn1/ASN1OctetString;)V
    .registers 3
    .param p1, "keyid"    # Lorg/spongycastle/asn1/ASN1OctetString;

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 56
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;->keyidentifier:[B

    .line 57
    return-void
.end method

.method public constructor <init>([B)V
    .registers 2
    .param p1, "keyid"    # [B

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 50
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;->keyidentifier:[B

    .line 51
    return-void
.end method

.method public static fromExtensions(Lorg/spongycastle/asn1/x509/Extensions;)Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;
    .registers 2
    .param p0, "extensions"    # Lorg/spongycastle/asn1/x509/Extensions;

    .prologue
    .line 44
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->subjectKeyIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {p0, v0}, Lorg/spongycastle/asn1/x509/Extensions;->getExtensionParsedValue(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 30
    instance-of v0, p0, Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;

    if-eqz v0, :cond_7

    .line 32
    check-cast p0, Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;

    .line 39
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 34
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 36
    new-instance v0, Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1OctetString;)V

    move-object p0, v0

    goto :goto_6

    .line 39
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;
    .registers 3
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 24
    invoke-static {p0, p1}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getKeyIdentifier()[B
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;->keyidentifier:[B

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 3

    .prologue
    .line 66
    new-instance v0, Lorg/spongycastle/asn1/DEROctetString;

    iget-object v1, p0, Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;->keyidentifier:[B

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    return-object v0
.end method
