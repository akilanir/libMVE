.class public Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;
.super Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;
.source "SecT571K1Point.java"


# direct methods
.method public constructor <init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;)V
    .registers 5
    .param p1, "curve"    # Lorg/spongycastle/math/ec/ECCurve;
    .param p2, "x"    # Lorg/spongycastle/math/ec/ECFieldElement;
    .param p3, "y"    # Lorg/spongycastle/math/ec/ECFieldElement;

    .prologue
    .line 16
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;Z)V

    .line 17
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;Z)V
    .registers 8
    .param p1, "curve"    # Lorg/spongycastle/math/ec/ECCurve;
    .param p2, "x"    # Lorg/spongycastle/math/ec/ECFieldElement;
    .param p3, "y"    # Lorg/spongycastle/math/ec/ECFieldElement;
    .param p4, "withCompression"    # Z

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 24
    invoke-direct {p0, p1, p2, p3}, Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;)V

    .line 26
    if-nez p2, :cond_14

    move v2, v0

    :goto_8
    if-nez p3, :cond_16

    :goto_a
    if-eq v2, v0, :cond_18

    .line 28
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Exactly one of the field elements is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_14
    move v2, v1

    .line 26
    goto :goto_8

    :cond_16
    move v0, v1

    goto :goto_a

    .line 31
    :cond_18
    iput-boolean p4, p0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->withCompression:Z

    .line 32
    return-void
.end method

.method constructor <init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;[Lorg/spongycastle/math/ec/ECFieldElement;Z)V
    .registers 6
    .param p1, "curve"    # Lorg/spongycastle/math/ec/ECCurve;
    .param p2, "x"    # Lorg/spongycastle/math/ec/ECFieldElement;
    .param p3, "y"    # Lorg/spongycastle/math/ec/ECFieldElement;
    .param p4, "zs"    # [Lorg/spongycastle/math/ec/ECFieldElement;
    .param p5, "withCompression"    # Z

    .prologue
    .line 36
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;[Lorg/spongycastle/math/ec/ECFieldElement;)V

    .line 38
    iput-boolean p5, p0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->withCompression:Z

    .line 39
    return-void
.end method


