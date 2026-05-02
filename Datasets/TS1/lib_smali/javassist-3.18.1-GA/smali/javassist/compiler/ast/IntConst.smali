.class public Ljavassist/compiler/ast/IntConst;
.super Ljavassist/compiler/ast/ASTree;
.source "IntConst.java"


# instance fields
.field protected type:I

.field protected value:J


# direct methods
.method public constructor <init>(JI)V
    .registers 4
    .param p1, "v"    # J
    .param p3, "tokenId"    # I

    .prologue
    .line 29
    invoke-direct {p0}, Ljavassist/compiler/ast/ASTree;-><init>()V

    iput-wide p1, p0, Ljavassist/compiler/ast/IntConst;->value:J

    iput p3, p0, Ljavassist/compiler/ast/IntConst;->type:I

    return-void
.end method

.method private compute0(ILjavassist/compiler/ast/DoubleConst;)Ljavassist/compiler/ast/DoubleConst;
    .registers 11
    .param p1, "op"    # I
    .param p2, "right"    # Ljavassist/compiler/ast/DoubleConst;

    .prologue
    .line 114
    iget-wide v6, p0, Ljavassist/compiler/ast/IntConst;->value:J

    long-to-double v2, v6

    .line 115
    .local v2, "value1":D
    iget-wide v4, p2, Ljavassist/compiler/ast/DoubleConst;->value:D

    .line 117
    .local v4, "value2":D
    packed-switch p1, :pswitch_data_20

    .line 134
    :pswitch_8
    const/4 v6, 0x0

    .line 137
    :goto_9
    return-object v6

    .line 119
    :pswitch_a
    add-double v0, v2, v4

    .line 137
    .local v0, "newValue":D
    :goto_c
    new-instance v6, Ljavassist/compiler/ast/DoubleConst;

    iget v7, p2, Ljavassist/compiler/ast/DoubleConst;->type:I

    invoke-direct {v6, v0, v1, v7}, Ljavassist/compiler/ast/DoubleConst;-><init>(DI)V

    goto :goto_9

    .line 122
    .end local v0    # "newValue":D
    :pswitch_14
    sub-double v0, v2, v4

    .line 123
    .restart local v0    # "newValue":D
    goto :goto_c

    .line 125
    .end local v0    # "newValue":D
    :pswitch_17
    mul-double v0, v2, v4

    .line 126
    .restart local v0    # "newValue":D
    goto :goto_c

    .line 128
    .end local v0    # "newValue":D
    :pswitch_1a
    div-double v0, v2, v4

    .line 129
    .restart local v0    # "newValue":D
    goto :goto_c

    .line 131
    .end local v0    # "newValue":D
    :pswitch_1d
    rem-double v0, v2, v4

    .line 132
    .restart local v0    # "newValue":D
    goto :goto_c

    .line 117
    :pswitch_data_20
    .packed-switch 0x25
        :pswitch_1d
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_17
        :pswitch_a
        :pswitch_8
        :pswitch_14
        :pswitch_8
        :pswitch_1a
    .end packed-switch
.end method

