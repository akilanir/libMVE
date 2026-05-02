.class public Lorg/apache/commons/lang3/BooleanUtils;
.super Ljava/lang/Object;
.source "BooleanUtils.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    return-void
.end method

.method public static varargs and([Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .registers 5
    .param p0, "array"    # [Ljava/lang/Boolean;

    .prologue
    .line 940
    if-nez p0, :cond_a

    .line 941
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The Array must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 943
    :cond_a
    array-length v2, p0

    if-nez v2, :cond_15

    .line 944
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Array is empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 947
    :cond_15
    :try_start_15
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->toPrimitive([Ljava/lang/Boolean;)[Z

    move-result-object v1

    .line 948
    .local v1, "primitive":[Z
    invoke-static {v1}, Lorg/apache/commons/lang3/BooleanUtils;->and([Z)Z

    move-result v2

    if-eqz v2, :cond_22

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_21
    return-object v2

    :cond_22
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    :try_end_24
    .catch Ljava/lang/NullPointerException; {:try_start_15 .. :try_end_24} :catch_25

    goto :goto_21

    .line 949
    .end local v1    # "primitive":[Z
    :catch_25
    move-exception v0

    .line 950
    .local v0, "ex":Ljava/lang/NullPointerException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The array must not contain any null elements"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static varargs and([Z)Z
    .registers 7
    .param p0, "array"    # [Z

    .prologue
    .line 906
    if-nez p0, :cond_a

    .line 907
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "The Array must not be null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 909
    :cond_a
    array-length v4, p0

    if-nez v4, :cond_15

    .line 910
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Array is empty"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 912
    :cond_15
    move-object v0, p0

    .local v0, "arr$":[Z
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_18
    if-ge v2, v3, :cond_23

    aget-boolean v1, v0, v2

    .line 913
    .local v1, "element":Z
    if-nez v1, :cond_20

    .line 914
    const/4 v4, 0x0

    .line 917
    .end local v1    # "element":Z
    :goto_1f
    return v4

    .line 912
    .restart local v1    # "element":Z
    :cond_20
    add-int/lit8 v2, v2, 0x1

    goto :goto_18

    .line 917
    .end local v1    # "element":Z
    :cond_23
    const/4 v4, 0x1

    goto :goto_1f
.end method

.method public static compare(ZZ)I
    .registers 3
    .param p0, "x"    # Z
    .param p1, "y"    # Z

    .prologue
    .line 1099
    if-ne p0, p1, :cond_4

    .line 1100
    const/4 v0, 0x0

    .line 1105
    :goto_3
    return v0

    .line 1102
    :cond_4
    if-eqz p0, :cond_8

    .line 1103
    const/4 v0, 0x1

    goto :goto_3

    .line 1105
    :cond_8
    const/4 v0, -0x1

    goto :goto_3
.end method

.method public static isFalse(Ljava/lang/Boolean;)Z
    .registers 2
    .param p0, "bool"    # Ljava/lang/Boolean;

    .prologue
    .line 123
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isNotFalse(Ljava/lang/Boolean;)Z
    .registers 2
    .param p0, "bool"    # Ljava/lang/Boolean;

    .prologue
    .line 141
    invoke-static {p0}, Lorg/apache/commons/lang3/BooleanUtils;->isFalse(Ljava/lang/Boolean;)Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static isNotTrue(Ljava/lang/Boolean;)Z
    .registers 2
    .param p0, "bool"    # Ljava/lang/Boolean;

    .prologue
    .line 105
    invoke-static {p0}, Lorg/apache/commons/lang3/BooleanUtils;->isTrue(Ljava/lang/Boolean;)Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static isTrue(Ljava/lang/Boolean;)Z
    .registers 2
    .param p0, "bool"    # Ljava/lang/Boolean;

    .prologue
    .line 87
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static negate(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .registers 2
    .param p0, "bool"    # Ljava/lang/Boolean;

    .prologue
    .line 64
    if-nez p0, :cond_4

    .line 65
    const/4 v0, 0x0

    .line 67
    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_d

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_3

    :cond_d
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_3
.end method

.method public static varargs or([Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .registers 5
    .param p0, "array"    # [Ljava/lang/Boolean;

    .prologue
    .line 1009
    if-nez p0, :cond_a

    .line 1010
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The Array must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1012
    :cond_a
    array-length v2, p0

    if-nez v2, :cond_15

    .line 1013
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Array is empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1016
    :cond_15
    :try_start_15
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->toPrimitive([Ljava/lang/Boolean;)[Z

    move-result-object v1

    .line 1017
    .local v1, "primitive":[Z
    invoke-static {v1}, Lorg/apache/commons/lang3/BooleanUtils;->or([Z)Z

    move-result v2

    if-eqz v2, :cond_22

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_21
    return-object v2

    :cond_22
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    :try_end_24
    .catch Ljava/lang/NullPointerException; {:try_start_15 .. :try_end_24} :catch_25

    goto :goto_21

    .line 1018
    .end local v1    # "primitive":[Z
    :catch_25
    move-exception v0

    .line 1019
    .local v0, "ex":Ljava/lang/NullPointerException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The array must not contain any null elements"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static varargs or([Z)Z
    .registers 7
    .param p0, "array"    # [Z

    .prologue
    .line 974
    if-nez p0, :cond_a

    .line 975
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "The Array must not be null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 977
    :cond_a
    array-length v4, p0

    if-nez v4, :cond_15

    .line 978
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Array is empty"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 980
    :cond_15
    move-object v0, p0

    .local v0, "arr$":[Z
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_18
    if-ge v2, v3, :cond_23

    aget-boolean v1, v0, v2

    .line 981
    .local v1, "element":Z
    if-eqz v1, :cond_20

    .line 982
    const/4 v4, 0x1

    .line 985
    .end local v1    # "element":Z
    :goto_1f
    return v4

    .line 980
    .restart local v1    # "element":Z
    :cond_20
    add-int/lit8 v2, v2, 0x1

    goto :goto_18

    .line 985
    .end local v1    # "element":Z
    :cond_23
    const/4 v4, 0x0

    goto :goto_1f
.end method

.method public static toBoolean(I)Z
    .registers 2
    .param p0, "value"    # I

    .prologue
    .line 199
    if-eqz p0, :cond_4

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public static toBoolean(III)Z
    .registers 5
    .param p0, "value"    # I
    .param p1, "trueValue"    # I
    .param p2, "falseValue"    # I

    .prologue
    .line 262
    if-ne p0, p1, :cond_4

    .line 263
    const/4 v0, 0x1

    .line 266
    :goto_3
    return v0

    .line 265
    :cond_4
    if-ne p0, p2, :cond_8

    .line 266
    const/4 v0, 0x0

    goto :goto_3

    .line 269
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Integer did not match either specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static toBoolean(Ljava/lang/Boolean;)Z
    .registers 2
    .param p0, "bool"    # Ljava/lang/Boolean;

    .prologue
    .line 159
    if-eqz p0, :cond_a

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static toBoolean(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Z
    .registers 6
    .param p0, "value"    # Ljava/lang/Integer;
    .param p1, "trueValue"    # Ljava/lang/Integer;
    .param p2, "falseValue"    # Ljava/lang/Integer;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 290
    if-nez p0, :cond_b

    .line 291
    if-nez p1, :cond_7

    .line 300
    :cond_6
    :goto_6
    return v0

    .line 294
    :cond_7
    if-nez p2, :cond_19

    move v0, v1

    .line 295
    goto :goto_6

    .line 297
    :cond_b
    invoke-virtual {p0, p1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 299
    invoke-virtual {p0, p2}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    move v0, v1

    .line 300
    goto :goto_6

    .line 303
    :cond_19
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Integer did not match either specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static toBoolean(Ljava/lang/String;)Z
    .registers 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 710
    invoke-static {p0}, Lorg/apache/commons/lang3/BooleanUtils;->toBooleanObject(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static toBoolean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 6
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "trueString"    # Ljava/lang/String;
    .param p2, "falseString"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 728
    if-ne p0, p1, :cond_5

    .line 736
    :cond_4
    :goto_4
    return v0

    .line 730
    :cond_5
    if-ne p0, p2, :cond_9

    move v0, v1

    .line 731
    goto :goto_4

    .line 732
    :cond_9
    if-eqz p0, :cond_19

    .line 733
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 735
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    move v0, v1

    .line 736
    goto :goto_4

    .line 740
    :cond_19
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The String did not match either specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static toBooleanDefaultIfNull(Ljava/lang/Boolean;Z)Z
    .registers 2
    .param p0, "bool"    # Ljava/lang/Boolean;
    .param p1, "valueIfNull"    # Z

    .prologue
    .line 176
    if-nez p0, :cond_3

    .line 179
    .end local p1    # "valueIfNull":Z
    :goto_2
    return p1

    .restart local p1    # "valueIfNull":Z
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    goto :goto_2
.end method

.method public static toBooleanObject(I)Ljava/lang/Boolean;
    .registers 2
    .param p0, "value"    # I

    .prologue
    .line 217
    if-nez p0, :cond_5

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_4
    return-object v0

    :cond_5
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_4
.end method

.method public static toBooleanObject(IIII)Ljava/lang/Boolean;
    .registers 6
    .param p0, "value"    # I
    .param p1, "trueValue"    # I
    .param p2, "falseValue"    # I
    .param p3, "nullValue"    # I

    .prologue
    .line 325
    if-ne p0, p1, :cond_5

    .line 326
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 332
    :goto_4
    return-object v0

    .line 328
    :cond_5
    if-ne p0, p2, :cond_a

    .line 329
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_4

    .line 331
    :cond_a
    if-ne p0, p3, :cond_e

    .line 332
    const/4 v0, 0x0

    goto :goto_4

    .line 335
    :cond_e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Integer did not match any specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static toBooleanObject(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .registers 2
    .param p0, "value"    # Ljava/lang/Integer;

    .prologue
    .line 239
    if-nez p0, :cond_4

    .line 240
    const/4 v0, 0x0

    .line 242
    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_d

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_3

    :cond_d
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_3
.end method

.method public static toBooleanObject(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Boolean;
    .registers 6
    .param p0, "value"    # Ljava/lang/Integer;
    .param p1, "trueValue"    # Ljava/lang/Integer;
    .param p2, "falseValue"    # Ljava/lang/Integer;
    .param p3, "nullValue"    # Ljava/lang/Integer;

    .prologue
    const/4 v0, 0x0

    .line 357
    if-nez p0, :cond_17

    .line 358
    if-nez p1, :cond_8

    .line 359
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 372
    :cond_7
    :goto_7
    return-object v0

    .line 361
    :cond_8
    if-nez p2, :cond_d

    .line 362
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_7

    .line 364
    :cond_d
    if-eqz p3, :cond_7

    .line 375
    :cond_f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Integer did not match any specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 367
    :cond_17
    invoke-virtual {p0, p1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 368
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_7

    .line 369
    :cond_20
    invoke-virtual {p0, p2}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_29

    .line 370
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_7

    .line 371
    :cond_29
    invoke-virtual {p0, p3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    goto :goto_7
.end method

.method public static toBooleanObject(Ljava/lang/String;)Ljava/lang/Boolean;
    .registers 12
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x2

    const/16 v9, 0x66

    const/16 v8, 0x46

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 554
    const-string v5, "true"

    if-ne p0, v5, :cond_e

    .line 555
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 634
    :goto_d
    return-object v5

    .line 557
    :cond_e
    if-nez p0, :cond_12

    .line 558
    const/4 v5, 0x0

    goto :goto_d

    .line 560
    :cond_12
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    packed-switch v5, :pswitch_data_11e

    .line 634
    :cond_19
    const/4 v5, 0x0

    goto :goto_d

    .line 562
    :pswitch_1b
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 563
    .local v0, "ch0":C
    const/16 v5, 0x79

    if-eq v0, v5, :cond_2f

    const/16 v5, 0x59

    if-eq v0, v5, :cond_2f

    const/16 v5, 0x74

    if-eq v0, v5, :cond_2f

    const/16 v5, 0x54

    if-ne v0, v5, :cond_32

    .line 565
    :cond_2f
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_d

    .line 567
    :cond_32
    const/16 v5, 0x6e

    if-eq v0, v5, :cond_3e

    const/16 v5, 0x4e

    if-eq v0, v5, :cond_3e

    if-eq v0, v9, :cond_3e

    if-ne v0, v8, :cond_19

    .line 569
    :cond_3e
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_d

    .line 574
    .end local v0    # "ch0":C
    :pswitch_41
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 575
    .restart local v0    # "ch0":C
    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 576
    .local v1, "ch1":C
    const/16 v5, 0x6f

    if-eq v0, v5, :cond_51

    const/16 v5, 0x4f

    if-ne v0, v5, :cond_5c

    :cond_51
    const/16 v5, 0x6e

    if-eq v1, v5, :cond_59

    const/16 v5, 0x4e

    if-ne v1, v5, :cond_5c

    .line 578
    :cond_59
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_d

    .line 580
    :cond_5c
    const/16 v5, 0x6e

    if-eq v0, v5, :cond_64

    const/16 v5, 0x4e

    if-ne v0, v5, :cond_19

    :cond_64
    const/16 v5, 0x6f

    if-eq v1, v5, :cond_6c

    const/16 v5, 0x4f

    if-ne v1, v5, :cond_19

    .line 582
    :cond_6c
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_d

    .line 587
    .end local v0    # "ch0":C
    .end local v1    # "ch1":C
    :pswitch_6f
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 588
    .restart local v0    # "ch0":C
    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 589
    .restart local v1    # "ch1":C
    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 590
    .local v2, "ch2":C
    const/16 v5, 0x79

    if-eq v0, v5, :cond_83

    const/16 v5, 0x59

    if-ne v0, v5, :cond_97

    :cond_83
    const/16 v5, 0x65

    if-eq v1, v5, :cond_8b

    const/16 v5, 0x45

    if-ne v1, v5, :cond_97

    :cond_8b
    const/16 v5, 0x73

    if-eq v2, v5, :cond_93

    const/16 v5, 0x53

    if-ne v2, v5, :cond_97

    .line 593
    :cond_93
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto/16 :goto_d

    .line 595
    :cond_97
    const/16 v5, 0x6f

    if-eq v0, v5, :cond_9f

    const/16 v5, 0x4f

    if-ne v0, v5, :cond_19

    :cond_9f
    if-eq v1, v9, :cond_a3

    if-ne v1, v8, :cond_19

    :cond_a3
    if-eq v2, v9, :cond_a7

    if-ne v2, v8, :cond_19

    .line 598
    :cond_a7
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto/16 :goto_d

    .line 603
    .end local v0    # "ch0":C
    .end local v1    # "ch1":C
    .end local v2    # "ch2":C
    :pswitch_ab
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 604
    .restart local v0    # "ch0":C
    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 605
    .restart local v1    # "ch1":C
    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 606
    .restart local v2    # "ch2":C
    const/4 v5, 0x3

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 607
    .local v3, "ch3":C
    const/16 v5, 0x74

    if-eq v0, v5, :cond_c4

    const/16 v5, 0x54

    if-ne v0, v5, :cond_19

    :cond_c4
    const/16 v5, 0x72

    if-eq v1, v5, :cond_cc

    const/16 v5, 0x52

    if-ne v1, v5, :cond_19

    :cond_cc
    const/16 v5, 0x75

    if-eq v2, v5, :cond_d4

    const/16 v5, 0x55

    if-ne v2, v5, :cond_19

    :cond_d4
    const/16 v5, 0x65

    if-eq v3, v5, :cond_dc

    const/16 v5, 0x45

    if-ne v3, v5, :cond_19

    .line 611
    :cond_dc
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto/16 :goto_d

    .line 616
    .end local v0    # "ch0":C
    .end local v1    # "ch1":C
    .end local v2    # "ch2":C
    .end local v3    # "ch3":C
    :pswitch_e0
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 617
    .restart local v0    # "ch0":C
    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 618
    .restart local v1    # "ch1":C
    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 619
    .restart local v2    # "ch2":C
    const/4 v5, 0x3

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 620
    .restart local v3    # "ch3":C
    const/4 v5, 0x4

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 621
    .local v4, "ch4":C
    if-eq v0, v9, :cond_fa

    if-ne v0, v8, :cond_19

    :cond_fa
    const/16 v5, 0x61

    if-eq v1, v5, :cond_102

    const/16 v5, 0x41

    if-ne v1, v5, :cond_19

    :cond_102
    const/16 v5, 0x6c

    if-eq v2, v5, :cond_10a

    const/16 v5, 0x4c

    if-ne v2, v5, :cond_19

    :cond_10a
    const/16 v5, 0x73

    if-eq v3, v5, :cond_112

    const/16 v5, 0x53

    if-ne v3, v5, :cond_19

    :cond_112
    const/16 v5, 0x65

    if-eq v4, v5, :cond_11a

    const/16 v5, 0x45

    if-ne v4, v5, :cond_19

    .line 626
    :cond_11a
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto/16 :goto_d

    .line 560
    :pswitch_data_11e
    .packed-switch 0x1
        :pswitch_1b
        :pswitch_41
        :pswitch_6f
        :pswitch_ab
        :pswitch_e0
    .end packed-switch
.end method

.method public static toBooleanObject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;
    .registers 6
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "trueString"    # Ljava/lang/String;
    .param p2, "falseString"    # Ljava/lang/String;
    .param p3, "nullString"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 657
    if-nez p0, :cond_17

    .line 658
    if-nez p1, :cond_8

    .line 659
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 672
    :cond_7
    :goto_7
    return-object v0

    .line 661
    :cond_8
    if-nez p2, :cond_d

    .line 662
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_7

    .line 664
    :cond_d
    if-eqz p3, :cond_7

    .line 675
    :cond_f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The String did not match any specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 667
    :cond_17
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 668
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_7

    .line 669
    :cond_20
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_29

    .line 670
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_7

    .line 671
    :cond_29
    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    goto :goto_7
.end method

.method public static toInteger(Ljava/lang/Boolean;III)I
    .registers 5
    .param p0, "bool"    # Ljava/lang/Boolean;
    .param p1, "trueValue"    # I
    .param p2, "falseValue"    # I
    .param p3, "nullValue"    # I

    .prologue
    .line 466
    if-nez p0, :cond_3

    .line 469
    .end local p1    # "trueValue":I
    .end local p3    # "nullValue":I
    :goto_2
    return p3

    .restart local p1    # "trueValue":I
    .restart local p3    # "nullValue":I
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_b

    .end local p1    # "trueValue":I
    :goto_9
    move p3, p1

    goto :goto_2

    .restart local p1    # "trueValue":I
    :cond_b
    move p1, p2

    goto :goto_9
.end method

.method public static toInteger(Z)I
    .registers 2
    .param p0, "bool"    # Z

    .prologue
    .line 393
    if-eqz p0, :cond_4

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public static toInteger(ZII)I
    .registers 3
    .param p0, "bool"    # Z
    .param p1, "trueValue"    # I
    .param p2, "falseValue"    # I

    .prologue
    .line 447
    if-eqz p0, :cond_3

    .end local p1    # "trueValue":I
    :goto_2
    return p1

    .restart local p1    # "trueValue":I
    :cond_3
    move p1, p2

    goto :goto_2
.end method

.method public static toIntegerObject(Ljava/lang/Boolean;)Ljava/lang/Integer;
    .registers 2
    .param p0, "bool"    # Ljava/lang/Boolean;

    .prologue
    .line 427
    if-nez p0, :cond_4

    .line 428
    const/4 v0, 0x0

    .line 430
    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_d

    sget-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->INTEGER_ONE:Ljava/lang/Integer;

    goto :goto_3

    :cond_d
    sget-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->INTEGER_ZERO:Ljava/lang/Integer;

    goto :goto_3
.end method

.method public static toIntegerObject(Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;
    .registers 5
    .param p0, "bool"    # Ljava/lang/Boolean;
    .param p1, "trueValue"    # Ljava/lang/Integer;
    .param p2, "falseValue"    # Ljava/lang/Integer;
    .param p3, "nullValue"    # Ljava/lang/Integer;

    .prologue
    .line 505
    if-nez p0, :cond_3

    .line 508
    .end local p1    # "trueValue":Ljava/lang/Integer;
    .end local p3    # "nullValue":Ljava/lang/Integer;
    :goto_2
    return-object p3

    .restart local p1    # "trueValue":Ljava/lang/Integer;
    .restart local p3    # "nullValue":Ljava/lang/Integer;
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_b

    .end local p1    # "trueValue":Ljava/lang/Integer;
    :goto_9
    move-object p3, p1

    goto :goto_2

    .restart local p1    # "trueValue":Ljava/lang/Integer;
    :cond_b
    move-object p1, p2

    goto :goto_9
.end method

.method public static toIntegerObject(Z)Ljava/lang/Integer;
    .registers 2
    .param p0, "bool"    # Z

    .prologue
    .line 409
    if-eqz p0, :cond_5

    sget-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->INTEGER_ONE:Ljava/lang/Integer;

    :goto_4
    return-object v0

    :cond_5
    sget-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->INTEGER_ZERO:Ljava/lang/Integer;

    goto :goto_4
.end method

.method public static toIntegerObject(ZLjava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;
    .registers 3
    .param p0, "bool"    # Z
    .param p1, "trueValue"    # Ljava/lang/Integer;
    .param p2, "falseValue"    # Ljava/lang/Integer;

    .prologue
    .line 486
    if-eqz p0, :cond_3

    .end local p1    # "trueValue":Ljava/lang/Integer;
    :goto_2
    return-object p1

    .restart local p1    # "trueValue":Ljava/lang/Integer;
    :cond_3
    move-object p1, p2

    goto :goto_2
.end method

.method public static toString(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "bool"    # Ljava/lang/Boolean;
    .param p1, "trueString"    # Ljava/lang/String;
    .param p2, "falseString"    # Ljava/lang/String;
    .param p3, "nullString"    # Ljava/lang/String;

    .prologue
    .line 812
    if-nez p0, :cond_3

    .line 815
    .end local p1    # "trueString":Ljava/lang/String;
    .end local p3    # "nullString":Ljava/lang/String;
    :goto_2
    return-object p3

    .restart local p1    # "trueString":Ljava/lang/String;
    .restart local p3    # "nullString":Ljava/lang/String;
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_b

    .end local p1    # "trueString":Ljava/lang/String;
    :goto_9
    move-object p3, p1

    goto :goto_2

    .restart local p1    # "trueString":Ljava/lang/String;
    :cond_b
    move-object p1, p2

    goto :goto_9
.end method

.method public static toString(ZLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "bool"    # Z
    .param p1, "trueString"    # Ljava/lang/String;
    .param p2, "falseString"    # Ljava/lang/String;

    .prologue
    .line 882
    if-eqz p0, :cond_3

    .end local p1    # "trueString":Ljava/lang/String;
    :goto_2
    return-object p1

    .restart local p1    # "trueString":Ljava/lang/String;
    :cond_3
    move-object p1, p2

    goto :goto_2
.end method

.method public static toStringOnOff(Ljava/lang/Boolean;)Ljava/lang/String;
    .registers 4
    .param p0, "bool"    # Ljava/lang/Boolean;

    .prologue
    .line 776
    const-string v0, "on"

    const-string v1, "off"

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2}, Lorg/apache/commons/lang3/BooleanUtils;->toString(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toStringOnOff(Z)Ljava/lang/String;
    .registers 3
    .param p0, "bool"    # Z

    .prologue
    .line 849
    const-string v0, "on"

    const-string v1, "off"

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang3/BooleanUtils;->toString(ZLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toStringTrueFalse(Ljava/lang/Boolean;)Ljava/lang/String;
    .registers 4
    .param p0, "bool"    # Ljava/lang/Boolean;

    .prologue
    .line 759
    const-string v0, "true"

    const-string v1, "false"

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2}, Lorg/apache/commons/lang3/BooleanUtils;->toString(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toStringTrueFalse(Z)Ljava/lang/String;
    .registers 3
    .param p0, "bool"    # Z

    .prologue
    .line 833
    const-string v0, "true"

    const-string v1, "false"

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang3/BooleanUtils;->toString(ZLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toStringYesNo(Ljava/lang/Boolean;)Ljava/lang/String;
    .registers 4
    .param p0, "bool"    # Ljava/lang/Boolean;

    .prologue
    .line 793
    const-string v0, "yes"

    const-string v1, "no"

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2}, Lorg/apache/commons/lang3/BooleanUtils;->toString(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toStringYesNo(Z)Ljava/lang/String;
    .registers 3
    .param p0, "bool"    # Z

    .prologue
    .line 865
    const-string v0, "yes"

    const-string v1, "no"

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang3/BooleanUtils;->toString(ZLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static varargs xor([Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .registers 5
    .param p0, "array"    # [Ljava/lang/Boolean;

    .prologue
    .line 1074
    if-nez p0, :cond_a

    .line 1075
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The Array must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1077
    :cond_a
    array-length v2, p0

    if-nez v2, :cond_15

    .line 1078
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Array is empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1081
    :cond_15
    :try_start_15
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->toPrimitive([Ljava/lang/Boolean;)[Z

    move-result-object v1

    .line 1082
    .local v1, "primitive":[Z
    invoke-static {v1}, Lorg/apache/commons/lang3/BooleanUtils;->xor([Z)Z

    move-result v2

    if-eqz v2, :cond_22

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_21
    return-object v2

    :cond_22
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    :try_end_24
    .catch Ljava/lang/NullPointerException; {:try_start_15 .. :try_end_24} :catch_25

    goto :goto_21

    .line 1083
    .end local v1    # "primitive":[Z
    :catch_25
    move-exception v0

    .line 1084
    .local v0, "ex":Ljava/lang/NullPointerException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The array must not contain any null elements"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static varargs xor([Z)Z
    .registers 8
    .param p0, "array"    # [Z

    .prologue
    .line 1042
    if-nez p0, :cond_a

    .line 1043
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "The Array must not be null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1045
    :cond_a
    array-length v5, p0

    if-nez v5, :cond_15

    .line 1046
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Array is empty"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1050
    :cond_15
    const/4 v4, 0x0

    .line 1051
    .local v4, "result":Z
    move-object v0, p0

    .local v0, "arr$":[Z
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_19
    if-ge v2, v3, :cond_21

    aget-boolean v1, v0, v2

    .line 1052
    .local v1, "element":Z
    xor-int/2addr v4, v1

    .line 1051
    add-int/lit8 v2, v2, 0x1

    goto :goto_19

    .line 1055
    .end local v1    # "element":Z
    :cond_21
    return v4
.end method
