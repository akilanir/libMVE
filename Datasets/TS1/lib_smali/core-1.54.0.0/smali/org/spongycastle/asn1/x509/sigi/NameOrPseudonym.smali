.class public Lorg/spongycastle/asn1/x509/sigi/NameOrPseudonym;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "NameOrPseudonym.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1Choice;


# instance fields
.field private givenName:Lorg/spongycastle/asn1/ASN1Sequence;

.field private pseudonym:Lorg/spongycastle/asn1/x500/DirectoryString;

.field private surname:Lorg/spongycastle/asn1/x500/DirectoryString;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "pseudonym"    # Ljava/lang/String;

    .prologue
    .line 122
    new-instance v0, Lorg/spongycastle/asn1/x500/DirectoryString;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/x500/DirectoryString;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/x509/sigi/NameOrPseudonym;-><init>(Lorg/spongycastle/asn1/x500/DirectoryString;)V

    .line 123
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 6
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/4 v3, 0x0

    .line 98
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 99
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_28

    .line 101
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad sequence size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 102
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 105
    :cond_28
    invoke-virtual {p1, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    instance-of v0, v0, Lorg/spongycastle/asn1/ASN1String;

    if-nez v0, :cond_51

    .line 107
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad object encountered: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 108
    invoke-virtual {p1, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 111
    :cond_51
    invoke-virtual {p1, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/x500/DirectoryString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/DirectoryString;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/sigi/NameOrPseudonym;->surname:Lorg/spongycastle/asn1/x500/DirectoryString;

    .line 112
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/sigi/NameOrPseudonym;->givenName:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 113
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x500/DirectoryString;)V
    .registers 2
    .param p1, "pseudonym"    # Lorg/spongycastle/asn1/x500/DirectoryString;

    .prologue
    .line 77
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 78
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/sigi/NameOrPseudonym;->pseudonym:Lorg/spongycastle/asn1/x500/DirectoryString;

    .line 79
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x500/DirectoryString;Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 3
    .param p1, "surname"    # Lorg/spongycastle/asn1/x500/DirectoryString;
    .param p2, "givenName"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 132
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 133
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/sigi/NameOrPseudonym;->surname:Lorg/spongycastle/asn1/x500/DirectoryString;

    .line 134
    iput-object p2, p0, Lorg/spongycastle/asn1/x509/sigi/NameOrPseudonym;->givenName:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 135
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/sigi/NameOrPseudonym;
    .registers 4
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 42
    if-eqz p0, :cond_6

    instance-of v0, p0, Lorg/spongycastle/asn1/x509/sigi/NameOrPseudonym;

    if-eqz v0, :cond_9

    .line 44
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/x509/sigi/NameOrPseudonym;

    .line 54
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_8
    return-object p0

    .line 47
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_9
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1String;

    if-eqz v0, :cond_18

    .line 49
    new-instance v0, Lorg/spongycastle/asn1/x509/sigi/NameOrPseudonym;

    invoke-static {p0}, Lorg/spongycastle/asn1/x500/DirectoryString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/DirectoryString;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/x509/sigi/NameOrPseudonym;-><init>(Lorg/spongycastle/asn1/x500/DirectoryString;)V

    move-object p0, v0

    goto :goto_8

    .line 52
    :cond_18
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v0, :cond_25

    .line 54
    new-instance v0, Lorg/spongycastle/asn1/x509/sigi/NameOrPseudonym;

    check-cast p0, Lorg/spongycastle/asn1/ASN1Sequence;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/x509/sigi/NameOrPseudonym;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_8

    .line 57
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_25
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "illegal object in getInstance: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 58
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


# virtual methods
.method public getGivenName()[Lorg/spongycastle/asn1/x500/DirectoryString;
    .registers 6

    .prologue
    .line 149
    iget-object v4, p0, Lorg/spongycastle/asn1/x509/sigi/NameOrPseudonym;->givenName:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v4

    new-array v3, v4, [Lorg/spongycastle/asn1/x500/DirectoryString;

    .line 150
    .local v3, "items":[Lorg/spongycastle/asn1/x500/DirectoryString;
    const/4 v0, 0x0

    .line 151
    .local v0, "count":I
    iget-object v4, p0, Lorg/spongycastle/asn1/x509/sigi/NameOrPseudonym;->givenName:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v2

    .local v2, "e":Ljava/util/Enumeration;
    :goto_f
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_23

    .line 153
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "count":I
    .local v1, "count":I
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/x500/DirectoryString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/DirectoryString;

    move-result-object v4

    aput-object v4, v3, v0

    move v0, v1

    .end local v1    # "count":I
    .restart local v0    # "count":I
    goto :goto_f

    .line 155
    :cond_23
    return-object v3
.end method

.method public getPseudonym()Lorg/spongycastle/asn1/x500/DirectoryString;
    .registers 2

    .prologue
    .line 139
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/sigi/NameOrPseudonym;->pseudonym:Lorg/spongycastle/asn1/x500/DirectoryString;

    return-object v0
.end method

.method public getSurname()Lorg/spongycastle/asn1/x500/DirectoryString;
    .registers 2

    .prologue
    .line 144
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/sigi/NameOrPseudonym;->surname:Lorg/spongycastle/asn1/x500/DirectoryString;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 3

    .prologue
    .line 176
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/sigi/NameOrPseudonym;->pseudonym:Lorg/spongycastle/asn1/x500/DirectoryString;

    if-eqz v1, :cond_b

    .line 178
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/sigi/NameOrPseudonym;->pseudonym:Lorg/spongycastle/asn1/x500/DirectoryString;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/x500/DirectoryString;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    .line 185
    :goto_a
    return-object v1

    .line 182
    :cond_b
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 183
    .local v0, "vec1":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/sigi/NameOrPseudonym;->surname:Lorg/spongycastle/asn1/x500/DirectoryString;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 184
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/sigi/NameOrPseudonym;->givenName:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 185
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    goto :goto_a
.end method
