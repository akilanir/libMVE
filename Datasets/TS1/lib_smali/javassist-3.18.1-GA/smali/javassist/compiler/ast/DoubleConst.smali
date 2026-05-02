.class public Ljavassist/compiler/ast/DoubleConst;
.super Ljavassist/compiler/ast/ASTree;
.source "DoubleConst.java"


# instance fields
.field protected type:I

.field protected value:D


# direct methods
.method public constructor <init>(DI)V
    .registers 4
    .param p1, "v"    # D
    .param p3, "tokenId"    # I

    .prologue
    .line 29
    invoke-direct {p0}, Ljavassist/compiler/ast/ASTree;-><init>()V

    iput-wide p1, p0, Ljavassist/compiler/ast/DoubleConst;->value:D

    iput p3, p0, Ljavassist/compiler/ast/DoubleConst;->type:I

    return-void
.end method

.method private static compute(IDDI)Ljavassist/compiler/ast/DoubleConst;
    .registers 9
    .param p0, "op"    # I
    .param p1, "value1"    # D
    .param p3, "value2"    # D
    .param p5, "newType"    # I

    .prologue
    .line 73
    packed-switch p0, :pswitch_data_1a

    .line 90
    :pswitch_3
    const/4 v2, 0x0

    .line 93
    :goto_4
    return-object v2

    .line 75
    :pswitch_5
    add-double v0, p1, p3

    .line 93
    .local v0, "newValue":D
    :goto_7
    new-instance v2, Ljavassist/compiler/ast/DoubleConst;

    invoke-direct {v2, v0, v1, p5}, Ljavassist/compiler/ast/DoubleConst;-><init>(DI)V

    goto :goto_4

    .line 78
    .end local v0    # "newValue":D
    :pswitch_d
    sub-double v0, p1, p3

    .line 79
    .restart local v0    # "newValue":D
    goto :goto_7

    .line 81
    .end local v0    # "newValue":D
    :pswitch_10
    mul-double v0, p1, p3

    .line 82
    .restart local v0    # "newValue":D
    goto :goto_7

    .line 84
    .end local v0    # "newValue":D
    :pswitch_13
    div-double v0, p1, p3

    .line 85
    .restart local v0    # "newValue":D
    goto :goto_7

    .line 87
    .end local v0    # "newValue":D
    :pswitch_16
    rem-double v0, p1, p3

    .line 88
    .restart local v0    # "newValue":D
    goto :goto_7

    .line 73
    nop

    :pswitch_data_1a
    .packed-switch 0x25
        :pswitch_16
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_10
        :pswitch_5
        :pswitch_3
        :pswitch_d
        :pswitch_3
        :pswitch_13
    .end packed-switch
.end method

.method private compute0(ILjavassist/compiler/ast/DoubleConst;)Ljavassist/compiler/ast/DoubleConst;
    .registers 9
    .param p1, "op"    # I
    .param p2, "right"    # Ljavassist/compiler/ast/DoubleConst;

    .prologue
    const/16 v1, 0x195

    .line 56
    iget v0, p0, Ljavassist/compiler/ast/DoubleConst;->type:I

    if-eq v0, v1, :cond_a

    iget v0, p2, Ljavassist/compiler/ast/DoubleConst;->type:I

    if-ne v0, v1, :cond_16

    .line 58
    :cond_a
    const/16 v5, 0x195

    .line 62
    .local v5, "newType":I
    :goto_c
    iget-wide v1, p0, Ljavassist/compiler/ast/DoubleConst;->value:D

    iget-wide v3, p2, Ljavassist/compiler/ast/DoubleConst;->value:D

    move v0, p1

    invoke-static/range {v0 .. v5}, Ljavassist/compiler/ast/DoubleConst;->compute(IDDI)Ljavassist/compiler/ast/DoubleConst;

    move-result-object v0

    return-object v0

    .line 60
    .end local v5    # "newType":I
    :cond_16
    const/16 v5, 0x194

    .restart local v5    # "newType":I
    goto :goto_c
.end method

.method private compute0(ILjavassist/compiler/ast/IntConst;)Ljavassist/compiler/ast/DoubleConst;
    .registers 9
    .param p1, "op"    # I
    .param p2, "right"    # Ljavassist/compiler/ast/IntConst;

    .prologue
    .line 66
    iget-wide v1, p0, Ljavassist/compiler/ast/DoubleConst;->value:D

    iget-wide v3, p2, Ljavassist/compiler/ast/IntConst;->value:J

    long-to-double v3, v3

    iget v5, p0, Ljavassist/compiler/ast/DoubleConst;->type:I

    move v0, p1

    invoke-static/range {v0 .. v5}, Ljavassist/compiler/ast/DoubleConst;->compute(IDDI)Ljavassist/compiler/ast/DoubleConst;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public accept(Ljavassist/compiler/ast/Visitor;)V
    .registers 2
    .param p1, "v"    # Ljavassist/compiler/ast/Visitor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 42
    invoke-virtual {p1, p0}, Ljavassist/compiler/ast/Visitor;->atDoubleConst(Ljavassist/compiler/ast/DoubleConst;)V

    .line 43
    return-void
.end method

.method public compute(ILjavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/ASTree;
    .registers 4
    .param p1, "op"    # I
    .param p2, "right"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 46
    instance-of v0, p2, Ljavassist/compiler/ast/IntConst;

    if-eqz v0, :cond_b

    .line 47
    check-cast p2, Ljavassist/compiler/ast/IntConst;

    .end local p2    # "right":Ljavassist/compiler/ast/ASTree;
    invoke-direct {p0, p1, p2}, Ljavassist/compiler/ast/DoubleConst;->compute0(ILjavassist/compiler/ast/IntConst;)Ljavassist/compiler/ast/DoubleConst;

    move-result-object v0

    .line 51
    :goto_a
    return-object v0

    .line 48
    .restart local p2    # "right":Ljavassist/compiler/ast/ASTree;
    :cond_b
    instance-of v0, p2, Ljavassist/compiler/ast/DoubleConst;

    if-eqz v0, :cond_16

    .line 49
    check-cast p2, Ljavassist/compiler/ast/DoubleConst;

    .end local p2    # "right":Ljavassist/compiler/ast/ASTree;
    invoke-direct {p0, p1, p2}, Ljavassist/compiler/ast/DoubleConst;->compute0(ILjavassist/compiler/ast/DoubleConst;)Ljavassist/compiler/ast/DoubleConst;

    move-result-object v0

    goto :goto_a

    .line 51
    .restart local p2    # "right":Ljavassist/compiler/ast/ASTree;
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public get()D
    .registers 3

    .prologue
    .line 31
    iget-wide v0, p0, Ljavassist/compiler/ast/DoubleConst;->value:D

    return-wide v0
.end method

.method public getType()I
    .registers 2

    .prologue
    .line 37
    iget v0, p0, Ljavassist/compiler/ast/DoubleConst;->type:I

    return v0
.end method

.method public set(D)V
    .registers 3
    .param p1, "v"    # D

    .prologue
    .line 33
    iput-wide p1, p0, Ljavassist/compiler/ast/DoubleConst;->value:D

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 39
    iget-wide v0, p0, Ljavassist/compiler/ast/DoubleConst;->value:D

    invoke-static {v0, v1}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
