.class final Lorg/mozilla/javascript/NativeString;
.super Lorg/mozilla/javascript/IdScriptableObject;
.source "NativeString.java"


# static fields
.field private static final ConstructorId_charAt:I = -0x5

.field private static final ConstructorId_charCodeAt:I = -0x6

.field private static final ConstructorId_concat:I = -0xe

.field private static final ConstructorId_equalsIgnoreCase:I = -0x1e

.field private static final ConstructorId_fromCharCode:I = -0x1

.field private static final ConstructorId_indexOf:I = -0x7

.field private static final ConstructorId_lastIndexOf:I = -0x8

.field private static final ConstructorId_localeCompare:I = -0x22

.field private static final ConstructorId_match:I = -0x1f

.field private static final ConstructorId_replace:I = -0x21

.field private static final ConstructorId_search:I = -0x20

.field private static final ConstructorId_slice:I = -0xf

.field private static final ConstructorId_split:I = -0x9

.field private static final ConstructorId_substr:I = -0xd

.field private static final ConstructorId_substring:I = -0xa

.field private static final ConstructorId_toLocaleLowerCase:I = -0x23

.field private static final ConstructorId_toLowerCase:I = -0xb

.field private static final ConstructorId_toUpperCase:I = -0xc

.field private static final Id_anchor:I = 0x1c

.field private static final Id_big:I = 0x15

.field private static final Id_blink:I = 0x16

.field private static final Id_bold:I = 0x10

.field private static final Id_charAt:I = 0x5

.field private static final Id_charCodeAt:I = 0x6

.field private static final Id_codePointAt:I = 0x2d

.field private static final Id_concat:I = 0xe

.field private static final Id_constructor:I = 0x1

.field private static final Id_endsWith:I = 0x2a

.field private static final Id_equals:I = 0x1d

.field private static final Id_equalsIgnoreCase:I = 0x1e

.field private static final Id_fixed:I = 0x12

.field private static final Id_fontcolor:I = 0x1a

.field private static final Id_fontsize:I = 0x19

.field private static final Id_includes:I = 0x28

.field private static final Id_indexOf:I = 0x7

.field private static final Id_italics:I = 0x11

.field private static final Id_lastIndexOf:I = 0x8

.field private static final Id_length:I = 0x1

.field private static final Id_link:I = 0x1b

.field private static final Id_localeCompare:I = 0x22

.field private static final Id_match:I = 0x1f

.field private static final Id_normalize:I = 0x2b

.field private static final Id_repeat:I = 0x2c

.field private static final Id_replace:I = 0x21

.field private static final Id_search:I = 0x20

.field private static final Id_slice:I = 0xf

.field private static final Id_small:I = 0x14

.field private static final Id_split:I = 0x9

.field private static final Id_startsWith:I = 0x29

.field private static final Id_strike:I = 0x13

.field private static final Id_sub:I = 0x18

.field private static final Id_substr:I = 0xd

.field private static final Id_substring:I = 0xa

.field private static final Id_sup:I = 0x17

.field private static final Id_toLocaleLowerCase:I = 0x23

.field private static final Id_toLocaleUpperCase:I = 0x24

.field private static final Id_toLowerCase:I = 0xb

.field private static final Id_toSource:I = 0x3

.field private static final Id_toString:I = 0x2

.field private static final Id_toUpperCase:I = 0xc

.field private static final Id_trim:I = 0x25

.field private static final Id_trimLeft:I = 0x26

.field private static final Id_trimRight:I = 0x27

.field private static final Id_valueOf:I = 0x4

.field private static final MAX_INSTANCE_ID:I = 0x1

.field private static final MAX_PROTOTYPE_ID:I = 0x2d

.field private static final STRING_TAG:Ljava/lang/Object;

.field static final serialVersionUID:J = 0xcc57334977d230fL


# instance fields
.field private string:Ljava/lang/CharSequence;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 33
    const-string v0, "String"

    sput-object v0, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "s"    # Ljava/lang/CharSequence;

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 42
    iput-object p1, p0, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    .line 43
    return-void
.end method

