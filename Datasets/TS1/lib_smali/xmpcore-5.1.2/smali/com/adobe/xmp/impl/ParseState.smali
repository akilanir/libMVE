.class Lcom/adobe/xmp/impl/ParseState;
.super Ljava/lang/Object;
.source "ISO8601Converter.java"


# instance fields
.field private pos:I

.field private str:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 402
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 395
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/xmp/impl/ParseState;->pos:I

    .line 403
    iput-object p1, p0, Lcom/adobe/xmp/impl/ParseState;->str:Ljava/lang/String;

    .line 404
    return-void
.end method


# virtual methods
.method public ch()C
    .registers 3

    .prologue
    .line 442
    iget v0, p0, Lcom/adobe/xmp/impl/ParseState;->pos:I

    iget-object v1, p0, Lcom/adobe/xmp/impl/ParseState;->str:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_13

    iget-object v0, p0, Lcom/adobe/xmp/impl/ParseState;->str:Ljava/lang/String;

    iget v1, p0, Lcom/adobe/xmp/impl/ParseState;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    :goto_12
    return v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public ch(I)C
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 431
    iget-object v0, p0, Lcom/adobe/xmp/impl/ParseState;->str:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge p1, v0, :cond_f

    iget-object v0, p0, Lcom/adobe/xmp/impl/ParseState;->str:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public gatherInt(Ljava/lang/String;I)I
    .registers 8
    .param p1, "errorMsg"    # Ljava/lang/String;
    .param p2, "maxValue"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 475
    const/4 v2, 0x0

    .line 476
    .local v2, "value":I
    const/4 v1, 0x0

    .line 477
    .local v1, "success":Z
    iget v3, p0, Lcom/adobe/xmp/impl/ParseState;->pos:I

    invoke-virtual {p0, v3}, Lcom/adobe/xmp/impl/ParseState;->ch(I)C

    move-result v0

    .line 478
    .local v0, "ch":C
    :goto_8
    const/16 v3, 0x30

    if-gt v3, v0, :cond_24

    const/16 v3, 0x39

    if-gt v0, v3, :cond_24

    .line 480
    mul-int/lit8 v3, v2, 0xa

    add-int/lit8 v4, v0, -0x30

    add-int v2, v3, v4

    .line 481
    const/4 v1, 0x1

    .line 482
    iget v3, p0, Lcom/adobe/xmp/impl/ParseState;->pos:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/adobe/xmp/impl/ParseState;->pos:I

    .line 483
    iget v3, p0, Lcom/adobe/xmp/impl/ParseState;->pos:I

    invoke-virtual {p0, v3}, Lcom/adobe/xmp/impl/ParseState;->ch(I)C

    move-result v0

    goto :goto_8

    .line 486
    :cond_24
    if-eqz v1, :cond_2f

    .line 488
    if-le v2, p2, :cond_29

    .line 498
    .end local p2    # "maxValue":I
    :goto_28
    return p2

    .line 492
    .restart local p2    # "maxValue":I
    :cond_29
    if-gez v2, :cond_2d

    .line 494
    const/4 p2, 0x0

    goto :goto_28

    :cond_2d
    move p2, v2

    .line 498
    goto :goto_28

    .line 503
    :cond_2f
    new-instance v3, Lcom/adobe/xmp/XMPException;

    const/4 v4, 0x5

    invoke-direct {v3, p1, v4}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v3
.end method

.method public hasNext()Z
    .registers 3

    .prologue
    .line 421
    iget v0, p0, Lcom/adobe/xmp/impl/ParseState;->pos:I

    iget-object v1, p0, Lcom/adobe/xmp/impl/ParseState;->str:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public length()I
    .registers 2

    .prologue
    .line 412
    iget-object v0, p0, Lcom/adobe/xmp/impl/ParseState;->str:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    return v0
.end method

.method public pos()I
    .registers 2

    .prologue
    .line 462
    iget v0, p0, Lcom/adobe/xmp/impl/ParseState;->pos:I

    return v0
.end method

.method public skip()V
    .registers 2

    .prologue
    .line 453
    iget v0, p0, Lcom/adobe/xmp/impl/ParseState;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/adobe/xmp/impl/ParseState;->pos:I

    .line 454
    return-void
.end method
