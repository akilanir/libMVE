.class public Lorg/spongycastle/asn1/x500/DirectoryString;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "DirectoryString.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1Choice;
.implements Lorg/spongycastle/asn1/ASN1String;


# instance fields
.field private string:Lorg/spongycastle/asn1/ASN1String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 100
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 101
    new-instance v0, Lorg/spongycastle/asn1/DERUTF8String;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/DERUTF8String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/x500/DirectoryString;->string:Lorg/spongycastle/asn1/ASN1String;

    .line 102
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/DERBMPString;)V
    .registers 2
    .param p1, "string"    # Lorg/spongycastle/asn1/DERBMPString;

    .prologue
    .line 95
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 96
    iput-object p1, p0, Lorg/spongycastle/asn1/x500/DirectoryString;->string:Lorg/spongycastle/asn1/ASN1String;

    .line 97
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/DERPrintableString;)V
    .registers 2
    .param p1, "string"    # Lorg/spongycastle/asn1/DERPrintableString;

    .prologue
    .line 77
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 78
    iput-object p1, p0, Lorg/spongycastle/asn1/x500/DirectoryString;->string:Lorg/spongycastle/asn1/ASN1String;

    .line 79
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/DERT61String;)V
    .registers 2
    .param p1, "string"    # Lorg/spongycastle/asn1/DERT61String;

    .prologue
    .line 71
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 72
    iput-object p1, p0, Lorg/spongycastle/asn1/x500/DirectoryString;->string:Lorg/spongycastle/asn1/ASN1String;

    .line 73
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/DERUTF8String;)V
    .registers 2
    .param p1, "string"    # Lorg/spongycastle/asn1/DERUTF8String;

    .prologue
    .line 89
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 90
    iput-object p1, p0, Lorg/spongycastle/asn1/x500/DirectoryString;->string:Lorg/spongycastle/asn1/ASN1String;

    .line 91
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/DERUniversalString;)V
    .registers 2
    .param p1, "string"    # Lorg/spongycastle/asn1/DERUniversalString;

    .prologue
    .line 83
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 84
    iput-object p1, p0, Lorg/spongycastle/asn1/x500/DirectoryString;->string:Lorg/spongycastle/asn1/ASN1String;

    .line 85
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/DirectoryString;
    .registers 4
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 26
    if-eqz p0, :cond_6

    instance-of v0, p0, Lorg/spongycastle/asn1/x500/DirectoryString;

    if-eqz v0, :cond_9

    .line 28
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/x500/DirectoryString;

    .line 53
    .end local p0    # "o":Ljava/lang/Object;
    :goto_8
    return-object p0

    .line 31
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_9
    instance-of v0, p0, Lorg/spongycastle/asn1/DERT61String;

    if-eqz v0, :cond_16

    .line 33
    new-instance v0, Lorg/spongycastle/asn1/x500/DirectoryString;

    check-cast p0, Lorg/spongycastle/asn1/DERT61String;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/x500/DirectoryString;-><init>(Lorg/spongycastle/asn1/DERT61String;)V

    move-object p0, v0

    goto :goto_8

    .line 36
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_16
    instance-of v0, p0, Lorg/spongycastle/asn1/DERPrintableString;

    if-eqz v0, :cond_23

    .line 38
    new-instance v0, Lorg/spongycastle/asn1/x500/DirectoryString;

    check-cast p0, Lorg/spongycastle/asn1/DERPrintableString;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/x500/DirectoryString;-><init>(Lorg/spongycastle/asn1/DERPrintableString;)V

    move-object p0, v0

    goto :goto_8

    .line 41
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_23
    instance-of v0, p0, Lorg/spongycastle/asn1/DERUniversalString;

    if-eqz v0, :cond_30

    .line 43
    new-instance v0, Lorg/spongycastle/asn1/x500/DirectoryString;

    check-cast p0, Lorg/spongycastle/asn1/DERUniversalString;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/x500/DirectoryString;-><init>(Lorg/spongycastle/asn1/DERUniversalString;)V

    move-object p0, v0

    goto :goto_8

    .line 46
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_30
    instance-of v0, p0, Lorg/spongycastle/asn1/DERUTF8String;

    if-eqz v0, :cond_3d

    .line 48
    new-instance v0, Lorg/spongycastle/asn1/x500/DirectoryString;

    check-cast p0, Lorg/spongycastle/asn1/DERUTF8String;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/x500/DirectoryString;-><init>(Lorg/spongycastle/asn1/DERUTF8String;)V

    move-object p0, v0

    goto :goto_8

    .line 51
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_3d
    instance-of v0, p0, Lorg/spongycastle/asn1/DERBMPString;

    if-eqz v0, :cond_4a

    .line 53
    new-instance v0, Lorg/spongycastle/asn1/x500/DirectoryString;

    check-cast p0, Lorg/spongycastle/asn1/DERBMPString;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/x500/DirectoryString;-><init>(Lorg/spongycastle/asn1/DERBMPString;)V

    move-object p0, v0

    goto :goto_8

    .line 56
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_4a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "illegal object in getInstance: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

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

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x500/DirectoryString;
    .registers 4
    .param p0, "o"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 61
    if-nez p1, :cond_a

    .line 63
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "choice item must be explicitly tagged"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 66
    :cond_a
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/x500/DirectoryString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/DirectoryString;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 106
    iget-object v0, p0, Lorg/spongycastle/asn1/x500/DirectoryString;->string:Lorg/spongycastle/asn1/ASN1String;

    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1String;->getString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 126
    iget-object v0, p0, Lorg/spongycastle/asn1/x500/DirectoryString;->string:Lorg/spongycastle/asn1/ASN1String;

    check-cast v0, Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lorg/spongycastle/asn1/x500/DirectoryString;->string:Lorg/spongycastle/asn1/ASN1String;

    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1String;->getString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
