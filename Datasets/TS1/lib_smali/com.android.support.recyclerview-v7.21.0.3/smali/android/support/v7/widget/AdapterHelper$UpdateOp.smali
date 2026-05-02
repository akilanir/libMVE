.class Landroid/support/v7/widget/AdapterHelper$UpdateOp;
.super Ljava/lang/Object;
.source "AdapterHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/AdapterHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "UpdateOp"
.end annotation


# static fields
.field static final ADD:I = 0x0

.field static final MOVE:I = 0x3

.field static final POOL_SIZE:I = 0x1e

.field static final REMOVE:I = 0x1

.field static final UPDATE:I = 0x2


# instance fields
.field cmd:I

.field itemCount:I

.field positionStart:I


# direct methods
.method constructor <init>(III)V
    .registers 4
    .param p1, "cmd"    # I
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I

    .prologue
    .line 584
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 585
    iput p1, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    .line 586
    iput p2, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .line 587
    iput p3, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    .line 588
    return-void
.end method


# virtual methods
.method cmdToString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 591
    iget v0, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    packed-switch v0, :pswitch_data_14

    .line 601
    const-string v0, "??"

    :goto_7
    return-object v0

    .line 593
    :pswitch_8
    const-string v0, "add"

    goto :goto_7

    .line 595
    :pswitch_b
    const-string v0, "rm"

    goto :goto_7

    .line 597
    :pswitch_e
    const-string v0, "up"

    goto :goto_7

    .line 599
    :pswitch_11
    const-string v0, "mv"

    goto :goto_7

    .line 591
    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_8
        :pswitch_b
        :pswitch_e
        :pswitch_11
    .end packed-switch
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 611
    if-ne p0, p1, :cond_5

    .line 636
    :cond_4
    :goto_4
    return v1

    .line 614
    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_13

    :cond_11
    move v1, v2

    .line 615
    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 618
    check-cast v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .line 620
    .local v0, "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    iget v3, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    iget v4, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-eq v3, v4, :cond_1e

    move v1, v2

    .line 621
    goto :goto_4

    .line 623
    :cond_1e
    iget v3, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    const/4 v4, 0x3

    if-ne v3, v4, :cond_3a

    iget v3, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v4, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    sub-int/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    if-ne v3, v1, :cond_3a

    .line 625
    iget v3, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v4, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ne v3, v4, :cond_3a

    iget v3, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v4, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-eq v3, v4, :cond_4

    .line 629
    :cond_3a
    iget v3, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v4, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-eq v3, v4, :cond_42

    move v1, v2

    .line 630
    goto :goto_4

    .line 632
    :cond_42
    iget v3, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v4, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 633
    goto :goto_4
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 641
    iget v0, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    .line 642
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int v0, v1, v2

    .line 643
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int v0, v1, v2

    .line 644
    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 606
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmdToString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",s:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "c:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