# virtual methods
.method public add(Lorg/spongycastle/math/ec/ECPoint;)Lorg/spongycastle/math/ec/ECPoint;
    .registers 33
    .param p1, "b"    # Lorg/spongycastle/math/ec/ECPoint;

    .prologue
    .line 83
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->isInfinity()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 191
    .end local p1    # "b":Lorg/spongycastle/math/ec/ECPoint;
    :goto_6
    return-object p1

    .line 87
    .restart local p1    # "b":Lorg/spongycastle/math/ec/ECPoint;
    :cond_7
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/math/ec/ECPoint;->isInfinity()Z

    move-result v2

    if-eqz v2, :cond_10

    move-object/from16 p1, p0

    .line 89
    goto :goto_6

    .line 92
    :cond_10
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v3

    .line 94
    .local v3, "curve":Lorg/spongycastle/math/ec/ECCurve;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->x:Lorg/spongycastle/math/ec/ECFieldElement;

    move-object/from16 v20, v0

    .line 95
    .local v20, "X1":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/math/ec/ECPoint;->getRawXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v21

    .line 97
    .local v21, "X2":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual/range {v20 .. v20}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v2

    if-eqz v2, :cond_38

    .line 99
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v2

    if-eqz v2, :cond_2f

    .line 101
    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECCurve;->getInfinity()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object p1

    goto :goto_6

    .line 104
    :cond_2f
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/spongycastle/math/ec/ECPoint;->add(Lorg/spongycastle/math/ec/ECPoint;)Lorg/spongycastle/math/ec/ECPoint;

    move-result-object p1

    goto :goto_6

    .line 107
    :cond_38
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->y:Lorg/spongycastle/math/ec/ECFieldElement;

    .local v14, "L1":Lorg/spongycastle/math/ec/ECFieldElement;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->zs:[Lorg/spongycastle/math/ec/ECFieldElement;

    const/4 v6, 0x0

    aget-object v25, v2, v6

    .line 108
    .local v25, "Z1":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/math/ec/ECPoint;->getRawYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v15

    .local v15, "L2":Lorg/spongycastle/math/ec/ECFieldElement;
    const/4 v2, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lorg/spongycastle/math/ec/ECPoint;->getZCoord(I)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v27

    .line 110
    .local v27, "Z2":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual/range {v25 .. v25}, Lorg/spongycastle/math/ec/ECFieldElement;->isOne()Z

    move-result v26

    .line 111
    .local v26, "Z1IsOne":Z
    move-object/from16 v19, v21

    .local v19, "U2":Lorg/spongycastle/math/ec/ECFieldElement;
    move-object/from16 v17, v15

    .line 112
    .local v17, "S2":Lorg/spongycastle/math/ec/ECFieldElement;
    if-nez v26, :cond_68

    .line 114
    move-object/from16 v0, v19

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v19

    .line 115
    move-object/from16 v0, v17

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v17

    .line 118
    :cond_68
    invoke-virtual/range {v27 .. v27}, Lorg/spongycastle/math/ec/ECFieldElement;->isOne()Z

    move-result v28

    .line 119
    .local v28, "Z2IsOne":Z
    move-object/from16 v18, v20

    .local v18, "U1":Lorg/spongycastle/math/ec/ECFieldElement;
    move-object/from16 v16, v14

    .line 120
    .local v16, "S1":Lorg/spongycastle/math/ec/ECFieldElement;
    if-nez v28, :cond_82

    .line 122
    move-object/from16 v0, v18

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v18

    .line 123
    move-object/from16 v0, v16

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v16

    .line 126
    :cond_82
    invoke-virtual/range {v16 .. v17}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v8

    .line 127
    .local v8, "A":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual/range {v18 .. v19}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v12

    .line 129
    .local v12, "B":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual {v12}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v2

    if-eqz v2, :cond_a2

    .line 131
    invoke-virtual {v8}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v2

    if-eqz v2, :cond_9c

    .line 133
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->twice()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object p1

    goto/16 :goto_6

    .line 136
    :cond_9c
    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECCurve;->getInfinity()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object p1

    goto/16 :goto_6

    .line 140
    :cond_a2
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v2

    if-eqz v2, :cond_120

    .line 143
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->normalize()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v30

    .line 144
    .local v30, "p":Lorg/spongycastle/math/ec/ECPoint;
    invoke-virtual/range {v30 .. v30}, Lorg/spongycastle/math/ec/ECPoint;->getXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v20

    .line 145
    invoke-virtual/range {v30 .. v30}, Lorg/spongycastle/math/ec/ECPoint;->getYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v22

    .line 147
    .local v22, "Y1":Lorg/spongycastle/math/ec/ECFieldElement;
    move-object/from16 v23, v15

    .line 148
    .local v23, "Y2":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual/range {v22 .. v23}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    move-object/from16 v0, v20

    invoke-virtual {v2, v0}, Lorg/spongycastle/math/ec/ECFieldElement;->divide(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v13

    .line 151
    .local v13, "L":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual {v13}, Lorg/spongycastle/math/ec/ECFieldElement;->square()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    invoke-virtual {v2, v13}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    move-object/from16 v0, v20

    invoke-virtual {v2, v0}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/math/ec/ECFieldElement;->addOne()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v4

    .line 152
    .local v4, "X3":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual {v4}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v2

    if-eqz v2, :cond_e9

    .line 155
    new-instance p1, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;

    .end local p1    # "b":Lorg/spongycastle/math/ec/ECPoint;
    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECCurve;->getB()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    move-object/from16 v0, p0

    iget-boolean v6, v0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->withCompression:Z

    move-object/from16 v0, p1

    invoke-direct {v0, v3, v4, v2, v6}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;Z)V

    goto/16 :goto_6

    .line 158
    .restart local p1    # "b":Lorg/spongycastle/math/ec/ECPoint;
    :cond_e9
    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    invoke-virtual {v13, v2}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    invoke-virtual {v2, v4}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    move-object/from16 v0, v22

    invoke-virtual {v2, v0}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v24

    .line 159
    .local v24, "Y3":Lorg/spongycastle/math/ec/ECFieldElement;
    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Lorg/spongycastle/math/ec/ECFieldElement;->divide(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    invoke-virtual {v2, v4}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v5

    .line 160
    .local v5, "L3":Lorg/spongycastle/math/ec/ECFieldElement;
    sget-object v2, Lorg/spongycastle/math/ec/ECConstants;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v3, v2}, Lorg/spongycastle/math/ec/ECCurve;->fromBigInteger(Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v29

    .line 191
    .end local v13    # "L":Lorg/spongycastle/math/ec/ECFieldElement;
    .end local v22    # "Y1":Lorg/spongycastle/math/ec/ECFieldElement;
    .end local v23    # "Y2":Lorg/spongycastle/math/ec/ECFieldElement;
    .end local v24    # "Y3":Lorg/spongycastle/math/ec/ECFieldElement;
    .end local v30    # "p":Lorg/spongycastle/math/ec/ECPoint;
    .local v29, "Z3":Lorg/spongycastle/math/ec/ECFieldElement;
    :cond_10d
    :goto_10d
    new-instance v2, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;

    const/4 v6, 0x1

    new-array v6, v6, [Lorg/spongycastle/math/ec/ECFieldElement;

    const/4 v7, 0x0

    aput-object v29, v6, v7

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->withCompression:Z

    invoke-direct/range {v2 .. v7}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;[Lorg/spongycastle/math/ec/ECFieldElement;Z)V

    move-object/from16 p1, v2

    goto/16 :goto_6

    .line 164
    .end local v4    # "X3":Lorg/spongycastle/math/ec/ECFieldElement;
    .end local v5    # "L3":Lorg/spongycastle/math/ec/ECFieldElement;
    .end local v29    # "Z3":Lorg/spongycastle/math/ec/ECFieldElement;
    :cond_120
    invoke-virtual {v12}, Lorg/spongycastle/math/ec/ECFieldElement;->square()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v12

    .line 166
    move-object/from16 v0, v18

    invoke-virtual {v8, v0}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v10

    .line 167
    .local v10, "AU1":Lorg/spongycastle/math/ec/ECFieldElement;
    move-object/from16 v0, v19

    invoke-virtual {v8, v0}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v11

    .line 169
    .local v11, "AU2":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual {v10, v11}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v4

    .line 170
    .restart local v4    # "X3":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual {v4}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v2

    if-eqz v2, :cond_14b

    .line 173
    new-instance p1, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;

    .end local p1    # "b":Lorg/spongycastle/math/ec/ECPoint;
    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECCurve;->getB()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    move-object/from16 v0, p0

    iget-boolean v6, v0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->withCompression:Z

    move-object/from16 v0, p1

    invoke-direct {v0, v3, v4, v2, v6}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;Z)V

    goto/16 :goto_6

    .line 176
    .restart local p1    # "b":Lorg/spongycastle/math/ec/ECPoint;
    :cond_14b
    invoke-virtual {v8, v12}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v9

    .line 177
    .local v9, "ABZ2":Lorg/spongycastle/math/ec/ECFieldElement;
    if-nez v28, :cond_157

    .line 179
    move-object/from16 v0, v27

    invoke-virtual {v9, v0}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v9

    .line 182
    :cond_157
    invoke-virtual {v11, v12}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    move-object/from16 v0, v25

    invoke-virtual {v14, v0}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v6

    invoke-virtual {v2, v9, v6}, Lorg/spongycastle/math/ec/ECFieldElement;->squarePlusProduct(Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v5

    .line 184
    .restart local v5    # "L3":Lorg/spongycastle/math/ec/ECFieldElement;
    move-object/from16 v29, v9

    .line 185
    .restart local v29    # "Z3":Lorg/spongycastle/math/ec/ECFieldElement;
    if-nez v26, :cond_10d

    .line 187
    move-object/from16 v0, v29

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v29

    goto :goto_10d
.end method

.method protected detach()Lorg/spongycastle/math/ec/ECPoint;
    .registers 5

    .prologue
    .line 43
    new-instance v0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;

    const/4 v1, 0x0

    invoke-virtual {p0}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->getAffineXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    invoke-virtual {p0}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->getAffineYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;)V

    return-object v0
.end method

.method protected getCompressionYTilde()Z
    .registers 6

    .prologue
    const/4 v2, 0x0

    .line 69
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->getRawXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v0

    .line 70
    .local v0, "X":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v3

    if-eqz v3, :cond_c

    .line 78
    :cond_b
    :goto_b
    return v2

    .line 75
    :cond_c
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->getRawYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v1

    .line 78
    .local v1, "Y":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual {v1}, Lorg/spongycastle/math/ec/ECFieldElement;->testBitZero()Z

    move-result v3

    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECFieldElement;->testBitZero()Z

    move-result v4

    if-eq v3, v4, :cond_b

    const/4 v2, 0x1

    goto :goto_b
.end method

.method public getYCoord()Lorg/spongycastle/math/ec/ECFieldElement;
    .registers 7

    .prologue
    .line 48
    iget-object v1, p0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->x:Lorg/spongycastle/math/ec/ECFieldElement;

    .local v1, "X":Lorg/spongycastle/math/ec/ECFieldElement;
    iget-object v0, p0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->y:Lorg/spongycastle/math/ec/ECFieldElement;

    .line 50
    .local v0, "L":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->isInfinity()Z

    move-result v4

    if-nez v4, :cond_10

    invoke-virtual {v1}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v4

    if-eqz v4, :cond_12

    :cond_10
    move-object v2, v0

    .line 64
    :cond_11
    :goto_11
    return-object v2

    .line 56
    :cond_12
    invoke-virtual {v0, v1}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v4

    invoke-virtual {v4, v1}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    .line 58
    .local v2, "Y":Lorg/spongycastle/math/ec/ECFieldElement;
    iget-object v4, p0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->zs:[Lorg/spongycastle/math/ec/ECFieldElement;

    const/4 v5, 0x0

    aget-object v3, v4, v5

    .line 59
    .local v3, "Z":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECFieldElement;->isOne()Z

    move-result v4

    if-nez v4, :cond_11

    .line 61
    invoke-virtual {v2, v3}, Lorg/spongycastle/math/ec/ECFieldElement;->divide(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    goto :goto_11
.end method

.method public negate()Lorg/spongycastle/math/ec/ECPoint;
    .registers 9

    .prologue
    const/4 v5, 0x0

    .line 309
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->isInfinity()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 322
    .end local p0    # "this":Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;
    :cond_7
    :goto_7
    return-object p0

    .line 314
    .restart local p0    # "this":Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;
    :cond_8
    iget-object v2, p0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->x:Lorg/spongycastle/math/ec/ECFieldElement;

    .line 315
    .local v2, "X":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual {v2}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v0

    if-nez v0, :cond_7

    .line 321
    iget-object v6, p0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->y:Lorg/spongycastle/math/ec/ECFieldElement;

    .local v6, "L":Lorg/spongycastle/math/ec/ECFieldElement;
    iget-object v0, p0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->zs:[Lorg/spongycastle/math/ec/ECFieldElement;

    aget-object v7, v0, v5

    .line 322
    .local v7, "Z":Lorg/spongycastle/math/ec/ECFieldElement;
    new-instance v0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;

    iget-object v1, p0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->curve:Lorg/spongycastle/math/ec/ECCurve;

    invoke-virtual {v6, v7}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Lorg/spongycastle/math/ec/ECFieldElement;

    aput-object v7, v4, v5

    iget-boolean v5, p0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->withCompression:Z

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;[Lorg/spongycastle/math/ec/ECFieldElement;Z)V

    move-object p0, v0

    goto :goto_7
.end method

.method public twice()Lorg/spongycastle/math/ec/ECPoint;
    .registers 16

    .prologue
    const/4 v5, 0x0

    .line 196
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->isInfinity()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 238
    .end local p0    # "this":Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;
    .local v1, "curve":Lorg/spongycastle/math/ec/ECCurve;
    .local v6, "L1":Lorg/spongycastle/math/ec/ECFieldElement;
    .local v7, "T":Lorg/spongycastle/math/ec/ECFieldElement;
    .local v8, "X1":Lorg/spongycastle/math/ec/ECFieldElement;
    .local v9, "Z1":Lorg/spongycastle/math/ec/ECFieldElement;
    .local v10, "Z1IsOne":Z
    .local v11, "Z1Sq":Lorg/spongycastle/math/ec/ECFieldElement;
    :goto_7
    return-object p0

    .line 201
    .end local v1    # "curve":Lorg/spongycastle/math/ec/ECCurve;
    .end local v6    # "L1":Lorg/spongycastle/math/ec/ECFieldElement;
    .end local v7    # "T":Lorg/spongycastle/math/ec/ECFieldElement;
    .end local v8    # "X1":Lorg/spongycastle/math/ec/ECFieldElement;
    .end local v9    # "Z1":Lorg/spongycastle/math/ec/ECFieldElement;
    .end local v10    # "Z1IsOne":Z
    .end local v11    # "Z1Sq":Lorg/spongycastle/math/ec/ECFieldElement;
    .restart local p0    # "this":Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;
    :cond_8
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v1

    .line 203
    .restart local v1    # "curve":Lorg/spongycastle/math/ec/ECCurve;
    iget-object v8, p0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->x:Lorg/spongycastle/math/ec/ECFieldElement;

    .line 204
    .restart local v8    # "X1":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual {v8}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v0

    if-eqz v0, :cond_19

    .line 207
    invoke-virtual {v1}, Lorg/spongycastle/math/ec/ECCurve;->getInfinity()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object p0

    goto :goto_7

    .line 211
    :cond_19
    iget-object v6, p0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->y:Lorg/spongycastle/math/ec/ECFieldElement;

    .restart local v6    # "L1":Lorg/spongycastle/math/ec/ECFieldElement;
    iget-object v0, p0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->zs:[Lorg/spongycastle/math/ec/ECFieldElement;

    aget-object v9, v0, v5

    .line 213
    .restart local v9    # "Z1":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual {v9}, Lorg/spongycastle/math/ec/ECFieldElement;->isOne()Z

    move-result v10

    .line 214
    .restart local v10    # "Z1IsOne":Z
    if-eqz v10, :cond_43

    move-object v11, v9

    .line 216
    .restart local v11    # "Z1Sq":Lorg/spongycastle/math/ec/ECFieldElement;
    :goto_26
    if-eqz v10, :cond_48

    .line 218
    invoke-virtual {v6}, Lorg/spongycastle/math/ec/ECFieldElement;->square()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v0

    invoke-virtual {v0, v6}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v7

    .line 225
    .restart local v7    # "T":Lorg/spongycastle/math/ec/ECFieldElement;
    :goto_30
    invoke-virtual {v7}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v0

    if-eqz v0, :cond_51

    .line 228
    new-instance v0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;

    invoke-virtual {v1}, Lorg/spongycastle/math/ec/ECCurve;->getB()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v4

    iget-boolean v5, p0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->withCompression:Z

    invoke-direct {v0, v1, v7, v4, v5}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;Z)V

    move-object p0, v0

    goto :goto_7

    .line 214
    .end local v7    # "T":Lorg/spongycastle/math/ec/ECFieldElement;
    .end local v11    # "Z1Sq":Lorg/spongycastle/math/ec/ECFieldElement;
    :cond_43
    invoke-virtual {v9}, Lorg/spongycastle/math/ec/ECFieldElement;->square()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v11

    goto :goto_26

    .line 222
    .restart local v11    # "Z1Sq":Lorg/spongycastle/math/ec/ECFieldElement;
    :cond_48
    invoke-virtual {v6, v9}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v0

    invoke-virtual {v0, v6}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v7

    .restart local v7    # "T":Lorg/spongycastle/math/ec/ECFieldElement;
    goto :goto_30

    .line 231
    :cond_51
    invoke-virtual {v7}, Lorg/spongycastle/math/ec/ECFieldElement;->square()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    .line 232
    .local v2, "X3":Lorg/spongycastle/math/ec/ECFieldElement;
    if-eqz v10, :cond_8a

    move-object v12, v7

    .line 234
    .local v12, "Z3":Lorg/spongycastle/math/ec/ECFieldElement;
    :goto_58
    invoke-virtual {v6, v8}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECFieldElement;->square()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v13

    .line 235
    .local v13, "t1":Lorg/spongycastle/math/ec/ECFieldElement;
    if-eqz v10, :cond_8f

    move-object v14, v9

    .line 236
    .local v14, "t2":Lorg/spongycastle/math/ec/ECFieldElement;
    :goto_63
    invoke-virtual {v13, v7}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v0

    invoke-virtual {v0, v11}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v0

    invoke-virtual {v0, v13}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v0

    invoke-virtual {v0, v14}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v0

    invoke-virtual {v0, v2}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v0

    invoke-virtual {v0, v12}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v3

    .line 238
    .local v3, "L3":Lorg/spongycastle/math/ec/ECFieldElement;
    new-instance v0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;

    const/4 v4, 0x1

    new-array v4, v4, [Lorg/spongycastle/math/ec/ECFieldElement;

    aput-object v12, v4, v5

    iget-boolean v5, p0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->withCompression:Z

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;[Lorg/spongycastle/math/ec/ECFieldElement;Z)V

    move-object p0, v0

    goto/16 :goto_7

    .line 232
    .end local v3    # "L3":Lorg/spongycastle/math/ec/ECFieldElement;
    .end local v12    # "Z3":Lorg/spongycastle/math/ec/ECFieldElement;
    .end local v13    # "t1":Lorg/spongycastle/math/ec/ECFieldElement;
    .end local v14    # "t2":Lorg/spongycastle/math/ec/ECFieldElement;
    :cond_8a
    invoke-virtual {v7, v11}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v12

    goto :goto_58

    .line 235
    .restart local v12    # "Z3":Lorg/spongycastle/math/ec/ECFieldElement;
    .restart local v13    # "t1":Lorg/spongycastle/math/ec/ECFieldElement;
    :cond_8f
    invoke-virtual {v11}, Lorg/spongycastle/math/ec/ECFieldElement;->square()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v14

    goto :goto_63
.end method

.method public twicePlus(Lorg/spongycastle/math/ec/ECPoint;)Lorg/spongycastle/math/ec/ECPoint;
    .registers 26
    .param p1, "b"    # Lorg/spongycastle/math/ec/ECPoint;

    .prologue
    .line 243
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->isInfinity()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 304
    .end local p1    # "b":Lorg/spongycastle/math/ec/ECPoint;
    :cond_6
    :goto_6
    return-object p1

    .line 247
    .restart local p1    # "b":Lorg/spongycastle/math/ec/ECPoint;
    :cond_7
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/math/ec/ECPoint;->isInfinity()Z

    move-result v2

    if-eqz v2, :cond_12

    .line 249
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->twice()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object p1

    goto :goto_6

    .line 252
    :cond_12
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v3

    .line 254
    .local v3, "curve":Lorg/spongycastle/math/ec/ECCurve;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->x:Lorg/spongycastle/math/ec/ECFieldElement;

    move-object/from16 v16, v0

    .line 255
    .local v16, "X1":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual/range {v16 .. v16}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v2

    if-nez v2, :cond_6

    .line 262
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/math/ec/ECPoint;->getRawXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v18

    .local v18, "X2":Lorg/spongycastle/math/ec/ECFieldElement;
    const/4 v2, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lorg/spongycastle/math/ec/ECPoint;->getZCoord(I)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v22

    .line 263
    .local v22, "Z2":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual/range {v18 .. v18}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v2

    if-nez v2, :cond_39

    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/math/ec/ECFieldElement;->isOne()Z

    move-result v2

    if-nez v2, :cond_44

    .line 265
    :cond_39
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->twice()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Lorg/spongycastle/math/ec/ECPoint;->add(Lorg/spongycastle/math/ec/ECPoint;)Lorg/spongycastle/math/ec/ECPoint;

    move-result-object p1

    goto :goto_6

    .line 268
    :cond_44
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->y:Lorg/spongycastle/math/ec/ECFieldElement;

    .local v10, "L1":Lorg/spongycastle/math/ec/ECFieldElement;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->zs:[Lorg/spongycastle/math/ec/ECFieldElement;

    const/4 v6, 0x0

    aget-object v20, v2, v6

    .line 269
    .local v20, "Z1":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/math/ec/ECPoint;->getRawYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v13

    .line 271
    .local v13, "L2":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual/range {v16 .. v16}, Lorg/spongycastle/math/ec/ECFieldElement;->square()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v17

    .line 272
    .local v17, "X1Sq":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual {v10}, Lorg/spongycastle/math/ec/ECFieldElement;->square()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v11

    .line 273
    .local v11, "L1Sq":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual/range {v20 .. v20}, Lorg/spongycastle/math/ec/ECFieldElement;->square()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v21

    .line 274
    .local v21, "Z1Sq":Lorg/spongycastle/math/ec/ECFieldElement;
    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v12

    .line 277
    .local v12, "L1Z1":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual {v11, v12}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v15

    .line 278
    .local v15, "T":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual {v13}, Lorg/spongycastle/math/ec/ECFieldElement;->addOne()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v14

    .line 280
    .local v14, "L2plus1":Lorg/spongycastle/math/ec/ECFieldElement;
    move-object/from16 v0, v21

    invoke-virtual {v14, v0}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    invoke-virtual {v2, v11}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    move-object/from16 v0, v17

    move-object/from16 v1, v21

    invoke-virtual {v2, v15, v0, v1}, Lorg/spongycastle/math/ec/ECFieldElement;->multiplyPlusProduct(Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v8

    .line 281
    .local v8, "A":Lorg/spongycastle/math/ec/ECFieldElement;
    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v19

    .line 282
    .local v19, "X2Z1Sq":Lorg/spongycastle/math/ec/ECFieldElement;
    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/math/ec/ECFieldElement;->square()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v9

    .line 284
    .local v9, "B":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual {v9}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v2

    if-eqz v2, :cond_a9

    .line 286
    invoke-virtual {v8}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v2

    if-eqz v2, :cond_a3

    .line 288
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/math/ec/ECPoint;->twice()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object p1

    goto/16 :goto_6

    .line 291
    :cond_a3
    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECCurve;->getInfinity()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object p1

    goto/16 :goto_6

    .line 294
    :cond_a9
    invoke-virtual {v8}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v2

    if-eqz v2, :cond_c0

    .line 297
    new-instance p1, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;

    .end local p1    # "b":Lorg/spongycastle/math/ec/ECPoint;
    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECCurve;->getB()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    move-object/from16 v0, p0

    iget-boolean v6, v0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->withCompression:Z

    move-object/from16 v0, p1

    invoke-direct {v0, v3, v8, v2, v6}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;Z)V

    goto/16 :goto_6

    .line 300
    .restart local p1    # "b":Lorg/spongycastle/math/ec/ECPoint;
    :cond_c0
    invoke-virtual {v8}, Lorg/spongycastle/math/ec/ECFieldElement;->square()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v4

    .line 301
    .local v4, "X3":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual {v8, v9}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v23

    .line 302
    .local v23, "Z3":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual {v8, v9}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/math/ec/ECFieldElement;->square()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    move-object/from16 v0, v23

    invoke-virtual {v2, v15, v14, v0}, Lorg/spongycastle/math/ec/ECFieldElement;->multiplyPlusProduct(Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v5

    .line 304
    .local v5, "L3":Lorg/spongycastle/math/ec/ECFieldElement;
    new-instance v2, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;

    const/4 v6, 0x1

    new-array v6, v6, [Lorg/spongycastle/math/ec/ECFieldElement;

    const/4 v7, 0x0

    aput-object v23, v6, v7

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;->withCompression:Z

    invoke-direct/range {v2 .. v7}, Lorg/spongycastle/math/ec/custom/sec/SecT571K1Point;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;[Lorg/spongycastle/math/ec/ECFieldElement;Z)V

    move-object/from16 p1, v2

    goto/16 :goto_6
.end method