.method static init(Lorg/mozilla/javascript/Scriptable;Z)V
    .registers 4
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "sealed"    # Z

    .prologue
    .line 37
    new-instance v0, Lorg/mozilla/javascript/NativeString;

    const-string v1, ""

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/NativeString;-><init>(Ljava/lang/CharSequence;)V

    .line 38
    .local v0, "obj":Lorg/mozilla/javascript/NativeString;
    const/16 v1, 0x2d

    invoke-virtual {v0, v1, p0, p1}, Lorg/mozilla/javascript/NativeString;->exportAsJSClass(ILorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/IdFunctionObject;

    .line 39
    return-void
.end method

.method private static js_concat(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 10
    .param p0, "target"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 690
    array-length v0, p1

    .line 691
    .local v0, "N":I
    if-nez v0, :cond_4

    .line 712
    .end local p0    # "target":Ljava/lang/String;
    :goto_3
    return-object p0

    .line 692
    .restart local p0    # "target":Ljava/lang/String;
    :cond_4
    const/4 v7, 0x1

    if-ne v0, v7, :cond_13

    .line 693
    const/4 v7, 0x0

    aget-object v7, p1, v7

    invoke-static {v7}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 694
    .local v1, "arg":Ljava/lang/String;
    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_3

    .line 699
    .end local v1    # "arg":Ljava/lang/String;
    :cond_13
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 700
    .local v6, "size":I
    new-array v2, v0, [Ljava/lang/String;

    .line 701
    .local v2, "argsAsStrings":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1a
    if-eq v3, v0, :cond_2c

    .line 702
    aget-object v7, p1, v3

    invoke-static {v7}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 703
    .local v5, "s":Ljava/lang/String;
    aput-object v5, v2, v3

    .line 704
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    add-int/2addr v6, v7

    .line 701
    add-int/lit8 v3, v3, 0x1

    goto :goto_1a

    .line 707
    .end local v5    # "s":Ljava/lang/String;
    :cond_2c
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 708
    .local v4, "result":Ljava/lang/StringBuilder;
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 709
    const/4 v3, 0x0

    :goto_35
    if-eq v3, v0, :cond_3f

    .line 710
    aget-object v7, v2, v3

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 709
    add-int/lit8 v3, v3, 0x1

    goto :goto_35

    .line 712
    :cond_3f
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_3
.end method

.method private static js_indexOf(ILjava/lang/String;[Ljava/lang/Object;)I
    .registers 13
    .param p0, "methodId"    # I
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    const/16 v9, 0x29

    const/16 v8, 0x2a

    const/4 v7, 0x1

    const/4 v4, -0x1

    const/4 v3, 0x0

    .line 572
    invoke-static {p2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v2

    .line 573
    .local v2, "searchStr":Ljava/lang/String;
    invoke-static {p2, v7}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger([Ljava/lang/Object;I)D

    move-result-wide v0

    .line 575
    .local v0, "position":D
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    int-to-double v5, v5

    cmpl-double v5, v0, v5

    if-lez v5, :cond_1e

    if-eq p0, v9, :cond_1e

    if-eq p0, v8, :cond_1e

    move v3, v4

    .line 586
    :cond_1d
    :goto_1d
    return v3

    .line 578
    :cond_1e
    const-wide/16 v5, 0x0

    cmpg-double v5, v0, v5

    if-gez v5, :cond_4a

    const-wide/16 v0, 0x0

    .line 582
    :cond_26
    :goto_26
    if-ne v8, p0, :cond_6e

    .line 583
    array-length v5, p2

    if-eqz v5, :cond_38

    array-length v5, p2

    if-eq v5, v7, :cond_38

    array-length v5, p2

    const/4 v6, 0x2

    if-ne v5, v6, :cond_3d

    aget-object v5, p2, v7

    sget-object v6, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v5, v6, :cond_3d

    :cond_38
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    int-to-double v0, v5

    .line 584
    :cond_3d
    double-to-int v5, v0

    invoke-virtual {p1, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1d

    move v3, v4

    goto :goto_1d

    .line 579
    :cond_4a
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    int-to-double v5, v5

    cmpl-double v5, v0, v5

    if-lez v5, :cond_59

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    int-to-double v0, v5

    goto :goto_26

    .line 580
    :cond_59
    if-ne p0, v8, :cond_26

    cmpl-double v5, v0, v0

    if-nez v5, :cond_68

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    int-to-double v5, v5

    cmpl-double v5, v0, v5

    if-lez v5, :cond_26

    :cond_68
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    int-to-double v0, v5

    goto :goto_26

    .line 586
    :cond_6e
    if-ne p0, v9, :cond_79

    double-to-int v5, v0

    invoke-virtual {p1, v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v5

    if-nez v5, :cond_1d

    move v3, v4

    goto :goto_1d

    :cond_79
    double-to-int v3, v0

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    goto :goto_1d
.end method

.method private static js_lastIndexOf(Ljava/lang/String;[Ljava/lang/Object;)I
    .registers 7
    .param p0, "target"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 598
    const/4 v3, 0x0

    invoke-static {p1, v3}, Lorg/mozilla/javascript/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v2

    .line 599
    .local v2, "search":Ljava/lang/String;
    const/4 v3, 0x1

    invoke-static {p1, v3}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v0

    .line 601
    .local v0, "end":D
    cmpl-double v3, v0, v0

    if-nez v3, :cond_17

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    int-to-double v3, v3

    cmpl-double v3, v0, v3

    if-lez v3, :cond_22

    .line 602
    :cond_17
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    int-to-double v0, v3

    .line 606
    :cond_1c
    :goto_1c
    double-to-int v3, v0

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v3

    return v3

    .line 603
    :cond_22
    const-wide/16 v3, 0x0

    cmpg-double v3, v0, v3

    if-gez v3, :cond_1c

    .line 604
    const-wide/16 v0, 0x0

    goto :goto_1c
.end method

.method private static js_slice(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 12
    .param p0, "target"    # Ljava/lang/CharSequence;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v9, 0x1

    const-wide/16 v5, 0x0

    .line 716
    array-length v7, p1

    if-ge v7, v9, :cond_29

    move-wide v0, v5

    .line 718
    .local v0, "begin":D
    :goto_7
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v4

    .line 719
    .local v4, "length":I
    cmpg-double v7, v0, v5

    if-gez v7, :cond_31

    .line 720
    int-to-double v7, v4

    add-double/2addr v0, v7

    .line 721
    cmpg-double v7, v0, v5

    if-gez v7, :cond_17

    .line 722
    const-wide/16 v0, 0x0

    .line 727
    :cond_17
    :goto_17
    array-length v7, p1

    const/4 v8, 0x2

    if-lt v7, v8, :cond_21

    aget-object v7, p1, v9

    sget-object v8, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v7, v8, :cond_38

    .line 728
    :cond_21
    int-to-double v2, v4

    .line 741
    .local v2, "end":D
    :cond_22
    :goto_22
    double-to-int v5, v0

    double-to-int v6, v2

    invoke-interface {p0, v5, v6}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v5

    return-object v5

    .line 716
    .end local v0    # "begin":D
    .end local v2    # "end":D
    .end local v4    # "length":I
    :cond_29
    const/4 v7, 0x0

    aget-object v7, p1, v7

    invoke-static {v7}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v0

    goto :goto_7

    .line 723
    .restart local v0    # "begin":D
    .restart local v4    # "length":I
    :cond_31
    int-to-double v7, v4

    cmpl-double v7, v0, v7

    if-lez v7, :cond_17

    .line 724
    int-to-double v0, v4

    goto :goto_17

    .line 730
    :cond_38
    aget-object v7, p1, v9

    invoke-static {v7}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v2

    .line 731
    .restart local v2    # "end":D
    cmpg-double v7, v2, v5

    if-gez v7, :cond_50

    .line 732
    int-to-double v7, v4

    add-double/2addr v2, v7

    .line 733
    cmpg-double v5, v2, v5

    if-gez v5, :cond_4a

    .line 734
    const-wide/16 v2, 0x0

    .line 738
    :cond_4a
    :goto_4a
    cmpg-double v5, v2, v0

    if-gez v5, :cond_22

    .line 739
    move-wide v2, v0

    goto :goto_22

    .line 735
    :cond_50
    int-to-double v5, v4

    cmpl-double v5, v2, v5

    if-lez v5, :cond_4a

    .line 736
    int-to-double v2, v4

    goto :goto_4a
.end method

.method private static js_substr(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 12
    .param p0, "target"    # Ljava/lang/CharSequence;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v9, 0x1

    const-wide/16 v7, 0x0

    .line 657
    array-length v5, p1

    if-ge v5, v9, :cond_7

    .line 683
    .end local p0    # "target":Ljava/lang/CharSequence;
    :goto_6
    return-object p0

    .line 660
    .restart local p0    # "target":Ljava/lang/CharSequence;
    :cond_7
    const/4 v5, 0x0

    aget-object v5, p1, v5

    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v0

    .line 662
    .local v0, "begin":D
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v4

    .line 664
    .local v4, "length":I
    cmpg-double v5, v0, v7

    if-gez v5, :cond_29

    .line 665
    int-to-double v5, v4

    add-double/2addr v0, v5

    .line 666
    cmpg-double v5, v0, v7

    if-gez v5, :cond_1e

    .line 667
    const-wide/16 v0, 0x0

    .line 672
    :cond_1e
    :goto_1e
    array-length v5, p1

    if-ne v5, v9, :cond_30

    .line 673
    int-to-double v2, v4

    .line 683
    .local v2, "end":D
    :cond_22
    :goto_22
    double-to-int v5, v0

    double-to-int v6, v2

    invoke-interface {p0, v5, v6}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p0

    goto :goto_6

    .line 668
    .end local v2    # "end":D
    :cond_29
    int-to-double v5, v4

    cmpl-double v5, v0, v5

    if-lez v5, :cond_1e

    .line 669
    int-to-double v0, v4

    goto :goto_1e

    .line 675
    :cond_30
    aget-object v5, p1, v9

    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v2

    .line 676
    .restart local v2    # "end":D
    cmpg-double v5, v2, v7

    if-gez v5, :cond_3c

    .line 677
    const-wide/16 v2, 0x0

    .line 678
    :cond_3c
    add-double/2addr v2, v0

    .line 679
    int-to-double v5, v4

    cmpl-double v5, v2, v5

    if-lez v5, :cond_22

    .line 680
    int-to-double v2, v4

    goto :goto_22
.end method

.method private static js_substring(Lorg/mozilla/javascript/Context;Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 15
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "target"    # Ljava/lang/CharSequence;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    const-wide/16 v10, 0x0

    const/4 v9, 0x1

    .line 616
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    .line 617
    .local v2, "length":I
    const/4 v7, 0x0

    invoke-static {p2, v7}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 620
    .local v3, "start":D
    cmpg-double v7, v3, v10

    if-gez v7, :cond_23

    .line 621
    const-wide/16 v3, 0x0

    .line 625
    :cond_12
    :goto_12
    array-length v7, p2

    if-le v7, v9, :cond_1b

    aget-object v7, p2, v9

    sget-object v8, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v7, v8, :cond_2a

    .line 626
    :cond_1b
    int-to-double v0, v2

    .line 646
    .local v0, "end":D
    :cond_1c
    :goto_1c
    double-to-int v7, v3

    double-to-int v8, v0

    invoke-interface {p1, v7, v8}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v7

    return-object v7

    .line 622
    .end local v0    # "end":D
    :cond_23
    int-to-double v7, v2

    cmpl-double v7, v3, v7

    if-lez v7, :cond_12

    .line 623
    int-to-double v3, v2

    goto :goto_12

    .line 628
    :cond_2a
    aget-object v7, p2, v9

    invoke-static {v7}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v0

    .line 629
    .restart local v0    # "end":D
    cmpg-double v7, v0, v10

    if-gez v7, :cond_46

    .line 630
    const-wide/16 v0, 0x0

    .line 635
    :cond_36
    :goto_36
    cmpg-double v7, v0, v3

    if-gez v7, :cond_1c

    .line 636
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v7

    const/16 v8, 0x78

    if-eq v7, v8, :cond_4d

    .line 637
    move-wide v5, v3

    .line 638
    .local v5, "temp":D
    move-wide v3, v0

    .line 639
    move-wide v0, v5

    .line 640
    goto :goto_1c

    .line 631
    .end local v5    # "temp":D
    :cond_46
    int-to-double v7, v2

    cmpl-double v7, v0, v7

    if-lez v7, :cond_36

    .line 632
    int-to-double v0, v2

    goto :goto_36

    .line 642
    :cond_4d
    move-wide v0, v3

    goto :goto_1c
.end method

.method private static realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/NativeString;
    .registers 3
    .param p0, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    .line 508
    instance-of v0, p0, Lorg/mozilla/javascript/NativeString;

    if-nez v0, :cond_9

    .line 509
    invoke-static {p1}, Lorg/mozilla/javascript/NativeString;->incompatibleCallError(Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 510
    :cond_9
    check-cast p0, Lorg/mozilla/javascript/NativeString;

    .end local p0    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    return-object p0
.end method

.method private static tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 8
    .param p0, "thisObj"    # Ljava/lang/Object;
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "attribute"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    const/16 v3, 0x3e

    .line 519
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 520
    .local v1, "str":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 521
    .local v0, "result":Ljava/lang/StringBuilder;
    const/16 v2, 0x3c

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 522
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 523
    if-eqz p2, :cond_2f

    .line 524
    const/16 v2, 0x20

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 525
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 526
    const-string v2, "=\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 527
    const/4 v2, 0x0

    invoke-static {p3, v2}, Lorg/mozilla/javascript/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 528
    const/16 v2, 0x22

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 530
    :cond_2f
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 531
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 532
    const-string v2, "</"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 533
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 534
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 535
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 42
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 187
    sget-object v3, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_f

    .line 188
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/IdScriptableObject;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v27

    .line 497
    :cond_e
    :goto_e
    return-object v27

    .line 190
    :cond_f
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v21

    .line 193
    .local v21, "id":I
    :goto_13
    packed-switch v21, :pswitch_data_524

    .line 502
    :pswitch_16
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "String.prototype has no method: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/IdFunctionObject;->getFunctionName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 211
    :pswitch_33
    move-object/from16 v0, p5

    array-length v3, v0

    if-lez v3, :cond_6a

    .line 212
    const/4 v3, 0x0

    aget-object v3, p5, v3

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v3

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-static {v0, v1, v3}, Lorg/mozilla/javascript/ScriptRuntime;->toObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p4

    .line 214
    move-object/from16 v0, p5

    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    new-array v0, v3, [Ljava/lang/Object;

    move-object/from16 v23, v0

    .line 215
    .local v23, "newArgs":[Ljava/lang/Object;
    const/16 v19, 0x0

    .local v19, "i":I
    :goto_52
    move-object/from16 v0, v23

    array-length v3, v0

    move/from16 v0, v19

    if-ge v0, v3, :cond_62

    .line 216
    add-int/lit8 v3, v19, 0x1

    aget-object v3, p5, v3

    aput-object v3, v23, v19

    .line 215
    add-int/lit8 v19, v19, 0x1

    goto :goto_52

    .line 217
    :cond_62
    move-object/from16 p5, v23

    .line 222
    .end local v19    # "i":I
    .end local v23    # "newArgs":[Ljava/lang/Object;
    :goto_64
    move/from16 v0, v21

    neg-int v0, v0

    move/from16 v21, v0

    .line 223
    goto :goto_13

    .line 219
    :cond_6a
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v3

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-static {v0, v1, v3}, Lorg/mozilla/javascript/ScriptRuntime;->toObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p4

    goto :goto_64

    .line 227
    :pswitch_77
    move-object/from16 v0, p5

    array-length v9, v0

    .line 228
    .local v9, "N":I
    const/4 v3, 0x1

    if-ge v9, v3, :cond_80

    .line 229
    const-string v27, ""

    goto :goto_e

    .line 230
    :cond_80
    new-instance v30, Ljava/lang/StringBuilder;

    move-object/from16 v0, v30

    invoke-direct {v0, v9}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 231
    .local v30, "sb":Ljava/lang/StringBuilder;
    const/16 v19, 0x0

    .restart local v19    # "i":I
    :goto_89
    move/from16 v0, v19

    if-eq v0, v9, :cond_9b

    .line 232
    aget-object v3, p5, v19

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->toUint16(Ljava/lang/Object;)C

    move-result v3

    move-object/from16 v0, v30

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 231
    add-int/lit8 v19, v19, 0x1

    goto :goto_89

    .line 234
    :cond_9b
    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 238
    .end local v9    # "N":I
    .end local v19    # "i":I
    .end local v30    # "sb":Ljava/lang/StringBuilder;
    :pswitch_a1
    move-object/from16 v0, p5

    array-length v3, v0

    const/4 v4, 0x1

    if-lt v3, v4, :cond_bb

    const/4 v3, 0x0

    aget-object v3, p5, v3

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v27

    .line 240
    .local v27, "s":Ljava/lang/CharSequence;
    :goto_ae
    if-nez p4, :cond_be

    .line 242
    new-instance v15, Lorg/mozilla/javascript/NativeString;

    move-object/from16 v0, v27

    invoke-direct {v15, v0}, Lorg/mozilla/javascript/NativeString;-><init>(Ljava/lang/CharSequence;)V

    move-object/from16 v27, v15

    goto/16 :goto_e

    .line 238
    .end local v27    # "s":Ljava/lang/CharSequence;
    :cond_bb
    const-string v27, ""

    goto :goto_ae

    .line 245
    .restart local v27    # "s":Ljava/lang/CharSequence;
    :cond_be
    move-object/from16 v0, v27

    instance-of v3, v0, Ljava/lang/String;

    if-nez v3, :cond_e

    invoke-interface/range {v27 .. v27}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 251
    .end local v27    # "s":Ljava/lang/CharSequence;
    :pswitch_ca
    move-object/from16 v0, p4

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/NativeString;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/NativeString;

    move-result-object v3

    iget-object v15, v3, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    .line 252
    .local v15, "cs":Ljava/lang/CharSequence;
    instance-of v3, v15, Ljava/lang/String;

    if-eqz v3, :cond_dc

    .end local v15    # "cs":Ljava/lang/CharSequence;
    :goto_d8
    move-object/from16 v27, v15

    goto/16 :goto_e

    .restart local v15    # "cs":Ljava/lang/CharSequence;
    :cond_dc
    invoke-interface {v15}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v15

    goto :goto_d8

    .line 255
    .end local v15    # "cs":Ljava/lang/CharSequence;
    :pswitch_e1
    move-object/from16 v0, p4

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/NativeString;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/NativeString;

    move-result-object v3

    iget-object v0, v3, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    move-object/from16 v27, v0

    .line 256
    .restart local v27    # "s":Ljava/lang/CharSequence;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "(new String(\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface/range {v27 .. v27}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->escapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\"))"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 262
    .end local v27    # "s":Ljava/lang/CharSequence;
    :pswitch_110
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v35

    .line 263
    .local v35, "target":Ljava/lang/CharSequence;
    const/4 v3, 0x0

    move-object/from16 v0, p5

    invoke-static {v0, v3}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger([Ljava/lang/Object;I)D

    move-result-wide v24

    .line 264
    .local v24, "pos":D
    const-wide/16 v3, 0x0

    cmpg-double v3, v24, v3

    if-ltz v3, :cond_12a

    invoke-interface/range {v35 .. v35}, Ljava/lang/CharSequence;->length()I

    move-result v3

    int-to-double v3, v3

    cmpl-double v3, v24, v3

    if-ltz v3, :cond_137

    .line 265
    :cond_12a
    const/4 v3, 0x5

    move/from16 v0, v21

    if-ne v0, v3, :cond_133

    const-string v27, ""

    goto/16 :goto_e

    .line 266
    :cond_133
    sget-object v27, Lorg/mozilla/javascript/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    goto/16 :goto_e

    .line 268
    :cond_137
    move-wide/from16 v0, v24

    double-to-int v3, v0

    move-object/from16 v0, v35

    invoke-interface {v0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v10

    .line 269
    .local v10, "c":C
    const/4 v3, 0x5

    move/from16 v0, v21

    if-ne v0, v3, :cond_14b

    invoke-static {v10}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 270
    :cond_14b
    invoke-static {v10}, Lorg/mozilla/javascript/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v27

    goto/16 :goto_e

    .line 274
    .end local v10    # "c":C
    .end local v24    # "pos":D
    .end local v35    # "target":Ljava/lang/CharSequence;
    :pswitch_151
    const/4 v3, 0x7

    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p5

    invoke-static {v3, v4, v0}, Lorg/mozilla/javascript/NativeString;->js_indexOf(ILjava/lang/String;[Ljava/lang/Object;)I

    move-result v3

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v27

    goto/16 :goto_e

    .line 279
    :pswitch_162
    move-object/from16 v0, p4

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->requireObjectCoercible(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v3

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v27

    .line 281
    .local v27, "s":Ljava/lang/String;
    move-object/from16 v0, p5

    array-length v3, v0

    if-lez v3, :cond_18b

    const/4 v3, 0x0

    aget-object v3, p5, v3

    instance-of v3, v3, Lorg/mozilla/javascript/regexp/NativeRegExp;

    if-eqz v3, :cond_18b

    .line 282
    const-string v3, "msg.first.arg.not.regexp"

    const-class v4, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/IdFunctionObject;->getFunctionName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lorg/mozilla/javascript/ScriptRuntime;->typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    throw v3

    .line 285
    :cond_18b
    move/from16 v0, v21

    move-object/from16 v1, v27

    move-object/from16 v2, p5

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/NativeString;->js_indexOf(ILjava/lang/String;[Ljava/lang/Object;)I

    move-result v22

    .line 287
    .local v22, "idx":I
    const/16 v3, 0x28

    move/from16 v0, v21

    if-ne v0, v3, :cond_1a9

    .line 288
    const/4 v3, -0x1

    move/from16 v0, v22

    if-eq v0, v3, :cond_1a7

    const/4 v3, 0x1

    :goto_1a1
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v27

    goto/16 :goto_e

    :cond_1a7
    const/4 v3, 0x0

    goto :goto_1a1

    .line 289
    :cond_1a9
    const/16 v3, 0x29

    move/from16 v0, v21

    if-ne v0, v3, :cond_1ba

    .line 290
    if-nez v22, :cond_1b8

    const/4 v3, 0x1

    :goto_1b2
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v27

    goto/16 :goto_e

    :cond_1b8
    const/4 v3, 0x0

    goto :goto_1b2

    .line 291
    :cond_1ba
    const/16 v3, 0x2a

    move/from16 v0, v21

    if-ne v0, v3, :cond_1ce

    .line 292
    const/4 v3, -0x1

    move/from16 v0, v22

    if-eq v0, v3, :cond_1cc

    const/4 v3, 0x1

    :goto_1c6
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v27

    goto/16 :goto_e

    :cond_1cc
    const/4 v3, 0x0

    goto :goto_1c6

    .line 296
    .end local v22    # "idx":I
    .end local v27    # "s":Ljava/lang/String;
    :cond_1ce
    :pswitch_1ce
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p5

    invoke-static {v3, v0}, Lorg/mozilla/javascript/NativeString;->js_lastIndexOf(Ljava/lang/String;[Ljava/lang/Object;)I

    move-result v3

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v27

    goto/16 :goto_e

    .line 300
    :pswitch_1de
    invoke-static/range {p2 .. p2}, Lorg/mozilla/javascript/ScriptRuntime;->checkRegExpProxy(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/RegExpProxy;

    move-result-object v3

    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p5

    invoke-interface {v3, v0, v1, v4, v2}, Lorg/mozilla/javascript/RegExpProxy;->js_split(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v27

    goto/16 :goto_e

    .line 305
    :pswitch_1f2
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v3

    move-object/from16 v0, p2

    move-object/from16 v1, p5

    invoke-static {v0, v3, v1}, Lorg/mozilla/javascript/NativeString;->js_substring(Lorg/mozilla/javascript/Context;Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v27

    goto/16 :goto_e

    .line 309
    :pswitch_200
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lorg/mozilla/javascript/ScriptRuntime;->ROOT_LOCALE:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 314
    :pswitch_20c
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lorg/mozilla/javascript/ScriptRuntime;->ROOT_LOCALE:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 318
    :pswitch_218
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v3

    move-object/from16 v0, p5

    invoke-static {v3, v0}, Lorg/mozilla/javascript/NativeString;->js_substr(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v27

    goto/16 :goto_e

    .line 321
    :pswitch_224
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p5

    invoke-static {v3, v0}, Lorg/mozilla/javascript/NativeString;->js_concat(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 324
    :pswitch_230
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v3

    move-object/from16 v0, p5

    invoke-static {v3, v0}, Lorg/mozilla/javascript/NativeString;->js_slice(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v27

    goto/16 :goto_e

    .line 327
    :pswitch_23c
    const-string v3, "b"

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v0, p4

    invoke-static {v0, v3, v4, v5}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 330
    :pswitch_248
    const-string v3, "i"

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v0, p4

    invoke-static {v0, v3, v4, v5}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 333
    :pswitch_254
    const-string v3, "tt"

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v0, p4

    invoke-static {v0, v3, v4, v5}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 336
    :pswitch_260
    const-string v3, "strike"

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v0, p4

    invoke-static {v0, v3, v4, v5}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 339
    :pswitch_26c
    const-string v3, "small"

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v0, p4

    invoke-static {v0, v3, v4, v5}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 342
    :pswitch_278
    const-string v3, "big"

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v0, p4

    invoke-static {v0, v3, v4, v5}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 345
    :pswitch_284
    const-string v3, "blink"

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v0, p4

    invoke-static {v0, v3, v4, v5}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 348
    :pswitch_290
    const-string v3, "sup"

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v0, p4

    invoke-static {v0, v3, v4, v5}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 351
    :pswitch_29c
    const-string v3, "sub"

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v0, p4

    invoke-static {v0, v3, v4, v5}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 354
    :pswitch_2a8
    const-string v3, "font"

    const-string v4, "size"

    move-object/from16 v0, p4

    move-object/from16 v1, p5

    invoke-static {v0, v3, v4, v1}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 357
    :pswitch_2b6
    const-string v3, "font"

    const-string v4, "color"

    move-object/from16 v0, p4

    move-object/from16 v1, p5

    invoke-static {v0, v3, v4, v1}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 360
    :pswitch_2c4
    const-string v3, "a"

    const-string v4, "href"

    move-object/from16 v0, p4

    move-object/from16 v1, p5

    invoke-static {v0, v3, v4, v1}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 363
    :pswitch_2d2
    const-string v3, "a"

    const-string v4, "name"

    move-object/from16 v0, p4

    move-object/from16 v1, p5

    invoke-static {v0, v3, v4, v1}, Lorg/mozilla/javascript/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 367
    :pswitch_2e0
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v28

    .line 368
    .local v28, "s1":Ljava/lang/String;
    const/4 v3, 0x0

    move-object/from16 v0, p5

    invoke-static {v0, v3}, Lorg/mozilla/javascript/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v29

    .line 369
    .local v29, "s2":Ljava/lang/String;
    const/16 v3, 0x1d

    move/from16 v0, v21

    if-ne v0, v3, :cond_2fb

    invoke-virtual/range {v28 .. v29}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    :goto_2f5
    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v27

    goto/16 :goto_e

    :cond_2fb
    invoke-virtual/range {v28 .. v29}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    goto :goto_2f5

    .line 378
    .end local v28    # "s1":Ljava/lang/String;
    .end local v29    # "s2":Ljava/lang/String;
    :pswitch_300
    const/16 v3, 0x1f

    move/from16 v0, v21

    if-ne v0, v3, :cond_319

    .line 379
    const/4 v8, 0x1

    .line 385
    .local v8, "actionType":I
    :goto_307
    invoke-static/range {p2 .. p2}, Lorg/mozilla/javascript/ScriptRuntime;->checkRegExpProxy(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/RegExpProxy;

    move-result-object v3

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    invoke-interface/range {v3 .. v8}, Lorg/mozilla/javascript/RegExpProxy;->action(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v27

    goto/16 :goto_e

    .line 380
    .end local v8    # "actionType":I
    :cond_319
    const/16 v3, 0x20

    move/from16 v0, v21

    if-ne v0, v3, :cond_321

    .line 381
    const/4 v8, 0x3

    .restart local v8    # "actionType":I
    goto :goto_307

    .line 383
    .end local v8    # "actionType":I
    :cond_321
    const/4 v8, 0x2

    .restart local v8    # "actionType":I
    goto :goto_307

    .line 394
    .end local v8    # "actionType":I
    :pswitch_323
    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/Context;->getLocale()Ljava/util/Locale;

    move-result-object v3

    invoke-static {v3}, Ljava/text/Collator;->getInstance(Ljava/util/Locale;)Ljava/text/Collator;

    move-result-object v14

    .line 395
    .local v14, "collator":Ljava/text/Collator;
    const/4 v3, 0x3

    invoke-virtual {v14, v3}, Ljava/text/Collator;->setStrength(I)V

    .line 396
    const/4 v3, 0x1

    invoke-virtual {v14, v3}, Ljava/text/Collator;->setDecomposition(I)V

    .line 397
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    move-object/from16 v0, p5

    invoke-static {v0, v4}, Lorg/mozilla/javascript/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v14, v3, v4}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    int-to-double v3, v3

    invoke-static {v3, v4}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v27

    goto/16 :goto_e

    .line 402
    .end local v14    # "collator":Ljava/text/Collator;
    :pswitch_349
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/Context;->getLocale()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 406
    :pswitch_357
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/Context;->getLocale()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 410
    :pswitch_365
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v34

    .line 411
    .local v34, "str":Ljava/lang/String;
    invoke-virtual/range {v34 .. v34}, Ljava/lang/String;->toCharArray()[C

    move-result-object v11

    .line 413
    .local v11, "chars":[C
    const/16 v33, 0x0

    .line 414
    .local v33, "start":I
    :goto_36f
    array-length v3, v11

    move/from16 v0, v33

    if-ge v0, v3, :cond_37f

    aget-char v3, v11, v33

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->isJSWhitespaceOrLineTerminator(I)Z

    move-result v3

    if-eqz v3, :cond_37f

    .line 415
    add-int/lit8 v33, v33, 0x1

    goto :goto_36f

    .line 417
    :cond_37f
    array-length v0, v11

    move/from16 v16, v0

    .line 418
    .local v16, "end":I
    :goto_382
    move/from16 v0, v16

    move/from16 v1, v33

    if-le v0, v1, :cond_395

    add-int/lit8 v3, v16, -0x1

    aget-char v3, v11, v3

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->isJSWhitespaceOrLineTerminator(I)Z

    move-result v3

    if-eqz v3, :cond_395

    .line 419
    add-int/lit8 v16, v16, -0x1

    goto :goto_382

    .line 422
    :cond_395
    move-object/from16 v0, v34

    move/from16 v1, v33

    move/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 425
    .end local v11    # "chars":[C
    .end local v16    # "end":I
    .end local v33    # "start":I
    .end local v34    # "str":Ljava/lang/String;
    :pswitch_3a1
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v34

    .line 426
    .restart local v34    # "str":Ljava/lang/String;
    invoke-virtual/range {v34 .. v34}, Ljava/lang/String;->toCharArray()[C

    move-result-object v11

    .line 428
    .restart local v11    # "chars":[C
    const/16 v33, 0x0

    .line 429
    .restart local v33    # "start":I
    :goto_3ab
    array-length v3, v11

    move/from16 v0, v33

    if-ge v0, v3, :cond_3bb

    aget-char v3, v11, v33

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->isJSWhitespaceOrLineTerminator(I)Z

    move-result v3

    if-eqz v3, :cond_3bb

    .line 430
    add-int/lit8 v33, v33, 0x1

    goto :goto_3ab

    .line 432
    :cond_3bb
    array-length v0, v11

    move/from16 v16, v0

    .line 434
    .restart local v16    # "end":I
    move-object/from16 v0, v34

    move/from16 v1, v33

    move/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 438
    .end local v11    # "chars":[C
    .end local v16    # "end":I
    .end local v33    # "start":I
    .end local v34    # "str":Ljava/lang/String;
    :pswitch_3ca
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v34

    .line 439
    .restart local v34    # "str":Ljava/lang/String;
    invoke-virtual/range {v34 .. v34}, Ljava/lang/String;->toCharArray()[C

    move-result-object v11

    .line 441
    .restart local v11    # "chars":[C
    const/16 v33, 0x0

    .line 443
    .restart local v33    # "start":I
    array-length v0, v11

    move/from16 v16, v0

    .line 444
    .restart local v16    # "end":I
    :goto_3d7
    move/from16 v0, v16

    move/from16 v1, v33

    if-le v0, v1, :cond_3ea

    add-int/lit8 v3, v16, -0x1

    aget-char v3, v11, v3

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->isJSWhitespaceOrLineTerminator(I)Z

    move-result v3

    if-eqz v3, :cond_3ea

    .line 445
    add-int/lit8 v16, v16, -0x1

    goto :goto_3d7

    .line 448
    :cond_3ea
    move-object/from16 v0, v34

    move/from16 v1, v33

    move/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 451
    .end local v11    # "chars":[C
    .end local v16    # "end":I
    .end local v33    # "start":I
    .end local v34    # "str":Ljava/lang/String;
    :pswitch_3f6
    const/4 v3, 0x0

    move-object/from16 v0, p5

    invoke-static {v0, v3}, Lorg/mozilla/javascript/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v18

    .line 454
    .local v18, "formStr":Ljava/lang/String;
    sget-object v3, Ljava/text/Normalizer$Form;->NFD:Ljava/text/Normalizer$Form;

    invoke-virtual {v3}, Ljava/text/Normalizer$Form;->name()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_421

    sget-object v17, Ljava/text/Normalizer$Form;->NFD:Ljava/text/Normalizer$Form;

    .line 460
    .local v17, "form":Ljava/text/Normalizer$Form;
    :goto_40d
    move-object/from16 v0, p4

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->requireObjectCoercible(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v3

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-static {v3, v0}, Ljava/text/Normalizer;->normalize(Ljava/lang/CharSequence;Ljava/text/Normalizer$Form;)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 455
    .end local v17    # "form":Ljava/text/Normalizer$Form;
    :cond_421
    sget-object v3, Ljava/text/Normalizer$Form;->NFKC:Ljava/text/Normalizer$Form;

    invoke-virtual {v3}, Ljava/text/Normalizer$Form;->name()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_432

    sget-object v17, Ljava/text/Normalizer$Form;->NFKC:Ljava/text/Normalizer$Form;

    .restart local v17    # "form":Ljava/text/Normalizer$Form;
    goto :goto_40d

    .line 456
    .end local v17    # "form":Ljava/text/Normalizer$Form;
    :cond_432
    sget-object v3, Ljava/text/Normalizer$Form;->NFKD:Ljava/text/Normalizer$Form;

    invoke-virtual {v3}, Ljava/text/Normalizer$Form;->name()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_443

    sget-object v17, Ljava/text/Normalizer$Form;->NFKD:Ljava/text/Normalizer$Form;

    .restart local v17    # "form":Ljava/text/Normalizer$Form;
    goto :goto_40d

    .line 457
    .end local v17    # "form":Ljava/text/Normalizer$Form;
    :cond_443
    sget-object v3, Ljava/text/Normalizer$Form;->NFC:Ljava/text/Normalizer$Form;

    invoke-virtual {v3}, Ljava/text/Normalizer$Form;->name()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_456

    move-object/from16 v0, p5

    array-length v3, v0

    if-nez v3, :cond_459

    :cond_456
    sget-object v17, Ljava/text/Normalizer$Form;->NFC:Ljava/text/Normalizer$Form;

    .restart local v17    # "form":Ljava/text/Normalizer$Form;
    goto :goto_40d

    .line 458
    .end local v17    # "form":Ljava/text/Normalizer$Form;
    :cond_459
    const-string v3, "The normalization form should be one of NFC, NFD, NFKC, NFKD"

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->rangeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    throw v3

    .line 465
    .end local v18    # "formStr":Ljava/lang/String;
    :pswitch_460
    move-object/from16 v0, p4

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->requireObjectCoercible(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v3

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v34

    .line 466
    .restart local v34    # "str":Ljava/lang/String;
    const/4 v3, 0x0

    move-object/from16 v0, p5

    invoke-static {v0, v3}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger([Ljava/lang/Object;I)D

    move-result-wide v12

    .line 468
    .local v12, "cnt":D
    const-wide/16 v3, 0x0

    cmpl-double v3, v12, v3

    if-nez v3, :cond_47d

    .line 469
    const-string v27, ""

    goto/16 :goto_e

    .line 472
    :cond_47d
    const-wide/16 v3, 0x0

    cmpg-double v3, v12, v3

    if-ltz v3, :cond_489

    const-wide/high16 v3, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v3, v12, v3

    if-nez v3, :cond_490

    :cond_489
    const-string v3, "Invalid count value"

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->rangeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    throw v3

    .line 474
    :cond_490
    invoke-virtual/range {v34 .. v34}, Ljava/lang/String;->length()I

    move-result v3

    int-to-long v3, v3

    double-to-long v5, v12

    mul-long v31, v3, v5

    .line 476
    .local v31, "size":J
    const-wide v3, 0x41dfffffffc00000L    # 2.147483647E9

    cmpl-double v3, v12, v3

    if-gez v3, :cond_4a8

    const-wide/32 v3, 0x7fffffff

    cmp-long v3, v31, v3

    if-ltz v3, :cond_4ab

    .line 477
    :cond_4a8
    const-wide/32 v31, 0x7fffffff

    .line 480
    :cond_4ab
    new-instance v26, Ljava/lang/StringBuilder;

    move-wide/from16 v0, v31

    long-to-int v3, v0

    move-object/from16 v0, v26

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 481
    .local v26, "retval":Ljava/lang/StringBuilder;
    move-object/from16 v0, v26

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 483
    const/16 v19, 0x1

    .line 484
    .restart local v19    # "i":I
    :goto_4be
    move/from16 v0, v19

    int-to-double v3, v0

    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    div-double v5, v12, v5

    cmpg-double v3, v3, v5

    if-gtz v3, :cond_520

    .line 485
    move-object/from16 v0, v26

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 486
    mul-int/lit8 v19, v19, 0x2

    goto :goto_4be

    .line 488
    .end local v19    # "i":I
    .local v20, "i":I
    :goto_4d3
    add-int/lit8 v19, v20, 0x1

    .end local v20    # "i":I
    .restart local v19    # "i":I
    move/from16 v0, v20

    int-to-double v3, v0

    cmpg-double v3, v3, v12

    if-gez v3, :cond_4e6

    move-object/from16 v0, v26

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v20, v19

    .end local v19    # "i":I
    .restart local v20    # "i":I
    goto :goto_4d3

    .line 490
    .end local v20    # "i":I
    .restart local v19    # "i":I
    :cond_4e6
    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_e

    .line 494
    .end local v12    # "cnt":D
    .end local v19    # "i":I
    .end local v26    # "retval":Ljava/lang/StringBuilder;
    .end local v31    # "size":J
    .end local v34    # "str":Ljava/lang/String;
    :pswitch_4ec
    move-object/from16 v0, p4

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->requireObjectCoercible(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v3

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v34

    .line 495
    .restart local v34    # "str":Ljava/lang/String;
    const/4 v3, 0x0

    move-object/from16 v0, p5

    invoke-static {v0, v3}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger([Ljava/lang/Object;I)D

    move-result-wide v12

    .line 497
    .restart local v12    # "cnt":D
    const-wide/16 v3, 0x0

    cmpg-double v3, v12, v3

    if-ltz v3, :cond_50e

    invoke-virtual/range {v34 .. v34}, Ljava/lang/String;->length()I

    move-result v3

    int-to-double v3, v3

    cmpl-double v3, v12, v3

    if-ltz v3, :cond_514

    :cond_50e
    sget-object v3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    :goto_510
    move-object/from16 v27, v3

    goto/16 :goto_e

    :cond_514
    double-to-int v3, v12

    move-object/from16 v0, v34

    invoke-virtual {v0, v3}, Ljava/lang/String;->codePointAt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    goto :goto_510

    .restart local v19    # "i":I
    .restart local v26    # "retval":Ljava/lang/StringBuilder;
    .restart local v31    # "size":J
    :cond_520
    move/from16 v20, v19

    .end local v19    # "i":I
    .restart local v20    # "i":I
    goto :goto_4d3

    .line 193
    nop

    :pswitch_data_524
    .packed-switch -0x23
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_77
        :pswitch_16
        :pswitch_a1
        :pswitch_ca
        :pswitch_e1
        :pswitch_ca
        :pswitch_110
        :pswitch_110
        :pswitch_151
        :pswitch_1ce
        :pswitch_1de
        :pswitch_1f2
        :pswitch_200
        :pswitch_20c
        :pswitch_218
        :pswitch_224
        :pswitch_230
        :pswitch_23c
        :pswitch_248
        :pswitch_254
        :pswitch_260
        :pswitch_26c
        :pswitch_278
        :pswitch_284
        :pswitch_290
        :pswitch_29c
        :pswitch_2a8
        :pswitch_2b6
        :pswitch_2c4
        :pswitch_2d2
        :pswitch_2e0
        :pswitch_2e0
        :pswitch_300
        :pswitch_300
        :pswitch_300
        :pswitch_323
        :pswitch_349
        :pswitch_357
        :pswitch_365
        :pswitch_3a1
        :pswitch_3ca
        :pswitch_162
        :pswitch_162
        :pswitch_162
        :pswitch_3f6
        :pswitch_460
        :pswitch_4ec
    .end packed-switch
.end method

.method protected fillConstructorProperties(Lorg/mozilla/javascript/IdFunctionObject;)V
    .registers 8
    .param p1, "ctor"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    .line 88
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/4 v3, -0x1

    const-string v4, "fromCharCode"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 90
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/4 v3, -0x5

    const-string v4, "charAt"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 92
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/4 v3, -0x6

    const-string v4, "charCodeAt"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 94
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/4 v3, -0x7

    const-string v4, "indexOf"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 96
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/4 v3, -0x8

    const-string v4, "lastIndexOf"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 98
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0x9

    const-string v4, "split"

    const/4 v5, 0x3

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 100
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0xa

    const-string v4, "substring"

    const/4 v5, 0x3

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 102
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0xb

    const-string v4, "toLowerCase"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 104
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0xc

    const-string v4, "toUpperCase"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 106
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0xd

    const-string v4, "substr"

    const/4 v5, 0x3

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 108
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0xe

    const-string v4, "concat"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 110
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0xf

    const-string v4, "slice"

    const/4 v5, 0x3

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 112
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0x1e

    const-string v4, "equalsIgnoreCase"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 114
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0x1f

    const-string v4, "match"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 116
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0x20

    const-string v4, "search"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 118
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0x21

    const-string v4, "replace"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 120
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0x22

    const-string v4, "localeCompare"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 122
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0x23

    const-string v4, "toLocaleLowerCase"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeString;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 124
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->fillConstructorProperties(Lorg/mozilla/javascript/IdFunctionObject;)V

    .line 125
    return-void
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .registers 4
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 63
    const-string v0, "length"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 64
    const/4 v0, 0x7

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/NativeString;->instanceIdInfo(II)I

    move-result v0

    .line 66
    :goto_e
    return v0

    :cond_f
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v0

    goto :goto_e
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .registers 11
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x2

    const/16 v7, 0x62

    const/16 v6, 0x73

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 751
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 752
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    packed-switch v3, :pswitch_data_1b4

    .line 821
    :cond_10
    :goto_10
    :pswitch_10
    if-eqz v0, :cond_1b

    if-eq v0, p1, :cond_1b

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1b

    const/4 v2, 0x0

    .line 825
    :cond_1b
    :goto_1b
    return v2

    .line 753
    :pswitch_1c
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 754
    .local v1, "c":I
    if-ne v1, v7, :cond_33

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v6, :cond_10

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x75

    if-ne v3, v4, :cond_10

    const/16 v2, 0x18

    goto :goto_1b

    .line 755
    :cond_33
    const/16 v3, 0x67

    if-ne v1, v3, :cond_48

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v7, :cond_10

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x69

    if-ne v3, v4, :cond_10

    const/16 v2, 0x15

    goto :goto_1b

    .line 756
    :cond_48
    const/16 v3, 0x70

    if-ne v1, v3, :cond_10

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v6, :cond_10

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x75

    if-ne v3, v4, :cond_10

    const/16 v2, 0x17

    goto :goto_1b

    .line 758
    .end local v1    # "c":I
    :pswitch_5d
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 759
    .restart local v1    # "c":I
    if-ne v1, v7, :cond_68

    const-string v0, "bold"

    const/16 v2, 0x10

    goto :goto_10

    .line 760
    :cond_68
    const/16 v3, 0x6c

    if-ne v1, v3, :cond_71

    const-string v0, "link"

    const/16 v2, 0x1b

    goto :goto_10

    .line 761
    :cond_71
    const/16 v3, 0x74

    if-ne v1, v3, :cond_10

    const-string v0, "trim"

    const/16 v2, 0x25

    goto :goto_10

    .line 763
    .end local v1    # "c":I
    :pswitch_7a
    const/4 v3, 0x4

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_1d6

    goto :goto_10

    .line 764
    :sswitch_83
    const-string v0, "fixed"

    const/16 v2, 0x12

    goto :goto_10

    .line 765
    :sswitch_88
    const-string v0, "slice"

    const/16 v2, 0xf

    goto :goto_10

    .line 766
    :sswitch_8d
    const-string v0, "match"

    const/16 v2, 0x1f

    goto/16 :goto_10

    .line 767
    :sswitch_93
    const-string v0, "blink"

    const/16 v2, 0x16

    goto/16 :goto_10

    .line 768
    :sswitch_99
    const-string v0, "small"

    const/16 v2, 0x14

    goto/16 :goto_10

    .line 769
    :sswitch_9f
    const-string v0, "split"

    const/16 v2, 0x9

    goto/16 :goto_10

    .line 771
    :pswitch_a5
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_1f0

    goto/16 :goto_10

    .line 772
    :sswitch_ae
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 773
    .restart local v1    # "c":I
    const/16 v3, 0x72

    if-ne v1, v3, :cond_bc

    const-string v0, "repeat"

    const/16 v2, 0x2c

    goto/16 :goto_10

    .line 774
    :cond_bc
    if-ne v1, v6, :cond_10

    const-string v0, "search"

    const/16 v2, 0x20

    goto/16 :goto_10

    .line 776
    .end local v1    # "c":I
    :sswitch_c4
    const-string v0, "charAt"

    const/4 v2, 0x5

    goto/16 :goto_10

    .line 777
    :sswitch_c9
    const-string v0, "anchor"

    const/16 v2, 0x1c

    goto/16 :goto_10

    .line 778
    :sswitch_cf
    const-string v0, "concat"

    const/16 v2, 0xe

    goto/16 :goto_10

    .line 779
    :sswitch_d5
    const-string v0, "equals"

    const/16 v2, 0x1d

    goto/16 :goto_10

    .line 780
    :sswitch_db
    const-string v0, "strike"

    const/16 v2, 0x13

    goto/16 :goto_10

    .line 781
    :sswitch_e1
    const-string v0, "substr"

    const/16 v2, 0xd

    goto/16 :goto_10

    .line 783
    :pswitch_e7
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_20e

    goto/16 :goto_10

    .line 784
    :sswitch_f0
    const-string v0, "valueOf"

    const/4 v2, 0x4

    goto/16 :goto_10

    .line 785
    :sswitch_f5
    const-string v0, "replace"

    const/16 v2, 0x21

    goto/16 :goto_10

    .line 786
    :sswitch_fb
    const-string v0, "indexOf"

    const/4 v2, 0x7

    goto/16 :goto_10

    .line 787
    :sswitch_100
    const-string v0, "italics"

    const/16 v2, 0x11

    goto/16 :goto_10

    .line 789
    :pswitch_106
    const/4 v3, 0x6

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_220

    goto/16 :goto_10

    .line 790
    :sswitch_110
    const-string v0, "toSource"

    const/4 v2, 0x3

    goto/16 :goto_10

    .line 791
    :sswitch_115
    const-string v0, "includes"

    const/16 v2, 0x28

    goto/16 :goto_10

    .line 792
    :sswitch_11b
    const-string v0, "trimLeft"

    const/16 v2, 0x26

    goto/16 :goto_10

    .line 793
    :sswitch_121
    const-string v0, "toString"

    const/4 v2, 0x2

    goto/16 :goto_10

    .line 794
    :sswitch_126
    const-string v0, "endsWith"

    const/16 v2, 0x2a

    goto/16 :goto_10

    .line 795
    :sswitch_12c
    const-string v0, "fontsize"

    const/16 v2, 0x19

    goto/16 :goto_10

    .line 797
    :pswitch_132
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_23a

    goto/16 :goto_10

    .line 798
    :sswitch_13b
    const-string v0, "fontcolor"

    const/16 v2, 0x1a

    goto/16 :goto_10

    .line 799
    :sswitch_141
    const-string v0, "normalize"

    const/16 v2, 0x2b

    goto/16 :goto_10

    .line 800
    :sswitch_147
    const-string v0, "substring"

    const/16 v2, 0xa

    goto/16 :goto_10

    .line 801
    :sswitch_14d
    const-string v0, "trimRight"

    const/16 v2, 0x27

    goto/16 :goto_10

    .line 803
    :pswitch_153
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 804
    .restart local v1    # "c":I
    const/16 v3, 0x63

    if-ne v1, v3, :cond_160

    const-string v0, "charCodeAt"

    const/4 v2, 0x6

    goto/16 :goto_10

    .line 805
    :cond_160
    if-ne v1, v6, :cond_10

    const-string v0, "startsWith"

    const/16 v2, 0x29

    goto/16 :goto_10

    .line 807
    .end local v1    # "c":I
    :pswitch_168
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_24c

    goto/16 :goto_10

    .line 808
    :sswitch_171
    const-string v0, "toLowerCase"

    const/16 v2, 0xb

    goto/16 :goto_10

    .line 809
    :sswitch_177
    const-string v0, "toUpperCase"

    const/16 v2, 0xc

    goto/16 :goto_10

    .line 810
    :sswitch_17d
    const-string v0, "codePointAt"

    const/16 v2, 0x2d

    goto/16 :goto_10

    .line 811
    :sswitch_183
    const-string v0, "constructor"

    const/4 v2, 0x1

    goto/16 :goto_10

    .line 812
    :sswitch_188
    const-string v0, "lastIndexOf"

    const/16 v2, 0x8

    goto/16 :goto_10

    .line 814
    :pswitch_18e
    const-string v0, "localeCompare"

    const/16 v2, 0x22

    goto/16 :goto_10

    .line 815
    :pswitch_194
    const-string v0, "equalsIgnoreCase"

    const/16 v2, 0x1e

    goto/16 :goto_10

    .line 816
    :pswitch_19a
    const/16 v3, 0x8

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 817
    .restart local v1    # "c":I
    const/16 v3, 0x4c

    if-ne v1, v3, :cond_1aa

    const-string v0, "toLocaleLowerCase"

    const/16 v2, 0x23

    goto/16 :goto_10

    .line 818
    :cond_1aa
    const/16 v3, 0x55

    if-ne v1, v3, :cond_10

    const-string v0, "toLocaleUpperCase"

    const/16 v2, 0x24

    goto/16 :goto_10

    .line 752
    :pswitch_data_1b4
    .packed-switch 0x3
        :pswitch_1c
        :pswitch_5d
        :pswitch_7a
        :pswitch_a5
        :pswitch_e7
        :pswitch_106
        :pswitch_132
        :pswitch_153
        :pswitch_168
        :pswitch_10
        :pswitch_18e
        :pswitch_10
        :pswitch_10
        :pswitch_194
        :pswitch_19a
    .end packed-switch

    .line 763
    :sswitch_data_1d6
    .sparse-switch
        0x64 -> :sswitch_83
        0x65 -> :sswitch_88
        0x68 -> :sswitch_8d
        0x6b -> :sswitch_93
        0x6c -> :sswitch_99
        0x74 -> :sswitch_9f
    .end sparse-switch

    .line 771
    :sswitch_data_1f0
    .sparse-switch
        0x65 -> :sswitch_ae
        0x68 -> :sswitch_c4
        0x6e -> :sswitch_c9
        0x6f -> :sswitch_cf
        0x71 -> :sswitch_d5
        0x74 -> :sswitch_db
        0x75 -> :sswitch_e1
    .end sparse-switch

    .line 783
    :sswitch_data_20e
    .sparse-switch
        0x61 -> :sswitch_f0
        0x65 -> :sswitch_f5
        0x6e -> :sswitch_fb
        0x74 -> :sswitch_100
    .end sparse-switch

    .line 789
    :sswitch_data_220
    .sparse-switch
        0x63 -> :sswitch_110
        0x65 -> :sswitch_115
        0x66 -> :sswitch_11b
        0x6e -> :sswitch_121
        0x74 -> :sswitch_126
        0x7a -> :sswitch_12c
    .end sparse-switch

    .line 797
    :sswitch_data_23a
    .sparse-switch
        0x66 -> :sswitch_13b
        0x6e -> :sswitch_141
        0x73 -> :sswitch_147
        0x74 -> :sswitch_14d
    .end sparse-switch

    .line 807
    :sswitch_data_24c
    .sparse-switch
        0x4c -> :sswitch_171
        0x55 -> :sswitch_177
        0x64 -> :sswitch_17d
        0x6e -> :sswitch_183
        0x73 -> :sswitch_188
    .end sparse-switch
.end method

.method public get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .registers 4
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 552
    if-ltz p1, :cond_15

    iget-object v0, p0, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-ge p1, v0, :cond_15

    .line 553
    iget-object v0, p0, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    invoke-interface {v0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    .line 555
    :goto_14
    return-object v0

    :cond_15
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_14
.end method

.method public getClassName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 47
    const-string v0, "String"

    return-object v0
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 72
    const/4 v0, 0x1

    if-ne p1, v0, :cond_6

    const-string v0, "length"

    .line 73
    :goto_5
    return-object v0

    :cond_6
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_5
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 79
    const/4 v0, 0x1

    if-ne p1, v0, :cond_e

    .line 80
    iget-object v0, p0, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v0

    .line 82
    :goto_d
    return-object v0

    :cond_e
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_d
.end method

.method getLength()I
    .registers 2

    .prologue
    .line 650
    iget-object v0, p0, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    return v0
.end method

.method protected getMaxInstanceId()I
    .registers 2

    .prologue
    .line 57
    const/4 v0, 0x1

    return v0
.end method

.method protected initPrototypeId(I)V
    .registers 6
    .param p1, "id"    # I

    .prologue
    .line 132
    packed-switch p1, :pswitch_data_d4

    .line 178
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 133
    :pswitch_d
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "constructor"

    .line 180
    .local v1, "s":Ljava/lang/String;
    :goto_10
    sget-object v2, Lorg/mozilla/javascript/NativeString;->STRING_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lorg/mozilla/javascript/NativeString;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 181
    return-void

    .line 134
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_16
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 135
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toSource"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 136
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1e
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "valueOf"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 137
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_22
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "charAt"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 138
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_26
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "charCodeAt"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 139
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "indexOf"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 140
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2e
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "lastIndexOf"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 141
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_32
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "split"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 142
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_36
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "substring"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 143
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toLowerCase"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 144
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3e
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toUpperCase"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 145
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_42
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "substr"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 146
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_46
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "concat"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 147
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_4a
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "slice"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 148
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_4e
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "bold"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 149
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_52
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "italics"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 150
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_56
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "fixed"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 151
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_5a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "strike"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 152
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_5e
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "small"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 153
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_62
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "big"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 154
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_66
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "blink"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 155
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_6a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "sup"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 156
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_6e
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "sub"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 157
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_72
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "fontsize"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 158
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_76
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "fontcolor"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 159
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_7a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "link"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 160
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_7e
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "anchor"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 161
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_82
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "equals"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 162
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_86
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "equalsIgnoreCase"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 163
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_8a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "match"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 164
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_8e
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "search"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_10

    .line 165
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_93
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "replace"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_10

    .line 166
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_98
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "localeCompare"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_10

    .line 167
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_9d
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toLocaleLowerCase"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_10

    .line 168
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_a2
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toLocaleUpperCase"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_10

    .line 169
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_a7
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "trim"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_10

    .line 170
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_ac
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "trimLeft"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_10

    .line 171
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_b1
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "trimRight"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_10

    .line 172
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_b6
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "includes"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_10

    .line 173
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_bb
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "startsWith"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_10

    .line 174
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_c0
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "endsWith"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_10

    .line 175
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_c5
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "normalize"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_10

    .line 176
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_ca
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "repeat"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_10

    .line 177
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_cf
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "codePointAt"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_10

    .line 132
    :pswitch_data_d4
    .packed-switch 0x1
        :pswitch_d
        :pswitch_16
        :pswitch_1a
        :pswitch_1e
        :pswitch_22
        :pswitch_26
        :pswitch_2a
        :pswitch_2e
        :pswitch_32
        :pswitch_36
        :pswitch_3a
        :pswitch_3e
        :pswitch_42
        :pswitch_46
        :pswitch_4a
        :pswitch_4e
        :pswitch_52
        :pswitch_56
        :pswitch_5a
        :pswitch_5e
        :pswitch_62
        :pswitch_66
        :pswitch_6a
        :pswitch_6e
        :pswitch_72
        :pswitch_76
        :pswitch_7a
        :pswitch_7e
        :pswitch_82
        :pswitch_86
        :pswitch_8a
        :pswitch_8e
        :pswitch_93
        :pswitch_98
        :pswitch_9d
        :pswitch_a2
        :pswitch_a7
        :pswitch_ac
        :pswitch_b1
        :pswitch_b6
        :pswitch_bb
        :pswitch_c0
        :pswitch_c5
        :pswitch_ca
        :pswitch_cf
    .end packed-switch
.end method

.method public put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    .registers 5
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 560
    if-ltz p1, :cond_b

    iget-object v0, p0, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-ge p1, v0, :cond_b

    .line 564
    :goto_a
    return-void

    .line 563
    :cond_b
    invoke-super {p0, p1, p2, p3}, Lorg/mozilla/javascript/IdScriptableObject;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_a
.end method

.method public toCharSequence()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 539
    iget-object v0, p0, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 544
    iget-object v0, p0, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    check-cast v0, Ljava/lang/String;

    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p0, Lorg/mozilla/javascript/NativeString;->string:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method
