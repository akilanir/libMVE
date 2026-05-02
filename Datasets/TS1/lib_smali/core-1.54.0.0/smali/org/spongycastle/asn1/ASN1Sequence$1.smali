.class Lorg/spongycastle/asn1/ASN1Sequence$1;
.super Ljava/lang/Object;
.source "ASN1Sequence.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1SequenceParser;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/spongycastle/asn1/ASN1Sequence;->parser()Lorg/spongycastle/asn1/ASN1SequenceParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private index:I

.field private final max:I

.field final synthetic this$0:Lorg/spongycastle/asn1/ASN1Sequence;

.field final synthetic val$outer:Lorg/spongycastle/asn1/ASN1Sequence;


# direct methods
.method constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 4
    .param p1, "this$0"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 229
    iput-object p1, p0, Lorg/spongycastle/asn1/ASN1Sequence$1;->this$0:Lorg/spongycastle/asn1/ASN1Sequence;

    iput-object p2, p0, Lorg/spongycastle/asn1/ASN1Sequence$1;->val$outer:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 230
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1Sequence$1;->this$0:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/asn1/ASN1Sequence$1;->max:I

    return-void
.end method


# virtual methods
.method public getLoadedObject()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 256
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1Sequence$1;->val$outer:Lorg/spongycastle/asn1/ASN1Sequence;

    return-object v0
.end method

.method public readObject()Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 236
    iget v1, p0, Lorg/spongycastle/asn1/ASN1Sequence$1;->index:I

    iget v2, p0, Lorg/spongycastle/asn1/ASN1Sequence$1;->max:I

    if-ne v1, v2, :cond_8

    .line 238
    const/4 v0, 0x0

    .line 251
    :cond_7
    :goto_7
    return-object v0

    .line 241
    :cond_8
    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1Sequence$1;->this$0:Lorg/spongycastle/asn1/ASN1Sequence;

    iget v2, p0, Lorg/spongycastle/asn1/ASN1Sequence$1;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/spongycastle/asn1/ASN1Sequence$1;->index:I

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    .line 242
    .local v0, "obj":Lorg/spongycastle/asn1/ASN1Encodable;
    instance-of v1, v0, Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v1, :cond_1f

    .line 244
    check-cast v0, Lorg/spongycastle/asn1/ASN1Sequence;

    .end local v0    # "obj":Lorg/spongycastle/asn1/ASN1Encodable;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Sequence;->parser()Lorg/spongycastle/asn1/ASN1SequenceParser;

    move-result-object v0

    goto :goto_7

    .line 246
    .restart local v0    # "obj":Lorg/spongycastle/asn1/ASN1Encodable;
    :cond_1f
    instance-of v1, v0, Lorg/spongycastle/asn1/ASN1Set;

    if-eqz v1, :cond_7

    .line 248
    check-cast v0, Lorg/spongycastle/asn1/ASN1Set;

    .end local v0    # "obj":Lorg/spongycastle/asn1/ASN1Encodable;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Set;->parser()Lorg/spongycastle/asn1/ASN1SetParser;

    move-result-object v0

    goto :goto_7
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 261
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1Sequence$1;->val$outer:Lorg/spongycastle/asn1/ASN1Sequence;

    return-object v0
.end method
