.class public Lorg/spongycastle/asn1/dvcs/TargetEtcChain;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "TargetEtcChain.java"


# instance fields
.field private chain:Lorg/spongycastle/asn1/ASN1Sequence;

.field private pathProcInput:Lorg/spongycastle/asn1/dvcs/PathProcInput;

.field private target:Lorg/spongycastle/asn1/dvcs/CertEtcToken;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 8
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 58
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 59
    const/4 v1, 0x0

    .line 60
    .local v1, "i":I
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    .line 61
    .local v3, "obj":Lorg/spongycastle/asn1/ASN1Encodable;
    invoke-static {v3}, Lorg/spongycastle/asn1/dvcs/CertEtcToken;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/dvcs/CertEtcToken;

    move-result-object v5

    iput-object v5, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->target:Lorg/spongycastle/asn1/dvcs/CertEtcToken;

    .line 65
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    :try_start_12
    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    .line 66
    invoke-static {v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v5

    iput-object v5, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->chain:Lorg/spongycastle/asn1/ASN1Sequence;
    :try_end_1c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_12 .. :try_end_1c} :catch_3d
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_12 .. :try_end_1c} :catch_2f

    .line 78
    :goto_1c
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    :try_start_1e
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    .line 79
    invoke-static {v3}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1TaggedObject;

    move-result-object v4

    .line 80
    .local v4, "tagged":Lorg/spongycastle/asn1/ASN1TaggedObject;
    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v5

    packed-switch v5, :pswitch_data_40

    .end local v4    # "tagged":Lorg/spongycastle/asn1/ASN1TaggedObject;
    :goto_2d
    move v1, v2

    .line 93
    .end local v2    # "i":I
    .restart local v1    # "i":I
    :goto_2e
    return-void

    .line 71
    :catch_2f
    move-exception v0

    .line 73
    .local v0, "e":Ljava/lang/IndexOutOfBoundsException;
    goto :goto_2e

    .line 83
    .end local v0    # "e":Ljava/lang/IndexOutOfBoundsException;
    .end local v1    # "i":I
    .restart local v2    # "i":I
    .restart local v4    # "tagged":Lorg/spongycastle/asn1/ASN1TaggedObject;
    :pswitch_31
    const/4 v5, 0x0

    invoke-static {v4, v5}, Lorg/spongycastle/asn1/dvcs/PathProcInput;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/dvcs/PathProcInput;

    move-result-object v5

    iput-object v5, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->pathProcInput:Lorg/spongycastle/asn1/dvcs/PathProcInput;
    :try_end_38
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1e .. :try_end_38} :catch_39
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1e .. :try_end_38} :catch_3b

    goto :goto_2d

    .line 87
    .end local v4    # "tagged":Lorg/spongycastle/asn1/ASN1TaggedObject;
    :catch_39
    move-exception v5

    goto :goto_2d

    .line 90
    :catch_3b
    move-exception v5

    goto :goto_2d

    .line 68
    .end local v2    # "i":I
    .restart local v1    # "i":I
    :catch_3d
    move-exception v5

    goto :goto_1c

    .line 80
    nop

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_31
    .end packed-switch
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/dvcs/CertEtcToken;)V
    .registers 3
    .param p1, "target"    # Lorg/spongycastle/asn1/dvcs/CertEtcToken;

    .prologue
    const/4 v0, 0x0

    .line 32
    invoke-direct {p0, p1, v0, v0}, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;-><init>(Lorg/spongycastle/asn1/dvcs/CertEtcToken;[Lorg/spongycastle/asn1/dvcs/CertEtcToken;Lorg/spongycastle/asn1/dvcs/PathProcInput;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/dvcs/CertEtcToken;Lorg/spongycastle/asn1/dvcs/PathProcInput;)V
    .registers 4
    .param p1, "target"    # Lorg/spongycastle/asn1/dvcs/CertEtcToken;
    .param p2, "pathProcInput"    # Lorg/spongycastle/asn1/dvcs/PathProcInput;

    .prologue
    .line 42
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;-><init>(Lorg/spongycastle/asn1/dvcs/CertEtcToken;[Lorg/spongycastle/asn1/dvcs/CertEtcToken;Lorg/spongycastle/asn1/dvcs/PathProcInput;)V

    .line 43
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/dvcs/CertEtcToken;[Lorg/spongycastle/asn1/dvcs/CertEtcToken;)V
    .registers 4
    .param p1, "target"    # Lorg/spongycastle/asn1/dvcs/CertEtcToken;
    .param p2, "chain"    # [Lorg/spongycastle/asn1/dvcs/CertEtcToken;

    .prologue
    .line 37
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;-><init>(Lorg/spongycastle/asn1/dvcs/CertEtcToken;[Lorg/spongycastle/asn1/dvcs/CertEtcToken;Lorg/spongycastle/asn1/dvcs/PathProcInput;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/dvcs/CertEtcToken;[Lorg/spongycastle/asn1/dvcs/CertEtcToken;Lorg/spongycastle/asn1/dvcs/PathProcInput;)V
    .registers 5
    .param p1, "target"    # Lorg/spongycastle/asn1/dvcs/CertEtcToken;
    .param p2, "chain"    # [Lorg/spongycastle/asn1/dvcs/CertEtcToken;
    .param p3, "pathProcInput"    # Lorg/spongycastle/asn1/dvcs/PathProcInput;

    .prologue
    .line 46
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 47
    iput-object p1, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->target:Lorg/spongycastle/asn1/dvcs/CertEtcToken;

    .line 49
    if-eqz p2, :cond_e

    .line 51
    new-instance v0, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v0, p2}, Lorg/spongycastle/asn1/DERSequence;-><init>([Lorg/spongycastle/asn1/ASN1Encodable;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->chain:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 54
    :cond_e
    iput-object p3, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->pathProcInput:Lorg/spongycastle/asn1/dvcs/PathProcInput;

    .line 55
    return-void
.end method

.method public static arrayFromSequence(Lorg/spongycastle/asn1/ASN1Sequence;)[Lorg/spongycastle/asn1/dvcs/TargetEtcChain;
    .registers 4
    .param p0, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 182
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    new-array v1, v2, [Lorg/spongycastle/asn1/dvcs/TargetEtcChain;

    .line 184
    .local v1, "tmp":[Lorg/spongycastle/asn1/dvcs/TargetEtcChain;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    array-length v2, v1

    if-eq v0, v2, :cond_17

    .line 186
    invoke-virtual {p0, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/dvcs/TargetEtcChain;

    move-result-object v2

    aput-object v2, v1, v0

    .line 184
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 189
    :cond_17
    return-object v1
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/dvcs/TargetEtcChain;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 97
    instance-of v0, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;

    if-eqz v0, :cond_7

    .line 99
    check-cast p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;

    .line 106
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 101
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 103
    new-instance v0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 106
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/dvcs/TargetEtcChain;
    .registers 3
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 113
    invoke-static {p0, p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/dvcs/TargetEtcChain;

    move-result-object v0

    return-object v0
.end method

.method private setChain(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 2
    .param p1, "chain"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 167
    iput-object p1, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->chain:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 168
    return-void
.end method

.method private setPathProcInput(Lorg/spongycastle/asn1/dvcs/PathProcInput;)V
    .registers 2
    .param p1, "pathProcInput"    # Lorg/spongycastle/asn1/dvcs/PathProcInput;

    .prologue
    .line 177
    iput-object p1, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->pathProcInput:Lorg/spongycastle/asn1/dvcs/PathProcInput;

    .line 178
    return-void
.end method


# virtual methods
.method public getChain()[Lorg/spongycastle/asn1/dvcs/CertEtcToken;
    .registers 2

    .prologue
    .line 157
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->chain:Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v0, :cond_b

    .line 159
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->chain:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-static {v0}, Lorg/spongycastle/asn1/dvcs/CertEtcToken;->arrayFromSequence(Lorg/spongycastle/asn1/ASN1Sequence;)[Lorg/spongycastle/asn1/dvcs/CertEtcToken;

    move-result-object v0

    .line 162
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getPathProcInput()Lorg/spongycastle/asn1/dvcs/PathProcInput;
    .registers 2

    .prologue
    .line 172
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->pathProcInput:Lorg/spongycastle/asn1/dvcs/PathProcInput;

    return-object v0
.end method

.method public getTarget()Lorg/spongycastle/asn1/dvcs/CertEtcToken;
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->target:Lorg/spongycastle/asn1/dvcs/CertEtcToken;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 118
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 119
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->target:Lorg/spongycastle/asn1/dvcs/CertEtcToken;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 120
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->chain:Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v1, :cond_14

    .line 122
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->chain:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 124
    :cond_14
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->pathProcInput:Lorg/spongycastle/asn1/dvcs/PathProcInput;

    if-eqz v1, :cond_22

    .line 126
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->pathProcInput:Lorg/spongycastle/asn1/dvcs/PathProcInput;

    invoke-direct {v1, v3, v3, v2}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 129
    :cond_22
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 134
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 135
    .local v0, "s":Ljava/lang/StringBuffer;
    const-string v1, "TargetEtcChain {\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 136
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "target: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->target:Lorg/spongycastle/asn1/dvcs/CertEtcToken;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 137
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->chain:Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v1, :cond_4a

    .line 139
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "chain: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->chain:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 141
    :cond_4a
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->pathProcInput:Lorg/spongycastle/asn1/dvcs/PathProcInput;

    if-eqz v1, :cond_6c

    .line 143
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pathProcInput: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->pathProcInput:Lorg/spongycastle/asn1/dvcs/PathProcInput;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 145
    :cond_6c
    const-string v1, "}\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 146
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
