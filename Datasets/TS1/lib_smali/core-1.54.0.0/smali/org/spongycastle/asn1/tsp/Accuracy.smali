.class public Lorg/spongycastle/asn1/tsp/Accuracy;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "Accuracy.java"


# static fields
.field protected static final MAX_MICROS:I = 0x3e7

.field protected static final MAX_MILLIS:I = 0x3e7

.field protected static final MIN_MICROS:I = 0x1

.field protected static final MIN_MILLIS:I = 0x1


# instance fields
.field micros:Lorg/spongycastle/asn1/ASN1Integer;

.field millis:Lorg/spongycastle/asn1/ASN1Integer;

.field seconds:Lorg/spongycastle/asn1/ASN1Integer;


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 32
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1Integer;Lorg/spongycastle/asn1/ASN1Integer;Lorg/spongycastle/asn1/ASN1Integer;)V
    .registers 7
    .param p1, "seconds"    # Lorg/spongycastle/asn1/ASN1Integer;
    .param p2, "millis"    # Lorg/spongycastle/asn1/ASN1Integer;
    .param p3, "micros"    # Lorg/spongycastle/asn1/ASN1Integer;

    .prologue
    const/16 v2, 0x3e7

    const/4 v1, 0x1

    .line 38
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 39
    iput-object p1, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->seconds:Lorg/spongycastle/asn1/ASN1Integer;

    .line 42
    if-eqz p2, :cond_26

    .line 43
    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    move-result v0

    if-lt v0, v1, :cond_1e

    .line 44
    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    move-result v0

    if-le v0, v2, :cond_26

    .line 46
    :cond_1e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid millis field : not in (1..999)"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 51
    :cond_26
    iput-object p2, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->millis:Lorg/spongycastle/asn1/ASN1Integer;

    .line 54
    if-eqz p3, :cond_46

    .line 55
    invoke-virtual {p3}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    move-result v0

    if-lt v0, v1, :cond_3e

    .line 56
    invoke-virtual {p3}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    move-result v0

    if-le v0, v2, :cond_46

    .line 58
    :cond_3e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid micros field : not in (1..999)"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 63
    :cond_46
    iput-object p3, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->micros:Lorg/spongycastle/asn1/ASN1Integer;

    .line 66
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 8
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/16 v5, 0x3e7

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 69
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 70
    iput-object v2, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->seconds:Lorg/spongycastle/asn1/ASN1Integer;

    .line 71
    iput-object v2, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->millis:Lorg/spongycastle/asn1/ASN1Integer;

    .line 72
    iput-object v2, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->micros:Lorg/spongycastle/asn1/ASN1Integer;

    .line 74
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    if-ge v1, v2, :cond_91

    .line 77
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    instance-of v2, v2, Lorg/spongycastle/asn1/ASN1Integer;

    if-eqz v2, :cond_28

    .line 79
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/asn1/ASN1Integer;

    iput-object v2, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->seconds:Lorg/spongycastle/asn1/ASN1Integer;

    .line 74
    :cond_25
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 81
    :cond_28
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    instance-of v2, v2, Lorg/spongycastle/asn1/DERTaggedObject;

    if-eqz v2, :cond_25

    .line 83
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 85
    .local v0, "extra":Lorg/spongycastle/asn1/DERTaggedObject;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/DERTaggedObject;->getTagNo()I

    move-result v2

    packed-switch v2, :pswitch_data_92

    .line 106
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Invalig tag number"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 88
    :pswitch_45
    invoke-static {v0, v3}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->millis:Lorg/spongycastle/asn1/ASN1Integer;

    .line 89
    iget-object v2, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->millis:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/math/BigInteger;->intValue()I

    move-result v2

    if-lt v2, v4, :cond_63

    iget-object v2, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->millis:Lorg/spongycastle/asn1/ASN1Integer;

    .line 90
    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/math/BigInteger;->intValue()I

    move-result v2

    if-le v2, v5, :cond_25

    .line 92
    :cond_63
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Invalid millis field : not in (1..999)."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 97
    :pswitch_6b
    invoke-static {v0, v3}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->micros:Lorg/spongycastle/asn1/ASN1Integer;

    .line 98
    iget-object v2, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->micros:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/math/BigInteger;->intValue()I

    move-result v2

    if-lt v2, v4, :cond_89

    iget-object v2, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->micros:Lorg/spongycastle/asn1/ASN1Integer;

    .line 99
    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/math/BigInteger;->intValue()I

    move-result v2

    if-le v2, v5, :cond_25

    .line 101
    :cond_89
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Invalid micros field : not in (1..999)."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 110
    .end local v0    # "extra":Lorg/spongycastle/asn1/DERTaggedObject;
    :cond_91
    return-void

    .line 85
    :pswitch_data_92
    .packed-switch 0x0
        :pswitch_45
        :pswitch_6b
    .end packed-switch
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/tsp/Accuracy;
    .registers 3
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 114
    instance-of v0, p0, Lorg/spongycastle/asn1/tsp/Accuracy;

    if-eqz v0, :cond_7

    .line 116
    check-cast p0, Lorg/spongycastle/asn1/tsp/Accuracy;

    .line 124
    .end local p0    # "o":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 119
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 121
    new-instance v0, Lorg/spongycastle/asn1/tsp/Accuracy;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/tsp/Accuracy;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 124
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getMicros()Lorg/spongycastle/asn1/ASN1Integer;
    .registers 2

    .prologue
    .line 139
    iget-object v0, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->micros:Lorg/spongycastle/asn1/ASN1Integer;

    return-object v0
.end method

.method public getMillis()Lorg/spongycastle/asn1/ASN1Integer;
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->millis:Lorg/spongycastle/asn1/ASN1Integer;

    return-object v0
.end method

.method public getSeconds()Lorg/spongycastle/asn1/ASN1Integer;
    .registers 2

    .prologue
    .line 129
    iget-object v0, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->seconds:Lorg/spongycastle/asn1/ASN1Integer;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 154
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 156
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->seconds:Lorg/spongycastle/asn1/ASN1Integer;

    if-eqz v1, :cond_f

    .line 158
    iget-object v1, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->seconds:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 161
    :cond_f
    iget-object v1, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->millis:Lorg/spongycastle/asn1/ASN1Integer;

    if-eqz v1, :cond_1d

    .line 163
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    iget-object v2, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->millis:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-direct {v1, v4, v4, v2}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 166
    :cond_1d
    iget-object v1, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->micros:Lorg/spongycastle/asn1/ASN1Integer;

    if-eqz v1, :cond_2c

    .line 168
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v2, 0x1

    iget-object v3, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->micros:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-direct {v1, v4, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 171
    :cond_2c
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method
