.class public Lorg/spongycastle/asn1/dvcs/Data;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "Data.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1Choice;


# instance fields
.field private certs:Lorg/spongycastle/asn1/ASN1Sequence;

.field private message:Lorg/spongycastle/asn1/ASN1OctetString;

.field private messageImprint:Lorg/spongycastle/asn1/x509/DigestInfo;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/ASN1OctetString;)V
    .registers 2
    .param p1, "message"    # Lorg/spongycastle/asn1/ASN1OctetString;

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 40
    iput-object p1, p0, Lorg/spongycastle/asn1/dvcs/Data;->message:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 41
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 2
    .param p1, "certs"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 59
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 60
    iput-object p1, p0, Lorg/spongycastle/asn1/dvcs/Data;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 61
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/dvcs/TargetEtcChain;)V
    .registers 3
    .param p1, "cert"    # Lorg/spongycastle/asn1/dvcs/TargetEtcChain;

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 50
    new-instance v0, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1Encodable;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/dvcs/Data;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 51
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/DigestInfo;)V
    .registers 2
    .param p1, "messageImprint"    # Lorg/spongycastle/asn1/x509/DigestInfo;

    .prologue
    .line 44
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 45
    iput-object p1, p0, Lorg/spongycastle/asn1/dvcs/Data;->messageImprint:Lorg/spongycastle/asn1/x509/DigestInfo;

    .line 46
    return-void
.end method

.method public constructor <init>([B)V
    .registers 3
    .param p1, "messageBytes"    # [B

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 35
    new-instance v0, Lorg/spongycastle/asn1/DEROctetString;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    iput-object v0, p0, Lorg/spongycastle/asn1/dvcs/Data;->message:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 36
    return-void
.end method

.method public constructor <init>([Lorg/spongycastle/asn1/dvcs/TargetEtcChain;)V
    .registers 3
    .param p1, "certs"    # [Lorg/spongycastle/asn1/dvcs/TargetEtcChain;

    .prologue
    .line 54
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 55
    new-instance v0, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/DERSequence;-><init>([Lorg/spongycastle/asn1/ASN1Encodable;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/dvcs/Data;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 56
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/dvcs/Data;
    .registers 4
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 65
    instance-of v0, p0, Lorg/spongycastle/asn1/dvcs/Data;

    if-eqz v0, :cond_7

    .line 67
    check-cast p0, Lorg/spongycastle/asn1/dvcs/Data;

    .line 79
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 69
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1OctetString;

    if-eqz v0, :cond_14

    .line 71
    new-instance v0, Lorg/spongycastle/asn1/dvcs/Data;

    check-cast p0, Lorg/spongycastle/asn1/ASN1OctetString;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/dvcs/Data;-><init>(Lorg/spongycastle/asn1/ASN1OctetString;)V

    move-object p0, v0

    goto :goto_6

    .line 73
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_14
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v0, :cond_23

    .line 75
    new-instance v0, Lorg/spongycastle/asn1/dvcs/Data;

    invoke-static {p0}, Lorg/spongycastle/asn1/x509/DigestInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/DigestInfo;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/dvcs/Data;-><init>(Lorg/spongycastle/asn1/x509/DigestInfo;)V

    move-object p0, v0

    goto :goto_6

    .line 77
    :cond_23
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v0, :cond_35

    .line 79
    new-instance v0, Lorg/spongycastle/asn1/dvcs/Data;

    check-cast p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .end local p0    # "obj":Ljava/lang/Object;
    const/4 v1, 0x0

    invoke-static {p0, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/dvcs/Data;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 81
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_35
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown object submitted to getInstance: "

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

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/dvcs/Data;
    .registers 3
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 88
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/dvcs/Data;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/dvcs/Data;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getCerts()[Lorg/spongycastle/asn1/dvcs/TargetEtcChain;
    .registers 4

    .prologue
    .line 135
    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/Data;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    if-nez v2, :cond_6

    .line 137
    const/4 v1, 0x0

    .line 147
    :cond_5
    return-object v1

    .line 140
    :cond_6
    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/Data;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    new-array v1, v2, [Lorg/spongycastle/asn1/dvcs/TargetEtcChain;

    .line 142
    .local v1, "tmp":[Lorg/spongycastle/asn1/dvcs/TargetEtcChain;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    array-length v2, v1

    if-eq v0, v2, :cond_5

    .line 144
    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/Data;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v2, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/dvcs/TargetEtcChain;

    move-result-object v2

    aput-object v2, v1, v0

    .line 142
    add-int/lit8 v0, v0, 0x1

    goto :goto_f
.end method

.method public getMessage()Lorg/spongycastle/asn1/ASN1OctetString;
    .registers 2

    .prologue
    .line 125
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/Data;->message:Lorg/spongycastle/asn1/ASN1OctetString;

    return-object v0
.end method

.method public getMessageImprint()Lorg/spongycastle/asn1/x509/DigestInfo;
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/Data;->messageImprint:Lorg/spongycastle/asn1/x509/DigestInfo;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 93
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/Data;->message:Lorg/spongycastle/asn1/ASN1OctetString;

    if-eqz v0, :cond_c

    .line 95
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/Data;->message:Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1OctetString;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    .line 103
    :goto_b
    return-object v0

    .line 97
    :cond_c
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/Data;->messageImprint:Lorg/spongycastle/asn1/x509/DigestInfo;

    if-eqz v0, :cond_17

    .line 99
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/Data;->messageImprint:Lorg/spongycastle/asn1/x509/DigestInfo;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/DigestInfo;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    goto :goto_b

    .line 103
    :cond_17
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/Data;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-direct {v0, v2, v2, v1}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_b
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 109
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/Data;->message:Lorg/spongycastle/asn1/ASN1OctetString;

    if-eqz v0, :cond_20

    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Data {\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/Data;->message:Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 119
    :goto_1f
    return-object v0

    .line 113
    :cond_20
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/Data;->messageImprint:Lorg/spongycastle/asn1/x509/DigestInfo;

    if-eqz v0, :cond_40

    .line 115
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Data {\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/Data;->messageImprint:Lorg/spongycastle/asn1/x509/DigestInfo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1f

    .line 119
    :cond_40
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Data {\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/Data;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1f
.end method
