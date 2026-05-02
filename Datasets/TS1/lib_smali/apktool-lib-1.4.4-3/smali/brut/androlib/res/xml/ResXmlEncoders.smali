.class public final Lbrut/androlib/res/xml/ResXmlEncoders;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static encodeAsResXmlAttr(Ljava/lang/String;)Ljava/lang/String;
    .registers 10

    const/16 v8, 0x5c

    const/4 v1, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_a

    :goto_9
    return-object p0

    :cond_a
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0xa

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    aget-char v0, v2, v1

    sparse-switch v0, :sswitch_data_5e

    :goto_1e
    array-length v4, v2

    move v0, v1

    :goto_20
    if-ge v0, v4, :cond_59

    aget-char v5, v2, v0

    sparse-switch v5, :sswitch_data_6c

    invoke-static {v5}, Lbrut/androlib/res/xml/ResXmlEncoders;->isPrintableChar(C)Z

    move-result v6

    if-nez v6, :cond_49

    const-string v6, "\\u%04x"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v7, v1

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_3f
    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    :sswitch_42
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1e

    :sswitch_46
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_49
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3f

    :sswitch_4d
    const-string v5, "&quot;"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3f

    :sswitch_53
    const-string v5, "\\n"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3f

    :cond_59
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_9

    :sswitch_data_5e
    .sparse-switch
        0x23 -> :sswitch_42
        0x3f -> :sswitch_42
        0x40 -> :sswitch_42
    .end sparse-switch

    :sswitch_data_6c
    .sparse-switch
        0xa -> :sswitch_53
        0x22 -> :sswitch_4d
        0x5c -> :sswitch_46
    .end sparse-switch
.end method

