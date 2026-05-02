.class public Lorg/spongycastle/asn1/x509/DisplayText;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "DisplayText.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1Choice;


# static fields
.field public static final CONTENT_TYPE_BMPSTRING:I = 0x1

.field public static final CONTENT_TYPE_IA5STRING:I = 0x0

.field public static final CONTENT_TYPE_UTF8STRING:I = 0x2

.field public static final CONTENT_TYPE_VISIBLESTRING:I = 0x3

.field public static final DISPLAY_TEXT_MAXIMUM_SIZE:I = 0xc8


# instance fields
.field contentType:I

.field contents:Lorg/spongycastle/asn1/ASN1String;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .registers 5
    .param p1, "type"    # I
    .param p2, "text"    # Ljava/lang/String;

    .prologue
    const/16 v1, 0xc8

    .line 71
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 72
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v1, :cond_10

    .line 76
    const/4 v0, 0x0

    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 79
    :cond_10
    iput p1, p0, Lorg/spongycastle/asn1/x509/DisplayText;->contentType:I

    .line 80
    packed-switch p1, :pswitch_data_3e

    .line 95
    new-instance v0, Lorg/spongycastle/asn1/DERUTF8String;

    invoke-direct {v0, p2}, Lorg/spongycastle/asn1/DERUTF8String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/DisplayText;->contents:Lorg/spongycastle/asn1/ASN1String;

    .line 98
    :goto_1c
    return-void

    .line 83
    :pswitch_1d
    new-instance v0, Lorg/spongycastle/asn1/DERIA5String;

    invoke-direct {v0, p2}, Lorg/spongycastle/asn1/DERIA5String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/DisplayText;->contents:Lorg/spongycastle/asn1/ASN1String;

    goto :goto_1c

    .line 86
    :pswitch_25
    new-instance v0, Lorg/spongycastle/asn1/DERUTF8String;

    invoke-direct {v0, p2}, Lorg/spongycastle/asn1/DERUTF8String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/DisplayText;->contents:Lorg/spongycastle/asn1/ASN1String;

    goto :goto_1c

    .line 89
    :pswitch_2d
    new-instance v0, Lorg/spongycastle/asn1/DERVisibleString;

    invoke-direct {v0, p2}, Lorg/spongycastle/asn1/DERVisibleString;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/DisplayText;->contents:Lorg/spongycastle/asn1/ASN1String;

    goto :goto_1c

    .line 92
    :pswitch_35
    new-instance v0, Lorg/spongycastle/asn1/DERBMPString;

    invoke-direct {v0, p2}, Lorg/spongycastle/asn1/DERBMPString;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/DisplayText;->contents:Lorg/spongycastle/asn1/ASN1String;

    goto :goto_1c

    .line 80
    nop

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_35
        :pswitch_25
        :pswitch_2d
    .end packed-switch
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    const/16 v1, 0xc8

    .line 107
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 109
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v1, :cond_10

    .line 111
    const/4 v0, 0x0

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 114
    :cond_10
    const/4 v0, 0x2

    iput v0, p0, Lorg/spongycastle/asn1/x509/DisplayText;->contentType:I

    .line 115
    new-instance v0, Lorg/spongycastle/asn1/DERUTF8String;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/DERUTF8String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/DisplayText;->contents:Lorg/spongycastle/asn1/ASN1String;

    .line 116
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1String;)V
    .registers 2
    .param p1, "de"    # Lorg/spongycastle/asn1/ASN1String;

    .prologue
    .line 126
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 127
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/DisplayText;->contents:Lorg/spongycastle/asn1/ASN1String;

    .line 128
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/DisplayText;
    .registers 4
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 132
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1String;

    if-eqz v0, :cond_d

    .line 134
    new-instance v0, Lorg/spongycastle/asn1/x509/DisplayText;

    check-cast p0, Lorg/spongycastle/asn1/ASN1String;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/x509/DisplayText;-><init>(Lorg/spongycastle/asn1/ASN1String;)V

    move-object p0, v0

    .line 138
    :goto_c
    return-object p0

    .line 136
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_d
    if-eqz p0, :cond_13

    instance-of v0, p0, Lorg/spongycastle/asn1/x509/DisplayText;

    if-eqz v0, :cond_16

    .line 138
    :cond_13
    check-cast p0, Lorg/spongycastle/asn1/x509/DisplayText;

    goto :goto_c

    .line 141
    :cond_16
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

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/DisplayText;
    .registers 3
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 148
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/x509/DisplayText;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/DisplayText;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 163
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/DisplayText;->contents:Lorg/spongycastle/asn1/ASN1String;

    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1String;->getString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 153
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/DisplayText;->contents:Lorg/spongycastle/asn1/ASN1String;

    check-cast v0, Lorg/spongycastle/asn1/ASN1Primitive;

    return-object v0
.end method