.method private compute0(ILjavassist/compiler/ast/IntConst;)Ljavassist/compiler/ast/IntConst;
    .registers 15
    .param p1, "op"    # I
    .param p2, "right"    # Ljavassist/compiler/ast/IntConst;

    .prologue
    const/16 v10, 0x193

    const/16 v9, 0x191

    .line 55
    iget v3, p0, Ljavassist/compiler/ast/IntConst;->type:I

    .line 56
    .local v3, "type1":I
    iget v4, p2, Ljavassist/compiler/ast/IntConst;->type:I

    .line 58
    .local v4, "type2":I
    if-eq v3, v10, :cond_c

    if-ne v4, v10, :cond_17

    .line 59
    :cond_c
    const/16 v0, 0x193

    .line 66
    .local v0, "newType":I
    :goto_e
    iget-wide v5, p0, Ljavassist/compiler/ast/IntConst;->value:J

    .line 67
    .local v5, "value1":J
    iget-wide v7, p2, Ljavassist/compiler/ast/IntConst;->value:J

    .line 69
    .local v7, "value2":J
    sparse-switch p1, :sswitch_data_54

    .line 107
    const/4 v9, 0x0

    .line 110
    :goto_16
    return-object v9

    .line 60
    .end local v0    # "newType":I
    .end local v5    # "value1":J
    .end local v7    # "value2":J
    :cond_17
    if-ne v3, v9, :cond_1e

    if-ne v4, v9, :cond_1e

    .line 62
    const/16 v0, 0x191

    .restart local v0    # "newType":I
    goto :goto_e

    .line 64
    .end local v0    # "newType":I
    :cond_1e
    const/16 v0, 0x192

    .restart local v0    # "newType":I
    goto :goto_e

    .line 71
    .restart local v5    # "value1":J
    .restart local v7    # "value2":J
    :sswitch_21
    add-long v1, v5, v7

    .line 110
    .local v1, "newValue":J
    :goto_23
    new-instance v9, Ljavassist/compiler/ast/IntConst;

    invoke-direct {v9, v1, v2, v0}, Ljavassist/compiler/ast/IntConst;-><init>(JI)V

    goto :goto_16

    .line 74
    .end local v1    # "newValue":J
    :sswitch_29
    sub-long v1, v5, v7

    .line 75
    .restart local v1    # "newValue":J
    goto :goto_23

    .line 77
    .end local v1    # "newValue":J
    :sswitch_2c
    mul-long v1, v5, v7

    .line 78
    .restart local v1    # "newValue":J
    goto :goto_23

    .line 80
    .end local v1    # "newValue":J
    :sswitch_2f
    div-long v1, v5, v7

    .line 81
    .restart local v1    # "newValue":J
    goto :goto_23

    .line 83
    .end local v1    # "newValue":J
    :sswitch_32
    rem-long v1, v5, v7

    .line 84
    .restart local v1    # "newValue":J
    goto :goto_23

    .line 86
    .end local v1    # "newValue":J
    :sswitch_35
    or-long v1, v5, v7

    .line 87
    .restart local v1    # "newValue":J
    goto :goto_23

    .line 89
    .end local v1    # "newValue":J
    :sswitch_38
    xor-long v1, v5, v7

    .line 90
    .restart local v1    # "newValue":J
    goto :goto_23

    .line 92
    .end local v1    # "newValue":J
    :sswitch_3b
    and-long v1, v5, v7

    .line 93
    .restart local v1    # "newValue":J
    goto :goto_23

    .line 95
    .end local v1    # "newValue":J
    :sswitch_3e
    iget-wide v9, p0, Ljavassist/compiler/ast/IntConst;->value:J

    long-to-int v11, v7

    shl-long v1, v9, v11

    .line 96
    .restart local v1    # "newValue":J
    move v0, v3

    .line 97
    goto :goto_23

    .line 99
    .end local v1    # "newValue":J
    :sswitch_45
    iget-wide v9, p0, Ljavassist/compiler/ast/IntConst;->value:J

    long-to-int v11, v7

    shr-long v1, v9, v11

    .line 100
    .restart local v1    # "newValue":J
    move v0, v3

    .line 101
    goto :goto_23

    .line 103
    .end local v1    # "newValue":J
    :sswitch_4c
    iget-wide v9, p0, Ljavassist/compiler/ast/IntConst;->value:J

    long-to-int v11, v7

    ushr-long v1, v9, v11

    .line 104
    .restart local v1    # "newValue":J
    move v0, v3

    .line 105
    goto :goto_23

    .line 69
    nop

    :sswitch_data_54
    .sparse-switch
        0x25 -> :sswitch_32
        0x26 -> :sswitch_3b
        0x2a -> :sswitch_2c
        0x2b -> :sswitch_21
        0x2d -> :sswitch_29
        0x2f -> :sswitch_2f
        0x5e -> :sswitch_38
        0x7c -> :sswitch_35
        0x16c -> :sswitch_3e
        0x16e -> :sswitch_45
        0x172 -> :sswitch_4c
    .end sparse-switch
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
    invoke-virtual {p1, p0}, Ljavassist/compiler/ast/Visitor;->atIntConst(Ljavassist/compiler/ast/IntConst;)V

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
    invoke-direct {p0, p1, p2}, Ljavassist/compiler/ast/IntConst;->compute0(ILjavassist/compiler/ast/IntConst;)Ljavassist/compiler/ast/IntConst;

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
    invoke-direct {p0, p1, p2}, Ljavassist/compiler/ast/IntConst;->compute0(ILjavassist/compiler/ast/DoubleConst;)Ljavassist/compiler/ast/DoubleConst;

    move-result-object v0

    goto :goto_a

    .line 51
    .restart local p2    # "right":Ljavassist/compiler/ast/ASTree;
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public get()J
    .registers 3

    .prologue
    .line 31
    iget-wide v0, p0, Ljavassist/compiler/ast/IntConst;->value:J

    return-wide v0
.end method

.method public getType()I
    .registers 2

    .prologue
    .line 37
    iget v0, p0, Ljavassist/compiler/ast/IntConst;->type:I

    return v0
.end method

.method public set(J)V
    .registers 3
    .param p1, "v"    # J

    .prologue
    .line 33
    iput-wide p1, p0, Ljavassist/compiler/ast/IntConst;->value:J

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 39
    iget-wide v0, p0, Ljavassist/compiler/ast/IntConst;->value:J

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