.method public static encodeAsXmlValue(Ljava/lang/String;)Ljava/lang/String;
    .registers 16

    const/16 v13, 0x5c

    const/16 v12, 0x22

    const/4 v1, 0x1

    const/4 v3, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_d

    :goto_c
    return-object p0

    :cond_d
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0xa

    invoke-direct {v8, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    aget-char v0, v7, v3

    sparse-switch v0, :sswitch_data_a8

    :goto_21
    array-length v9, v7

    move v6, v3

    move v2, v1

    move v0, v3

    move v4, v3

    move v5, v3

    :goto_27
    if-ge v6, v9, :cond_8b

    aget-char v10, v7, v6

    if-eqz v5, :cond_48

    const/16 v11, 0x3e

    if-ne v10, v11, :cond_a3

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    move v4, v0

    move v5, v3

    move v0, v2

    move v2, v3

    :goto_3b
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_3e
    add-int/lit8 v6, v6, 0x1

    move v14, v0

    move v0, v2

    move v2, v14

    goto :goto_27

    :sswitch_44
    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_21

    :cond_48
    const/16 v11, 0x20

    if-ne v10, v11, :cond_52

    if-eqz v2, :cond_4f

    move v0, v1

    :cond_4f
    move v2, v0

    move v0, v1

    goto :goto_3b

    :cond_52
    sparse-switch v10, :sswitch_data_b6

    invoke-static {v10}, Lbrut/androlib/res/xml/ResXmlEncoders;->isPrintableChar(C)Z

    move-result v2

    if-nez v2, :cond_9c

    const-string v2, "\\u%04x"

    new-array v11, v1, [Ljava/lang/Object;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v11, v3

    invoke-static {v2, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v2, v0

    move v0, v3

    goto :goto_3e

    :sswitch_6f
    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move v2, v0

    move v0, v3

    goto :goto_3b

    :sswitch_75
    move v0, v3

    move v2, v1

    goto :goto_3b

    :sswitch_78
    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move v2, v0

    move v0, v3

    goto :goto_3b

    :sswitch_7e
    if-eqz v0, :cond_9f

    invoke-virtual {v8, v4, v12}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move v2, v0

    move v5, v1

    move v0, v3

    goto :goto_3b

    :cond_8b
    if-nez v0, :cond_8f

    if-eqz v2, :cond_96

    :cond_8f
    invoke-virtual {v8, v4, v12}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_96
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_c

    :cond_9c
    move v2, v0

    move v0, v3

    goto :goto_3b

    :cond_9f
    move v2, v0

    move v5, v1

    move v0, v3

    goto :goto_3b

    :cond_a3
    move v14, v2

    move v2, v0

    move v0, v14

    goto :goto_3b

    nop

    :sswitch_data_a8
    .sparse-switch
        0x23 -> :sswitch_44
        0x3f -> :sswitch_44
        0x40 -> :sswitch_44
    .end sparse-switch

    :sswitch_data_b6
    .sparse-switch
        0xa -> :sswitch_75
        0x22 -> :sswitch_78
        0x27 -> :sswitch_75
        0x3c -> :sswitch_7e
        0x5c -> :sswitch_6f
    .end sparse-switch
.end method

.method public static enumerateNonPositionalSubstitutions(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    const/4 v0, 0x0

    const/4 v1, -0x1

    invoke-static {p0, v1}, Lbrut/androlib/res/xml/ResXmlEncoders;->findNonPositionalSubstitutions(Ljava/lang/String;I)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x2

    if-ge v2, v3, :cond_e

    :goto_d
    return-object p0

    :cond_e
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v1, v0

    move v2, v0

    :goto_19
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4d

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    add-int/lit8 v0, v1, 0x1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x24

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v1

    move v2, v1

    move v1, v0

    goto :goto_19

    :cond_4d
    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_d
.end method

.method public static escapeXmlChars(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    const-string v0, "&"

    const-string v1, "&amp;"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "<"

    const-string v2, "&lt;"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static findNonPositionalSubstitutions(Ljava/lang/String;I)Ljava/util/List;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    const/16 v9, 0x39

    const/16 v8, 0x30

    const/16 v7, 0x25

    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    move v1, v0

    :cond_11
    invoke-virtual {p0, v7, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    add-int/lit8 v2, v5, 0x1

    if-eqz v2, :cond_1b

    if-ne v2, v3, :cond_1c

    :cond_1b
    :goto_1b
    return-object v4

    :cond_1c
    add-int/lit8 v1, v2, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v2, v7, :cond_11

    if-lt v2, v8, :cond_3b

    if-gt v2, v9, :cond_3b

    if-ge v1, v3, :cond_3b

    :cond_2a
    move v2, v1

    add-int/lit8 v1, v2, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-lt v2, v8, :cond_37

    if-gt v2, v9, :cond_37

    if-lt v1, v3, :cond_2a

    :cond_37
    const/16 v6, 0x24

    if-eq v2, v6, :cond_11

    :cond_3b
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 v2, -0x1

    if-eq p1, v2, :cond_11

    add-int/lit8 v0, v0, 0x1

    if-lt v0, p1, :cond_11

    goto :goto_1b
.end method

.method public static hasMultipleNonPositionalSubstitutions(Ljava/lang/String;)Z
    .registers 3

    const/4 v0, 0x1

    const/4 v1, 0x2

    invoke-static {p0, v1}, Lbrut/androlib/res/xml/ResXmlEncoders;->findNonPositionalSubstitutions(Ljava/lang/String;I)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-le v1, v0, :cond_d

    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method private static isPrintableChar(C)Z
    .registers 3

    invoke-static {p0}, Ljava/lang/Character$UnicodeBlock;->of(C)Ljava/lang/Character$UnicodeBlock;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Character;->isISOControl(C)Z

    move-result v1

    if-nez v1, :cond_17

    const v1, 0xffff

    if-eq p0, v1, :cond_17

    if-eqz v0, :cond_17

    sget-object v1, Ljava/lang/Character$UnicodeBlock;->SPECIALS:Ljava/lang/Character$UnicodeBlock;

    if-eq v0, v1, :cond_17

    const/4 v0, 0x1

    :goto_16
    return v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method
