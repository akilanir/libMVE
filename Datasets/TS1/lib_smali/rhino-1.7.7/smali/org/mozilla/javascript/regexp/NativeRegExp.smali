.class public Lorg/mozilla/javascript/regexp/NativeRegExp;
.super Lorg/mozilla/javascript/IdScriptableObject;
.source "NativeRegExp.java"

# interfaces
.implements Lorg/mozilla/javascript/Function;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final ANCHOR_BOL:I = -0x2

.field private static final INDEX_LEN:I = 0x2

.field private static final Id_compile:I = 0x1

.field private static final Id_exec:I = 0x4

.field private static final Id_global:I = 0x3

.field private static final Id_ignoreCase:I = 0x4

.field private static final Id_lastIndex:I = 0x1

.field private static final Id_multiline:I = 0x5

.field private static final Id_prefix:I = 0x6

.field private static final Id_source:I = 0x2

.field private static final Id_test:I = 0x5

.field private static final Id_toSource:I = 0x3

.field private static final Id_toString:I = 0x2

.field public static final JSREG_FOLD:I = 0x2

.field public static final JSREG_GLOB:I = 0x1

.field public static final JSREG_MULTILINE:I = 0x4

.field public static final MATCH:I = 0x1

.field private static final MAX_INSTANCE_ID:I = 0x5

.field private static final MAX_PROTOTYPE_ID:I = 0x6

.field public static final PREFIX:I = 0x2

.field private static final REGEXP_TAG:Ljava/lang/Object;

.field private static final REOP_ALNUM:B = 0x9t

.field private static final REOP_ALT:B = 0x1ft

.field private static final REOP_ALTPREREQ:B = 0x35t

.field private static final REOP_ALTPREREQ2:B = 0x37t

.field private static final REOP_ALTPREREQi:B = 0x36t

.field private static final REOP_ASSERT:B = 0x29t

.field private static final REOP_ASSERTNOTTEST:B = 0x2ct

.field private static final REOP_ASSERTTEST:B = 0x2bt

.field private static final REOP_ASSERT_NOT:B = 0x2at

.field private static final REOP_BACKREF:B = 0xdt

.field private static final REOP_BOL:B = 0x2t

.field private static final REOP_CLASS:B = 0x16t

.field private static final REOP_DIGIT:B = 0x7t

.field private static final REOP_DOT:B = 0x6t

.field private static final REOP_EMPTY:B = 0x1t

.field private static final REOP_END:B = 0x39t

.field private static final REOP_ENDCHILD:B = 0x31t

.field private static final REOP_EOL:B = 0x3t

.field private static final REOP_FLAT:B = 0xet

.field private static final REOP_FLAT1:B = 0xft

.field private static final REOP_FLAT1i:B = 0x11t

.field private static final REOP_FLATi:B = 0x10t

.field private static final REOP_JUMP:B = 0x20t

.field private static final REOP_LPAREN:B = 0x1dt

.field private static final REOP_MINIMALOPT:B = 0x2ft

.field private static final REOP_MINIMALPLUS:B = 0x2et

.field private static final REOP_MINIMALQUANT:B = 0x30t

.field private static final REOP_MINIMALREPEAT:B = 0x34t

.field private static final REOP_MINIMALSTAR:B = 0x2dt

.field private static final REOP_NCLASS:B = 0x17t

.field private static final REOP_NONALNUM:B = 0xat

.field private static final REOP_NONDIGIT:B = 0x8t

.field private static final REOP_NONSPACE:B = 0xct

.field private static final REOP_OPT:B = 0x1ct

.field private static final REOP_PLUS:B = 0x1bt

.field private static final REOP_QUANT:B = 0x19t

.field private static final REOP_REPEAT:B = 0x33t

.field private static final REOP_RPAREN:B = 0x1et

.field private static final REOP_SIMPLE_END:B = 0x17t

.field private static final REOP_SIMPLE_START:B = 0x1t

.field private static final REOP_SPACE:B = 0xbt

.field private static final REOP_STAR:B = 0x1at

.field private static final REOP_UCFLAT1:B = 0x12t

.field private static final REOP_UCFLAT1i:B = 0x13t

.field private static final REOP_WBDRY:B = 0x4t

.field private static final REOP_WNONBDRY:B = 0x5t

.field public static final TEST:I = 0x0

.field private static final debug:Z = false

.field static final serialVersionUID:J = 0x44e828d6a0fb3a60L


# instance fields
.field lastIndex:Ljava/lang/Object;

.field private lastIndexAttr:I

.field private re:Lorg/mozilla/javascript/regexp/RECompiled;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 38
    const-class v0, Lorg/mozilla/javascript/regexp/NativeRegExp;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_13

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lorg/mozilla/javascript/regexp/NativeRegExp;->$assertionsDisabled:Z

    .line 42
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lorg/mozilla/javascript/regexp/NativeRegExp;->REGEXP_TAG:Ljava/lang/Object;

    return-void

    .line 38
    :cond_13
    const/4 v0, 0x0

    goto :goto_9
.end method

.method constructor <init>()V
    .registers 3

    .prologue
    .line 216
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 2778
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    .line 2779
    const/4 v0, 0x6

    iput v0, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->lastIndexAttr:I

    .line 216
    return-void
.end method

.method constructor <init>(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/regexp/RECompiled;)V
    .registers 6
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "regexpCompiled"    # Lorg/mozilla/javascript/regexp/RECompiled;

    .prologue
    const-wide/16 v1, 0x0

    .line 140
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 2778
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    .line 2779
    const/4 v0, 0x6

    iput v0, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->lastIndexAttr:I

    .line 141
    iput-object p2, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->re:Lorg/mozilla/javascript/regexp/RECompiled;

    .line 142
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    .line 143
    sget-object v0, Lorg/mozilla/javascript/TopLevel$Builtins;->RegExp:Lorg/mozilla/javascript/TopLevel$Builtins;

    invoke-static {p0, p1, v0}, Lorg/mozilla/javascript/ScriptRuntime;->setBuiltinProtoAndParent(Lorg/mozilla/javascript/ScriptableObject;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$Builtins;)V

    .line 144
    return-void
.end method

.method private static addCharacterRangeToCharSet(Lorg/mozilla/javascript/regexp/RECharSet;CC)V
    .registers 10
    .param p0, "cs"    # Lorg/mozilla/javascript/regexp/RECharSet;
    .param p1, "c1"    # C
    .param p2, "c2"    # C

    .prologue
    const/16 v6, 0xff

    .line 1507
    div-int/lit8 v0, p1, 0x8

    .line 1508
    .local v0, "byteIndex1":I
    div-int/lit8 v1, p2, 0x8

    .line 1510
    .local v1, "byteIndex2":I
    iget v3, p0, Lorg/mozilla/javascript/regexp/RECharSet;->length:I

    if-ge p2, v3, :cond_c

    if-le p1, p2, :cond_15

    .line 1511
    :cond_c
    const-string v3, "SyntaxError"

    const-string v4, "invalid range in character class"

    invoke-static {v3, v4}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    throw v3

    .line 1515
    :cond_15
    and-int/lit8 v3, p1, 0x7

    int-to-char p1, v3

    .line 1516
    and-int/lit8 v3, p2, 0x7

    int-to-char p2, v3

    .line 1518
    if-ne v0, v1, :cond_2d

    .line 1519
    iget-object v3, p0, Lorg/mozilla/javascript/regexp/RECharSet;->bits:[B

    aget-byte v4, v3, v0

    sub-int v5, p2, p1

    rsub-int/lit8 v5, v5, 0x7

    shr-int v5, v6, v5

    shl-int/2addr v5, p1

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v3, v0

    .line 1527
    :goto_2c
    return-void

    .line 1522
    :cond_2d
    iget-object v3, p0, Lorg/mozilla/javascript/regexp/RECharSet;->bits:[B

    aget-byte v4, v3, v0

    shl-int v5, v6, p1

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v3, v0

    .line 1523
    add-int/lit8 v2, v0, 0x1

    .local v2, "i":I
    :goto_39
    if-ge v2, v1, :cond_43

    .line 1524
    iget-object v3, p0, Lorg/mozilla/javascript/regexp/RECharSet;->bits:[B

    const/4 v4, -0x1

    aput-byte v4, v3, v2

    .line 1523
    add-int/lit8 v2, v2, 0x1

    goto :goto_39

    .line 1525
    :cond_43
    iget-object v3, p0, Lorg/mozilla/javascript/regexp/RECharSet;->bits:[B

    aget-byte v4, v3, v1

    rsub-int/lit8 v5, p2, 0x7

    shr-int v5, v6, v5

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v3, v1

    goto :goto_2c
.end method

.method private static addCharacterToCharSet(Lorg/mozilla/javascript/regexp/RECharSet;C)V
    .registers 7
    .param p0, "cs"    # Lorg/mozilla/javascript/regexp/RECharSet;
    .param p1, "c"    # C

    .prologue
    .line 1492
    div-int/lit8 v0, p1, 0x8

    .line 1493
    .local v0, "byteIndex":I
    iget v1, p0, Lorg/mozilla/javascript/regexp/RECharSet;->length:I

    if-lt p1, v1, :cond_f

    .line 1494
    const-string v1, "SyntaxError"

    const-string v2, "invalid range in character class"

    invoke-static {v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v1

    throw v1

    .line 1497
    :cond_f
    iget-object v1, p0, Lorg/mozilla/javascript/regexp/RECharSet;->bits:[B

    aget-byte v2, v1, v0

    const/4 v3, 0x1

    and-int/lit8 v4, p1, 0x7

    shl-int/2addr v3, v4

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    .line 1498
    return-void
.end method

.method private static addIndex([BII)I
    .registers 5
    .param p0, "array"    # [B
    .param p1, "pc"    # I
    .param p2, "index"    # I

    .prologue
    .line 1210
    if-gez p2, :cond_7

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 1211
    :cond_7
    const v0, 0xffff

    if-le p2, v0, :cond_13

    .line 1212
    const-string v0, "Too complex regexp"

    invoke-static {v0}, Lorg/mozilla/javascript/Context;->reportRuntimeError(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v0

    throw v0

    .line 1213
    :cond_13
    shr-int/lit8 v0, p2, 0x8

    int-to-byte v0, v0

    aput-byte v0, p0, p1

    .line 1214
    add-int/lit8 v0, p1, 0x1

    int-to-byte v1, p2

    aput-byte v1, p0, v0

    .line 1215
    add-int/lit8 v0, p1, 0x2

    return v0
.end method

.method private static backrefMatcher(Lorg/mozilla/javascript/regexp/REGlobalData;ILjava/lang/String;I)Z
    .registers 13
    .param p0, "gData"    # Lorg/mozilla/javascript/regexp/REGlobalData;
    .param p1, "parenIndex"    # I
    .param p2, "input"    # Ljava/lang/String;
    .param p3, "end"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 1462
    iget-object v7, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->parens:[J

    if-eqz v7, :cond_b

    iget-object v7, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->parens:[J

    array-length v7, v7

    if-lt p1, v7, :cond_d

    :cond_b
    move v5, v6

    .line 1484
    :cond_c
    :goto_c
    return v5

    .line 1464
    :cond_d
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/regexp/REGlobalData;->parensIndex(I)I

    move-result v4

    .line 1465
    .local v4, "parenContent":I
    const/4 v7, -0x1

    if-eq v4, v7, :cond_c

    .line 1468
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/regexp/REGlobalData;->parensLength(I)I

    move-result v3

    .line 1469
    .local v3, "len":I
    iget v7, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/2addr v7, v3

    if-le v7, p3, :cond_1f

    move v5, v6

    .line 1470
    goto :goto_c

    .line 1472
    :cond_1f
    iget-object v7, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->regexp:Lorg/mozilla/javascript/regexp/RECompiled;

    iget v7, v7, Lorg/mozilla/javascript/regexp/RECompiled;->flags:I

    and-int/lit8 v7, v7, 0x2

    if-eqz v7, :cond_48

    .line 1473
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_28
    if-ge v2, v3, :cond_52

    .line 1474
    add-int v7, v4, v2

    invoke-virtual {p2, v7}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1475
    .local v0, "c1":C
    iget v7, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/2addr v7, v2

    invoke-virtual {p2, v7}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1476
    .local v1, "c2":C
    if-eq v0, v1, :cond_45

    invoke-static {v0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->upcase(C)C

    move-result v7

    invoke-static {v1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->upcase(C)C

    move-result v8

    if-eq v7, v8, :cond_45

    move v5, v6

    .line 1477
    goto :goto_c

    .line 1473
    :cond_45
    add-int/lit8 v2, v2, 0x1

    goto :goto_28

    .line 1480
    .end local v0    # "c1":C
    .end local v1    # "c2":C
    .end local v2    # "i":I
    :cond_48
    iget v7, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    invoke-virtual {p2, v4, p2, v7, v3}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result v7

    if-nez v7, :cond_52

    move v5, v6

    .line 1481
    goto :goto_c

    .line 1483
    :cond_52
    iget v6, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/2addr v6, v3

    iput v6, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    goto :goto_c
.end method

.method private static calculateBitmapSize(Lorg/mozilla/javascript/regexp/CompilerState;Lorg/mozilla/javascript/regexp/RENode;[CII)Z
    .registers 20
    .param p0, "state"    # Lorg/mozilla/javascript/regexp/CompilerState;
    .param p1, "target"    # Lorg/mozilla/javascript/regexp/RENode;
    .param p2, "src"    # [C
    .param p3, "index"    # I
    .param p4, "end"    # I

    .prologue
    .line 555
    const/4 v12, 0x0

    .line 560
    .local v12, "rangeStart":C
    const/4 v9, 0x0

    .line 561
    .local v9, "max":I
    const/4 v6, 0x0

    .line 563
    .local v6, "inRange":Z
    const/4 v13, 0x0

    move-object/from16 v0, p1

    iput v13, v0, Lorg/mozilla/javascript/regexp/RENode;->bmsize:I

    .line 564
    const/4 v13, 0x1

    move-object/from16 v0, p1

    iput-boolean v13, v0, Lorg/mozilla/javascript/regexp/RENode;->sense:Z

    .line 566
    move/from16 v0, p3

    move/from16 v1, p4

    if-ne v0, v1, :cond_15

    .line 567
    const/4 v13, 0x1

    .line 710
    :goto_14
    return v13

    .line 569
    :cond_15
    aget-char v13, p2, p3

    const/16 v14, 0x5e

    if-ne v13, v14, :cond_22

    .line 570
    add-int/lit8 p3, p3, 0x1

    .line 571
    const/4 v13, 0x0

    move-object/from16 v0, p1

    iput-boolean v13, v0, Lorg/mozilla/javascript/regexp/RENode;->sense:Z

    :cond_22
    move/from16 v7, p3

    .line 574
    .end local p3    # "index":I
    .local v7, "index":I
    :goto_24
    move/from16 v0, p4

    if-eq v7, v0, :cond_134

    .line 575
    const/4 v8, 0x0

    .line 576
    .local v8, "localMax":I
    const/4 v11, 0x2

    .line 577
    .local v11, "nDigits":I
    aget-char v13, p2, v7

    packed-switch v13, :pswitch_data_146

    .line 681
    add-int/lit8 p3, v7, 0x1

    .end local v7    # "index":I
    .restart local p3    # "index":I
    aget-char v8, p2, v7

    .line 684
    :goto_33
    if-eqz v6, :cond_11e

    .line 685
    if-le v12, v8, :cond_103

    .line 686
    const-string v13, "msg.bad.range"

    const-string v14, ""

    invoke-static {v13, v14}, Lorg/mozilla/javascript/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 687
    const/4 v13, 0x0

    goto :goto_14

    .line 579
    .end local p3    # "index":I
    .restart local v7    # "index":I
    :pswitch_40
    add-int/lit8 p3, v7, 0x1

    .line 580
    .end local v7    # "index":I
    .restart local p3    # "index":I
    add-int/lit8 v7, p3, 0x1

    .end local p3    # "index":I
    .restart local v7    # "index":I
    aget-char v2, p2, p3

    .line 581
    .local v2, "c":C
    sparse-switch v2, :sswitch_data_14c

    .line 676
    move v8, v2

    move/from16 p3, v7

    .line 677
    .end local v7    # "index":I
    .restart local p3    # "index":I
    goto :goto_33

    .line 583
    .end local p3    # "index":I
    .restart local v7    # "index":I
    :sswitch_4d
    const/16 v8, 0x8

    move/from16 p3, v7

    .line 584
    .end local v7    # "index":I
    .restart local p3    # "index":I
    goto :goto_33

    .line 586
    .end local p3    # "index":I
    .restart local v7    # "index":I
    :sswitch_52
    const/16 v8, 0xc

    move/from16 p3, v7

    .line 587
    .end local v7    # "index":I
    .restart local p3    # "index":I
    goto :goto_33

    .line 589
    .end local p3    # "index":I
    .restart local v7    # "index":I
    :sswitch_57
    const/16 v8, 0xa

    move/from16 p3, v7

    .line 590
    .end local v7    # "index":I
    .restart local p3    # "index":I
    goto :goto_33

    .line 592
    .end local p3    # "index":I
    .restart local v7    # "index":I
    :sswitch_5c
    const/16 v8, 0xd

    move/from16 p3, v7

    .line 593
    .end local v7    # "index":I
    .restart local p3    # "index":I
    goto :goto_33

    .line 595
    .end local p3    # "index":I
    .restart local v7    # "index":I
    :sswitch_61
    const/16 v8, 0x9

    move/from16 p3, v7

    .line 596
    .end local v7    # "index":I
    .restart local p3    # "index":I
    goto :goto_33

    .line 598
    .end local p3    # "index":I
    .restart local v7    # "index":I
    :sswitch_66
    const/16 v8, 0xb

    move/from16 p3, v7

    .line 599
    .end local v7    # "index":I
    .restart local p3    # "index":I
    goto :goto_33

    .line 601
    .end local p3    # "index":I
    .restart local v7    # "index":I
    :sswitch_6b
    move/from16 v0, p4

    if-ge v7, v0, :cond_81

    aget-char v13, p2, v7

    invoke-static {v13}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isControlLetter(C)Z

    move-result v13

    if-eqz v13, :cond_81

    .line 602
    add-int/lit8 p3, v7, 0x1

    .end local v7    # "index":I
    .restart local p3    # "index":I
    aget-char v13, p2, v7

    and-int/lit8 v13, v13, 0x1f

    int-to-char v8, v13

    .line 605
    :goto_7e
    const/16 v8, 0x5c

    .line 606
    goto :goto_33

    .line 604
    .end local p3    # "index":I
    .restart local v7    # "index":I
    :cond_81
    add-int/lit8 p3, v7, -0x1

    .end local v7    # "index":I
    .restart local p3    # "index":I
    goto :goto_7e

    .line 608
    .end local p3    # "index":I
    .restart local v7    # "index":I
    :sswitch_84
    add-int/lit8 v11, v11, 0x2

    .line 611
    :sswitch_86
    const/4 v10, 0x0

    .line 612
    .local v10, "n":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_88
    if-ge v5, v11, :cond_142

    move/from16 v0, p4

    if-ge v7, v0, :cond_142

    .line 613
    add-int/lit8 p3, v7, 0x1

    .end local v7    # "index":I
    .restart local p3    # "index":I
    aget-char v2, p2, v7

    .line 614
    invoke-static {v2, v10}, Lorg/mozilla/javascript/Kit;->xDigitToInt(II)I

    move-result v10

    .line 615
    if-gez v10, :cond_a0

    .line 618
    add-int/lit8 v13, v5, 0x1

    sub-int p3, p3, v13

    .line 619
    const/16 v10, 0x5c

    .line 623
    :goto_9e
    move v8, v10

    .line 624
    goto :goto_33

    .line 612
    :cond_a0
    add-int/lit8 v5, v5, 0x1

    move/from16 v7, p3

    .end local p3    # "index":I
    .restart local v7    # "index":I
    goto :goto_88

    .line 626
    .end local v5    # "i":I
    .end local v10    # "n":I
    :sswitch_a5
    if-eqz v6, :cond_b3

    .line 627
    const-string v13, "msg.bad.range"

    const-string v14, ""

    invoke-static {v13, v14}, Lorg/mozilla/javascript/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 628
    const/4 v13, 0x0

    move/from16 p3, v7

    .end local v7    # "index":I
    .restart local p3    # "index":I
    goto/16 :goto_14

    .line 630
    .end local p3    # "index":I
    .restart local v7    # "index":I
    :cond_b3
    const/16 v8, 0x39

    move/from16 p3, v7

    .line 631
    .end local v7    # "index":I
    .restart local p3    # "index":I
    goto/16 :goto_33

    .line 637
    .end local p3    # "index":I
    .restart local v7    # "index":I
    :sswitch_b9
    if-eqz v6, :cond_c7

    .line 638
    const-string v13, "msg.bad.range"

    const-string v14, ""

    invoke-static {v13, v14}, Lorg/mozilla/javascript/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 639
    const/4 v13, 0x0

    move/from16 p3, v7

    .end local v7    # "index":I
    .restart local p3    # "index":I
    goto/16 :goto_14

    .line 641
    .end local p3    # "index":I
    .restart local v7    # "index":I
    :cond_c7
    const/high16 v13, 0x10000

    move-object/from16 v0, p1

    iput v13, v0, Lorg/mozilla/javascript/regexp/RENode;->bmsize:I

    .line 642
    const/4 v13, 0x1

    move/from16 p3, v7

    .end local v7    # "index":I
    .restart local p3    # "index":I
    goto/16 :goto_14

    .line 657
    .end local p3    # "index":I
    .restart local v7    # "index":I
    :sswitch_d2
    add-int/lit8 v10, v2, -0x30

    .line 658
    .restart local v10    # "n":I
    aget-char v2, p2, v7

    .line 659
    const/16 v13, 0x30

    if-gt v13, v2, :cond_13f

    const/16 v13, 0x37

    if-gt v2, v13, :cond_13f

    .line 660
    add-int/lit8 p3, v7, 0x1

    .line 661
    .end local v7    # "index":I
    .restart local p3    # "index":I
    mul-int/lit8 v13, v10, 0x8

    add-int/lit8 v14, v2, -0x30

    add-int v10, v13, v14

    .line 662
    aget-char v2, p2, p3

    .line 663
    const/16 v13, 0x30

    if-gt v13, v2, :cond_fd

    const/16 v13, 0x37

    if-gt v2, v13, :cond_fd

    .line 664
    add-int/lit8 p3, p3, 0x1

    .line 665
    mul-int/lit8 v13, v10, 0x8

    add-int/lit8 v14, v2, -0x30

    add-int v5, v13, v14

    .line 666
    .restart local v5    # "i":I
    const/16 v13, 0xff

    if-gt v5, v13, :cond_100

    .line 667
    move v10, v5

    .line 672
    .end local v5    # "i":I
    :cond_fd
    :goto_fd
    move v8, v10

    .line 673
    goto/16 :goto_33

    .line 669
    .restart local v5    # "i":I
    :cond_100
    add-int/lit8 p3, p3, -0x1

    goto :goto_fd

    .line 689
    .end local v2    # "c":C
    .end local v5    # "i":I
    .end local v10    # "n":I
    :cond_103
    const/4 v6, 0x0

    .line 701
    :cond_104
    iget v13, p0, Lorg/mozilla/javascript/regexp/CompilerState;->flags:I

    and-int/lit8 v13, v13, 0x2

    if-eqz v13, :cond_117

    .line 702
    int-to-char v13, v8

    invoke-static {v13}, Lorg/mozilla/javascript/regexp/NativeRegExp;->upcase(C)C

    move-result v4

    .line 703
    .local v4, "cu":C
    int-to-char v13, v8

    invoke-static {v13}, Lorg/mozilla/javascript/regexp/NativeRegExp;->downcase(C)C

    move-result v3

    .line 704
    .local v3, "cd":C
    if-lt v4, v3, :cond_132

    move v8, v4

    .line 706
    .end local v3    # "cd":C
    .end local v4    # "cu":C
    :cond_117
    :goto_117
    if-le v8, v9, :cond_11a

    .line 707
    move v9, v8

    :cond_11a
    move/from16 v7, p3

    .line 708
    .end local p3    # "index":I
    .restart local v7    # "index":I
    goto/16 :goto_24

    .line 692
    .end local v7    # "index":I
    .restart local p3    # "index":I
    :cond_11e
    add-int/lit8 v13, p4, -0x1

    move/from16 v0, p3

    if-ge v0, v13, :cond_104

    .line 693
    aget-char v13, p2, p3

    const/16 v14, 0x2d

    if-ne v13, v14, :cond_104

    .line 694
    add-int/lit8 p3, p3, 0x1

    .line 695
    const/4 v6, 0x1

    .line 696
    int-to-char v12, v8

    move/from16 v7, p3

    .line 697
    .end local p3    # "index":I
    .restart local v7    # "index":I
    goto/16 :goto_24

    .end local v7    # "index":I
    .restart local v3    # "cd":C
    .restart local v4    # "cu":C
    .restart local p3    # "index":I
    :cond_132
    move v8, v3

    .line 704
    goto :goto_117

    .line 709
    .end local v3    # "cd":C
    .end local v4    # "cu":C
    .end local v8    # "localMax":I
    .end local v11    # "nDigits":I
    .end local p3    # "index":I
    .restart local v7    # "index":I
    :cond_134
    add-int/lit8 v13, v9, 0x1

    move-object/from16 v0, p1

    iput v13, v0, Lorg/mozilla/javascript/regexp/RENode;->bmsize:I

    .line 710
    const/4 v13, 0x1

    move/from16 p3, v7

    .end local v7    # "index":I
    .restart local p3    # "index":I
    goto/16 :goto_14

    .end local p3    # "index":I
    .restart local v2    # "c":C
    .restart local v7    # "index":I
    .restart local v8    # "localMax":I
    .restart local v10    # "n":I
    .restart local v11    # "nDigits":I
    :cond_13f
    move/from16 p3, v7

    .end local v7    # "index":I
    .restart local p3    # "index":I
    goto :goto_fd

    .end local p3    # "index":I
    .restart local v5    # "i":I
    .restart local v7    # "index":I
    :cond_142
    move/from16 p3, v7

    .end local v7    # "index":I
    .restart local p3    # "index":I
    goto/16 :goto_9e

    .line 577
    :pswitch_data_146
    .packed-switch 0x5c
        :pswitch_40
    .end packed-switch

    .line 581
    :sswitch_data_14c
    .sparse-switch
        0x30 -> :sswitch_d2
        0x31 -> :sswitch_d2
        0x32 -> :sswitch_d2
        0x33 -> :sswitch_d2
        0x34 -> :sswitch_d2
        0x35 -> :sswitch_d2
        0x36 -> :sswitch_d2
        0x37 -> :sswitch_d2
        0x44 -> :sswitch_b9
        0x53 -> :sswitch_b9
        0x57 -> :sswitch_b9
        0x62 -> :sswitch_4d
        0x63 -> :sswitch_6b
        0x64 -> :sswitch_a5
        0x66 -> :sswitch_52
        0x6e -> :sswitch_57
        0x72 -> :sswitch_5c
        0x73 -> :sswitch_b9
        0x74 -> :sswitch_61
        0x75 -> :sswitch_84
        0x76 -> :sswitch_66
        0x77 -> :sswitch_b9
        0x78 -> :sswitch_86
    .end sparse-switch
.end method

.method private static classMatcher(Lorg/mozilla/javascript/regexp/REGlobalData;Lorg/mozilla/javascript/regexp/RECharSet;C)Z
    .registers 7
    .param p0, "gData"    # Lorg/mozilla/javascript/regexp/REGlobalData;
    .param p1, "charSet"    # Lorg/mozilla/javascript/regexp/RECharSet;
    .param p2, "ch"    # C

    .prologue
    const/4 v1, 0x1

    .line 1739
    iget-boolean v2, p1, Lorg/mozilla/javascript/regexp/RECharSet;->converted:Z

    if-nez v2, :cond_8

    .line 1740
    invoke-static {p0, p1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->processCharSet(Lorg/mozilla/javascript/regexp/REGlobalData;Lorg/mozilla/javascript/regexp/RECharSet;)V

    .line 1743
    :cond_8
    shr-int/lit8 v0, p2, 0x3

    .line 1744
    .local v0, "byteIndex":I
    iget v2, p1, Lorg/mozilla/javascript/regexp/RECharSet;->length:I

    if-eqz v2, :cond_1d

    iget v2, p1, Lorg/mozilla/javascript/regexp/RECharSet;->length:I

    if-ge p2, v2, :cond_1d

    iget-object v2, p1, Lorg/mozilla/javascript/regexp/RECharSet;->bits:[B

    aget-byte v2, v2, v0

    and-int/lit8 v3, p2, 0x7

    shl-int v3, v1, v3

    and-int/2addr v2, v3

    if-nez v2, :cond_21

    :cond_1d
    :goto_1d
    iget-boolean v2, p1, Lorg/mozilla/javascript/regexp/RECharSet;->sense:Z

    xor-int/2addr v1, v2

    return v1

    :cond_21
    const/4 v1, 0x0

    goto :goto_1d
.end method

.method static compileRE(Lorg/mozilla/javascript/Context;Ljava/lang/String;Ljava/lang/String;Z)Lorg/mozilla/javascript/regexp/RECompiled;
    .registers 19
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "global"    # Ljava/lang/String;
    .param p3, "flat"    # Z

    .prologue
    .line 283
    new-instance v10, Lorg/mozilla/javascript/regexp/RECompiled;

    move-object/from16 v0, p1

    invoke-direct {v10, v0}, Lorg/mozilla/javascript/regexp/RECompiled;-><init>(Ljava/lang/String;)V

    .line 284
    .local v10, "regexp":Lorg/mozilla/javascript/regexp/RECompiled;
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v8

    .line 285
    .local v8, "length":I
    const/4 v5, 0x0

    .line 286
    .local v5, "flags":I
    if-eqz p2, :cond_48

    .line 287
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_f
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v12

    if-ge v6, v12, :cond_48

    .line 288
    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 289
    .local v1, "c":C
    const/4 v4, 0x0

    .line 290
    .local v4, "f":I
    const/16 v12, 0x67

    if-ne v1, v12, :cond_32

    .line 291
    const/4 v4, 0x1

    .line 299
    :goto_21
    and-int v12, v5, v4

    if-eqz v12, :cond_2e

    .line 300
    const-string v12, "msg.invalid.re.flag"

    invoke-static {v1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lorg/mozilla/javascript/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 302
    :cond_2e
    or-int/2addr v5, v4

    .line 287
    add-int/lit8 v6, v6, 0x1

    goto :goto_f

    .line 292
    :cond_32
    const/16 v12, 0x69

    if-ne v1, v12, :cond_38

    .line 293
    const/4 v4, 0x2

    goto :goto_21

    .line 294
    :cond_38
    const/16 v12, 0x6d

    if-ne v1, v12, :cond_3e

    .line 295
    const/4 v4, 0x4

    goto :goto_21

    .line 297
    :cond_3e
    const-string v12, "msg.invalid.re.flag"

    invoke-static {v1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lorg/mozilla/javascript/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_21

    .line 305
    .end local v1    # "c":C
    .end local v4    # "f":I
    .end local v6    # "i":I
    :cond_48
    iput v5, v10, Lorg/mozilla/javascript/regexp/RECompiled;->flags:I

    .line 307
    new-instance v11, Lorg/mozilla/javascript/regexp/CompilerState;

    iget-object v12, v10, Lorg/mozilla/javascript/regexp/RECompiled;->source:[C

    invoke-direct {v11, p0, v12, v8, v5}, Lorg/mozilla/javascript/regexp/CompilerState;-><init>(Lorg/mozilla/javascript/Context;[CII)V

    .line 308
    .local v11, "state":Lorg/mozilla/javascript/regexp/CompilerState;
    if-eqz p3, :cond_a8

    if-lez v8, :cond_a8

    .line 312
    new-instance v12, Lorg/mozilla/javascript/regexp/RENode;

    const/16 v13, 0xe

    invoke-direct {v12, v13}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    iput-object v12, v11, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 313
    iget-object v12, v11, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    iget-object v13, v11, Lorg/mozilla/javascript/regexp/CompilerState;->cpbegin:[C

    const/4 v14, 0x0

    aget-char v13, v13, v14

    iput-char v13, v12, Lorg/mozilla/javascript/regexp/RENode;->chr:C

    .line 314
    iget-object v12, v11, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    iput v8, v12, Lorg/mozilla/javascript/regexp/RENode;->length:I

    .line 315
    iget-object v12, v11, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    const/4 v13, 0x0

    iput v13, v12, Lorg/mozilla/javascript/regexp/RENode;->flatIndex:I

    .line 316
    iget v12, v11, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    add-int/lit8 v12, v12, 0x5

    iput v12, v11, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    .line 331
    :cond_76
    iget v12, v11, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    add-int/lit8 v12, v12, 0x1

    new-array v12, v12, [B

    iput-object v12, v10, Lorg/mozilla/javascript/regexp/RECompiled;->program:[B

    .line 332
    iget v12, v11, Lorg/mozilla/javascript/regexp/CompilerState;->classCount:I

    if-eqz v12, :cond_8c

    .line 333
    iget v12, v11, Lorg/mozilla/javascript/regexp/CompilerState;->classCount:I

    new-array v12, v12, [Lorg/mozilla/javascript/regexp/RECharSet;

    iput-object v12, v10, Lorg/mozilla/javascript/regexp/RECompiled;->classList:[Lorg/mozilla/javascript/regexp/RECharSet;

    .line 334
    iget v12, v11, Lorg/mozilla/javascript/regexp/CompilerState;->classCount:I

    iput v12, v10, Lorg/mozilla/javascript/regexp/RECompiled;->classCount:I

    .line 336
    :cond_8c
    const/4 v12, 0x0

    iget-object v13, v11, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    invoke-static {v11, v10, v12, v13}, Lorg/mozilla/javascript/regexp/NativeRegExp;->emitREBytecode(Lorg/mozilla/javascript/regexp/CompilerState;Lorg/mozilla/javascript/regexp/RECompiled;ILorg/mozilla/javascript/regexp/RENode;)I

    move-result v2

    .line 337
    .local v2, "endPC":I
    iget-object v12, v10, Lorg/mozilla/javascript/regexp/RECompiled;->program:[B

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "endPC":I
    .local v3, "endPC":I
    const/16 v13, 0x39

    aput-byte v13, v12, v2

    .line 347
    iget v12, v11, Lorg/mozilla/javascript/regexp/CompilerState;->parenCount:I

    iput v12, v10, Lorg/mozilla/javascript/regexp/RECompiled;->parenCount:I

    .line 350
    iget-object v12, v10, Lorg/mozilla/javascript/regexp/RECompiled;->program:[B

    const/4 v13, 0x0

    aget-byte v12, v12, v13

    sparse-switch v12, :sswitch_data_106

    .line 380
    .end local v3    # "endPC":I
    .end local v10    # "regexp":Lorg/mozilla/javascript/regexp/RECompiled;
    :cond_a7
    :goto_a7
    return-object v10

    .line 318
    .restart local v10    # "regexp":Lorg/mozilla/javascript/regexp/RECompiled;
    :cond_a8
    invoke-static {v11}, Lorg/mozilla/javascript/regexp/NativeRegExp;->parseDisjunction(Lorg/mozilla/javascript/regexp/CompilerState;)Z

    move-result v12

    if-nez v12, :cond_b0

    .line 319
    const/4 v10, 0x0

    goto :goto_a7

    .line 323
    :cond_b0
    iget v12, v11, Lorg/mozilla/javascript/regexp/CompilerState;->maxBackReference:I

    iget v13, v11, Lorg/mozilla/javascript/regexp/CompilerState;->parenCount:I

    if-le v12, v13, :cond_76

    .line 324
    new-instance v11, Lorg/mozilla/javascript/regexp/CompilerState;

    .end local v11    # "state":Lorg/mozilla/javascript/regexp/CompilerState;
    iget-object v12, v10, Lorg/mozilla/javascript/regexp/RECompiled;->source:[C

    invoke-direct {v11, p0, v12, v8, v5}, Lorg/mozilla/javascript/regexp/CompilerState;-><init>(Lorg/mozilla/javascript/Context;[CII)V

    .line 325
    .restart local v11    # "state":Lorg/mozilla/javascript/regexp/CompilerState;
    iget v12, v11, Lorg/mozilla/javascript/regexp/CompilerState;->parenCount:I

    iput v12, v11, Lorg/mozilla/javascript/regexp/CompilerState;->backReferenceLimit:I

    .line 326
    invoke-static {v11}, Lorg/mozilla/javascript/regexp/NativeRegExp;->parseDisjunction(Lorg/mozilla/javascript/regexp/CompilerState;)Z

    move-result v12

    if-nez v12, :cond_76

    .line 327
    const/4 v10, 0x0

    goto :goto_a7

    .line 353
    .restart local v3    # "endPC":I
    :sswitch_c9
    iget-object v12, v10, Lorg/mozilla/javascript/regexp/RECompiled;->program:[B

    const/4 v13, 0x1

    invoke-static {v12, v13}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v12

    int-to-char v12, v12

    iput v12, v10, Lorg/mozilla/javascript/regexp/RECompiled;->anchorCh:I

    goto :goto_a7

    .line 357
    :sswitch_d4
    iget-object v12, v10, Lorg/mozilla/javascript/regexp/RECompiled;->program:[B

    const/4 v13, 0x1

    aget-byte v12, v12, v13

    and-int/lit16 v12, v12, 0xff

    int-to-char v12, v12

    iput v12, v10, Lorg/mozilla/javascript/regexp/RECompiled;->anchorCh:I

    goto :goto_a7

    .line 361
    :sswitch_df
    iget-object v12, v10, Lorg/mozilla/javascript/regexp/RECompiled;->program:[B

    const/4 v13, 0x1

    invoke-static {v12, v13}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v7

    .line 362
    .local v7, "k":I
    iget-object v12, v10, Lorg/mozilla/javascript/regexp/RECompiled;->source:[C

    aget-char v12, v12, v7

    iput v12, v10, Lorg/mozilla/javascript/regexp/RECompiled;->anchorCh:I

    goto :goto_a7

    .line 365
    .end local v7    # "k":I
    :sswitch_ed
    const/4 v12, -0x2

    iput v12, v10, Lorg/mozilla/javascript/regexp/RECompiled;->anchorCh:I

    goto :goto_a7

    .line 368
    :sswitch_f1
    iget-object v9, v11, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 369
    .local v9, "n":Lorg/mozilla/javascript/regexp/RENode;
    iget-object v12, v9, Lorg/mozilla/javascript/regexp/RENode;->kid:Lorg/mozilla/javascript/regexp/RENode;

    iget-byte v12, v12, Lorg/mozilla/javascript/regexp/RENode;->op:B

    const/4 v13, 0x2

    if-ne v12, v13, :cond_a7

    iget-object v12, v9, Lorg/mozilla/javascript/regexp/RENode;->kid2:Lorg/mozilla/javascript/regexp/RENode;

    iget-byte v12, v12, Lorg/mozilla/javascript/regexp/RENode;->op:B

    const/4 v13, 0x2

    if-ne v12, v13, :cond_a7

    .line 370
    const/4 v12, -0x2

    iput v12, v10, Lorg/mozilla/javascript/regexp/RECompiled;->anchorCh:I

    goto :goto_a7

    .line 350
    nop

    :sswitch_data_106
    .sparse-switch
        0x2 -> :sswitch_ed
        0xe -> :sswitch_df
        0xf -> :sswitch_d4
        0x10 -> :sswitch_df
        0x11 -> :sswitch_d4
        0x12 -> :sswitch_c9
        0x13 -> :sswitch_c9
        0x1f -> :sswitch_f1
    .end sparse-switch
.end method

.method private static doFlat(Lorg/mozilla/javascript/regexp/CompilerState;C)V
    .registers 4
    .param p0, "state"    # Lorg/mozilla/javascript/regexp/CompilerState;
    .param p1, "c"    # C

    .prologue
    .line 769
    new-instance v0, Lorg/mozilla/javascript/regexp/RENode;

    const/16 v1, 0xe

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    iput-object v0, p0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 770
    iget-object v0, p0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    iput-char p1, v0, Lorg/mozilla/javascript/regexp/RENode;->chr:C

    .line 771
    iget-object v0, p0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    const/4 v1, 0x1

    iput v1, v0, Lorg/mozilla/javascript/regexp/RENode;->length:I

    .line 772
    iget-object v0, p0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    const/4 v1, -0x1

    iput v1, v0, Lorg/mozilla/javascript/regexp/RENode;->flatIndex:I

    .line 773
    iget v0, p0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    add-int/lit8 v0, v0, 0x3

    iput v0, p0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    .line 774
    return-void
.end method

.method private static downcase(C)C
    .registers 3
    .param p0, "ch"    # C

    .prologue
    const/16 v1, 0x80

    .line 433
    if-ge p0, v1, :cond_10

    .line 434
    const/16 v1, 0x41

    if-gt v1, p0, :cond_f

    const/16 v1, 0x5a

    if-gt p0, v1, :cond_f

    .line 435
    add-int/lit8 v1, p0, 0x20

    int-to-char p0, v1

    .line 440
    .end local p0    # "ch":C
    .local v0, "cl":C
    :cond_f
    :goto_f
    return p0

    .line 439
    .end local v0    # "cl":C
    .restart local p0    # "ch":C
    :cond_10
    invoke-static {p0}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v0

    .line 440
    .restart local v0    # "cl":C
    if-lt v0, v1, :cond_f

    move p0, v0

    goto :goto_f
.end method

.method private static emitREBytecode(Lorg/mozilla/javascript/regexp/CompilerState;Lorg/mozilla/javascript/regexp/RECompiled;ILorg/mozilla/javascript/regexp/RENode;)I
    .registers 18
    .param p0, "state"    # Lorg/mozilla/javascript/regexp/CompilerState;
    .param p1, "re"    # Lorg/mozilla/javascript/regexp/RECompiled;
    .param p2, "pc"    # I
    .param p3, "t"    # Lorg/mozilla/javascript/regexp/RENode;

    .prologue
    .line 1230
    iget-object v6, p1, Lorg/mozilla/javascript/regexp/RECompiled;->program:[B

    .local v6, "program":[B
    move/from16 v5, p2

    .line 1232
    .end local p2    # "pc":I
    .local v5, "pc":I
    :goto_4
    if-eqz p3, :cond_298

    .line 1233
    add-int/lit8 p2, v5, 0x1

    .end local v5    # "pc":I
    .restart local p2    # "pc":I
    move-object/from16 v0, p3

    iget-byte v7, v0, Lorg/mozilla/javascript/regexp/RENode;->op:B

    aput-byte v7, v6, v5

    .line 1234
    move-object/from16 v0, p3

    iget-byte v7, v0, Lorg/mozilla/javascript/regexp/RENode;->op:B

    sparse-switch v7, :sswitch_data_29a

    .line 1358
    :goto_15
    move-object/from16 v0, p3

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/RENode;->next:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 p3, v0

    move/from16 v5, p2

    .end local p2    # "pc":I
    .restart local v5    # "pc":I
    goto :goto_4

    .line 1236
    .end local v5    # "pc":I
    .restart local p2    # "pc":I
    :sswitch_1e
    add-int/lit8 p2, p2, -0x1

    .line 1237
    goto :goto_15

    .line 1241
    :sswitch_21
    move-object/from16 v0, p3

    iget-byte v7, v0, Lorg/mozilla/javascript/regexp/RENode;->op:B

    const/16 v8, 0x36

    if-ne v7, v8, :cond_87

    const/4 v1, 0x1

    .line 1242
    .local v1, "ignoreCase":Z
    :goto_2a
    if-eqz v1, :cond_89

    move-object/from16 v0, p3

    iget-char v7, v0, Lorg/mozilla/javascript/regexp/RENode;->chr:C

    invoke-static {v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->upcase(C)C

    move-result v7

    :goto_34
    move/from16 v0, p2

    invoke-static {v6, v0, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addIndex([BII)I

    .line 1243
    add-int/lit8 p2, p2, 0x2

    .line 1244
    if-eqz v1, :cond_8e

    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->index:I

    int-to-char v7, v7

    invoke-static {v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->upcase(C)C

    move-result v7

    :goto_46
    move/from16 v0, p2

    invoke-static {v6, v0, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addIndex([BII)I

    .line 1245
    add-int/lit8 p2, p2, 0x2

    .line 1248
    .end local v1    # "ignoreCase":Z
    :sswitch_4d
    move-object/from16 v0, p3

    iget-object v2, v0, Lorg/mozilla/javascript/regexp/RENode;->kid2:Lorg/mozilla/javascript/regexp/RENode;

    .line 1249
    .local v2, "nextAlt":Lorg/mozilla/javascript/regexp/RENode;
    move/from16 v3, p2

    .line 1250
    .local v3, "nextAltFixup":I
    add-int/lit8 p2, p2, 0x2

    .line 1251
    move-object/from16 v0, p3

    iget-object v7, v0, Lorg/mozilla/javascript/regexp/RENode;->kid:Lorg/mozilla/javascript/regexp/RENode;

    move/from16 v0, p2

    invoke-static {p0, p1, v0, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->emitREBytecode(Lorg/mozilla/javascript/regexp/CompilerState;Lorg/mozilla/javascript/regexp/RECompiled;ILorg/mozilla/javascript/regexp/RENode;)I

    move-result p2

    .line 1252
    add-int/lit8 v5, p2, 0x1

    .end local p2    # "pc":I
    .restart local v5    # "pc":I
    const/16 v7, 0x20

    aput-byte v7, v6, p2

    .line 1253
    move v4, v5

    .line 1254
    .local v4, "nextTermFixup":I
    add-int/lit8 p2, v5, 0x2

    .line 1255
    .end local v5    # "pc":I
    .restart local p2    # "pc":I
    move/from16 v0, p2

    invoke-static {v6, v3, v0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->resolveForwardJump([BII)V

    .line 1256
    move/from16 v0, p2

    invoke-static {p0, p1, v0, v2}, Lorg/mozilla/javascript/regexp/NativeRegExp;->emitREBytecode(Lorg/mozilla/javascript/regexp/CompilerState;Lorg/mozilla/javascript/regexp/RECompiled;ILorg/mozilla/javascript/regexp/RENode;)I

    move-result p2

    .line 1258
    add-int/lit8 v5, p2, 0x1

    .end local p2    # "pc":I
    .restart local v5    # "pc":I
    const/16 v7, 0x20

    aput-byte v7, v6, p2

    .line 1259
    move v3, v5

    .line 1260
    add-int/lit8 p2, v5, 0x2

    .line 1262
    .end local v5    # "pc":I
    .restart local p2    # "pc":I
    move/from16 v0, p2

    invoke-static {v6, v4, v0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->resolveForwardJump([BII)V

    .line 1263
    move/from16 v0, p2

    invoke-static {v6, v3, v0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->resolveForwardJump([BII)V

    goto :goto_15

    .line 1241
    .end local v2    # "nextAlt":Lorg/mozilla/javascript/regexp/RENode;
    .end local v3    # "nextAltFixup":I
    .end local v4    # "nextTermFixup":I
    :cond_87
    const/4 v1, 0x0

    goto :goto_2a

    .line 1242
    .restart local v1    # "ignoreCase":Z
    :cond_89
    move-object/from16 v0, p3

    iget-char v7, v0, Lorg/mozilla/javascript/regexp/RENode;->chr:C

    goto :goto_34

    .line 1244
    :cond_8e
    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->index:I

    goto :goto_46

    .line 1269
    .end local v1    # "ignoreCase":Z
    :sswitch_93
    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->flatIndex:I

    const/4 v8, -0x1

    if-eq v7, v8, :cond_d5

    .line 1271
    :goto_9a
    move-object/from16 v0, p3

    iget-object v7, v0, Lorg/mozilla/javascript/regexp/RENode;->next:Lorg/mozilla/javascript/regexp/RENode;

    if-eqz v7, :cond_d5

    move-object/from16 v0, p3

    iget-object v7, v0, Lorg/mozilla/javascript/regexp/RENode;->next:Lorg/mozilla/javascript/regexp/RENode;

    iget-byte v7, v7, Lorg/mozilla/javascript/regexp/RENode;->op:B

    const/16 v8, 0xe

    if-ne v7, v8, :cond_d5

    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->flatIndex:I

    move-object/from16 v0, p3

    iget v8, v0, Lorg/mozilla/javascript/regexp/RENode;->length:I

    add-int/2addr v7, v8

    move-object/from16 v0, p3

    iget-object v8, v0, Lorg/mozilla/javascript/regexp/RENode;->next:Lorg/mozilla/javascript/regexp/RENode;

    iget v8, v8, Lorg/mozilla/javascript/regexp/RENode;->flatIndex:I

    if-ne v7, v8, :cond_d5

    .line 1273
    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->length:I

    move-object/from16 v0, p3

    iget-object v8, v0, Lorg/mozilla/javascript/regexp/RENode;->next:Lorg/mozilla/javascript/regexp/RENode;

    iget v8, v8, Lorg/mozilla/javascript/regexp/RENode;->length:I

    add-int/2addr v7, v8

    move-object/from16 v0, p3

    iput v7, v0, Lorg/mozilla/javascript/regexp/RENode;->length:I

    .line 1274
    move-object/from16 v0, p3

    iget-object v7, v0, Lorg/mozilla/javascript/regexp/RENode;->next:Lorg/mozilla/javascript/regexp/RENode;

    iget-object v7, v7, Lorg/mozilla/javascript/regexp/RENode;->next:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v0, p3

    iput-object v7, v0, Lorg/mozilla/javascript/regexp/RENode;->next:Lorg/mozilla/javascript/regexp/RENode;

    goto :goto_9a

    .line 1277
    :cond_d5
    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->flatIndex:I

    const/4 v8, -0x1

    if-eq v7, v8, :cond_10c

    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->length:I

    const/4 v8, 0x1

    if-le v7, v8, :cond_10c

    .line 1278
    iget v7, p0, Lorg/mozilla/javascript/regexp/CompilerState;->flags:I

    and-int/lit8 v7, v7, 0x2

    if-eqz v7, :cond_105

    .line 1279
    add-int/lit8 v7, p2, -0x1

    const/16 v8, 0x10

    aput-byte v8, v6, v7

    .line 1282
    :goto_ef
    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->flatIndex:I

    move/from16 v0, p2

    invoke-static {v6, v0, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addIndex([BII)I

    move-result p2

    .line 1283
    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->length:I

    move/from16 v0, p2

    invoke-static {v6, v0, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addIndex([BII)I

    move-result p2

    goto/16 :goto_15

    .line 1281
    :cond_105
    add-int/lit8 v7, p2, -0x1

    const/16 v8, 0xe

    aput-byte v8, v6, v7

    goto :goto_ef

    .line 1286
    :cond_10c
    move-object/from16 v0, p3

    iget-char v7, v0, Lorg/mozilla/javascript/regexp/RENode;->chr:C

    const/16 v8, 0x100

    if-ge v7, v8, :cond_134

    .line 1287
    iget v7, p0, Lorg/mozilla/javascript/regexp/CompilerState;->flags:I

    and-int/lit8 v7, v7, 0x2

    if-eqz v7, :cond_12d

    .line 1288
    add-int/lit8 v7, p2, -0x1

    const/16 v8, 0x11

    aput-byte v8, v6, v7

    .line 1291
    :goto_120
    add-int/lit8 v5, p2, 0x1

    .end local p2    # "pc":I
    .restart local v5    # "pc":I
    move-object/from16 v0, p3

    iget-char v7, v0, Lorg/mozilla/javascript/regexp/RENode;->chr:C

    int-to-byte v7, v7

    aput-byte v7, v6, p2

    move/from16 p2, v5

    .end local v5    # "pc":I
    .restart local p2    # "pc":I
    goto/16 :goto_15

    .line 1290
    :cond_12d
    add-int/lit8 v7, p2, -0x1

    const/16 v8, 0xf

    aput-byte v8, v6, v7

    goto :goto_120

    .line 1294
    :cond_134
    iget v7, p0, Lorg/mozilla/javascript/regexp/CompilerState;->flags:I

    and-int/lit8 v7, v7, 0x2

    if-eqz v7, :cond_14c

    .line 1295
    add-int/lit8 v7, p2, -0x1

    const/16 v8, 0x13

    aput-byte v8, v6, v7

    .line 1298
    :goto_140
    move-object/from16 v0, p3

    iget-char v7, v0, Lorg/mozilla/javascript/regexp/RENode;->chr:C

    move/from16 v0, p2

    invoke-static {v6, v0, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addIndex([BII)I

    move-result p2

    .line 1301
    goto/16 :goto_15

    .line 1297
    :cond_14c
    add-int/lit8 v7, p2, -0x1

    const/16 v8, 0x12

    aput-byte v8, v6, v7

    goto :goto_140

    .line 1303
    :sswitch_153
    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->parenIndex:I

    move/from16 v0, p2

    invoke-static {v6, v0, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addIndex([BII)I

    move-result p2

    .line 1304
    move-object/from16 v0, p3

    iget-object v7, v0, Lorg/mozilla/javascript/regexp/RENode;->kid:Lorg/mozilla/javascript/regexp/RENode;

    move/from16 v0, p2

    invoke-static {p0, p1, v0, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->emitREBytecode(Lorg/mozilla/javascript/regexp/CompilerState;Lorg/mozilla/javascript/regexp/RECompiled;ILorg/mozilla/javascript/regexp/RENode;)I

    move-result p2

    .line 1305
    add-int/lit8 v5, p2, 0x1

    .end local p2    # "pc":I
    .restart local v5    # "pc":I
    const/16 v7, 0x1e

    aput-byte v7, v6, p2

    .line 1306
    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->parenIndex:I

    invoke-static {v6, v5, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addIndex([BII)I

    move-result p2

    .line 1307
    .end local v5    # "pc":I
    .restart local p2    # "pc":I
    goto/16 :goto_15

    .line 1309
    :sswitch_177
    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->parenIndex:I

    move/from16 v0, p2

    invoke-static {v6, v0, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addIndex([BII)I

    move-result p2

    .line 1310
    goto/16 :goto_15

    .line 1312
    :sswitch_183
    move/from16 v4, p2

    .line 1313
    .restart local v4    # "nextTermFixup":I
    add-int/lit8 p2, p2, 0x2

    .line 1314
    move-object/from16 v0, p3

    iget-object v7, v0, Lorg/mozilla/javascript/regexp/RENode;->kid:Lorg/mozilla/javascript/regexp/RENode;

    move/from16 v0, p2

    invoke-static {p0, p1, v0, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->emitREBytecode(Lorg/mozilla/javascript/regexp/CompilerState;Lorg/mozilla/javascript/regexp/RECompiled;ILorg/mozilla/javascript/regexp/RENode;)I

    move-result p2

    .line 1315
    add-int/lit8 v5, p2, 0x1

    .end local p2    # "pc":I
    .restart local v5    # "pc":I
    const/16 v7, 0x2b

    aput-byte v7, v6, p2

    .line 1316
    invoke-static {v6, v4, v5}, Lorg/mozilla/javascript/regexp/NativeRegExp;->resolveForwardJump([BII)V

    move/from16 p2, v5

    .line 1317
    .end local v5    # "pc":I
    .restart local p2    # "pc":I
    goto/16 :goto_15

    .line 1319
    .end local v4    # "nextTermFixup":I
    :sswitch_19e
    move/from16 v4, p2

    .line 1320
    .restart local v4    # "nextTermFixup":I
    add-int/lit8 p2, p2, 0x2

    .line 1321
    move-object/from16 v0, p3

    iget-object v7, v0, Lorg/mozilla/javascript/regexp/RENode;->kid:Lorg/mozilla/javascript/regexp/RENode;

    move/from16 v0, p2

    invoke-static {p0, p1, v0, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->emitREBytecode(Lorg/mozilla/javascript/regexp/CompilerState;Lorg/mozilla/javascript/regexp/RECompiled;ILorg/mozilla/javascript/regexp/RENode;)I

    move-result p2

    .line 1322
    add-int/lit8 v5, p2, 0x1

    .end local p2    # "pc":I
    .restart local v5    # "pc":I
    const/16 v7, 0x2c

    aput-byte v7, v6, p2

    .line 1323
    invoke-static {v6, v4, v5}, Lorg/mozilla/javascript/regexp/NativeRegExp;->resolveForwardJump([BII)V

    move/from16 p2, v5

    .line 1324
    .end local v5    # "pc":I
    .restart local p2    # "pc":I
    goto/16 :goto_15

    .line 1326
    .end local v4    # "nextTermFixup":I
    :sswitch_1b9
    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->min:I

    if-nez v7, :cond_204

    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->max:I

    const/4 v8, -0x1

    if-ne v7, v8, :cond_204

    .line 1327
    add-int/lit8 v8, p2, -0x1

    move-object/from16 v0, p3

    iget-boolean v7, v0, Lorg/mozilla/javascript/regexp/RENode;->greedy:Z

    if-eqz v7, :cond_201

    const/16 v7, 0x1a

    :goto_1d0
    aput-byte v7, v6, v8

    .line 1340
    :goto_1d2
    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->parenCount:I

    move/from16 v0, p2

    invoke-static {v6, v0, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addIndex([BII)I

    move-result p2

    .line 1341
    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->parenIndex:I

    move/from16 v0, p2

    invoke-static {v6, v0, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addIndex([BII)I

    move-result p2

    .line 1342
    move/from16 v4, p2

    .line 1343
    .restart local v4    # "nextTermFixup":I
    add-int/lit8 p2, p2, 0x2

    .line 1344
    move-object/from16 v0, p3

    iget-object v7, v0, Lorg/mozilla/javascript/regexp/RENode;->kid:Lorg/mozilla/javascript/regexp/RENode;

    move/from16 v0, p2

    invoke-static {p0, p1, v0, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->emitREBytecode(Lorg/mozilla/javascript/regexp/CompilerState;Lorg/mozilla/javascript/regexp/RECompiled;ILorg/mozilla/javascript/regexp/RENode;)I

    move-result p2

    .line 1345
    add-int/lit8 v5, p2, 0x1

    .end local p2    # "pc":I
    .restart local v5    # "pc":I
    const/16 v7, 0x31

    aput-byte v7, v6, p2

    .line 1346
    invoke-static {v6, v4, v5}, Lorg/mozilla/javascript/regexp/NativeRegExp;->resolveForwardJump([BII)V

    move/from16 p2, v5

    .line 1347
    .end local v5    # "pc":I
    .restart local p2    # "pc":I
    goto/16 :goto_15

    .line 1327
    .end local v4    # "nextTermFixup":I
    :cond_201
    const/16 v7, 0x2d

    goto :goto_1d0

    .line 1329
    :cond_204
    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->min:I

    if-nez v7, :cond_221

    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->max:I

    const/4 v8, 0x1

    if-ne v7, v8, :cond_221

    .line 1330
    add-int/lit8 v8, p2, -0x1

    move-object/from16 v0, p3

    iget-boolean v7, v0, Lorg/mozilla/javascript/regexp/RENode;->greedy:Z

    if-eqz v7, :cond_21e

    const/16 v7, 0x1c

    :goto_21b
    aput-byte v7, v6, v8

    goto :goto_1d2

    :cond_21e
    const/16 v7, 0x2f

    goto :goto_21b

    .line 1332
    :cond_221
    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->min:I

    const/4 v8, 0x1

    if-ne v7, v8, :cond_23f

    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->max:I

    const/4 v8, -0x1

    if-ne v7, v8, :cond_23f

    .line 1333
    add-int/lit8 v8, p2, -0x1

    move-object/from16 v0, p3

    iget-boolean v7, v0, Lorg/mozilla/javascript/regexp/RENode;->greedy:Z

    if-eqz v7, :cond_23c

    const/16 v7, 0x1b

    :goto_239
    aput-byte v7, v6, v8

    goto :goto_1d2

    :cond_23c
    const/16 v7, 0x2e

    goto :goto_239

    .line 1335
    :cond_23f
    move-object/from16 v0, p3

    iget-boolean v7, v0, Lorg/mozilla/javascript/regexp/RENode;->greedy:Z

    if-nez v7, :cond_24b

    add-int/lit8 v7, p2, -0x1

    const/16 v8, 0x30

    aput-byte v8, v6, v7

    .line 1336
    :cond_24b
    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->min:I

    move/from16 v0, p2

    invoke-static {v6, v0, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addIndex([BII)I

    move-result p2

    .line 1338
    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->max:I

    add-int/lit8 v7, v7, 0x1

    move/from16 v0, p2

    invoke-static {v6, v0, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addIndex([BII)I

    move-result p2

    goto/16 :goto_1d2

    .line 1349
    :sswitch_263
    move-object/from16 v0, p3

    iget-boolean v7, v0, Lorg/mozilla/javascript/regexp/RENode;->sense:Z

    if-nez v7, :cond_26f

    .line 1350
    add-int/lit8 v7, p2, -0x1

    const/16 v8, 0x17

    aput-byte v8, v6, v7

    .line 1351
    :cond_26f
    move-object/from16 v0, p3

    iget v7, v0, Lorg/mozilla/javascript/regexp/RENode;->index:I

    move/from16 v0, p2

    invoke-static {v6, v0, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addIndex([BII)I

    move-result p2

    .line 1352
    iget-object v7, p1, Lorg/mozilla/javascript/regexp/RECompiled;->classList:[Lorg/mozilla/javascript/regexp/RECharSet;

    move-object/from16 v0, p3

    iget v8, v0, Lorg/mozilla/javascript/regexp/RENode;->index:I

    new-instance v9, Lorg/mozilla/javascript/regexp/RECharSet;

    move-object/from16 v0, p3

    iget v10, v0, Lorg/mozilla/javascript/regexp/RENode;->bmsize:I

    move-object/from16 v0, p3

    iget v11, v0, Lorg/mozilla/javascript/regexp/RENode;->startIndex:I

    move-object/from16 v0, p3

    iget v12, v0, Lorg/mozilla/javascript/regexp/RENode;->kidlen:I

    move-object/from16 v0, p3

    iget-boolean v13, v0, Lorg/mozilla/javascript/regexp/RENode;->sense:Z

    invoke-direct {v9, v10, v11, v12, v13}, Lorg/mozilla/javascript/regexp/RECharSet;-><init>(IIIZ)V

    aput-object v9, v7, v8

    goto/16 :goto_15

    .line 1360
    .end local p2    # "pc":I
    .restart local v5    # "pc":I
    :cond_298
    return v5

    .line 1234
    nop

    :sswitch_data_29a
    .sparse-switch
        0x1 -> :sswitch_1e
        0xd -> :sswitch_177
        0xe -> :sswitch_93
        0x16 -> :sswitch_263
        0x19 -> :sswitch_1b9
        0x1d -> :sswitch_153
        0x1f -> :sswitch_4d
        0x29 -> :sswitch_183
        0x2a -> :sswitch_19e
        0x35 -> :sswitch_21
        0x36 -> :sswitch_21
        0x37 -> :sswitch_21
    .end sparse-switch
.end method

.method private static escapeRegExp(Ljava/lang/Object;)Ljava/lang/String;
    .registers 8
    .param p0, "src"    # Ljava/lang/Object;

    .prologue
    const/16 v6, 0x2f

    .line 224
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 226
    .local v0, "s":Ljava/lang/String;
    const/4 v1, 0x0

    .line 227
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v3, 0x0

    .line 228
    .local v3, "start":I
    invoke-virtual {v0, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 229
    .local v2, "slash":I
    :goto_c
    const/4 v4, -0x1

    if-le v2, v4, :cond_33

    .line 230
    if-eq v2, v3, :cond_1b

    add-int/lit8 v4, v2, -0x1

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x5c

    if-eq v4, v5, :cond_2c

    .line 231
    :cond_1b
    if-nez v1, :cond_22

    .line 232
    new-instance v1, Ljava/lang/StringBuilder;

    .end local v1    # "sb":Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 234
    .restart local v1    # "sb":Ljava/lang/StringBuilder;
    :cond_22
    invoke-virtual {v1, v0, v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 235
    const-string v4, "\\/"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    add-int/lit8 v3, v2, 0x1

    .line 238
    :cond_2c
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {v0, v6, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    goto :goto_c

    .line 240
    :cond_33
    if-eqz v1, :cond_40

    .line 241
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v1, v0, v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 242
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 244
    :cond_40
    return-object v0
.end method

.method private execSub(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;I)Ljava/lang/Object;
    .registers 15
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scopeObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "matchType"    # I

    .prologue
    .line 250
    invoke-static {p1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getImpl(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/regexp/RegExpImpl;

    move-result-object v3

    .line 252
    .local v3, "reImpl":Lorg/mozilla/javascript/regexp/RegExpImpl;
    array-length v0, p3

    if-nez v0, :cond_3a

    .line 253
    iget-object v4, v3, Lorg/mozilla/javascript/regexp/RegExpImpl;->input:Ljava/lang/String;

    .line 254
    .local v4, "str":Ljava/lang/String;
    if-nez v4, :cond_11

    .line 255
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 260
    :cond_11
    :goto_11
    const-wide/16 v7, 0x0

    .line 261
    .local v7, "d":D
    iget-object v0, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->re:Lorg/mozilla/javascript/regexp/RECompiled;

    iget v0, v0, Lorg/mozilla/javascript/regexp/RECompiled;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_21

    .line 262
    iget-object v0, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v7

    .line 266
    :cond_21
    const-wide/16 v0, 0x0

    cmpg-double v0, v7, v0

    if-ltz v0, :cond_30

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v0

    int-to-double v0, v0

    cmpg-double v0, v0, v7

    if-gez v0, :cond_42

    .line 267
    :cond_30
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    .line 268
    const/4 v9, 0x0

    .line 278
    :cond_39
    :goto_39
    return-object v9

    .line 258
    .end local v4    # "str":Ljava/lang/String;
    .end local v7    # "d":D
    :cond_3a
    const/4 v0, 0x0

    aget-object v0, p3, v0

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .restart local v4    # "str":Ljava/lang/String;
    goto :goto_11

    .line 271
    .restart local v7    # "d":D
    :cond_42
    const/4 v0, 0x1

    new-array v5, v0, [I

    const/4 v0, 0x0

    double-to-int v1, v7

    aput v1, v5, v0

    .local v5, "indexp":[I
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v6, p4

    .line 272
    invoke-virtual/range {v0 .. v6}, Lorg/mozilla/javascript/regexp/NativeRegExp;->executeRegExp(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/regexp/RegExpImpl;Ljava/lang/String;[II)Ljava/lang/Object;

    move-result-object v9

    .line 273
    .local v9, "rval":Ljava/lang/Object;
    iget-object v0, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->re:Lorg/mozilla/javascript/regexp/RECompiled;

    iget v0, v0, Lorg/mozilla/javascript/regexp/RECompiled;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_39

    .line 274
    if-eqz v9, :cond_5f

    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v9, v0, :cond_68

    :cond_5f
    const-wide/16 v0, 0x0

    :goto_61
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    goto :goto_39

    :cond_68
    const/4 v0, 0x0

    aget v0, v5, v0

    int-to-double v0, v0

    goto :goto_61
.end method

.method private static executeREBytecode(Lorg/mozilla/javascript/regexp/REGlobalData;Ljava/lang/String;I)Z
    .registers 49
    .param p0, "gData"    # Lorg/mozilla/javascript/regexp/REGlobalData;
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "end"    # I

    .prologue
    .line 1941
    const/4 v12, 0x0

    .line 1942
    .local v12, "pc":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->regexp:Lorg/mozilla/javascript/regexp/RECompiled;

    iget-object v6, v3, Lorg/mozilla/javascript/regexp/RECompiled;->program:[B

    .line 1943
    .local v6, "program":[B
    const/16 v17, 0x39

    .line 1944
    .local v17, "continuationOp":I
    const/16 v18, 0x0

    .line 1945
    .local v18, "continuationPc":I
    const/16 v44, 0x0

    .line 1947
    .local v44, "result":Z
    add-int/lit8 v7, v12, 0x1

    .end local v12    # "pc":I
    .local v7, "pc":I
    aget-byte v5, v6, v12

    .line 1953
    .local v5, "op":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->regexp:Lorg/mozilla/javascript/regexp/RECompiled;

    iget v3, v3, Lorg/mozilla/javascript/regexp/RECompiled;->anchorCh:I

    if-gez v3, :cond_84

    invoke-static {v5}, Lorg/mozilla/javascript/regexp/NativeRegExp;->reopIsSimple(I)Z

    move-result v3

    if-eqz v3, :cond_84

    .line 1954
    const/16 v29, 0x0

    .line 1955
    .local v29, "anchor":Z
    :goto_21
    move-object/from16 v0, p0

    iget v3, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v0, p2

    if-gt v3, v0, :cond_3f

    .line 1956
    const/4 v9, 0x1

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move/from16 v8, p2

    invoke-static/range {v3 .. v9}, Lorg/mozilla/javascript/regexp/NativeRegExp;->simpleMatch(Lorg/mozilla/javascript/regexp/REGlobalData;Ljava/lang/String;I[BIIZ)I

    move-result v35

    .line 1957
    .local v35, "match":I
    if-ltz v35, :cond_43

    .line 1958
    const/16 v29, 0x1

    .line 1959
    move/from16 v7, v35

    .line 1960
    add-int/lit8 v12, v7, 0x1

    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    aget-byte v5, v6, v7

    move v7, v12

    .line 1966
    .end local v12    # "pc":I
    .end local v35    # "match":I
    .restart local v7    # "pc":I
    :cond_3f
    if-nez v29, :cond_84

    .line 1967
    const/4 v3, 0x0

    .line 2351
    .end local v29    # "anchor":Z
    :goto_42
    return v3

    .line 1963
    .restart local v29    # "anchor":Z
    .restart local v35    # "match":I
    :cond_43
    move-object/from16 v0, p0

    iget v3, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->skipped:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->skipped:I

    .line 1964
    move-object/from16 v0, p0

    iget v3, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    goto :goto_21

    .line 2012
    .end local v29    # "anchor":Z
    .end local v35    # "match":I
    :cond_58
    :pswitch_58
    invoke-static {v6, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getOffset([BI)I

    move-result v3

    add-int v40, v7, v3

    .line 2013
    .local v40, "nextpc":I
    add-int/lit8 v7, v7, 0x2

    .line 2014
    add-int/lit8 v12, v7, 0x1

    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    aget-byte v5, v6, v7

    .line 2015
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v16, v0

    .line 2016
    .local v16, "startcp":I
    invoke-static {v5}, Lorg/mozilla/javascript/regexp/NativeRegExp;->reopIsSimple(I)Z

    move-result v3

    if-eqz v3, :cond_550

    .line 2017
    const/4 v14, 0x1

    move-object/from16 v8, p0

    move-object/from16 v9, p1

    move v10, v5

    move-object v11, v6

    move/from16 v13, p2

    invoke-static/range {v8 .. v14}, Lorg/mozilla/javascript/regexp/NativeRegExp;->simpleMatch(Lorg/mozilla/javascript/regexp/REGlobalData;Ljava/lang/String;I[BIIZ)I

    move-result v35

    .line 2018
    .restart local v35    # "match":I
    if-gez v35, :cond_14c

    .line 2019
    add-int/lit8 v15, v40, 0x1

    .end local v40    # "nextpc":I
    .local v15, "nextpc":I
    aget-byte v5, v6, v40

    .line 2020
    move v7, v15

    .line 1972
    .end local v12    # "pc":I
    .end local v15    # "nextpc":I
    .end local v16    # "startcp":I
    .end local v35    # "match":I
    .restart local v7    # "pc":I
    :cond_84
    :goto_84
    invoke-static {v5}, Lorg/mozilla/javascript/regexp/NativeRegExp;->reopIsSimple(I)Z

    move-result v3

    if-eqz v3, :cond_e0

    .line 1973
    const/4 v9, 0x1

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move/from16 v8, p2

    invoke-static/range {v3 .. v9}, Lorg/mozilla/javascript/regexp/NativeRegExp;->simpleMatch(Lorg/mozilla/javascript/regexp/REGlobalData;Ljava/lang/String;I[BIIZ)I

    move-result v35

    .line 1974
    .restart local v35    # "match":I
    if-ltz v35, :cond_dd

    const/16 v44, 0x1

    .line 1975
    :goto_99
    if-eqz v44, :cond_9d

    .line 1976
    move/from16 v7, v35

    :cond_9d
    move v12, v7

    .line 2337
    .end local v7    # "pc":I
    .end local v35    # "match":I
    .restart local v12    # "pc":I
    :goto_9e
    if-nez v44, :cond_542

    .line 2338
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->backTrackStackTop:Lorg/mozilla/javascript/regexp/REBackTrackData;

    move-object/from16 v30, v0

    .line 2339
    .local v30, "backTrackData":Lorg/mozilla/javascript/regexp/REBackTrackData;
    if-eqz v30, :cond_53e

    .line 2340
    move-object/from16 v0, v30

    iget-object v3, v0, Lorg/mozilla/javascript/regexp/REBackTrackData;->previous:Lorg/mozilla/javascript/regexp/REBackTrackData;

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->backTrackStackTop:Lorg/mozilla/javascript/regexp/REBackTrackData;

    .line 2341
    move-object/from16 v0, v30

    iget-object v3, v0, Lorg/mozilla/javascript/regexp/REBackTrackData;->parens:[J

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->parens:[J

    .line 2342
    move-object/from16 v0, v30

    iget v3, v0, Lorg/mozilla/javascript/regexp/REBackTrackData;->cp:I

    move-object/from16 v0, p0

    iput v3, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    .line 2343
    move-object/from16 v0, v30

    iget-object v3, v0, Lorg/mozilla/javascript/regexp/REBackTrackData;->stateStackTop:Lorg/mozilla/javascript/regexp/REProgState;

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->stateStackTop:Lorg/mozilla/javascript/regexp/REProgState;

    .line 2344
    move-object/from16 v0, v30

    iget v0, v0, Lorg/mozilla/javascript/regexp/REBackTrackData;->continuationOp:I

    move/from16 v17, v0

    .line 2345
    move-object/from16 v0, v30

    iget v0, v0, Lorg/mozilla/javascript/regexp/REBackTrackData;->continuationPc:I

    move/from16 v18, v0

    .line 2346
    move-object/from16 v0, v30

    iget v7, v0, Lorg/mozilla/javascript/regexp/REBackTrackData;->pc:I

    .line 2347
    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    move-object/from16 v0, v30

    iget v5, v0, Lorg/mozilla/javascript/regexp/REBackTrackData;->op:I

    .line 2348
    goto :goto_84

    .line 1974
    .end local v30    # "backTrackData":Lorg/mozilla/javascript/regexp/REBackTrackData;
    .restart local v35    # "match":I
    :cond_dd
    const/16 v44, 0x0

    goto :goto_99

    .line 1979
    .end local v35    # "match":I
    :cond_e0
    packed-switch v5, :pswitch_data_554

    .line 2329
    :pswitch_e3
    const-string v3, "invalid bytecode"

    invoke-static {v3}, Lorg/mozilla/javascript/Kit;->codeBug(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 1984
    :pswitch_ea
    invoke-static {v6, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v3

    int-to-char v0, v3

    move/from16 v36, v0

    .line 1985
    .local v36, "matchCh1":C
    add-int/lit8 v7, v7, 0x2

    .line 1986
    invoke-static {v6, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v3

    int-to-char v0, v3

    move/from16 v37, v0

    .line 1987
    .local v37, "matchCh2":C
    add-int/lit8 v7, v7, 0x2

    .line 1989
    move-object/from16 v0, p0

    iget v3, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v0, p2

    if-ne v3, v0, :cond_108

    .line 1990
    const/16 v44, 0x0

    move v12, v7

    .line 1991
    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    goto :goto_9e

    .line 1993
    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    :cond_108
    move-object/from16 v0, p0

    iget v3, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v31

    .line 1994
    .local v31, "c":C
    const/16 v3, 0x37

    if-ne v5, v3, :cond_133

    .line 1995
    move/from16 v0, v31

    move/from16 v1, v36

    if-eq v0, v1, :cond_58

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->regexp:Lorg/mozilla/javascript/regexp/RECompiled;

    iget-object v3, v3, Lorg/mozilla/javascript/regexp/RECompiled;->classList:[Lorg/mozilla/javascript/regexp/RECharSet;

    aget-object v3, v3, v37

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-static {v0, v3, v1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->classMatcher(Lorg/mozilla/javascript/regexp/REGlobalData;Lorg/mozilla/javascript/regexp/RECharSet;C)Z

    move-result v3

    if-nez v3, :cond_58

    .line 1997
    const/16 v44, 0x0

    move v12, v7

    .line 1998
    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    goto/16 :goto_9e

    .line 2001
    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    :cond_133
    const/16 v3, 0x36

    if-ne v5, v3, :cond_13b

    .line 2002
    invoke-static/range {v31 .. v31}, Lorg/mozilla/javascript/regexp/NativeRegExp;->upcase(C)C

    move-result v31

    .line 2003
    :cond_13b
    move/from16 v0, v31

    move/from16 v1, v36

    if-eq v0, v1, :cond_58

    move/from16 v0, v31

    move/from16 v1, v37

    if-eq v0, v1, :cond_58

    .line 2004
    const/16 v44, 0x0

    move v12, v7

    .line 2005
    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    goto/16 :goto_9e

    .line 2023
    .end local v31    # "c":C
    .end local v36    # "matchCh1":C
    .end local v37    # "matchCh2":C
    .restart local v16    # "startcp":I
    .restart local v35    # "match":I
    .restart local v40    # "nextpc":I
    :cond_14c
    const/16 v44, 0x1

    .line 2024
    move/from16 v7, v35

    .line 2025
    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    add-int/lit8 v12, v7, 0x1

    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    aget-byte v5, v6, v7

    move v7, v12

    .line 2027
    .end local v12    # "pc":I
    .end local v35    # "match":I
    .restart local v7    # "pc":I
    :goto_155
    add-int/lit8 v15, v40, 0x1

    .end local v40    # "nextpc":I
    .restart local v15    # "nextpc":I
    aget-byte v14, v6, v40

    .local v14, "nextop":B
    move-object/from16 v13, p0

    .line 2028
    invoke-static/range {v13 .. v18}, Lorg/mozilla/javascript/regexp/NativeRegExp;->pushBackTrackState(Lorg/mozilla/javascript/regexp/REGlobalData;BIIII)V

    goto/16 :goto_84

    .line 2035
    .end local v14    # "nextop":B
    .end local v15    # "nextpc":I
    .end local v16    # "startcp":I
    :pswitch_160
    invoke-static {v6, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getOffset([BI)I

    move-result v41

    .line 2036
    .local v41, "offset":I
    add-int v7, v7, v41

    .line 2037
    add-int/lit8 v12, v7, 0x1

    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    aget-byte v5, v6, v7

    move v7, v12

    .line 2039
    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    goto/16 :goto_84

    .line 2044
    .end local v41    # "offset":I
    :pswitch_16d
    invoke-static {v6, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v43

    .line 2045
    .local v43, "parenIndex":I
    add-int/lit8 v7, v7, 0x2

    .line 2046
    move-object/from16 v0, p0

    iget v3, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v43

    invoke-virtual {v0, v1, v3, v4}, Lorg/mozilla/javascript/regexp/REGlobalData;->setParens(III)V

    .line 2047
    add-int/lit8 v12, v7, 0x1

    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    aget-byte v5, v6, v7

    move v7, v12

    .line 2049
    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    goto/16 :goto_84

    .line 2052
    .end local v43    # "parenIndex":I
    :pswitch_186
    invoke-static {v6, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v43

    .line 2053
    .restart local v43    # "parenIndex":I
    add-int/lit8 v7, v7, 0x2

    .line 2054
    move-object/from16 v0, p0

    move/from16 v1, v43

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/regexp/REGlobalData;->parensIndex(I)I

    move-result v32

    .line 2055
    .local v32, "cap_index":I
    move-object/from16 v0, p0

    iget v3, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    sub-int v3, v3, v32

    move-object/from16 v0, p0

    move/from16 v1, v43

    move/from16 v2, v32

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/javascript/regexp/REGlobalData;->setParens(III)V

    .line 2057
    add-int/lit8 v12, v7, 0x1

    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    aget-byte v5, v6, v7

    move v7, v12

    .line 2059
    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    goto/16 :goto_84

    .line 2063
    .end local v32    # "cap_index":I
    .end local v43    # "parenIndex":I
    :pswitch_1aa
    invoke-static {v6, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v3

    add-int v15, v7, v3

    .line 2064
    .restart local v15    # "nextpc":I
    add-int/lit8 v7, v7, 0x2

    .line 2065
    add-int/lit8 v12, v7, 0x1

    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    aget-byte v5, v6, v7

    .line 2066
    invoke-static {v5}, Lorg/mozilla/javascript/regexp/NativeRegExp;->reopIsSimple(I)Z

    move-result v3

    if-eqz v3, :cond_1d4

    const/16 v25, 0x0

    move-object/from16 v19, p0

    move-object/from16 v20, p1

    move/from16 v21, v5

    move-object/from16 v22, v6

    move/from16 v23, v12

    move/from16 v24, p2

    invoke-static/range {v19 .. v25}, Lorg/mozilla/javascript/regexp/NativeRegExp;->simpleMatch(Lorg/mozilla/javascript/regexp/REGlobalData;Ljava/lang/String;I[BIIZ)I

    move-result v3

    if-gez v3, :cond_1d4

    .line 2067
    const/16 v44, 0x0

    .line 2068
    goto/16 :goto_9e

    .line 2070
    :cond_1d4
    const/16 v20, 0x0

    const/16 v21, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->backTrackStackTop:Lorg/mozilla/javascript/regexp/REBackTrackData;

    move-object/from16 v23, v0

    move-object/from16 v19, p0

    move/from16 v24, v17

    move/from16 v25, v18

    invoke-static/range {v19 .. v25}, Lorg/mozilla/javascript/regexp/NativeRegExp;->pushProgState(Lorg/mozilla/javascript/regexp/REGlobalData;IIILorg/mozilla/javascript/regexp/REBackTrackData;II)V

    .line 2072
    const/16 v3, 0x2b

    move-object/from16 v0, p0

    invoke-static {v0, v3, v15}, Lorg/mozilla/javascript/regexp/NativeRegExp;->pushBackTrackState(Lorg/mozilla/javascript/regexp/REGlobalData;BI)V

    move v7, v12

    .line 2074
    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    goto/16 :goto_84

    .line 2077
    .end local v15    # "nextpc":I
    :pswitch_1f7
    invoke-static {v6, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v3

    add-int v15, v7, v3

    .line 2078
    .restart local v15    # "nextpc":I
    add-int/lit8 v7, v7, 0x2

    .line 2079
    add-int/lit8 v12, v7, 0x1

    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    aget-byte v5, v6, v7

    .line 2080
    invoke-static {v5}, Lorg/mozilla/javascript/regexp/NativeRegExp;->reopIsSimple(I)Z

    move-result v3

    if-eqz v3, :cond_227

    .line 2081
    const/16 v25, 0x0

    move-object/from16 v19, p0

    move-object/from16 v20, p1

    move/from16 v21, v5

    move-object/from16 v22, v6

    move/from16 v23, v12

    move/from16 v24, p2

    invoke-static/range {v19 .. v25}, Lorg/mozilla/javascript/regexp/NativeRegExp;->simpleMatch(Lorg/mozilla/javascript/regexp/REGlobalData;Ljava/lang/String;I[BIIZ)I

    move-result v35

    .line 2082
    .restart local v35    # "match":I
    if-ltz v35, :cond_227

    aget-byte v3, v6, v35

    const/16 v4, 0x2c

    if-ne v3, v4, :cond_227

    .line 2083
    const/16 v44, 0x0

    .line 2084
    goto/16 :goto_9e

    .line 2087
    .end local v35    # "match":I
    :cond_227
    const/16 v20, 0x0

    const/16 v21, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->backTrackStackTop:Lorg/mozilla/javascript/regexp/REBackTrackData;

    move-object/from16 v23, v0

    move-object/from16 v19, p0

    move/from16 v24, v17

    move/from16 v25, v18

    invoke-static/range {v19 .. v25}, Lorg/mozilla/javascript/regexp/NativeRegExp;->pushProgState(Lorg/mozilla/javascript/regexp/REGlobalData;IIILorg/mozilla/javascript/regexp/REBackTrackData;II)V

    .line 2089
    const/16 v3, 0x2c

    move-object/from16 v0, p0

    invoke-static {v0, v3, v15}, Lorg/mozilla/javascript/regexp/NativeRegExp;->pushBackTrackState(Lorg/mozilla/javascript/regexp/REGlobalData;BI)V

    move v7, v12

    .line 2091
    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    goto/16 :goto_84

    .line 2096
    .end local v15    # "nextpc":I
    :pswitch_24a
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->popProgState(Lorg/mozilla/javascript/regexp/REGlobalData;)Lorg/mozilla/javascript/regexp/REProgState;

    move-result-object v45

    .line 2097
    .local v45, "state":Lorg/mozilla/javascript/regexp/REProgState;
    move-object/from16 v0, v45

    iget v3, v0, Lorg/mozilla/javascript/regexp/REProgState;->index:I

    move-object/from16 v0, p0

    iput v3, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    .line 2098
    move-object/from16 v0, v45

    iget-object v3, v0, Lorg/mozilla/javascript/regexp/REProgState;->backTrack:Lorg/mozilla/javascript/regexp/REBackTrackData;

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->backTrackStackTop:Lorg/mozilla/javascript/regexp/REBackTrackData;

    .line 2099
    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationPc:I

    move/from16 v18, v0

    .line 2100
    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationOp:I

    move/from16 v17, v0

    .line 2101
    const/16 v3, 0x2c

    if-ne v5, v3, :cond_272

    .line 2102
    if-nez v44, :cond_275

    const/16 v44, 0x1

    :cond_272
    :goto_272
    move v12, v7

    .line 2105
    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    goto/16 :goto_9e

    .line 2102
    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    :cond_275
    const/16 v44, 0x0

    goto :goto_272

    .line 2117
    .end local v45    # "state":Lorg/mozilla/javascript/regexp/REProgState;
    :pswitch_278
    const/16 v33, 0x0

    .line 2118
    .local v33, "greedy":Z
    sparse-switch v5, :sswitch_data_59a

    .line 2151
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 2120
    :sswitch_282
    const/16 v33, 0x1

    .line 2123
    :sswitch_284
    const/16 v20, 0x0

    .line 2124
    .local v20, "min":I
    const/16 v21, -0x1

    .line 2153
    .local v21, "max":I
    :goto_288
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v22, v0

    const/16 v23, 0x0

    move-object/from16 v19, p0

    move/from16 v24, v17

    move/from16 v25, v18

    invoke-static/range {v19 .. v25}, Lorg/mozilla/javascript/regexp/NativeRegExp;->pushProgState(Lorg/mozilla/javascript/regexp/REGlobalData;IIILorg/mozilla/javascript/regexp/REBackTrackData;II)V

    .line 2155
    if-eqz v33, :cond_2ce

    .line 2156
    const/16 v3, 0x33

    move-object/from16 v0, p0

    invoke-static {v0, v3, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->pushBackTrackState(Lorg/mozilla/javascript/regexp/REGlobalData;BI)V

    .line 2157
    const/16 v17, 0x33

    .line 2158
    move/from16 v18, v7

    .line 2160
    add-int/lit8 v7, v7, 0x6

    .line 2161
    add-int/lit8 v12, v7, 0x1

    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    aget-byte v5, v6, v7

    move v7, v12

    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    goto/16 :goto_84

    .line 2127
    .end local v20    # "min":I
    .end local v21    # "max":I
    :sswitch_2af
    const/16 v33, 0x1

    .line 2130
    :sswitch_2b1
    const/16 v20, 0x1

    .line 2131
    .restart local v20    # "min":I
    const/16 v21, -0x1

    .line 2132
    .restart local v21    # "max":I
    goto :goto_288

    .line 2134
    .end local v20    # "min":I
    .end local v21    # "max":I
    :sswitch_2b6
    const/16 v33, 0x1

    .line 2137
    :sswitch_2b8
    const/16 v20, 0x0

    .line 2138
    .restart local v20    # "min":I
    const/16 v21, 0x1

    .line 2139
    .restart local v21    # "max":I
    goto :goto_288

    .line 2141
    .end local v20    # "min":I
    .end local v21    # "max":I
    :sswitch_2bd
    const/16 v33, 0x1

    .line 2144
    :sswitch_2bf
    invoke-static {v6, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getOffset([BI)I

    move-result v20

    .line 2145
    .restart local v20    # "min":I
    add-int/lit8 v7, v7, 0x2

    .line 2147
    invoke-static {v6, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getOffset([BI)I

    move-result v3

    add-int/lit8 v21, v3, -0x1

    .line 2148
    .restart local v21    # "max":I
    add-int/lit8 v7, v7, 0x2

    .line 2149
    goto :goto_288

    .line 2163
    :cond_2ce
    if-eqz v20, :cond_2dd

    .line 2164
    const/16 v17, 0x34

    .line 2165
    move/from16 v18, v7

    .line 2167
    add-int/lit8 v7, v7, 0x6

    .line 2168
    add-int/lit8 v12, v7, 0x1

    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    aget-byte v5, v6, v7

    move v7, v12

    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    goto/16 :goto_84

    .line 2170
    :cond_2dd
    const/16 v3, 0x34

    move-object/from16 v0, p0

    invoke-static {v0, v3, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->pushBackTrackState(Lorg/mozilla/javascript/regexp/REGlobalData;BI)V

    .line 2171
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->popProgState(Lorg/mozilla/javascript/regexp/REGlobalData;)Lorg/mozilla/javascript/regexp/REProgState;

    .line 2172
    add-int/lit8 v7, v7, 0x4

    .line 2173
    invoke-static {v6, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getOffset([BI)I

    move-result v3

    add-int/2addr v7, v3

    .line 2174
    add-int/lit8 v12, v7, 0x1

    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    aget-byte v5, v6, v7

    move v7, v12

    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    goto/16 :goto_84

    .line 2183
    .end local v20    # "min":I
    .end local v21    # "max":I
    .end local v33    # "greedy":Z
    :pswitch_2f5
    const/16 v44, 0x1

    .line 2185
    move/from16 v7, v18

    .line 2186
    move/from16 v5, v17

    .line 2187
    goto/16 :goto_84

    .line 2193
    :cond_2fd
    :pswitch_2fd
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->popProgState(Lorg/mozilla/javascript/regexp/REGlobalData;)Lorg/mozilla/javascript/regexp/REProgState;

    move-result-object v45

    .line 2194
    .restart local v45    # "state":Lorg/mozilla/javascript/regexp/REProgState;
    if-nez v44, :cond_321

    .line 2196
    move-object/from16 v0, v45

    iget v3, v0, Lorg/mozilla/javascript/regexp/REProgState;->min:I

    if-nez v3, :cond_30b

    .line 2197
    const/16 v44, 0x1

    .line 2198
    :cond_30b
    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationPc:I

    move/from16 v18, v0

    .line 2199
    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationOp:I

    move/from16 v17, v0

    .line 2200
    add-int/lit8 v7, v7, 0x4

    .line 2201
    invoke-static {v6, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getOffset([BI)I

    move-result v3

    add-int/2addr v7, v3

    move v12, v7

    .line 2202
    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    goto/16 :goto_9e

    .line 2204
    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    :cond_321
    move-object/from16 v0, v45

    iget v3, v0, Lorg/mozilla/javascript/regexp/REProgState;->min:I

    if-nez v3, :cond_349

    move-object/from16 v0, p0

    iget v3, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move-object/from16 v0, v45

    iget v4, v0, Lorg/mozilla/javascript/regexp/REProgState;->index:I

    if-ne v3, v4, :cond_349

    .line 2206
    const/16 v44, 0x0

    .line 2207
    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationPc:I

    move/from16 v18, v0

    .line 2208
    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationOp:I

    move/from16 v17, v0

    .line 2209
    add-int/lit8 v7, v7, 0x4

    .line 2210
    invoke-static {v6, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getOffset([BI)I

    move-result v3

    add-int/2addr v7, v3

    move v12, v7

    .line 2211
    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    goto/16 :goto_9e

    .line 2213
    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    :cond_349
    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->min:I

    move/from16 v23, v0

    .local v23, "new_min":I
    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->max:I

    move/from16 v24, v0

    .line 2214
    .local v24, "new_max":I
    if-eqz v23, :cond_54c

    add-int/lit8 v23, v23, -0x1

    move/from16 v39, v23

    .line 2215
    .end local v23    # "new_min":I
    .local v39, "new_min":I
    :goto_35b
    const/4 v3, -0x1

    move/from16 v0, v24

    if-eq v0, v3, :cond_548

    add-int/lit8 v24, v24, -0x1

    move/from16 v38, v24

    .line 2216
    .end local v24    # "new_max":I
    .local v38, "new_max":I
    :goto_364
    if-nez v38, :cond_37e

    .line 2217
    const/16 v44, 0x1

    .line 2218
    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationPc:I

    move/from16 v18, v0

    .line 2219
    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationOp:I

    move/from16 v17, v0

    .line 2220
    add-int/lit8 v7, v7, 0x4

    .line 2221
    invoke-static {v6, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getOffset([BI)I

    move-result v3

    add-int/2addr v7, v3

    move v12, v7

    .line 2222
    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    goto/16 :goto_9e

    .line 2224
    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    :cond_37e
    add-int/lit8 v15, v7, 0x6

    .line 2225
    .restart local v15    # "nextpc":I
    aget-byte v14, v6, v15

    .line 2226
    .local v14, "nextop":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v16, v0

    .line 2227
    .restart local v16    # "startcp":I
    invoke-static {v14}, Lorg/mozilla/javascript/regexp/NativeRegExp;->reopIsSimple(I)Z

    move-result v3

    if-eqz v3, :cond_3c5

    .line 2228
    add-int/lit8 v15, v15, 0x1

    .line 2229
    const/16 v28, 0x1

    move-object/from16 v22, p0

    move-object/from16 v23, p1

    move/from16 v24, v14

    move-object/from16 v25, v6

    move/from16 v26, v15

    move/from16 v27, p2

    invoke-static/range {v22 .. v28}, Lorg/mozilla/javascript/regexp/NativeRegExp;->simpleMatch(Lorg/mozilla/javascript/regexp/REGlobalData;Ljava/lang/String;I[BIIZ)I

    move-result v35

    .line 2230
    .restart local v35    # "match":I
    if-gez v35, :cond_3c1

    .line 2231
    if-nez v39, :cond_3be

    const/16 v44, 0x1

    .line 2232
    :goto_3a8
    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationPc:I

    move/from16 v18, v0

    .line 2233
    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationOp:I

    move/from16 v17, v0

    .line 2234
    add-int/lit8 v7, v7, 0x4

    .line 2235
    invoke-static {v6, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getOffset([BI)I

    move-result v3

    add-int/2addr v7, v3

    move v12, v7

    .line 2236
    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    goto/16 :goto_9e

    .line 2231
    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    :cond_3be
    const/16 v44, 0x0

    goto :goto_3a8

    .line 2238
    :cond_3c1
    const/16 v44, 0x1

    .line 2239
    move/from16 v15, v35

    .line 2241
    .end local v35    # "match":I
    :cond_3c5
    const/16 v17, 0x33

    .line 2242
    move/from16 v18, v7

    .line 2243
    const/16 v26, 0x0

    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationOp:I

    move/from16 v27, v0

    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationPc:I

    move/from16 v28, v0

    move-object/from16 v22, p0

    move/from16 v23, v39

    move/from16 v24, v38

    move/from16 v25, v16

    invoke-static/range {v22 .. v28}, Lorg/mozilla/javascript/regexp/NativeRegExp;->pushProgState(Lorg/mozilla/javascript/regexp/REGlobalData;IIILorg/mozilla/javascript/regexp/REBackTrackData;II)V

    .line 2245
    if-nez v39, :cond_419

    .line 2246
    const/16 v23, 0x33

    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationOp:I

    move/from16 v26, v0

    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationPc:I

    move/from16 v27, v0

    move-object/from16 v22, p0

    move/from16 v24, v7

    move/from16 v25, v16

    invoke-static/range {v22 .. v27}, Lorg/mozilla/javascript/regexp/NativeRegExp;->pushBackTrackState(Lorg/mozilla/javascript/regexp/REGlobalData;BIIII)V

    .line 2248
    invoke-static {v6, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v42

    .line 2249
    .local v42, "parenCount":I
    add-int/lit8 v3, v7, 0x2

    invoke-static {v6, v3}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v43

    .line 2250
    .restart local v43    # "parenIndex":I
    const/16 v34, 0x0

    .local v34, "k":I
    :goto_407
    move/from16 v0, v34

    move/from16 v1, v42

    if-ge v0, v1, :cond_419

    .line 2251
    add-int v3, v43, v34

    const/4 v4, -0x1

    const/4 v8, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4, v8}, Lorg/mozilla/javascript/regexp/REGlobalData;->setParens(III)V

    .line 2250
    add-int/lit8 v34, v34, 0x1

    goto :goto_407

    .line 2254
    .end local v34    # "k":I
    .end local v42    # "parenCount":I
    .end local v43    # "parenIndex":I
    :cond_419
    aget-byte v3, v6, v15

    const/16 v4, 0x31

    if-eq v3, v4, :cond_2fd

    .line 2256
    move v7, v15

    .line 2257
    add-int/lit8 v12, v7, 0x1

    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    aget-byte v5, v6, v7

    move v7, v12

    .line 2259
    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    goto/16 :goto_84

    .line 2263
    .end local v14    # "nextop":I
    .end local v15    # "nextpc":I
    .end local v16    # "startcp":I
    .end local v38    # "new_max":I
    .end local v39    # "new_min":I
    .end local v45    # "state":Lorg/mozilla/javascript/regexp/REProgState;
    :pswitch_427
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->popProgState(Lorg/mozilla/javascript/regexp/REGlobalData;)Lorg/mozilla/javascript/regexp/REProgState;

    move-result-object v45

    .line 2264
    .restart local v45    # "state":Lorg/mozilla/javascript/regexp/REProgState;
    if-nez v44, :cond_499

    .line 2268
    move-object/from16 v0, v45

    iget v3, v0, Lorg/mozilla/javascript/regexp/REProgState;->max:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_43a

    move-object/from16 v0, v45

    iget v3, v0, Lorg/mozilla/javascript/regexp/REProgState;->max:I

    if-lez v3, :cond_48a

    .line 2269
    :cond_43a
    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->min:I

    move/from16 v23, v0

    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->max:I

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v25, v0

    const/16 v26, 0x0

    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationOp:I

    move/from16 v27, v0

    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationPc:I

    move/from16 v28, v0

    move-object/from16 v22, p0

    invoke-static/range {v22 .. v28}, Lorg/mozilla/javascript/regexp/NativeRegExp;->pushProgState(Lorg/mozilla/javascript/regexp/REGlobalData;IIILorg/mozilla/javascript/regexp/REBackTrackData;II)V

    .line 2271
    const/16 v17, 0x34

    .line 2272
    move/from16 v18, v7

    .line 2273
    invoke-static {v6, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v42

    .line 2274
    .restart local v42    # "parenCount":I
    add-int/lit8 v7, v7, 0x2

    .line 2275
    invoke-static {v6, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v43

    .line 2276
    .restart local v43    # "parenIndex":I
    add-int/lit8 v7, v7, 0x4

    .line 2277
    const/16 v34, 0x0

    .restart local v34    # "k":I
    :goto_471
    move/from16 v0, v34

    move/from16 v1, v42

    if-ge v0, v1, :cond_483

    .line 2278
    add-int v3, v43, v34

    const/4 v4, -0x1

    const/4 v8, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4, v8}, Lorg/mozilla/javascript/regexp/REGlobalData;->setParens(III)V

    .line 2277
    add-int/lit8 v34, v34, 0x1

    goto :goto_471

    .line 2280
    :cond_483
    add-int/lit8 v12, v7, 0x1

    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    aget-byte v5, v6, v7

    move v7, v12

    .line 2281
    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    goto/16 :goto_84

    .line 2284
    .end local v34    # "k":I
    .end local v42    # "parenCount":I
    .end local v43    # "parenIndex":I
    :cond_48a
    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationPc:I

    move/from16 v18, v0

    .line 2285
    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationOp:I

    move/from16 v17, v0

    move v12, v7

    .line 2286
    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    goto/16 :goto_9e

    .line 2289
    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    :cond_499
    move-object/from16 v0, v45

    iget v3, v0, Lorg/mozilla/javascript/regexp/REProgState;->min:I

    if-nez v3, :cond_4ba

    move-object/from16 v0, p0

    iget v3, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move-object/from16 v0, v45

    iget v4, v0, Lorg/mozilla/javascript/regexp/REProgState;->index:I

    if-ne v3, v4, :cond_4ba

    .line 2291
    const/16 v44, 0x0

    .line 2292
    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationPc:I

    move/from16 v18, v0

    .line 2293
    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationOp:I

    move/from16 v17, v0

    move v12, v7

    .line 2294
    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    goto/16 :goto_9e

    .line 2296
    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    :cond_4ba
    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->min:I

    move/from16 v23, v0

    .restart local v23    # "new_min":I
    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->max:I

    move/from16 v24, v0

    .line 2297
    .restart local v24    # "new_max":I
    if-eqz v23, :cond_4ca

    add-int/lit8 v23, v23, -0x1

    .line 2298
    :cond_4ca
    const/4 v3, -0x1

    move/from16 v0, v24

    if-eq v0, v3, :cond_4d1

    add-int/lit8 v24, v24, -0x1

    .line 2299
    :cond_4d1
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v25, v0

    const/16 v26, 0x0

    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationOp:I

    move/from16 v27, v0

    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationPc:I

    move/from16 v28, v0

    move-object/from16 v22, p0

    invoke-static/range {v22 .. v28}, Lorg/mozilla/javascript/regexp/NativeRegExp;->pushProgState(Lorg/mozilla/javascript/regexp/REGlobalData;IIILorg/mozilla/javascript/regexp/REBackTrackData;II)V

    .line 2301
    if-eqz v23, :cond_517

    .line 2302
    const/16 v17, 0x34

    .line 2303
    move/from16 v18, v7

    .line 2304
    invoke-static {v6, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v42

    .line 2305
    .restart local v42    # "parenCount":I
    add-int/lit8 v7, v7, 0x2

    .line 2306
    invoke-static {v6, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v43

    .line 2307
    .restart local v43    # "parenIndex":I
    add-int/lit8 v7, v7, 0x4

    .line 2308
    const/16 v34, 0x0

    .restart local v34    # "k":I
    :goto_4fe
    move/from16 v0, v34

    move/from16 v1, v42

    if-ge v0, v1, :cond_510

    .line 2309
    add-int v3, v43, v34

    const/4 v4, -0x1

    const/4 v8, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4, v8}, Lorg/mozilla/javascript/regexp/REGlobalData;->setParens(III)V

    .line 2308
    add-int/lit8 v34, v34, 0x1

    goto :goto_4fe

    .line 2311
    :cond_510
    add-int/lit8 v12, v7, 0x1

    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    aget-byte v5, v6, v7

    move v7, v12

    .line 2312
    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    goto/16 :goto_84

    .line 2313
    .end local v34    # "k":I
    .end local v42    # "parenCount":I
    .end local v43    # "parenIndex":I
    :cond_517
    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationPc:I

    move/from16 v18, v0

    .line 2314
    move-object/from16 v0, v45

    iget v0, v0, Lorg/mozilla/javascript/regexp/REProgState;->continuationOp:I

    move/from16 v17, v0

    .line 2315
    const/16 v3, 0x34

    move-object/from16 v0, p0

    invoke-static {v0, v3, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->pushBackTrackState(Lorg/mozilla/javascript/regexp/REGlobalData;BI)V

    .line 2316
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->popProgState(Lorg/mozilla/javascript/regexp/REGlobalData;)Lorg/mozilla/javascript/regexp/REProgState;

    .line 2317
    add-int/lit8 v7, v7, 0x4

    .line 2318
    invoke-static {v6, v7}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getOffset([BI)I

    move-result v3

    add-int/2addr v7, v3

    .line 2319
    add-int/lit8 v12, v7, 0x1

    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    aget-byte v5, v6, v7

    move v7, v12

    .line 2321
    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    goto/16 :goto_84

    .line 2326
    .end local v23    # "new_min":I
    .end local v24    # "new_max":I
    .end local v45    # "state":Lorg/mozilla/javascript/regexp/REProgState;
    :pswitch_53b
    const/4 v3, 0x1

    goto/16 :goto_42

    .line 2351
    .end local v7    # "pc":I
    .restart local v12    # "pc":I
    .restart local v30    # "backTrackData":Lorg/mozilla/javascript/regexp/REBackTrackData;
    :cond_53e
    const/4 v3, 0x0

    move v7, v12

    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    goto/16 :goto_42

    .line 2354
    .end local v7    # "pc":I
    .end local v30    # "backTrackData":Lorg/mozilla/javascript/regexp/REBackTrackData;
    .restart local v12    # "pc":I
    :cond_542
    add-int/lit8 v7, v12, 0x1

    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    aget-byte v5, v6, v12

    goto/16 :goto_84

    .restart local v24    # "new_max":I
    .restart local v39    # "new_min":I
    .restart local v45    # "state":Lorg/mozilla/javascript/regexp/REProgState;
    :cond_548
    move/from16 v38, v24

    .end local v24    # "new_max":I
    .restart local v38    # "new_max":I
    goto/16 :goto_364

    .end local v38    # "new_max":I
    .end local v39    # "new_min":I
    .restart local v23    # "new_min":I
    .restart local v24    # "new_max":I
    :cond_54c
    move/from16 v39, v23

    .end local v23    # "new_min":I
    .restart local v39    # "new_min":I
    goto/16 :goto_35b

    .end local v7    # "pc":I
    .end local v24    # "new_max":I
    .end local v39    # "new_min":I
    .end local v45    # "state":Lorg/mozilla/javascript/regexp/REProgState;
    .restart local v12    # "pc":I
    .restart local v16    # "startcp":I
    .restart local v40    # "nextpc":I
    :cond_550
    move v7, v12

    .end local v12    # "pc":I
    .restart local v7    # "pc":I
    goto/16 :goto_155

    .line 1979
    nop

    :pswitch_data_554
    .packed-switch 0x19
        :pswitch_278
        :pswitch_278
        :pswitch_278
        :pswitch_278
        :pswitch_16d
        :pswitch_186
        :pswitch_58
        :pswitch_160
        :pswitch_e3
        :pswitch_e3
        :pswitch_e3
        :pswitch_e3
        :pswitch_e3
        :pswitch_e3
        :pswitch_e3
        :pswitch_e3
        :pswitch_1aa
        :pswitch_1f7
        :pswitch_24a
        :pswitch_24a
        :pswitch_278
        :pswitch_278
        :pswitch_278
        :pswitch_278
        :pswitch_2f5
        :pswitch_e3
        :pswitch_2fd
        :pswitch_427
        :pswitch_ea
        :pswitch_ea
        :pswitch_ea
        :pswitch_e3
        :pswitch_53b
    .end packed-switch

    .line 2118
    :sswitch_data_59a
    .sparse-switch
        0x19 -> :sswitch_2bd
        0x1a -> :sswitch_282
        0x1b -> :sswitch_2af
        0x1c -> :sswitch_2b6
        0x2d -> :sswitch_284
        0x2e -> :sswitch_2b1
        0x2f -> :sswitch_2b8
        0x30 -> :sswitch_2bf
    .end sparse-switch
.end method

.method private static flatNIMatcher(Lorg/mozilla/javascript/regexp/REGlobalData;IILjava/lang/String;I)Z
    .registers 12
    .param p0, "gData"    # Lorg/mozilla/javascript/regexp/REGlobalData;
    .param p1, "matchChars"    # I
    .param p2, "length"    # I
    .param p3, "input"    # Ljava/lang/String;
    .param p4, "end"    # I

    .prologue
    const/4 v4, 0x0

    .line 1419
    iget v5, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/2addr v5, p2

    if-le v5, p4, :cond_7

    .line 1430
    :cond_6
    :goto_6
    return v4

    .line 1421
    :cond_7
    iget-object v5, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->regexp:Lorg/mozilla/javascript/regexp/RECompiled;

    iget-object v3, v5, Lorg/mozilla/javascript/regexp/RECompiled;->source:[C

    .line 1422
    .local v3, "source":[C
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_c
    if-ge v2, p2, :cond_28

    .line 1423
    add-int v5, p1, v2

    aget-char v0, v3, v5

    .line 1424
    .local v0, "c1":C
    iget v5, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/2addr v5, v2

    invoke-virtual {p3, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1425
    .local v1, "c2":C
    if-eq v0, v1, :cond_25

    invoke-static {v0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->upcase(C)C

    move-result v5

    invoke-static {v1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->upcase(C)C

    move-result v6

    if-ne v5, v6, :cond_6

    .line 1422
    :cond_25
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 1429
    .end local v0    # "c1":C
    .end local v1    # "c2":C
    :cond_28
    iget v4, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/2addr v4, p2

    iput v4, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    .line 1430
    const/4 v4, 0x1

    goto :goto_6
.end method

.method private static flatNMatcher(Lorg/mozilla/javascript/regexp/REGlobalData;IILjava/lang/String;I)Z
    .registers 9
    .param p0, "gData"    # Lorg/mozilla/javascript/regexp/REGlobalData;
    .param p1, "matchChars"    # I
    .param p2, "length"    # I
    .param p3, "input"    # Ljava/lang/String;
    .param p4, "end"    # I

    .prologue
    const/4 v1, 0x0

    .line 1404
    iget v2, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/2addr v2, p2

    if-le v2, p4, :cond_7

    .line 1412
    :cond_6
    :goto_6
    return v1

    .line 1406
    :cond_7
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    if-ge v0, p2, :cond_1e

    .line 1407
    iget-object v2, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->regexp:Lorg/mozilla/javascript/regexp/RECompiled;

    iget-object v2, v2, Lorg/mozilla/javascript/regexp/RECompiled;->source:[C

    add-int v3, p1, v0

    aget-char v2, v2, v3

    iget v3, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/2addr v3, v0

    invoke-virtual {p3, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v2, v3, :cond_6

    .line 1406
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 1411
    :cond_1e
    iget v1, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/2addr v1, p2

    iput v1, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    .line 1412
    const/4 v1, 0x1

    goto :goto_6
.end method

.method private static getDecimalValue(CLorg/mozilla/javascript/regexp/CompilerState;ILjava/lang/String;)I
    .registers 11
    .param p0, "c"    # C
    .param p1, "state"    # Lorg/mozilla/javascript/regexp/CompilerState;
    .param p2, "maxValue"    # I
    .param p3, "overflowMessageId"    # Ljava/lang/String;

    .prologue
    .line 780
    const/4 v0, 0x0

    .line 781
    .local v0, "overflow":Z
    iget v2, p1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    .line 782
    .local v2, "start":I
    iget-object v1, p1, Lorg/mozilla/javascript/regexp/CompilerState;->cpbegin:[C

    .line 783
    .local v1, "src":[C
    add-int/lit8 v4, p0, -0x30

    .line 784
    .local v4, "value":I
    :goto_7
    iget v5, p1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    iget v6, p1, Lorg/mozilla/javascript/regexp/CompilerState;->cpend:I

    if-eq v5, v6, :cond_17

    .line 785
    iget v5, p1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    aget-char p0, v1, v5

    .line 786
    invoke-static {p0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isDigit(C)Z

    move-result v5

    if-nez v5, :cond_24

    .line 799
    :cond_17
    if-eqz v0, :cond_23

    .line 800
    iget v5, p1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    sub-int/2addr v5, v2

    invoke-static {v1, v2, v5}, Ljava/lang/String;->valueOf([CII)Ljava/lang/String;

    move-result-object v5

    invoke-static {p3, v5}, Lorg/mozilla/javascript/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 803
    :cond_23
    return v4

    .line 789
    :cond_24
    if-nez v0, :cond_2f

    .line 790
    mul-int/lit8 v5, v4, 0xa

    add-int/lit8 v6, p0, -0x30

    add-int v3, v5, v6

    .line 791
    .local v3, "v":I
    if-ge v3, p2, :cond_36

    .line 792
    move v4, v3

    .line 784
    .end local v3    # "v":I
    :cond_2f
    :goto_2f
    iget v5, p1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    goto :goto_7

    .line 794
    .restart local v3    # "v":I
    :cond_36
    const/4 v0, 0x1

    .line 795
    move v4, p2

    goto :goto_2f
.end method

.method private static getImpl(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/regexp/RegExpImpl;
    .registers 2
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 220
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->getRegExpProxy(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/RegExpProxy;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/regexp/RegExpImpl;

    return-object v0
.end method

.method private static getIndex([BI)I
    .registers 4
    .param p0, "array"    # [B
    .param p1, "pc"    # I

    .prologue
    .line 1220
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method private static getOffset([BI)I
    .registers 3
    .param p0, "array"    # [B
    .param p1, "pc"    # I

    .prologue
    .line 1205
    invoke-static {p0, p1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v0

    return v0
.end method

.method public static init(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Z)V
    .registers 9
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "sealed"    # Z

    .prologue
    const/4 v5, 0x2

    .line 116
    new-instance v1, Lorg/mozilla/javascript/regexp/NativeRegExp;

    invoke-direct {v1}, Lorg/mozilla/javascript/regexp/NativeRegExp;-><init>()V

    .line 117
    .local v1, "proto":Lorg/mozilla/javascript/regexp/NativeRegExp;
    const-string v2, ""

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {p0, v2, v3, v4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->compileRE(Lorg/mozilla/javascript/Context;Ljava/lang/String;Ljava/lang/String;Z)Lorg/mozilla/javascript/regexp/RECompiled;

    move-result-object v2

    iput-object v2, v1, Lorg/mozilla/javascript/regexp/NativeRegExp;->re:Lorg/mozilla/javascript/regexp/RECompiled;

    .line 118
    const/4 v2, 0x6

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/regexp/NativeRegExp;->activatePrototypeMap(I)V

    .line 119
    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 120
    invoke-static {p1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getObjectPrototype(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/regexp/NativeRegExp;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 122
    new-instance v0, Lorg/mozilla/javascript/regexp/NativeRegExpCtor;

    invoke-direct {v0}, Lorg/mozilla/javascript/regexp/NativeRegExpCtor;-><init>()V

    .line 125
    .local v0, "ctor":Lorg/mozilla/javascript/regexp/NativeRegExpCtor;
    const-string v2, "constructor"

    invoke-virtual {v1, v2, v0, v5}, Lorg/mozilla/javascript/regexp/NativeRegExp;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 127
    invoke-static {v0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->setFunctionProtoAndParent(Lorg/mozilla/javascript/BaseFunction;Lorg/mozilla/javascript/Scriptable;)V

    .line 129
    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/regexp/NativeRegExpCtor;->setImmunePrototypeProperty(Ljava/lang/Object;)V

    .line 131
    if-eqz p2, :cond_36

    .line 132
    invoke-virtual {v1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->sealObject()V

    .line 133
    invoke-virtual {v0}, Lorg/mozilla/javascript/regexp/NativeRegExpCtor;->sealObject()V

    .line 136
    :cond_36
    const-string v2, "RegExp"

    invoke-static {p1, v2, v0, v5}, Lorg/mozilla/javascript/regexp/NativeRegExp;->defineProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 137
    return-void
.end method

.method private static isControlLetter(C)Z
    .registers 2
    .param p0, "c"    # C

    .prologue
    .line 395
    const/16 v0, 0x61

    if-gt v0, p0, :cond_8

    const/16 v0, 0x7a

    if-le p0, v0, :cond_10

    :cond_8
    const/16 v0, 0x41

    if-gt v0, p0, :cond_12

    const/16 v0, 0x5a

    if-gt p0, v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method static isDigit(C)Z
    .registers 2
    .param p0, "c"    # C

    .prologue
    .line 385
    const/16 v0, 0x30

    if-gt v0, p0, :cond_a

    const/16 v0, 0x39

    if-gt p0, v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private static isLineTerm(C)Z
    .registers 2
    .param p0, "c"    # C

    .prologue
    .line 400
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->isJSLineTerminator(I)Z

    move-result v0

    return v0
.end method

.method private static isREWhiteSpace(I)Z
    .registers 2
    .param p0, "c"    # I

    .prologue
    .line 405
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->isJSWhitespaceOrLineTerminator(I)Z

    move-result v0

    return v0
.end method

.method private static isWord(C)Z
    .registers 2
    .param p0, "c"    # C

    .prologue
    .line 390
    const/16 v0, 0x61

    if-gt v0, p0, :cond_8

    const/16 v0, 0x7a

    if-le p0, v0, :cond_1a

    :cond_8
    const/16 v0, 0x41

    if-gt v0, p0, :cond_10

    const/16 v0, 0x5a

    if-le p0, v0, :cond_1a

    :cond_10
    invoke-static {p0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isDigit(C)Z

    move-result v0

    if-nez v0, :cond_1a

    const/16 v0, 0x5f

    if-ne p0, v0, :cond_1c

    :cond_1a
    const/4 v0, 0x1

    :goto_1b
    return v0

    :cond_1c
    const/4 v0, 0x0

    goto :goto_1b
.end method

.method private static matchRegExp(Lorg/mozilla/javascript/regexp/REGlobalData;Lorg/mozilla/javascript/regexp/RECompiled;Ljava/lang/String;IIZ)Z
    .registers 14
    .param p0, "gData"    # Lorg/mozilla/javascript/regexp/REGlobalData;
    .param p1, "re"    # Lorg/mozilla/javascript/regexp/RECompiled;
    .param p2, "input"    # Ljava/lang/String;
    .param p3, "start"    # I
    .param p4, "end"    # I
    .param p5, "multiline"    # Z

    .prologue
    .line 2363
    iget v5, p1, Lorg/mozilla/javascript/regexp/RECompiled;->parenCount:I

    if-eqz v5, :cond_2a

    .line 2364
    iget v5, p1, Lorg/mozilla/javascript/regexp/RECompiled;->parenCount:I

    new-array v5, v5, [J

    iput-object v5, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->parens:[J

    .line 2369
    :goto_a
    const/4 v5, 0x0

    iput-object v5, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->backTrackStackTop:Lorg/mozilla/javascript/regexp/REBackTrackData;

    .line 2370
    const/4 v5, 0x0

    iput-object v5, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->stateStackTop:Lorg/mozilla/javascript/regexp/REProgState;

    .line 2372
    if-nez p5, :cond_18

    iget v5, p1, Lorg/mozilla/javascript/regexp/RECompiled;->flags:I

    and-int/lit8 v5, v5, 0x4

    if-eqz v5, :cond_2e

    :cond_18
    const/4 v5, 0x1

    :goto_19
    iput-boolean v5, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->multiline:Z

    .line 2373
    iput-object p1, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->regexp:Lorg/mozilla/javascript/regexp/RECompiled;

    .line 2375
    iget-object v5, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->regexp:Lorg/mozilla/javascript/regexp/RECompiled;

    iget v0, v5, Lorg/mozilla/javascript/regexp/RECompiled;->anchorCh:I

    .line 2380
    .local v0, "anchorCh":I
    move v1, p3

    .local v1, "i":I
    :goto_22
    if-gt v1, p4, :cond_80

    .line 2386
    if-ltz v0, :cond_49

    .line 2388
    :goto_26
    if-ne v1, p4, :cond_30

    .line 2389
    const/4 v5, 0x0

    .line 2419
    :goto_29
    return v5

    .line 2366
    .end local v0    # "anchorCh":I
    .end local v1    # "i":I
    :cond_2a
    const/4 v5, 0x0

    iput-object v5, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->parens:[J

    goto :goto_a

    .line 2372
    :cond_2e
    const/4 v5, 0x0

    goto :goto_19

    .line 2391
    .restart local v0    # "anchorCh":I
    .restart local v1    # "i":I
    :cond_30
    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 2392
    .local v3, "matchCh":C
    if-eq v3, v0, :cond_49

    iget-object v5, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->regexp:Lorg/mozilla/javascript/regexp/RECompiled;

    iget v5, v5, Lorg/mozilla/javascript/regexp/RECompiled;->flags:I

    and-int/lit8 v5, v5, 0x2

    if-eqz v5, :cond_5d

    invoke-static {v3}, Lorg/mozilla/javascript/regexp/NativeRegExp;->upcase(C)C

    move-result v5

    int-to-char v6, v0

    invoke-static {v6}, Lorg/mozilla/javascript/regexp/NativeRegExp;->upcase(C)C

    move-result v6

    if-ne v5, v6, :cond_5d

    .line 2401
    .end local v3    # "matchCh":C
    :cond_49
    iput v1, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    .line 2402
    sub-int v5, v1, p3

    iput v5, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->skipped:I

    .line 2403
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_50
    iget v5, p1, Lorg/mozilla/javascript/regexp/RECompiled;->parenCount:I

    if-ge v2, v5, :cond_60

    .line 2404
    iget-object v5, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->parens:[J

    const-wide/16 v6, -0x1

    aput-wide v6, v5, v2

    .line 2403
    add-int/lit8 v2, v2, 0x1

    goto :goto_50

    .line 2398
    .end local v2    # "j":I
    .restart local v3    # "matchCh":C
    :cond_5d
    add-int/lit8 v1, v1, 0x1

    .line 2399
    goto :goto_26

    .line 2406
    .end local v3    # "matchCh":C
    .restart local v2    # "j":I
    :cond_60
    invoke-static {p0, p2, p4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->executeREBytecode(Lorg/mozilla/javascript/regexp/REGlobalData;Ljava/lang/String;I)Z

    move-result v4

    .line 2408
    .local v4, "result":Z
    const/4 v5, 0x0

    iput-object v5, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->backTrackStackTop:Lorg/mozilla/javascript/regexp/REBackTrackData;

    .line 2409
    const/4 v5, 0x0

    iput-object v5, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->stateStackTop:Lorg/mozilla/javascript/regexp/REProgState;

    .line 2410
    if-eqz v4, :cond_6e

    .line 2411
    const/4 v5, 0x1

    goto :goto_29

    .line 2413
    :cond_6e
    const/4 v5, -0x2

    if-ne v0, v5, :cond_79

    iget-boolean v5, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->multiline:Z

    if-nez v5, :cond_79

    .line 2414
    iput p4, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->skipped:I

    .line 2415
    const/4 v5, 0x0

    goto :goto_29

    .line 2417
    :cond_79
    iget v5, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->skipped:I

    add-int v1, p3, v5

    .line 2380
    add-int/lit8 v1, v1, 0x1

    goto :goto_22

    .line 2419
    .end local v2    # "j":I
    .end local v4    # "result":Z
    :cond_80
    const/4 v5, 0x0

    goto :goto_29
.end method

.method private static parseAlternative(Lorg/mozilla/javascript/regexp/CompilerState;)Z
    .registers 7
    .param p0, "state"    # Lorg/mozilla/javascript/regexp/CompilerState;

    .prologue
    const/4 v3, 0x1

    .line 524
    const/4 v0, 0x0

    .line 525
    .local v0, "headTerm":Lorg/mozilla/javascript/regexp/RENode;
    const/4 v2, 0x0

    .line 526
    .local v2, "tailTerm":Lorg/mozilla/javascript/regexp/RENode;
    iget-object v1, p0, Lorg/mozilla/javascript/regexp/CompilerState;->cpbegin:[C

    .line 528
    .local v1, "source":[C
    :cond_5
    iget v4, p0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    iget v5, p0, Lorg/mozilla/javascript/regexp/CompilerState;->cpend:I

    if-eq v4, v5, :cond_1f

    iget v4, p0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    aget-char v4, v1, v4

    const/16 v5, 0x7c

    if-eq v4, v5, :cond_1f

    iget v4, p0, Lorg/mozilla/javascript/regexp/CompilerState;->parenNesting:I

    if-eqz v4, :cond_2c

    iget v4, p0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    aget-char v4, v1, v4

    const/16 v5, 0x29

    if-ne v4, v5, :cond_2c

    .line 531
    :cond_1f
    if-nez v0, :cond_29

    .line 532
    new-instance v4, Lorg/mozilla/javascript/regexp/RENode;

    invoke-direct {v4, v3}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    iput-object v4, p0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 539
    :goto_28
    return v3

    .line 535
    :cond_29
    iput-object v0, p0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    goto :goto_28

    .line 538
    :cond_2c
    invoke-static {p0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->parseTerm(Lorg/mozilla/javascript/regexp/CompilerState;)Z

    move-result v4

    if-nez v4, :cond_34

    .line 539
    const/4 v3, 0x0

    goto :goto_28

    .line 540
    :cond_34
    if-nez v0, :cond_40

    .line 541
    iget-object v0, p0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 542
    move-object v2, v0

    .line 546
    :goto_39
    iget-object v4, v2, Lorg/mozilla/javascript/regexp/RENode;->next:Lorg/mozilla/javascript/regexp/RENode;

    if-eqz v4, :cond_5

    iget-object v2, v2, Lorg/mozilla/javascript/regexp/RENode;->next:Lorg/mozilla/javascript/regexp/RENode;

    goto :goto_39

    .line 545
    :cond_40
    iget-object v4, p0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    iput-object v4, v2, Lorg/mozilla/javascript/regexp/RENode;->next:Lorg/mozilla/javascript/regexp/RENode;

    goto :goto_39
.end method

.method private static parseDisjunction(Lorg/mozilla/javascript/regexp/CompilerState;)Z
    .registers 11
    .param p0, "state"    # Lorg/mozilla/javascript/regexp/CompilerState;

    .prologue
    const/16 v9, 0x100

    const/16 v8, 0x37

    const/16 v7, 0x16

    const/4 v3, 0x0

    const/16 v6, 0xe

    .line 469
    invoke-static {p0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->parseAlternative(Lorg/mozilla/javascript/regexp/CompilerState;)Z

    move-result v4

    if-nez v4, :cond_10

    .line 515
    :cond_f
    :goto_f
    return v3

    .line 471
    :cond_10
    iget-object v2, p0, Lorg/mozilla/javascript/regexp/CompilerState;->cpbegin:[C

    .line 472
    .local v2, "source":[C
    iget v0, p0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    .line 473
    .local v0, "index":I
    array-length v4, v2

    if-eq v0, v4, :cond_62

    aget-char v4, v2, v0

    const/16 v5, 0x7c

    if-ne v4, v5, :cond_62

    .line 475
    iget v4, p0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    .line 476
    new-instance v1, Lorg/mozilla/javascript/regexp/RENode;

    const/16 v4, 0x1f

    invoke-direct {v1, v4}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    .line 477
    .local v1, "result":Lorg/mozilla/javascript/regexp/RENode;
    iget-object v4, p0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    iput-object v4, v1, Lorg/mozilla/javascript/regexp/RENode;->kid:Lorg/mozilla/javascript/regexp/RENode;

    .line 478
    invoke-static {p0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->parseDisjunction(Lorg/mozilla/javascript/regexp/CompilerState;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 480
    iget-object v3, p0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    iput-object v3, v1, Lorg/mozilla/javascript/regexp/RENode;->kid2:Lorg/mozilla/javascript/regexp/RENode;

    .line 481
    iput-object v1, p0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 486
    iget-object v3, v1, Lorg/mozilla/javascript/regexp/RENode;->kid:Lorg/mozilla/javascript/regexp/RENode;

    iget-byte v3, v3, Lorg/mozilla/javascript/regexp/RENode;->op:B

    if-ne v3, v6, :cond_67

    iget-object v3, v1, Lorg/mozilla/javascript/regexp/RENode;->kid2:Lorg/mozilla/javascript/regexp/RENode;

    iget-byte v3, v3, Lorg/mozilla/javascript/regexp/RENode;->op:B

    if-ne v3, v6, :cond_67

    .line 487
    iget v3, p0, Lorg/mozilla/javascript/regexp/CompilerState;->flags:I

    and-int/lit8 v3, v3, 0x2

    if-nez v3, :cond_64

    const/16 v3, 0x35

    :goto_4e
    iput-byte v3, v1, Lorg/mozilla/javascript/regexp/RENode;->op:B

    .line 489
    iget-object v3, v1, Lorg/mozilla/javascript/regexp/RENode;->kid:Lorg/mozilla/javascript/regexp/RENode;

    iget-char v3, v3, Lorg/mozilla/javascript/regexp/RENode;->chr:C

    iput-char v3, v1, Lorg/mozilla/javascript/regexp/RENode;->chr:C

    .line 490
    iget-object v3, v1, Lorg/mozilla/javascript/regexp/RENode;->kid2:Lorg/mozilla/javascript/regexp/RENode;

    iget-char v3, v3, Lorg/mozilla/javascript/regexp/RENode;->chr:C

    iput v3, v1, Lorg/mozilla/javascript/regexp/RENode;->index:I

    .line 493
    iget v3, p0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    add-int/lit8 v3, v3, 0xd

    iput v3, p0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    .line 515
    .end local v1    # "result":Lorg/mozilla/javascript/regexp/RENode;
    :cond_62
    :goto_62
    const/4 v3, 0x1

    goto :goto_f

    .line 487
    .restart local v1    # "result":Lorg/mozilla/javascript/regexp/RENode;
    :cond_64
    const/16 v3, 0x36

    goto :goto_4e

    .line 494
    :cond_67
    iget-object v3, v1, Lorg/mozilla/javascript/regexp/RENode;->kid:Lorg/mozilla/javascript/regexp/RENode;

    iget-byte v3, v3, Lorg/mozilla/javascript/regexp/RENode;->op:B

    if-ne v3, v7, :cond_94

    iget-object v3, v1, Lorg/mozilla/javascript/regexp/RENode;->kid:Lorg/mozilla/javascript/regexp/RENode;

    iget v3, v3, Lorg/mozilla/javascript/regexp/RENode;->index:I

    if-ge v3, v9, :cond_94

    iget-object v3, v1, Lorg/mozilla/javascript/regexp/RENode;->kid2:Lorg/mozilla/javascript/regexp/RENode;

    iget-byte v3, v3, Lorg/mozilla/javascript/regexp/RENode;->op:B

    if-ne v3, v6, :cond_94

    iget v3, p0, Lorg/mozilla/javascript/regexp/CompilerState;->flags:I

    and-int/lit8 v3, v3, 0x2

    if-nez v3, :cond_94

    .line 496
    iput-byte v8, v1, Lorg/mozilla/javascript/regexp/RENode;->op:B

    .line 497
    iget-object v3, v1, Lorg/mozilla/javascript/regexp/RENode;->kid2:Lorg/mozilla/javascript/regexp/RENode;

    iget-char v3, v3, Lorg/mozilla/javascript/regexp/RENode;->chr:C

    iput-char v3, v1, Lorg/mozilla/javascript/regexp/RENode;->chr:C

    .line 498
    iget-object v3, v1, Lorg/mozilla/javascript/regexp/RENode;->kid:Lorg/mozilla/javascript/regexp/RENode;

    iget v3, v3, Lorg/mozilla/javascript/regexp/RENode;->index:I

    iput v3, v1, Lorg/mozilla/javascript/regexp/RENode;->index:I

    .line 501
    iget v3, p0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    add-int/lit8 v3, v3, 0xd

    iput v3, p0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    goto :goto_62

    .line 502
    :cond_94
    iget-object v3, v1, Lorg/mozilla/javascript/regexp/RENode;->kid:Lorg/mozilla/javascript/regexp/RENode;

    iget-byte v3, v3, Lorg/mozilla/javascript/regexp/RENode;->op:B

    if-ne v3, v6, :cond_c1

    iget-object v3, v1, Lorg/mozilla/javascript/regexp/RENode;->kid2:Lorg/mozilla/javascript/regexp/RENode;

    iget-byte v3, v3, Lorg/mozilla/javascript/regexp/RENode;->op:B

    if-ne v3, v7, :cond_c1

    iget-object v3, v1, Lorg/mozilla/javascript/regexp/RENode;->kid2:Lorg/mozilla/javascript/regexp/RENode;

    iget v3, v3, Lorg/mozilla/javascript/regexp/RENode;->index:I

    if-ge v3, v9, :cond_c1

    iget v3, p0, Lorg/mozilla/javascript/regexp/CompilerState;->flags:I

    and-int/lit8 v3, v3, 0x2

    if-nez v3, :cond_c1

    .line 504
    iput-byte v8, v1, Lorg/mozilla/javascript/regexp/RENode;->op:B

    .line 505
    iget-object v3, v1, Lorg/mozilla/javascript/regexp/RENode;->kid:Lorg/mozilla/javascript/regexp/RENode;

    iget-char v3, v3, Lorg/mozilla/javascript/regexp/RENode;->chr:C

    iput-char v3, v1, Lorg/mozilla/javascript/regexp/RENode;->chr:C

    .line 506
    iget-object v3, v1, Lorg/mozilla/javascript/regexp/RENode;->kid2:Lorg/mozilla/javascript/regexp/RENode;

    iget v3, v3, Lorg/mozilla/javascript/regexp/RENode;->index:I

    iput v3, v1, Lorg/mozilla/javascript/regexp/RENode;->index:I

    .line 509
    iget v3, p0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    add-int/lit8 v3, v3, 0xd

    iput v3, p0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    goto :goto_62

    .line 512
    :cond_c1
    iget v3, p0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    add-int/lit8 v3, v3, 0x9

    iput v3, p0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    goto :goto_62
.end method

.method private static parseTerm(Lorg/mozilla/javascript/regexp/CompilerState;)Z
    .registers 22
    .param p0, "state"    # Lorg/mozilla/javascript/regexp/CompilerState;

    .prologue
    .line 809
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cpbegin:[C

    .line 810
    .local v15, "src":[C
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v19, v18, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    aget-char v4, v15, v18

    .line 811
    .local v4, "c":C
    const/4 v11, 0x2

    .line 812
    .local v11, "nDigits":I
    move-object/from16 v0, p0

    iget v13, v0, Lorg/mozilla/javascript/regexp/CompilerState;->parenCount:I

    .line 817
    .local v13, "parenBaseCount":I
    sparse-switch v4, :sswitch_data_8a0

    .line 1093
    new-instance v18, Lorg/mozilla/javascript/regexp/RENode;

    const/16 v19, 0xe

    invoke-direct/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 1094
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iput-char v4, v0, Lorg/mozilla/javascript/regexp/RENode;->chr:C

    .line 1095
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, v18

    iput v0, v1, Lorg/mozilla/javascript/regexp/RENode;->length:I

    .line 1096
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v19, v0

    add-int/lit8 v19, v19, -0x1

    move/from16 v0, v19

    move-object/from16 v1, v18

    iput v0, v1, Lorg/mozilla/javascript/regexp/RENode;->flatIndex:I

    .line 1097
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x3

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    .line 1101
    :cond_63
    :goto_63
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v16, v0

    .line 1102
    .local v16, "term":Lorg/mozilla/javascript/regexp/RENode;
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cpend:I

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_671

    .line 1103
    const/16 v18, 0x1

    .line 1194
    .end local v16    # "term":Lorg/mozilla/javascript/regexp/RENode;
    :goto_7d
    return v18

    .line 820
    :sswitch_7e
    new-instance v18, Lorg/mozilla/javascript/regexp/RENode;

    const/16 v19, 0x2

    invoke-direct/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 821
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    .line 822
    const/16 v18, 0x1

    goto :goto_7d

    .line 824
    :sswitch_9c
    new-instance v18, Lorg/mozilla/javascript/regexp/RENode;

    const/16 v19, 0x3

    invoke-direct/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 825
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    .line 826
    const/16 v18, 0x1

    goto :goto_7d

    .line 828
    :sswitch_ba
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cpend:I

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_41d

    .line 829
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v19, v18, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    aget-char v4, v15, v18

    .line 830
    sparse-switch v4, :sswitch_data_8ca

    .line 1000
    new-instance v18, Lorg/mozilla/javascript/regexp/RENode;

    const/16 v19, 0xe

    invoke-direct/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 1001
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iput-char v4, v0, Lorg/mozilla/javascript/regexp/RENode;->chr:C

    .line 1002
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, v18

    iput v0, v1, Lorg/mozilla/javascript/regexp/RENode;->length:I

    .line 1003
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v19, v0

    add-int/lit8 v19, v19, -0x1

    move/from16 v0, v19

    move-object/from16 v1, v18

    iput v0, v1, Lorg/mozilla/javascript/regexp/RENode;->flatIndex:I

    .line 1004
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x3

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    goto/16 :goto_63

    .line 833
    :sswitch_128
    new-instance v18, Lorg/mozilla/javascript/regexp/RENode;

    const/16 v19, 0x4

    invoke-direct/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 834
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    .line 835
    const/16 v18, 0x1

    goto/16 :goto_7d

    .line 837
    :sswitch_147
    new-instance v18, Lorg/mozilla/javascript/regexp/RENode;

    const/16 v19, 0x5

    invoke-direct/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 838
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    .line 839
    const/16 v18, 0x1

    goto/16 :goto_7d

    .line 848
    :sswitch_166
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cx:Lorg/mozilla/javascript/Context;

    move-object/from16 v18, v0

    const-string v19, "msg.bad.backref"

    const-string v20, ""

    invoke-static/range {v18 .. v20}, Lorg/mozilla/javascript/regexp/NativeRegExp;->reportWarning(Lorg/mozilla/javascript/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 850
    const/4 v12, 0x0

    .line 853
    .local v12, "num":I
    :goto_174
    const/16 v18, 0x20

    move/from16 v0, v18

    if-ge v12, v0, :cond_1b5

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cpend:I

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_1b5

    .line 854
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    aget-char v4, v15, v18

    .line 855
    const/16 v18, 0x30

    move/from16 v0, v18

    if-lt v4, v0, :cond_1b5

    const/16 v18, 0x37

    move/from16 v0, v18

    if-gt v4, v0, :cond_1b5

    .line 856
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    .line 857
    mul-int/lit8 v18, v12, 0x8

    add-int/lit8 v19, v4, -0x30

    add-int v12, v18, v19

    goto :goto_174

    .line 862
    :cond_1b5
    int-to-char v4, v12

    .line 863
    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->doFlat(Lorg/mozilla/javascript/regexp/CompilerState;C)V

    goto/16 :goto_63

    .line 874
    .end local v12    # "num":I
    :sswitch_1bd
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v17, v18, -0x1

    .line 875
    .local v17, "termStart":I
    const v18, 0xffff

    const-string v19, "msg.overlarge.backref"

    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v19

    invoke-static {v4, v0, v1, v2}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getDecimalValue(CLorg/mozilla/javascript/regexp/CompilerState;ILjava/lang/String;)I

    move-result v12

    .line 877
    .restart local v12    # "num":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->backReferenceLimit:I

    move/from16 v18, v0

    move/from16 v0, v18

    if-le v12, v0, :cond_1eb

    .line 878
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cx:Lorg/mozilla/javascript/Context;

    move-object/from16 v18, v0

    const-string v19, "msg.bad.backref"

    const-string v20, ""

    invoke-static/range {v18 .. v20}, Lorg/mozilla/javascript/regexp/NativeRegExp;->reportWarning(Lorg/mozilla/javascript/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 883
    :cond_1eb
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->backReferenceLimit:I

    move/from16 v18, v0

    move/from16 v0, v18

    if-le v12, v0, :cond_263

    .line 884
    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    .line 885
    const/16 v18, 0x38

    move/from16 v0, v18

    if-lt v4, v0, :cond_20a

    .line 888
    const/16 v4, 0x5c

    .line 889
    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->doFlat(Lorg/mozilla/javascript/regexp/CompilerState;C)V

    goto/16 :goto_63

    .line 892
    :cond_20a
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    .line 893
    add-int/lit8 v12, v4, -0x30

    .line 894
    :goto_21a
    const/16 v18, 0x20

    move/from16 v0, v18

    if-ge v12, v0, :cond_25b

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cpend:I

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_25b

    .line 895
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    aget-char v4, v15, v18

    .line 896
    const/16 v18, 0x30

    move/from16 v0, v18

    if-lt v4, v0, :cond_25b

    const/16 v18, 0x37

    move/from16 v0, v18

    if-gt v4, v0, :cond_25b

    .line 897
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    .line 898
    mul-int/lit8 v18, v12, 0x8

    add-int/lit8 v19, v4, -0x30

    add-int v12, v18, v19

    goto :goto_21a

    .line 903
    :cond_25b
    int-to-char v4, v12

    .line 904
    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->doFlat(Lorg/mozilla/javascript/regexp/CompilerState;C)V

    goto/16 :goto_63

    .line 908
    :cond_263
    new-instance v18, Lorg/mozilla/javascript/regexp/RENode;

    const/16 v19, 0xd

    invoke-direct/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 909
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    add-int/lit8 v19, v12, -0x1

    move/from16 v0, v19

    move-object/from16 v1, v18

    iput v0, v1, Lorg/mozilla/javascript/regexp/RENode;->parenIndex:I

    .line 910
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x3

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    .line 911
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->maxBackReference:I

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v0, v12, :cond_63

    .line 912
    move-object/from16 v0, p0

    iput v12, v0, Lorg/mozilla/javascript/regexp/CompilerState;->maxBackReference:I

    goto/16 :goto_63

    .line 917
    .end local v12    # "num":I
    .end local v17    # "termStart":I
    :sswitch_29c
    const/16 v4, 0xc

    .line 918
    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->doFlat(Lorg/mozilla/javascript/regexp/CompilerState;C)V

    goto/16 :goto_63

    .line 921
    :sswitch_2a5
    const/16 v4, 0xa

    .line 922
    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->doFlat(Lorg/mozilla/javascript/regexp/CompilerState;C)V

    goto/16 :goto_63

    .line 925
    :sswitch_2ae
    const/16 v4, 0xd

    .line 926
    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->doFlat(Lorg/mozilla/javascript/regexp/CompilerState;C)V

    goto/16 :goto_63

    .line 929
    :sswitch_2b7
    const/16 v4, 0x9

    .line 930
    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->doFlat(Lorg/mozilla/javascript/regexp/CompilerState;C)V

    goto/16 :goto_63

    .line 933
    :sswitch_2c0
    const/16 v4, 0xb

    .line 934
    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->doFlat(Lorg/mozilla/javascript/regexp/CompilerState;C)V

    goto/16 :goto_63

    .line 938
    :sswitch_2c9
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cpend:I

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_305

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    aget-char v18, v15, v18

    invoke-static/range {v18 .. v18}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isControlLetter(C)Z

    move-result v18

    if-eqz v18, :cond_305

    .line 940
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v19, v18, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    aget-char v18, v15, v18

    and-int/lit8 v18, v18, 0x1f

    move/from16 v0, v18

    int-to-char v4, v0

    .line 946
    :goto_2fe
    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->doFlat(Lorg/mozilla/javascript/regexp/CompilerState;C)V

    goto/16 :goto_63

    .line 943
    :cond_305
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, -0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    .line 944
    const/16 v4, 0x5c

    goto :goto_2fe

    .line 950
    :sswitch_316
    add-int/lit8 v11, v11, 0x2

    .line 955
    :sswitch_318
    const/4 v10, 0x0

    .line 957
    .local v10, "n":I
    const/4 v6, 0x0

    .line 958
    .local v6, "i":I
    :goto_31a
    if-ge v6, v11, :cond_364

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cpend:I

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_364

    .line 959
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v19, v18, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    aget-char v4, v15, v18

    .line 960
    invoke-static {v4, v10}, Lorg/mozilla/javascript/Kit;->xDigitToInt(II)I

    move-result v10

    .line 961
    if-gez v10, :cond_36c

    .line 964
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v19, v6, 0x2

    sub-int v18, v18, v19

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    .line 965
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v19, v18, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    aget-char v10, v15, v18

    .line 969
    :cond_364
    int-to-char v4, v10

    .line 971
    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->doFlat(Lorg/mozilla/javascript/regexp/CompilerState;C)V

    goto/16 :goto_63

    .line 958
    :cond_36c
    add-int/lit8 v6, v6, 0x1

    goto :goto_31a

    .line 975
    .end local v6    # "i":I
    .end local v10    # "n":I
    :sswitch_36f
    new-instance v18, Lorg/mozilla/javascript/regexp/RENode;

    const/16 v19, 0x7

    invoke-direct/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 976
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    goto/16 :goto_63

    .line 979
    :sswitch_38c
    new-instance v18, Lorg/mozilla/javascript/regexp/RENode;

    const/16 v19, 0x8

    invoke-direct/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 980
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    goto/16 :goto_63

    .line 983
    :sswitch_3a9
    new-instance v18, Lorg/mozilla/javascript/regexp/RENode;

    const/16 v19, 0xb

    invoke-direct/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 984
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    goto/16 :goto_63

    .line 987
    :sswitch_3c6
    new-instance v18, Lorg/mozilla/javascript/regexp/RENode;

    const/16 v19, 0xc

    invoke-direct/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 988
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    goto/16 :goto_63

    .line 991
    :sswitch_3e3
    new-instance v18, Lorg/mozilla/javascript/regexp/RENode;

    const/16 v19, 0x9

    invoke-direct/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 992
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    goto/16 :goto_63

    .line 995
    :sswitch_400
    new-instance v18, Lorg/mozilla/javascript/regexp/RENode;

    const/16 v19, 0xa

    invoke-direct/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 996
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    goto/16 :goto_63

    .line 1011
    :cond_41d
    const-string v18, "msg.trail.backslash"

    const-string v19, ""

    invoke-static/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 1012
    const/16 v18, 0x0

    goto/16 :goto_7d

    .line 1015
    :sswitch_428
    const/4 v14, 0x0

    .line 1016
    .local v14, "result":Lorg/mozilla/javascript/regexp/RENode;
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v17, v0

    .line 1017
    .restart local v17    # "termStart":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cpend:I

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_4d0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    aget-char v18, v15, v18

    const/16 v19, 0x3f

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_4d0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    aget-char v4, v15, v18

    const/16 v18, 0x3d

    move/from16 v0, v18

    if-eq v4, v0, :cond_46f

    const/16 v18, 0x21

    move/from16 v0, v18

    if-eq v4, v0, :cond_46f

    const/16 v18, 0x3a

    move/from16 v0, v18

    if-ne v4, v0, :cond_4d0

    .line 1020
    :cond_46f
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x2

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    .line 1021
    const/16 v18, 0x3d

    move/from16 v0, v18

    if-ne v4, v0, :cond_4b2

    .line 1022
    new-instance v14, Lorg/mozilla/javascript/regexp/RENode;

    .end local v14    # "result":Lorg/mozilla/javascript/regexp/RENode;
    const/16 v18, 0x29

    move/from16 v0, v18

    invoke-direct {v14, v0}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    .line 1024
    .restart local v14    # "result":Lorg/mozilla/javascript/regexp/RENode;
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x4

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    .line 1036
    :cond_49a
    :goto_49a
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->parenNesting:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->parenNesting:I

    .line 1037
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->parseDisjunction(Lorg/mozilla/javascript/regexp/CompilerState;)Z

    move-result v18

    if-nez v18, :cond_4fa

    .line 1038
    const/16 v18, 0x0

    goto/16 :goto_7d

    .line 1025
    :cond_4b2
    const/16 v18, 0x21

    move/from16 v0, v18

    if-ne v4, v0, :cond_49a

    .line 1026
    new-instance v14, Lorg/mozilla/javascript/regexp/RENode;

    .end local v14    # "result":Lorg/mozilla/javascript/regexp/RENode;
    const/16 v18, 0x2a

    move/from16 v0, v18

    invoke-direct {v14, v0}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    .line 1028
    .restart local v14    # "result":Lorg/mozilla/javascript/regexp/RENode;
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x4

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    goto :goto_49a

    .line 1031
    :cond_4d0
    new-instance v14, Lorg/mozilla/javascript/regexp/RENode;

    .end local v14    # "result":Lorg/mozilla/javascript/regexp/RENode;
    const/16 v18, 0x1d

    move/from16 v0, v18

    invoke-direct {v14, v0}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    .line 1033
    .restart local v14    # "result":Lorg/mozilla/javascript/regexp/RENode;
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x6

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    .line 1034
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->parenCount:I

    move/from16 v18, v0

    add-int/lit8 v19, v18, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->parenCount:I

    move/from16 v0, v18

    iput v0, v14, Lorg/mozilla/javascript/regexp/RENode;->parenIndex:I

    goto :goto_49a

    .line 1039
    :cond_4fa
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cpend:I

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    if-eq v0, v1, :cond_51c

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    aget-char v18, v15, v18

    const/16 v19, 0x29

    move/from16 v0, v18

    move/from16 v1, v19

    if-eq v0, v1, :cond_527

    .line 1040
    :cond_51c
    const-string v18, "msg.unterm.paren"

    const-string v19, ""

    invoke-static/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 1041
    const/16 v18, 0x0

    goto/16 :goto_7d

    .line 1043
    :cond_527
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    .line 1044
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->parenNesting:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, -0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->parenNesting:I

    .line 1045
    if-eqz v14, :cond_63

    .line 1046
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iput-object v0, v14, Lorg/mozilla/javascript/regexp/RENode;->kid:Lorg/mozilla/javascript/regexp/RENode;

    .line 1047
    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    goto/16 :goto_63

    .line 1052
    .end local v14    # "result":Lorg/mozilla/javascript/regexp/RENode;
    .end local v17    # "termStart":I
    :sswitch_555
    const-string v18, "msg.re.unmatched.right.paren"

    const-string v19, ""

    invoke-static/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 1053
    const/16 v18, 0x0

    goto/16 :goto_7d

    .line 1055
    :sswitch_560
    new-instance v18, Lorg/mozilla/javascript/regexp/RENode;

    const/16 v19, 0x16

    invoke-direct/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 1056
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v17, v0

    .line 1057
    .restart local v17    # "termStart":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    move/from16 v0, v17

    move-object/from16 v1, v18

    iput v0, v1, Lorg/mozilla/javascript/regexp/RENode;->startIndex:I

    .line 1059
    :goto_57f
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cpend:I

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_59c

    .line 1060
    const-string v18, "msg.unterm.class"

    const-string v19, ""

    invoke-static/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 1061
    const/16 v18, 0x0

    goto/16 :goto_7d

    .line 1063
    :cond_59c
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    aget-char v18, v15, v18

    const/16 v19, 0x5c

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_5c9

    .line 1064
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    .line 1071
    :cond_5ba
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    goto :goto_57f

    .line 1066
    :cond_5c9
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    aget-char v18, v15, v18

    const/16 v19, 0x5d

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_5ba

    .line 1067
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v19, v0

    sub-int v19, v19, v17

    move/from16 v0, v19

    move-object/from16 v1, v18

    iput v0, v1, Lorg/mozilla/javascript/regexp/RENode;->kidlen:I

    .line 1073
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->classCount:I

    move/from16 v19, v0

    add-int/lit8 v20, v19, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->classCount:I

    move/from16 v0, v19

    move-object/from16 v1, v18

    iput v0, v1, Lorg/mozilla/javascript/regexp/RENode;->index:I

    .line 1078
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v19, v0

    add-int/lit8 v20, v19, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v17

    move/from16 v3, v19

    invoke-static {v0, v1, v15, v2, v3}, Lorg/mozilla/javascript/regexp/NativeRegExp;->calculateBitmapSize(Lorg/mozilla/javascript/regexp/CompilerState;Lorg/mozilla/javascript/regexp/RENode;[CII)Z

    move-result v18

    if-nez v18, :cond_62d

    .line 1079
    const/16 v18, 0x0

    goto/16 :goto_7d

    .line 1080
    :cond_62d
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x3

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    goto/16 :goto_63

    .line 1084
    .end local v17    # "termStart":I
    :sswitch_63d
    new-instance v18, Lorg/mozilla/javascript/regexp/RENode;

    const/16 v19, 0x6

    invoke-direct/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 1085
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    goto/16 :goto_63

    .line 1090
    :sswitch_65a
    const-string v18, "msg.bad.quant"

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v19, v0

    add-int/lit8 v19, v19, -0x1

    aget-char v19, v15, v19

    invoke-static/range {v19 .. v19}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 1091
    const/16 v18, 0x0

    goto/16 :goto_7d

    .line 1105
    .restart local v16    # "term":Lorg/mozilla/javascript/regexp/RENode;
    :cond_671
    const/4 v5, 0x0

    .line 1106
    .local v5, "hasQ":Z
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    aget-char v18, v15, v18

    sparse-switch v18, :sswitch_data_934

    .line 1181
    :cond_67d
    :goto_67d
    if-nez v5, :cond_816

    .line 1182
    const/16 v18, 0x1

    goto/16 :goto_7d

    .line 1108
    :sswitch_683
    new-instance v18, Lorg/mozilla/javascript/regexp/RENode;

    const/16 v19, 0x19

    invoke-direct/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 1109
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, v18

    iput v0, v1, Lorg/mozilla/javascript/regexp/RENode;->min:I

    .line 1110
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    const/16 v19, -0x1

    move/from16 v0, v19

    move-object/from16 v1, v18

    iput v0, v1, Lorg/mozilla/javascript/regexp/RENode;->max:I

    .line 1112
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x8

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    .line 1113
    const/4 v5, 0x1

    .line 1114
    goto :goto_67d

    .line 1116
    :sswitch_6bc
    new-instance v18, Lorg/mozilla/javascript/regexp/RENode;

    const/16 v19, 0x19

    invoke-direct/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 1117
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, v18

    iput v0, v1, Lorg/mozilla/javascript/regexp/RENode;->min:I

    .line 1118
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    const/16 v19, -0x1

    move/from16 v0, v19

    move-object/from16 v1, v18

    iput v0, v1, Lorg/mozilla/javascript/regexp/RENode;->max:I

    .line 1120
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x8

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    .line 1121
    const/4 v5, 0x1

    .line 1122
    goto :goto_67d

    .line 1124
    :sswitch_6f5
    new-instance v18, Lorg/mozilla/javascript/regexp/RENode;

    const/16 v19, 0x19

    invoke-direct/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 1125
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, v18

    iput v0, v1, Lorg/mozilla/javascript/regexp/RENode;->min:I

    .line 1126
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, v18

    iput v0, v1, Lorg/mozilla/javascript/regexp/RENode;->max:I

    .line 1128
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x8

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    .line 1129
    const/4 v5, 0x1

    .line 1130
    goto/16 :goto_67d

    .line 1133
    :sswitch_72f
    const/4 v9, 0x0

    .line 1134
    .local v9, "min":I
    const/4 v8, -0x1

    .line 1135
    .local v8, "max":I
    move-object/from16 v0, p0

    iget v7, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    .line 1143
    .local v7, "leftCurl":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    array-length v0, v15

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_80e

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    aget-char v4, v15, v18

    invoke-static {v4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isDigit(C)Z

    move-result v18

    if-eqz v18, :cond_80e

    .line 1144
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    .line 1145
    const v18, 0xffff

    const-string v19, "msg.overlarge.min"

    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v19

    invoke-static {v4, v0, v1, v2}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getDecimalValue(CLorg/mozilla/javascript/regexp/CompilerState;ILjava/lang/String;)I

    move-result v9

    .line 1147
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    aget-char v4, v15, v18

    .line 1148
    const/16 v18, 0x2c

    move/from16 v0, v18

    if-ne v4, v0, :cond_7d7

    .line 1149
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    aget-char v4, v15, v18

    .line 1150
    invoke-static {v4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isDigit(C)Z

    move-result v18

    if-eqz v18, :cond_7d8

    .line 1151
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    .line 1152
    const v18, 0xffff

    const-string v19, "msg.overlarge.max"

    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v19

    invoke-static {v4, v0, v1, v2}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getDecimalValue(CLorg/mozilla/javascript/regexp/CompilerState;ILjava/lang/String;)I

    move-result v8

    .line 1154
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    aget-char v4, v15, v18

    .line 1155
    if-le v9, v8, :cond_7d8

    .line 1156
    const-string v18, "msg.max.lt.min"

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v19, v0

    aget-char v19, v15, v19

    invoke-static/range {v19 .. v19}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 1158
    const/16 v18, 0x0

    goto/16 :goto_7d

    .line 1162
    :cond_7d7
    move v8, v9

    .line 1165
    :cond_7d8
    const/16 v18, 0x7d

    move/from16 v0, v18

    if-ne v4, v0, :cond_80e

    .line 1166
    new-instance v18, Lorg/mozilla/javascript/regexp/RENode;

    const/16 v19, 0x19

    invoke-direct/range {v18 .. v19}, Lorg/mozilla/javascript/regexp/RENode;-><init>(B)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    .line 1167
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iput v9, v0, Lorg/mozilla/javascript/regexp/RENode;->min:I

    .line 1168
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iput v8, v0, Lorg/mozilla/javascript/regexp/RENode;->max:I

    .line 1171
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0xc

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->progLength:I

    .line 1172
    const/4 v5, 0x1

    .line 1175
    :cond_80e
    if-nez v5, :cond_67d

    .line 1176
    move-object/from16 v0, p0

    iput v7, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    goto/16 :goto_67d

    .line 1184
    .end local v7    # "leftCurl":I
    .end local v8    # "max":I
    .end local v9    # "min":I
    :cond_816
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    .line 1185
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    iput-object v0, v1, Lorg/mozilla/javascript/regexp/RENode;->kid:Lorg/mozilla/javascript/regexp/RENode;

    .line 1186
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iput v13, v0, Lorg/mozilla/javascript/regexp/RENode;->parenIndex:I

    .line 1187
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->parenCount:I

    move/from16 v19, v0

    sub-int v19, v19, v13

    move/from16 v0, v19

    move-object/from16 v1, v18

    iput v0, v1, Lorg/mozilla/javascript/regexp/RENode;->parenCount:I

    .line 1188
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cpend:I

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_890

    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    aget-char v18, v15, v18

    const/16 v19, 0x3f

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_890

    .line 1189
    move-object/from16 v0, p0

    iget v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/mozilla/javascript/regexp/CompilerState;->cp:I

    .line 1190
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, v18

    iput-boolean v0, v1, Lorg/mozilla/javascript/regexp/RENode;->greedy:Z

    .line 1194
    :goto_88c
    const/16 v18, 0x1

    goto/16 :goto_7d

    .line 1193
    :cond_890
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/CompilerState;->result:Lorg/mozilla/javascript/regexp/RENode;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, v18

    iput-boolean v0, v1, Lorg/mozilla/javascript/regexp/RENode;->greedy:Z

    goto :goto_88c

    .line 817
    nop

    :sswitch_data_8a0
    .sparse-switch
        0x24 -> :sswitch_9c
        0x28 -> :sswitch_428
        0x29 -> :sswitch_555
        0x2a -> :sswitch_65a
        0x2b -> :sswitch_65a
        0x2e -> :sswitch_63d
        0x3f -> :sswitch_65a
        0x5b -> :sswitch_560
        0x5c -> :sswitch_ba
        0x5e -> :sswitch_7e
    .end sparse-switch

    .line 830
    :sswitch_data_8ca
    .sparse-switch
        0x30 -> :sswitch_166
        0x31 -> :sswitch_1bd
        0x32 -> :sswitch_1bd
        0x33 -> :sswitch_1bd
        0x34 -> :sswitch_1bd
        0x35 -> :sswitch_1bd
        0x36 -> :sswitch_1bd
        0x37 -> :sswitch_1bd
        0x38 -> :sswitch_1bd
        0x39 -> :sswitch_1bd
        0x42 -> :sswitch_147
        0x44 -> :sswitch_38c
        0x53 -> :sswitch_3c6
        0x57 -> :sswitch_400
        0x62 -> :sswitch_128
        0x63 -> :sswitch_2c9
        0x64 -> :sswitch_36f
        0x66 -> :sswitch_29c
        0x6e -> :sswitch_2a5
        0x72 -> :sswitch_2ae
        0x73 -> :sswitch_3a9
        0x74 -> :sswitch_2b7
        0x75 -> :sswitch_316
        0x76 -> :sswitch_2c0
        0x77 -> :sswitch_3e3
        0x78 -> :sswitch_318
    .end sparse-switch

    .line 1106
    :sswitch_data_934
    .sparse-switch
        0x2a -> :sswitch_6bc
        0x2b -> :sswitch_683
        0x3f -> :sswitch_6f5
        0x7b -> :sswitch_72f
    .end sparse-switch
.end method

.method private static popProgState(Lorg/mozilla/javascript/regexp/REGlobalData;)Lorg/mozilla/javascript/regexp/REProgState;
    .registers 3
    .param p0, "gData"    # Lorg/mozilla/javascript/regexp/REGlobalData;

    .prologue
    .line 1376
    iget-object v0, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->stateStackTop:Lorg/mozilla/javascript/regexp/REProgState;

    .line 1377
    .local v0, "state":Lorg/mozilla/javascript/regexp/REProgState;
    iget-object v1, v0, Lorg/mozilla/javascript/regexp/REProgState;->previous:Lorg/mozilla/javascript/regexp/REProgState;

    iput-object v1, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->stateStackTop:Lorg/mozilla/javascript/regexp/REProgState;

    .line 1378
    return-object v0
.end method

.method private static processCharSet(Lorg/mozilla/javascript/regexp/REGlobalData;Lorg/mozilla/javascript/regexp/RECharSet;)V
    .registers 3
    .param p0, "gData"    # Lorg/mozilla/javascript/regexp/REGlobalData;
    .param p1, "charSet"    # Lorg/mozilla/javascript/regexp/RECharSet;

    .prologue
    .line 1533
    monitor-enter p1

    .line 1534
    :try_start_1
    iget-boolean v0, p1, Lorg/mozilla/javascript/regexp/RECharSet;->converted:Z

    if-nez v0, :cond_b

    .line 1535
    invoke-static {p0, p1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->processCharSetImpl(Lorg/mozilla/javascript/regexp/REGlobalData;Lorg/mozilla/javascript/regexp/RECharSet;)V

    .line 1536
    const/4 v0, 0x1

    iput-boolean v0, p1, Lorg/mozilla/javascript/regexp/RECharSet;->converted:Z

    .line 1538
    :cond_b
    monitor-exit p1

    .line 1539
    return-void

    .line 1538
    :catchall_d
    move-exception v0

    monitor-exit p1
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_d

    throw v0
.end method

.method private static processCharSetImpl(Lorg/mozilla/javascript/regexp/REGlobalData;Lorg/mozilla/javascript/regexp/RECharSet;)V
    .registers 21
    .param p0, "gData"    # Lorg/mozilla/javascript/regexp/REGlobalData;
    .param p1, "charSet"    # Lorg/mozilla/javascript/regexp/RECharSet;

    .prologue
    .line 1545
    move-object/from16 v0, p1

    iget v13, v0, Lorg/mozilla/javascript/regexp/RECharSet;->startIndex:I

    .line 1546
    .local v13, "src":I
    move-object/from16 v0, p1

    iget v0, v0, Lorg/mozilla/javascript/regexp/RECharSet;->strlength:I

    move/from16 v17, v0

    add-int v7, v13, v17

    .line 1548
    .local v7, "end":I
    const/4 v12, 0x0

    .line 1554
    .local v12, "rangeStart":C
    const/4 v9, 0x0

    .line 1556
    .local v9, "inRange":Z
    move-object/from16 v0, p1

    iget v0, v0, Lorg/mozilla/javascript/regexp/RECharSet;->length:I

    move/from16 v17, v0

    add-int/lit8 v17, v17, 0x7

    div-int/lit8 v3, v17, 0x8

    .line 1557
    .local v3, "byteLength":I
    new-array v0, v3, [B

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    iput-object v0, v1, Lorg/mozilla/javascript/regexp/RECharSet;->bits:[B

    .line 1559
    if-ne v13, v7, :cond_25

    .line 1729
    :goto_24
    return-void

    .line 1562
    :cond_25
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->regexp:Lorg/mozilla/javascript/regexp/RECompiled;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/RECompiled;->source:[C

    move-object/from16 v17, v0

    aget-char v17, v17, v13

    const/16 v18, 0x5e

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_92

    .line 1563
    sget-boolean v17, Lorg/mozilla/javascript/regexp/NativeRegExp;->$assertionsDisabled:Z

    if-nez v17, :cond_4d

    move-object/from16 v0, p1

    iget-boolean v0, v0, Lorg/mozilla/javascript/regexp/RECharSet;->sense:Z

    move/from16 v17, v0

    if-eqz v17, :cond_4d

    new-instance v17, Ljava/lang/AssertionError;

    invoke-direct/range {v17 .. v17}, Ljava/lang/AssertionError;-><init>()V

    throw v17

    .line 1564
    :cond_4d
    add-int/lit8 v13, v13, 0x1

    move v14, v13

    .line 1569
    .end local v13    # "src":I
    .local v14, "src":I
    :cond_50
    :goto_50
    if-eq v14, v7, :cond_2bb

    .line 1570
    const/4 v11, 0x2

    .line 1571
    .local v11, "nDigits":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->regexp:Lorg/mozilla/javascript/regexp/RECompiled;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/RECompiled;->source:[C

    move-object/from16 v17, v0

    aget-char v17, v17, v14

    packed-switch v17, :pswitch_data_2c8

    .line 1690
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->regexp:Lorg/mozilla/javascript/regexp/RECompiled;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/RECompiled;->source:[C

    move-object/from16 v17, v0

    add-int/lit8 v13, v14, 0x1

    .end local v14    # "src":I
    .restart local v13    # "src":I
    aget-char v15, v17, v14

    .line 1694
    .local v15, "thisCh":C
    :goto_74
    if-eqz v9, :cond_26c

    .line 1695
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->regexp:Lorg/mozilla/javascript/regexp/RECompiled;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v0, v0, Lorg/mozilla/javascript/regexp/RECompiled;->flags:I

    move/from16 v17, v0

    and-int/lit8 v17, v17, 0x2

    if-eqz v17, :cond_266

    .line 1696
    sget-boolean v17, Lorg/mozilla/javascript/regexp/NativeRegExp;->$assertionsDisabled:Z

    if-nez v17, :cond_239

    if-le v12, v15, :cond_239

    new-instance v17, Ljava/lang/AssertionError;

    invoke-direct/range {v17 .. v17}, Ljava/lang/AssertionError;-><init>()V

    throw v17

    .line 1566
    .end local v11    # "nDigits":I
    .end local v15    # "thisCh":C
    :cond_92
    sget-boolean v17, Lorg/mozilla/javascript/regexp/NativeRegExp;->$assertionsDisabled:Z

    if-nez v17, :cond_2be

    move-object/from16 v0, p1

    iget-boolean v0, v0, Lorg/mozilla/javascript/regexp/RECharSet;->sense:Z

    move/from16 v17, v0

    if-nez v17, :cond_2be

    new-instance v17, Ljava/lang/AssertionError;

    invoke-direct/range {v17 .. v17}, Ljava/lang/AssertionError;-><init>()V

    throw v17

    .line 1573
    .end local v13    # "src":I
    .restart local v11    # "nDigits":I
    .restart local v14    # "src":I
    :pswitch_a4
    add-int/lit8 v13, v14, 0x1

    .line 1574
    .end local v14    # "src":I
    .restart local v13    # "src":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->regexp:Lorg/mozilla/javascript/regexp/RECompiled;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/RECompiled;->source:[C

    move-object/from16 v17, v0

    add-int/lit8 v14, v13, 0x1

    .end local v13    # "src":I
    .restart local v14    # "src":I
    aget-char v4, v17, v13

    .line 1575
    .local v4, "c":C
    sparse-switch v4, :sswitch_data_2ce

    .line 1683
    move v15, v4

    .restart local v15    # "thisCh":C
    move v13, v14

    .line 1684
    .end local v14    # "src":I
    .restart local v13    # "src":I
    goto :goto_74

    .line 1577
    .end local v13    # "src":I
    .end local v15    # "thisCh":C
    .restart local v14    # "src":I
    :sswitch_bc
    const/16 v15, 0x8

    .restart local v15    # "thisCh":C
    move v13, v14

    .line 1578
    .end local v14    # "src":I
    .restart local v13    # "src":I
    goto :goto_74

    .line 1580
    .end local v13    # "src":I
    .end local v15    # "thisCh":C
    .restart local v14    # "src":I
    :sswitch_c0
    const/16 v15, 0xc

    .restart local v15    # "thisCh":C
    move v13, v14

    .line 1581
    .end local v14    # "src":I
    .restart local v13    # "src":I
    goto :goto_74

    .line 1583
    .end local v13    # "src":I
    .end local v15    # "thisCh":C
    .restart local v14    # "src":I
    :sswitch_c4
    const/16 v15, 0xa

    .restart local v15    # "thisCh":C
    move v13, v14

    .line 1584
    .end local v14    # "src":I
    .restart local v13    # "src":I
    goto :goto_74

    .line 1586
    .end local v13    # "src":I
    .end local v15    # "thisCh":C
    .restart local v14    # "src":I
    :sswitch_c8
    const/16 v15, 0xd

    .restart local v15    # "thisCh":C
    move v13, v14

    .line 1587
    .end local v14    # "src":I
    .restart local v13    # "src":I
    goto :goto_74

    .line 1589
    .end local v13    # "src":I
    .end local v15    # "thisCh":C
    .restart local v14    # "src":I
    :sswitch_cc
    const/16 v15, 0x9

    .restart local v15    # "thisCh":C
    move v13, v14

    .line 1590
    .end local v14    # "src":I
    .restart local v13    # "src":I
    goto :goto_74

    .line 1592
    .end local v13    # "src":I
    .end local v15    # "thisCh":C
    .restart local v14    # "src":I
    :sswitch_d0
    const/16 v15, 0xb

    .restart local v15    # "thisCh":C
    move v13, v14

    .line 1593
    .end local v14    # "src":I
    .restart local v13    # "src":I
    goto :goto_74

    .line 1595
    .end local v13    # "src":I
    .end local v15    # "thisCh":C
    .restart local v14    # "src":I
    :sswitch_d4
    if-ge v14, v7, :cond_101

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->regexp:Lorg/mozilla/javascript/regexp/RECompiled;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/RECompiled;->source:[C

    move-object/from16 v17, v0

    aget-char v17, v17, v14

    invoke-static/range {v17 .. v17}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isControlLetter(C)Z

    move-result v17

    if-eqz v17, :cond_101

    .line 1596
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->regexp:Lorg/mozilla/javascript/regexp/RECompiled;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/RECompiled;->source:[C

    move-object/from16 v17, v0

    add-int/lit8 v13, v14, 0x1

    .end local v14    # "src":I
    .restart local v13    # "src":I
    aget-char v17, v17, v14

    and-int/lit8 v17, v17, 0x1f

    move/from16 v0, v17

    int-to-char v15, v0

    .restart local v15    # "thisCh":C
    goto/16 :goto_74

    .line 1598
    .end local v13    # "src":I
    .end local v15    # "thisCh":C
    .restart local v14    # "src":I
    :cond_101
    add-int/lit8 v13, v14, -0x1

    .line 1599
    .end local v14    # "src":I
    .restart local v13    # "src":I
    const/16 v15, 0x5c

    .line 1601
    .restart local v15    # "thisCh":C
    goto/16 :goto_74

    .line 1603
    .end local v13    # "src":I
    .end local v15    # "thisCh":C
    .restart local v14    # "src":I
    :sswitch_107
    add-int/lit8 v11, v11, 0x2

    .line 1606
    :sswitch_109
    const/4 v10, 0x0

    .line 1607
    .local v10, "n":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_10b
    if-ge v8, v11, :cond_2c4

    if-ge v14, v7, :cond_2c4

    .line 1608
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->regexp:Lorg/mozilla/javascript/regexp/RECompiled;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/RECompiled;->source:[C

    move-object/from16 v17, v0

    add-int/lit8 v13, v14, 0x1

    .end local v14    # "src":I
    .restart local v13    # "src":I
    aget-char v4, v17, v14

    .line 1609
    invoke-static {v4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->toASCIIHexDigit(I)I

    move-result v6

    .line 1610
    .local v6, "digit":I
    if-gez v6, :cond_12e

    .line 1614
    add-int/lit8 v17, v8, 0x1

    sub-int v13, v13, v17

    .line 1615
    const/16 v10, 0x5c

    .line 1620
    .end local v6    # "digit":I
    :goto_12b
    int-to-char v15, v10

    .line 1621
    .restart local v15    # "thisCh":C
    goto/16 :goto_74

    .line 1618
    .end local v15    # "thisCh":C
    .restart local v6    # "digit":I
    :cond_12e
    shl-int/lit8 v17, v10, 0x4

    or-int v10, v17, v6

    .line 1607
    add-int/lit8 v8, v8, 0x1

    move v14, v13

    .end local v13    # "src":I
    .restart local v14    # "src":I
    goto :goto_10b

    .line 1636
    .end local v6    # "digit":I
    .end local v8    # "i":I
    .end local v10    # "n":I
    :sswitch_136
    add-int/lit8 v10, v4, -0x30

    .line 1637
    .restart local v10    # "n":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->regexp:Lorg/mozilla/javascript/regexp/RECompiled;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/RECompiled;->source:[C

    move-object/from16 v17, v0

    aget-char v4, v17, v14

    .line 1638
    const/16 v17, 0x30

    move/from16 v0, v17

    if-gt v0, v4, :cond_2c1

    const/16 v17, 0x37

    move/from16 v0, v17

    if-gt v4, v0, :cond_2c1

    .line 1639
    add-int/lit8 v13, v14, 0x1

    .line 1640
    .end local v14    # "src":I
    .restart local v13    # "src":I
    mul-int/lit8 v17, v10, 0x8

    add-int/lit8 v18, v4, -0x30

    add-int v10, v17, v18

    .line 1641
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->regexp:Lorg/mozilla/javascript/regexp/RECompiled;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/RECompiled;->source:[C

    move-object/from16 v17, v0

    aget-char v4, v17, v13

    .line 1642
    const/16 v17, 0x30

    move/from16 v0, v17

    if-gt v0, v4, :cond_183

    const/16 v17, 0x37

    move/from16 v0, v17

    if-gt v4, v0, :cond_183

    .line 1643
    add-int/lit8 v13, v13, 0x1

    .line 1644
    mul-int/lit8 v17, v10, 0x8

    add-int/lit8 v18, v4, -0x30

    add-int v8, v17, v18

    .line 1645
    .restart local v8    # "i":I
    const/16 v17, 0xff

    move/from16 v0, v17

    if-gt v8, v0, :cond_186

    .line 1646
    move v10, v8

    .line 1651
    .end local v8    # "i":I
    :cond_183
    :goto_183
    int-to-char v15, v10

    .line 1652
    .restart local v15    # "thisCh":C
    goto/16 :goto_74

    .line 1648
    .end local v15    # "thisCh":C
    .restart local v8    # "i":I
    :cond_186
    add-int/lit8 v13, v13, -0x1

    goto :goto_183

    .line 1655
    .end local v8    # "i":I
    .end local v10    # "n":I
    .end local v13    # "src":I
    .restart local v14    # "src":I
    :sswitch_189
    const/16 v17, 0x30

    const/16 v18, 0x39

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addCharacterRangeToCharSet(Lorg/mozilla/javascript/regexp/RECharSet;CC)V

    goto/16 :goto_50

    .line 1658
    :sswitch_198
    const/16 v17, 0x0

    const/16 v18, 0x2f

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addCharacterRangeToCharSet(Lorg/mozilla/javascript/regexp/RECharSet;CC)V

    .line 1659
    const/16 v17, 0x3a

    move-object/from16 v0, p1

    iget v0, v0, Lorg/mozilla/javascript/regexp/RECharSet;->length:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, -0x1

    move/from16 v0, v18

    int-to-char v0, v0

    move/from16 v18, v0

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addCharacterRangeToCharSet(Lorg/mozilla/javascript/regexp/RECharSet;CC)V

    goto/16 :goto_50

    .line 1663
    :sswitch_1bf
    move-object/from16 v0, p1

    iget v0, v0, Lorg/mozilla/javascript/regexp/RECharSet;->length:I

    move/from16 v17, v0

    add-int/lit8 v8, v17, -0x1

    .restart local v8    # "i":I
    :goto_1c7
    if-ltz v8, :cond_50

    .line 1664
    invoke-static {v8}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isREWhiteSpace(I)Z

    move-result v17

    if-eqz v17, :cond_1d9

    .line 1665
    int-to-char v0, v8

    move/from16 v17, v0

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addCharacterToCharSet(Lorg/mozilla/javascript/regexp/RECharSet;C)V

    .line 1663
    :cond_1d9
    add-int/lit8 v8, v8, -0x1

    goto :goto_1c7

    .line 1668
    .end local v8    # "i":I
    :sswitch_1dc
    move-object/from16 v0, p1

    iget v0, v0, Lorg/mozilla/javascript/regexp/RECharSet;->length:I

    move/from16 v17, v0

    add-int/lit8 v8, v17, -0x1

    .restart local v8    # "i":I
    :goto_1e4
    if-ltz v8, :cond_50

    .line 1669
    invoke-static {v8}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isREWhiteSpace(I)Z

    move-result v17

    if-nez v17, :cond_1f6

    .line 1670
    int-to-char v0, v8

    move/from16 v17, v0

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addCharacterToCharSet(Lorg/mozilla/javascript/regexp/RECharSet;C)V

    .line 1668
    :cond_1f6
    add-int/lit8 v8, v8, -0x1

    goto :goto_1e4

    .line 1673
    .end local v8    # "i":I
    :sswitch_1f9
    move-object/from16 v0, p1

    iget v0, v0, Lorg/mozilla/javascript/regexp/RECharSet;->length:I

    move/from16 v17, v0

    add-int/lit8 v8, v17, -0x1

    .restart local v8    # "i":I
    :goto_201
    if-ltz v8, :cond_50

    .line 1674
    int-to-char v0, v8

    move/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isWord(C)Z

    move-result v17

    if-eqz v17, :cond_216

    .line 1675
    int-to-char v0, v8

    move/from16 v17, v0

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addCharacterToCharSet(Lorg/mozilla/javascript/regexp/RECharSet;C)V

    .line 1673
    :cond_216
    add-int/lit8 v8, v8, -0x1

    goto :goto_201

    .line 1678
    .end local v8    # "i":I
    :sswitch_219
    move-object/from16 v0, p1

    iget v0, v0, Lorg/mozilla/javascript/regexp/RECharSet;->length:I

    move/from16 v17, v0

    add-int/lit8 v8, v17, -0x1

    .restart local v8    # "i":I
    :goto_221
    if-ltz v8, :cond_50

    .line 1679
    int-to-char v0, v8

    move/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isWord(C)Z

    move-result v17

    if-nez v17, :cond_236

    .line 1680
    int-to-char v0, v8

    move/from16 v17, v0

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addCharacterToCharSet(Lorg/mozilla/javascript/regexp/RECharSet;C)V

    .line 1678
    :cond_236
    add-int/lit8 v8, v8, -0x1

    goto :goto_221

    .line 1697
    .end local v4    # "c":C
    .end local v8    # "i":I
    .end local v14    # "src":I
    .restart local v13    # "src":I
    .restart local v15    # "thisCh":C
    :cond_239
    move v4, v12

    .restart local v4    # "c":C
    :cond_23a
    if-gt v4, v15, :cond_262

    .line 1698
    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addCharacterToCharSet(Lorg/mozilla/javascript/regexp/RECharSet;C)V

    .line 1699
    invoke-static {v4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->upcase(C)C

    move-result v16

    .line 1700
    .local v16, "uch":C
    invoke-static {v4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->downcase(C)C

    move-result v5

    .line 1701
    .local v5, "dch":C
    move/from16 v0, v16

    if-eq v4, v0, :cond_254

    .line 1702
    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-static {v0, v1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addCharacterToCharSet(Lorg/mozilla/javascript/regexp/RECharSet;C)V

    .line 1703
    :cond_254
    if-eq v4, v5, :cond_25b

    .line 1704
    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addCharacterToCharSet(Lorg/mozilla/javascript/regexp/RECharSet;C)V

    .line 1705
    :cond_25b
    add-int/lit8 v17, v4, 0x1

    move/from16 v0, v17

    int-to-char v4, v0

    if-nez v4, :cond_23a

    .line 1711
    .end local v4    # "c":C
    .end local v5    # "dch":C
    .end local v16    # "uch":C
    :cond_262
    :goto_262
    const/4 v9, 0x0

    move v14, v13

    .end local v13    # "src":I
    .restart local v14    # "src":I
    goto/16 :goto_50

    .line 1709
    .end local v14    # "src":I
    .restart local v13    # "src":I
    :cond_266
    move-object/from16 v0, p1

    invoke-static {v0, v12, v15}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addCharacterRangeToCharSet(Lorg/mozilla/javascript/regexp/RECharSet;CC)V

    goto :goto_262

    .line 1714
    :cond_26c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->regexp:Lorg/mozilla/javascript/regexp/RECompiled;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v0, v0, Lorg/mozilla/javascript/regexp/RECompiled;->flags:I

    move/from16 v17, v0

    and-int/lit8 v17, v17, 0x2

    if-eqz v17, :cond_2b5

    .line 1715
    invoke-static {v15}, Lorg/mozilla/javascript/regexp/NativeRegExp;->upcase(C)C

    move-result v17

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addCharacterToCharSet(Lorg/mozilla/javascript/regexp/RECharSet;C)V

    .line 1716
    invoke-static {v15}, Lorg/mozilla/javascript/regexp/NativeRegExp;->downcase(C)C

    move-result v17

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addCharacterToCharSet(Lorg/mozilla/javascript/regexp/RECharSet;C)V

    .line 1720
    :goto_292
    add-int/lit8 v17, v7, -0x1

    move/from16 v0, v17

    if-ge v13, v0, :cond_2be

    .line 1721
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/REGlobalData;->regexp:Lorg/mozilla/javascript/regexp/RECompiled;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/RECompiled;->source:[C

    move-object/from16 v17, v0

    aget-char v17, v17, v13

    const/16 v18, 0x2d

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_2be

    .line 1722
    add-int/lit8 v13, v13, 0x1

    .line 1723
    const/4 v9, 0x1

    .line 1724
    move v12, v15

    move v14, v13

    .end local v13    # "src":I
    .restart local v14    # "src":I
    goto/16 :goto_50

    .line 1718
    .end local v14    # "src":I
    .restart local v13    # "src":I
    :cond_2b5
    move-object/from16 v0, p1

    invoke-static {v0, v15}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addCharacterToCharSet(Lorg/mozilla/javascript/regexp/RECharSet;C)V

    goto :goto_292

    .end local v11    # "nDigits":I
    .end local v13    # "src":I
    .end local v15    # "thisCh":C
    .restart local v14    # "src":I
    :cond_2bb
    move v13, v14

    .line 1729
    .end local v14    # "src":I
    .restart local v13    # "src":I
    goto/16 :goto_24

    :cond_2be
    move v14, v13

    .end local v13    # "src":I
    .restart local v14    # "src":I
    goto/16 :goto_50

    .restart local v4    # "c":C
    .restart local v10    # "n":I
    .restart local v11    # "nDigits":I
    :cond_2c1
    move v13, v14

    .end local v14    # "src":I
    .restart local v13    # "src":I
    goto/16 :goto_183

    .end local v13    # "src":I
    .restart local v8    # "i":I
    .restart local v14    # "src":I
    :cond_2c4
    move v13, v14

    .end local v14    # "src":I
    .restart local v13    # "src":I
    goto/16 :goto_12b

    .line 1571
    nop

    :pswitch_data_2c8
    .packed-switch 0x5c
        :pswitch_a4
    .end packed-switch

    .line 1575
    :sswitch_data_2ce
    .sparse-switch
        0x30 -> :sswitch_136
        0x31 -> :sswitch_136
        0x32 -> :sswitch_136
        0x33 -> :sswitch_136
        0x34 -> :sswitch_136
        0x35 -> :sswitch_136
        0x36 -> :sswitch_136
        0x37 -> :sswitch_136
        0x44 -> :sswitch_198
        0x53 -> :sswitch_1dc
        0x57 -> :sswitch_219
        0x62 -> :sswitch_bc
        0x63 -> :sswitch_d4
        0x64 -> :sswitch_189
        0x66 -> :sswitch_c0
        0x6e -> :sswitch_c4
        0x72 -> :sswitch_c8
        0x73 -> :sswitch_1bf
        0x74 -> :sswitch_cc
        0x75 -> :sswitch_107
        0x76 -> :sswitch_d0
        0x77 -> :sswitch_1f9
        0x78 -> :sswitch_109
    .end sparse-switch
.end method

.method private static pushBackTrackState(Lorg/mozilla/javascript/regexp/REGlobalData;BI)V
    .registers 11
    .param p0, "gData"    # Lorg/mozilla/javascript/regexp/REGlobalData;
    .param p1, "op"    # B
    .param p2, "pc"    # I

    .prologue
    .line 1384
    iget-object v7, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->stateStackTop:Lorg/mozilla/javascript/regexp/REProgState;

    .line 1385
    .local v7, "state":Lorg/mozilla/javascript/regexp/REProgState;
    new-instance v0, Lorg/mozilla/javascript/regexp/REBackTrackData;

    iget v4, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    iget v5, v7, Lorg/mozilla/javascript/regexp/REProgState;->continuationOp:I

    iget v6, v7, Lorg/mozilla/javascript/regexp/REProgState;->continuationPc:I

    move-object v1, p0

    move v2, p1

    move v3, p2

    invoke-direct/range {v0 .. v6}, Lorg/mozilla/javascript/regexp/REBackTrackData;-><init>(Lorg/mozilla/javascript/regexp/REGlobalData;IIIII)V

    iput-object v0, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->backTrackStackTop:Lorg/mozilla/javascript/regexp/REBackTrackData;

    .line 1387
    return-void
.end method

.method private static pushBackTrackState(Lorg/mozilla/javascript/regexp/REGlobalData;BIIII)V
    .registers 13
    .param p0, "gData"    # Lorg/mozilla/javascript/regexp/REGlobalData;
    .param p1, "op"    # B
    .param p2, "pc"    # I
    .param p3, "cp"    # I
    .param p4, "continuationOp"    # I
    .param p5, "continuationPc"    # I

    .prologue
    .line 1393
    new-instance v0, Lorg/mozilla/javascript/regexp/REBackTrackData;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lorg/mozilla/javascript/regexp/REBackTrackData;-><init>(Lorg/mozilla/javascript/regexp/REGlobalData;IIIII)V

    iput-object v0, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->backTrackStackTop:Lorg/mozilla/javascript/regexp/REBackTrackData;

    .line 1395
    return-void
.end method

.method private static pushProgState(Lorg/mozilla/javascript/regexp/REGlobalData;IIILorg/mozilla/javascript/regexp/REBackTrackData;II)V
    .registers 15
    .param p0, "gData"    # Lorg/mozilla/javascript/regexp/REGlobalData;
    .param p1, "min"    # I
    .param p2, "max"    # I
    .param p3, "cp"    # I
    .param p4, "backTrackLastToSave"    # Lorg/mozilla/javascript/regexp/REBackTrackData;
    .param p5, "continuationOp"    # I
    .param p6, "continuationPc"    # I

    .prologue
    .line 1368
    new-instance v0, Lorg/mozilla/javascript/regexp/REProgState;

    iget-object v1, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->stateStackTop:Lorg/mozilla/javascript/regexp/REProgState;

    move v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    move v6, p5

    move v7, p6

    invoke-direct/range {v0 .. v7}, Lorg/mozilla/javascript/regexp/REProgState;-><init>(Lorg/mozilla/javascript/regexp/REProgState;IIILorg/mozilla/javascript/regexp/REBackTrackData;II)V

    iput-object v0, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->stateStackTop:Lorg/mozilla/javascript/regexp/REProgState;

    .line 1371
    return-void
.end method

.method private static realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/regexp/NativeRegExp;
    .registers 3
    .param p0, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    .line 2734
    instance-of v0, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;

    if-nez v0, :cond_9

    .line 2735
    invoke-static {p1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->incompatibleCallError(Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 2736
    :cond_9
    check-cast p0, Lorg/mozilla/javascript/regexp/NativeRegExp;

    .end local p0    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    return-object p0
.end method

.method private static reopIsSimple(I)Z
    .registers 3
    .param p0, "op"    # I

    .prologue
    const/4 v0, 0x1

    .line 1750
    if-lt p0, v0, :cond_8

    const/16 v1, 0x17

    if-gt p0, v1, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private static reportError(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arg"    # Ljava/lang/String;

    .prologue
    .line 2564
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 2565
    .local v0, "msg":Ljava/lang/String;
    const-string v1, "SyntaxError"

    invoke-static {v1, v0}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v1

    throw v1
.end method

.method private static reportWarning(Lorg/mozilla/javascript/Context;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "arg"    # Ljava/lang/String;

    .prologue
    .line 2556
    const/16 v1, 0xb

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 2557
    invoke-static {p1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 2558
    .local v0, "msg":Ljava/lang/String;
    invoke-static {v0}, Lorg/mozilla/javascript/Context;->reportWarning(Ljava/lang/String;)V

    .line 2560
    .end local v0    # "msg":Ljava/lang/String;
    :cond_f
    return-void
.end method

.method private static resolveForwardJump([BII)V
    .registers 4
    .param p0, "array"    # [B
    .param p1, "from"    # I
    .param p2, "pc"    # I

    .prologue
    .line 1199
    if-le p1, p2, :cond_7

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 1200
    :cond_7
    sub-int v0, p2, p1

    invoke-static {p0, p1, v0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->addIndex([BII)I

    .line 1201
    return-void
.end method

.method private static simpleMatch(Lorg/mozilla/javascript/regexp/REGlobalData;Ljava/lang/String;I[BIIZ)I
    .registers 19
    .param p0, "gData"    # Lorg/mozilla/javascript/regexp/REGlobalData;
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "op"    # I
    .param p3, "program"    # [B
    .param p4, "pc"    # I
    .param p5, "end"    # I
    .param p6, "updatecp"    # Z

    .prologue
    .line 1762
    const/4 v8, 0x0

    .line 1766
    .local v8, "result":Z
    iget v9, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    .line 1768
    .local v9, "startcp":I
    packed-switch p2, :pswitch_data_252

    .line 1926
    :pswitch_6
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v10

    throw v10

    .line 1770
    :pswitch_b
    const/4 v8, 0x1

    .line 1928
    :cond_c
    :goto_c
    if-eqz v8, :cond_248

    .line 1929
    if-nez p6, :cond_12

    .line 1930
    iput v9, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    .line 1934
    .end local p4    # "pc":I
    :cond_12
    :goto_12
    return p4

    .line 1773
    .restart local p4    # "pc":I
    :pswitch_13
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    if-eqz v10, :cond_29

    .line 1774
    iget-boolean v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->multiline:Z

    if-eqz v10, :cond_c

    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/lit8 v10, v10, -0x1

    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-static {v10}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isLineTerm(C)Z

    move-result v10

    if-eqz v10, :cond_c

    .line 1778
    :cond_29
    const/4 v8, 0x1

    .line 1779
    goto :goto_c

    .line 1781
    :pswitch_2b
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v0, p5

    if-eq v10, v0, :cond_41

    .line 1782
    iget-boolean v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->multiline:Z

    if-eqz v10, :cond_c

    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-static {v10}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isLineTerm(C)Z

    move-result v10

    if-eqz v10, :cond_c

    .line 1786
    :cond_41
    const/4 v8, 0x1

    .line 1787
    goto :goto_c

    .line 1789
    :pswitch_43
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    if-eqz v10, :cond_55

    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/lit8 v10, v10, -0x1

    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-static {v10}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isWord(C)Z

    move-result v10

    if-nez v10, :cond_6c

    :cond_55
    const/4 v10, 0x1

    :goto_56
    iget v11, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v0, p5

    if-ge v11, v0, :cond_68

    iget v11, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    invoke-static {v11}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isWord(C)Z

    move-result v11

    if-nez v11, :cond_6e

    :cond_68
    const/4 v11, 0x1

    :goto_69
    xor-int v8, v10, v11

    .line 1791
    goto :goto_c

    .line 1789
    :cond_6c
    const/4 v10, 0x0

    goto :goto_56

    :cond_6e
    const/4 v11, 0x0

    goto :goto_69

    .line 1793
    :pswitch_70
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    if-eqz v10, :cond_82

    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/lit8 v10, v10, -0x1

    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-static {v10}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isWord(C)Z

    move-result v10

    if-nez v10, :cond_9a

    :cond_82
    const/4 v10, 0x1

    :goto_83
    iget v11, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v0, p5

    if-ge v11, v0, :cond_9c

    iget v11, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    invoke-static {v11}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isWord(C)Z

    move-result v11

    if-eqz v11, :cond_9c

    const/4 v11, 0x1

    :goto_96
    xor-int v8, v10, v11

    .line 1795
    goto/16 :goto_c

    .line 1793
    :cond_9a
    const/4 v10, 0x0

    goto :goto_83

    :cond_9c
    const/4 v11, 0x0

    goto :goto_96

    .line 1797
    :pswitch_9e
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v0, p5

    if-eq v10, v0, :cond_c

    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-static {v10}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isLineTerm(C)Z

    move-result v10

    if-nez v10, :cond_c

    .line 1798
    const/4 v8, 0x1

    .line 1799
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    goto/16 :goto_c

    .line 1803
    :pswitch_b9
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v0, p5

    if-eq v10, v0, :cond_c

    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-static {v10}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isDigit(C)Z

    move-result v10

    if-eqz v10, :cond_c

    .line 1804
    const/4 v8, 0x1

    .line 1805
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    goto/16 :goto_c

    .line 1809
    :pswitch_d4
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v0, p5

    if-eq v10, v0, :cond_c

    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-static {v10}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isDigit(C)Z

    move-result v10

    if-nez v10, :cond_c

    .line 1810
    const/4 v8, 0x1

    .line 1811
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    goto/16 :goto_c

    .line 1815
    :pswitch_ef
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v0, p5

    if-eq v10, v0, :cond_c

    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-static {v10}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isWord(C)Z

    move-result v10

    if-eqz v10, :cond_c

    .line 1816
    const/4 v8, 0x1

    .line 1817
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    goto/16 :goto_c

    .line 1821
    :pswitch_10a
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v0, p5

    if-eq v10, v0, :cond_c

    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-static {v10}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isWord(C)Z

    move-result v10

    if-nez v10, :cond_c

    .line 1822
    const/4 v8, 0x1

    .line 1823
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    goto/16 :goto_c

    .line 1827
    :pswitch_125
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v0, p5

    if-eq v10, v0, :cond_c

    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-static {v10}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isREWhiteSpace(I)Z

    move-result v10

    if-eqz v10, :cond_c

    .line 1828
    const/4 v8, 0x1

    .line 1829
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    goto/16 :goto_c

    .line 1833
    :pswitch_140
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v0, p5

    if-eq v10, v0, :cond_c

    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-static {v10}, Lorg/mozilla/javascript/regexp/NativeRegExp;->isREWhiteSpace(I)Z

    move-result v10

    if-nez v10, :cond_c

    .line 1834
    const/4 v8, 0x1

    .line 1835
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    goto/16 :goto_c

    .line 1840
    :pswitch_15b
    invoke-static/range {p3 .. p4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v6

    .line 1841
    .local v6, "parenIndex":I
    add-int/lit8 p4, p4, 0x2

    .line 1842
    move/from16 v0, p5

    invoke-static {p0, v6, p1, v0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->backrefMatcher(Lorg/mozilla/javascript/regexp/REGlobalData;ILjava/lang/String;I)Z

    move-result v8

    .line 1844
    goto/16 :goto_c

    .line 1847
    .end local v6    # "parenIndex":I
    :pswitch_169
    invoke-static/range {p3 .. p4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v5

    .line 1848
    .local v5, "offset":I
    add-int/lit8 p4, p4, 0x2

    .line 1849
    invoke-static/range {p3 .. p4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v3

    .line 1850
    .local v3, "length":I
    add-int/lit8 p4, p4, 0x2

    .line 1851
    move/from16 v0, p5

    invoke-static {p0, v5, v3, p1, v0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->flatNMatcher(Lorg/mozilla/javascript/regexp/REGlobalData;IILjava/lang/String;I)Z

    move-result v8

    .line 1853
    goto/16 :goto_c

    .line 1856
    .end local v3    # "length":I
    .end local v5    # "offset":I
    :pswitch_17d
    add-int/lit8 v7, p4, 0x1

    .end local p4    # "pc":I
    .local v7, "pc":I
    aget-byte v10, p3, p4

    and-int/lit16 v10, v10, 0xff

    int-to-char v4, v10

    .line 1857
    .local v4, "matchCh":C
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v0, p5

    if-eq v10, v0, :cond_24e

    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    if-ne v10, v4, :cond_24e

    .line 1858
    const/4 v8, 0x1

    .line 1859
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 p4, v7

    .end local v7    # "pc":I
    .restart local p4    # "pc":I
    goto/16 :goto_c

    .line 1865
    .end local v4    # "matchCh":C
    :pswitch_19d
    invoke-static/range {p3 .. p4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v5

    .line 1866
    .restart local v5    # "offset":I
    add-int/lit8 p4, p4, 0x2

    .line 1867
    invoke-static/range {p3 .. p4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v3

    .line 1868
    .restart local v3    # "length":I
    add-int/lit8 p4, p4, 0x2

    .line 1869
    move/from16 v0, p5

    invoke-static {p0, v5, v3, p1, v0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->flatNIMatcher(Lorg/mozilla/javascript/regexp/REGlobalData;IILjava/lang/String;I)Z

    move-result v8

    .line 1871
    goto/16 :goto_c

    .line 1874
    .end local v3    # "length":I
    .end local v5    # "offset":I
    :pswitch_1b1
    add-int/lit8 v7, p4, 0x1

    .end local p4    # "pc":I
    .restart local v7    # "pc":I
    aget-byte v10, p3, p4

    and-int/lit16 v10, v10, 0xff

    int-to-char v4, v10

    .line 1875
    .restart local v4    # "matchCh":C
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v0, p5

    if-eq v10, v0, :cond_24e

    .line 1876
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1877
    .local v1, "c":C
    if-eq v4, v1, :cond_1d0

    invoke-static {v4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->upcase(C)C

    move-result v10

    invoke-static {v1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->upcase(C)C

    move-result v11

    if-ne v10, v11, :cond_1d7

    .line 1878
    :cond_1d0
    const/4 v8, 0x1

    .line 1879
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    :cond_1d7
    move/from16 p4, v7

    .line 1881
    .end local v7    # "pc":I
    .restart local p4    # "pc":I
    goto/16 :goto_c

    .line 1886
    .end local v1    # "c":C
    .end local v4    # "matchCh":C
    :pswitch_1db
    invoke-static/range {p3 .. p4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v10

    int-to-char v4, v10

    .line 1887
    .restart local v4    # "matchCh":C
    add-int/lit8 p4, p4, 0x2

    .line 1888
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v0, p5

    if-eq v10, v0, :cond_c

    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    if-ne v10, v4, :cond_c

    .line 1889
    const/4 v8, 0x1

    .line 1890
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    goto/16 :goto_c

    .line 1896
    .end local v4    # "matchCh":C
    :pswitch_1f9
    invoke-static/range {p3 .. p4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v10

    int-to-char v4, v10

    .line 1897
    .restart local v4    # "matchCh":C
    add-int/lit8 p4, p4, 0x2

    .line 1898
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v0, p5

    if-eq v10, v0, :cond_c

    .line 1899
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1900
    .restart local v1    # "c":C
    if-eq v4, v1, :cond_218

    invoke-static {v4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->upcase(C)C

    move-result v10

    invoke-static {v1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->upcase(C)C

    move-result v11

    if-ne v10, v11, :cond_c

    .line 1901
    :cond_218
    const/4 v8, 0x1

    .line 1902
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    goto/16 :goto_c

    .line 1911
    .end local v1    # "c":C
    .end local v4    # "matchCh":C
    :pswitch_221
    invoke-static/range {p3 .. p4}, Lorg/mozilla/javascript/regexp/NativeRegExp;->getIndex([BI)I

    move-result v2

    .line 1912
    .local v2, "index":I
    add-int/lit8 p4, p4, 0x2

    .line 1913
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    move/from16 v0, p5

    if-eq v10, v0, :cond_c

    .line 1914
    iget-object v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->regexp:Lorg/mozilla/javascript/regexp/RECompiled;

    iget-object v10, v10, Lorg/mozilla/javascript/regexp/RECompiled;->classList:[Lorg/mozilla/javascript/regexp/RECharSet;

    aget-object v10, v10, v2

    iget v11, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    invoke-static {p0, v10, v11}, Lorg/mozilla/javascript/regexp/NativeRegExp;->classMatcher(Lorg/mozilla/javascript/regexp/REGlobalData;Lorg/mozilla/javascript/regexp/RECharSet;C)Z

    move-result v10

    if-eqz v10, :cond_c

    .line 1917
    iget v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    .line 1918
    const/4 v8, 0x1

    .line 1919
    goto/16 :goto_c

    .line 1933
    .end local v2    # "index":I
    :cond_248
    iput v9, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    .line 1934
    const/16 p4, -0x1

    goto/16 :goto_12

    .end local p4    # "pc":I
    .restart local v4    # "matchCh":C
    .restart local v7    # "pc":I
    :cond_24e
    move/from16 p4, v7

    .end local v7    # "pc":I
    .restart local p4    # "pc":I
    goto/16 :goto_c

    .line 1768
    :pswitch_data_252
    .packed-switch 0x1
        :pswitch_b
        :pswitch_13
        :pswitch_2b
        :pswitch_43
        :pswitch_70
        :pswitch_9e
        :pswitch_b9
        :pswitch_d4
        :pswitch_ef
        :pswitch_10a
        :pswitch_125
        :pswitch_140
        :pswitch_15b
        :pswitch_169
        :pswitch_17d
        :pswitch_19d
        :pswitch_1b1
        :pswitch_1db
        :pswitch_1f9
        :pswitch_6
        :pswitch_6
        :pswitch_221
        :pswitch_221
    .end packed-switch
.end method

.method private static toASCIIHexDigit(I)I
    .registers 3
    .param p0, "c"    # I

    .prologue
    const/4 v0, -0x1

    .line 449
    const/16 v1, 0x30

    if-ge p0, v1, :cond_6

    .line 458
    :cond_5
    :goto_5
    return v0

    .line 451
    :cond_6
    const/16 v1, 0x39

    if-gt p0, v1, :cond_d

    .line 452
    add-int/lit8 v0, p0, -0x30

    goto :goto_5

    .line 454
    :cond_d
    or-int/lit8 p0, p0, 0x20

    .line 455
    const/16 v1, 0x61

    if-gt v1, p0, :cond_5

    const/16 v1, 0x66

    if-gt p0, v1, :cond_5

    .line 456
    add-int/lit8 v0, p0, -0x61

    add-int/lit8 v0, v0, 0xa

    goto :goto_5
.end method

.method private static upcase(C)C
    .registers 3
    .param p0, "ch"    # C

    .prologue
    const/16 v1, 0x80

    .line 421
    if-ge p0, v1, :cond_10

    .line 422
    const/16 v1, 0x61

    if-gt v1, p0, :cond_f

    const/16 v1, 0x7a

    if-gt p0, v1, :cond_f

    .line 423
    add-int/lit8 v1, p0, -0x20

    int-to-char p0, v1

    .line 428
    .end local p0    # "ch":C
    .local v0, "cu":C
    :cond_f
    :goto_f
    return p0

    .line 427
    .end local v0    # "cu":C
    .restart local p0    # "ch":C
    :cond_10
    invoke-static {p0}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v0

    .line 428
    .restart local v0    # "cu":C
    if-lt v0, v1, :cond_f

    move p0, v0

    goto :goto_f
.end method


# virtual methods
.method public call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 166
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p4, v0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->execSub(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method compile(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .registers 11
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 176
    array-length v3, p3

    if-lez v3, :cond_28

    aget-object v3, p3, v5

    instance-of v3, v3, Lorg/mozilla/javascript/regexp/NativeRegExp;

    if-eqz v3, :cond_28

    .line 177
    array-length v3, p3

    if-le v3, v6, :cond_1b

    aget-object v3, p3, v6

    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-eq v3, v4, :cond_1b

    .line 179
    const-string v3, "msg.bad.regexp.compile"

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->typeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    throw v3

    .line 181
    :cond_1b
    aget-object v2, p3, v5

    check-cast v2, Lorg/mozilla/javascript/regexp/NativeRegExp;

    .line 182
    .local v2, "thatObj":Lorg/mozilla/javascript/regexp/NativeRegExp;
    iget-object v3, v2, Lorg/mozilla/javascript/regexp/NativeRegExp;->re:Lorg/mozilla/javascript/regexp/RECompiled;

    iput-object v3, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->re:Lorg/mozilla/javascript/regexp/RECompiled;

    .line 183
    iget-object v3, v2, Lorg/mozilla/javascript/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    iput-object v3, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    .line 192
    .end local v2    # "thatObj":Lorg/mozilla/javascript/regexp/NativeRegExp;
    :goto_27
    return-object p0

    .line 186
    :cond_28
    array-length v3, p3

    if-eqz v3, :cond_31

    aget-object v3, p3, v5

    instance-of v3, v3, Lorg/mozilla/javascript/Undefined;

    if-eqz v3, :cond_51

    :cond_31
    const-string v1, ""

    .line 187
    .local v1, "s":Ljava/lang/String;
    :goto_33
    array-length v3, p3

    if-le v3, v6, :cond_58

    aget-object v3, p3, v6

    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-eq v3, v4, :cond_58

    aget-object v3, p3, v6

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 190
    .local v0, "global":Ljava/lang/String;
    :goto_42
    invoke-static {p1, v1, v0, v5}, Lorg/mozilla/javascript/regexp/NativeRegExp;->compileRE(Lorg/mozilla/javascript/Context;Ljava/lang/String;Ljava/lang/String;Z)Lorg/mozilla/javascript/regexp/RECompiled;

    move-result-object v3

    iput-object v3, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->re:Lorg/mozilla/javascript/regexp/RECompiled;

    .line 191
    const-wide/16 v3, 0x0

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    iput-object v3, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    goto :goto_27

    .line 186
    .end local v0    # "global":Ljava/lang/String;
    .end local v1    # "s":Ljava/lang/String;
    :cond_51
    aget-object v3, p3, v5

    invoke-static {v3}, Lorg/mozilla/javascript/regexp/NativeRegExp;->escapeRegExp(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_33

    .line 187
    .restart local v1    # "s":Ljava/lang/String;
    :cond_58
    const/4 v0, 0x0

    goto :goto_42
.end method

.method public construct(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .registers 5
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 171
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->execSub(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/Scriptable;

    return-object v0
.end method

.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 2706
    sget-object v2, Lorg/mozilla/javascript/regexp/NativeRegExp;->REGEXP_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v2}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_d

    .line 2707
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/IdScriptableObject;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 2727
    :goto_c
    return-object v2

    .line 2709
    :cond_d
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v0

    .line 2710
    .local v0, "id":I
    packed-switch v0, :pswitch_data_5c

    .line 2729
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 2712
    :pswitch_1e
    invoke-static {p4, p1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/regexp/NativeRegExp;

    move-result-object v2

    invoke-virtual {v2, p2, p3, p5}, Lorg/mozilla/javascript/regexp/NativeRegExp;->compile(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    goto :goto_c

    .line 2716
    :pswitch_27
    invoke-static {p4, p1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/regexp/NativeRegExp;

    move-result-object v2

    invoke-virtual {v2}, Lorg/mozilla/javascript/regexp/NativeRegExp;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_c

    .line 2719
    :pswitch_30
    invoke-static {p4, p1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/regexp/NativeRegExp;

    move-result-object v2

    const/4 v3, 0x1

    invoke-direct {v2, p2, p3, p5, v3}, Lorg/mozilla/javascript/regexp/NativeRegExp;->execSub(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    goto :goto_c

    .line 2722
    :pswitch_3a
    invoke-static {p4, p1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/regexp/NativeRegExp;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v2, p2, p3, p5, v3}, Lorg/mozilla/javascript/regexp/NativeRegExp;->execSub(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    .line 2723
    .local v1, "x":Ljava/lang/Object;
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4e

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_c

    :cond_4e
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_c

    .line 2727
    .end local v1    # "x":Ljava/lang/Object;
    :pswitch_51
    invoke-static {p4, p1}, Lorg/mozilla/javascript/regexp/NativeRegExp;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/regexp/NativeRegExp;

    move-result-object v2

    const/4 v3, 0x2

    invoke-direct {v2, p2, p3, p5, v3}, Lorg/mozilla/javascript/regexp/NativeRegExp;->execSub(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    goto :goto_c

    .line 2710
    nop

    :pswitch_data_5c
    .packed-switch 0x1
        :pswitch_1e
        :pswitch_27
        :pswitch_27
        :pswitch_30
        :pswitch_3a
        :pswitch_51
    .end packed-switch
.end method

.method executeRegExp(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/regexp/RegExpImpl;Ljava/lang/String;[II)Ljava/lang/Object;
    .registers 27
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "res"    # Lorg/mozilla/javascript/regexp/RegExpImpl;
    .param p4, "str"    # Ljava/lang/String;
    .param p5, "indexp"    # [I
    .param p6, "matchType"    # I

    .prologue
    .line 2428
    new-instance v3, Lorg/mozilla/javascript/regexp/REGlobalData;

    invoke-direct {v3}, Lorg/mozilla/javascript/regexp/REGlobalData;-><init>()V

    .line 2430
    .local v3, "gData":Lorg/mozilla/javascript/regexp/REGlobalData;
    const/4 v4, 0x0

    aget v6, p5, v4

    .line 2431
    .local v6, "start":I
    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->length()I

    move-result v7

    .line 2432
    .local v7, "end":I
    if-le v6, v7, :cond_f

    .line 2433
    move v6, v7

    .line 2437
    :cond_f
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/regexp/NativeRegExp;->re:Lorg/mozilla/javascript/regexp/RECompiled;

    move-object/from16 v0, p3

    iget-boolean v8, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->multiline:Z

    move-object/from16 v5, p4

    invoke-static/range {v3 .. v8}, Lorg/mozilla/javascript/regexp/NativeRegExp;->matchRegExp(Lorg/mozilla/javascript/regexp/REGlobalData;Lorg/mozilla/javascript/regexp/RECompiled;Ljava/lang/String;IIZ)Z

    move-result v13

    .line 2439
    .local v13, "matches":Z
    if-nez v13, :cond_2a

    .line 2440
    const/4 v4, 0x2

    move/from16 v0, p6

    if-eq v0, v4, :cond_27

    const/16 v19, 0x0

    .line 2546
    :goto_26
    return-object v19

    .line 2441
    :cond_27
    sget-object v19, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_26

    .line 2443
    :cond_2a
    iget v12, v3, Lorg/mozilla/javascript/regexp/REGlobalData;->cp:I

    .line 2444
    .local v12, "index":I
    const/4 v4, 0x0

    aput v12, p5, v4

    move v11, v12

    .line 2445
    .local v11, "ep":I
    iget v4, v3, Lorg/mozilla/javascript/regexp/REGlobalData;->skipped:I

    add-int/2addr v4, v6

    sub-int v14, v11, v4

    .line 2446
    .local v14, "matchlen":I
    sub-int/2addr v12, v14

    .line 2450
    if-nez p6, :cond_d7

    .line 2455
    sget-object v19, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2456
    .local v19, "result":Ljava/lang/Boolean;
    const/16 v17, 0x0

    .line 2472
    .end local v19    # "result":Ljava/lang/Boolean;
    .local v17, "obj":Lorg/mozilla/javascript/Scriptable;
    :goto_3c
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/regexp/NativeRegExp;->re:Lorg/mozilla/javascript/regexp/RECompiled;

    iget v4, v4, Lorg/mozilla/javascript/regexp/RECompiled;->parenCount:I

    if-nez v4, :cond_f6

    .line 2473
    const/4 v4, 0x0

    move-object/from16 v0, p3

    iput-object v4, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->parens:[Lorg/mozilla/javascript/regexp/SubString;

    .line 2474
    sget-object v4, Lorg/mozilla/javascript/regexp/SubString;->emptySubString:Lorg/mozilla/javascript/regexp/SubString;

    move-object/from16 v0, p3

    iput-object v4, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->lastParen:Lorg/mozilla/javascript/regexp/SubString;

    .line 2497
    :goto_4f
    if-eqz p6, :cond_6c

    .line 2502
    const-string v4, "index"

    iget v5, v3, Lorg/mozilla/javascript/regexp/REGlobalData;->skipped:I

    add-int/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, v17

    move-object/from16 v1, v17

    invoke-interface {v0, v4, v1, v5}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 2503
    const-string v4, "input"

    move-object/from16 v0, v17

    move-object/from16 v1, v17

    move-object/from16 v2, p4

    invoke-interface {v0, v4, v1, v2}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 2506
    :cond_6c
    move-object/from16 v0, p3

    iget-object v4, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->lastMatch:Lorg/mozilla/javascript/regexp/SubString;

    if-nez v4, :cond_8d

    .line 2507
    new-instance v4, Lorg/mozilla/javascript/regexp/SubString;

    invoke-direct {v4}, Lorg/mozilla/javascript/regexp/SubString;-><init>()V

    move-object/from16 v0, p3

    iput-object v4, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->lastMatch:Lorg/mozilla/javascript/regexp/SubString;

    .line 2508
    new-instance v4, Lorg/mozilla/javascript/regexp/SubString;

    invoke-direct {v4}, Lorg/mozilla/javascript/regexp/SubString;-><init>()V

    move-object/from16 v0, p3

    iput-object v4, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->leftContext:Lorg/mozilla/javascript/regexp/SubString;

    .line 2509
    new-instance v4, Lorg/mozilla/javascript/regexp/SubString;

    invoke-direct {v4}, Lorg/mozilla/javascript/regexp/SubString;-><init>()V

    move-object/from16 v0, p3

    iput-object v4, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->rightContext:Lorg/mozilla/javascript/regexp/SubString;

    .line 2511
    :cond_8d
    move-object/from16 v0, p3

    iget-object v4, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->lastMatch:Lorg/mozilla/javascript/regexp/SubString;

    move-object/from16 v0, p4

    iput-object v0, v4, Lorg/mozilla/javascript/regexp/SubString;->str:Ljava/lang/String;

    .line 2512
    move-object/from16 v0, p3

    iget-object v4, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->lastMatch:Lorg/mozilla/javascript/regexp/SubString;

    iput v12, v4, Lorg/mozilla/javascript/regexp/SubString;->index:I

    .line 2513
    move-object/from16 v0, p3

    iget-object v4, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->lastMatch:Lorg/mozilla/javascript/regexp/SubString;

    iput v14, v4, Lorg/mozilla/javascript/regexp/SubString;->length:I

    .line 2515
    move-object/from16 v0, p3

    iget-object v4, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->leftContext:Lorg/mozilla/javascript/regexp/SubString;

    move-object/from16 v0, p4

    iput-object v0, v4, Lorg/mozilla/javascript/regexp/SubString;->str:Ljava/lang/String;

    .line 2516
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v4

    const/16 v5, 0x78

    if-ne v4, v5, :cond_156

    .line 2530
    move-object/from16 v0, p3

    iget-object v4, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->leftContext:Lorg/mozilla/javascript/regexp/SubString;

    iput v6, v4, Lorg/mozilla/javascript/regexp/SubString;->index:I

    .line 2531
    move-object/from16 v0, p3

    iget-object v4, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->leftContext:Lorg/mozilla/javascript/regexp/SubString;

    iget v5, v3, Lorg/mozilla/javascript/regexp/REGlobalData;->skipped:I

    iput v5, v4, Lorg/mozilla/javascript/regexp/SubString;->length:I

    .line 2542
    :goto_bf
    move-object/from16 v0, p3

    iget-object v4, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->rightContext:Lorg/mozilla/javascript/regexp/SubString;

    move-object/from16 v0, p4

    iput-object v0, v4, Lorg/mozilla/javascript/regexp/SubString;->str:Ljava/lang/String;

    .line 2543
    move-object/from16 v0, p3

    iget-object v4, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->rightContext:Lorg/mozilla/javascript/regexp/SubString;

    iput v11, v4, Lorg/mozilla/javascript/regexp/SubString;->index:I

    .line 2544
    move-object/from16 v0, p3

    iget-object v4, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->rightContext:Lorg/mozilla/javascript/regexp/SubString;

    sub-int v5, v7, v11

    iput v5, v4, Lorg/mozilla/javascript/regexp/SubString;->length:I

    goto/16 :goto_26

    .line 2465
    .end local v17    # "obj":Lorg/mozilla/javascript/Scriptable;
    :cond_d7
    const/4 v4, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v0, v1, v4}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Scriptable;

    move-result-object v19

    .local v19, "result":Lorg/mozilla/javascript/Scriptable;
    move-object/from16 v17, v19

    .line 2466
    check-cast v17, Lorg/mozilla/javascript/Scriptable;

    .line 2468
    .restart local v17    # "obj":Lorg/mozilla/javascript/Scriptable;
    add-int v4, v12, v14

    move-object/from16 v0, p4

    invoke-virtual {v0, v12, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v15

    .line 2469
    .local v15, "matchstr":Ljava/lang/String;
    const/4 v4, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v17

    invoke-interface {v0, v4, v1, v15}, Lorg/mozilla/javascript/Scriptable;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto/16 :goto_3c

    .line 2476
    .end local v15    # "matchstr":Ljava/lang/String;
    .end local v19    # "result":Lorg/mozilla/javascript/Scriptable;
    :cond_f6
    const/16 v18, 0x0

    .line 2478
    .local v18, "parsub":Lorg/mozilla/javascript/regexp/SubString;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/regexp/NativeRegExp;->re:Lorg/mozilla/javascript/regexp/RECompiled;

    iget v4, v4, Lorg/mozilla/javascript/regexp/RECompiled;->parenCount:I

    new-array v4, v4, [Lorg/mozilla/javascript/regexp/SubString;

    move-object/from16 v0, p3

    iput-object v4, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->parens:[Lorg/mozilla/javascript/regexp/SubString;

    .line 2479
    const/16 v16, 0x0

    .local v16, "num":I
    :goto_106
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/regexp/NativeRegExp;->re:Lorg/mozilla/javascript/regexp/RECompiled;

    iget v4, v4, Lorg/mozilla/javascript/regexp/RECompiled;->parenCount:I

    move/from16 v0, v16

    if-ge v0, v4, :cond_14e

    .line 2480
    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/regexp/REGlobalData;->parensIndex(I)I

    move-result v9

    .line 2482
    .local v9, "cap_index":I
    const/4 v4, -0x1

    if-eq v9, v4, :cond_140

    .line 2483
    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/regexp/REGlobalData;->parensLength(I)I

    move-result v10

    .line 2484
    .local v10, "cap_length":I
    new-instance v18, Lorg/mozilla/javascript/regexp/SubString;

    .end local v18    # "parsub":Lorg/mozilla/javascript/regexp/SubString;
    move-object/from16 v0, v18

    move-object/from16 v1, p4

    invoke-direct {v0, v1, v9, v10}, Lorg/mozilla/javascript/regexp/SubString;-><init>(Ljava/lang/String;II)V

    .line 2485
    .restart local v18    # "parsub":Lorg/mozilla/javascript/regexp/SubString;
    move-object/from16 v0, p3

    iget-object v4, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->parens:[Lorg/mozilla/javascript/regexp/SubString;

    aput-object v18, v4, v16

    .line 2486
    if-eqz p6, :cond_13d

    .line 2487
    add-int/lit8 v4, v16, 0x1

    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/regexp/SubString;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v17

    move-object/from16 v1, v17

    invoke-interface {v0, v4, v1, v5}, Lorg/mozilla/javascript/Scriptable;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 2479
    .end local v10    # "cap_length":I
    :cond_13d
    :goto_13d
    add-int/lit8 v16, v16, 0x1

    goto :goto_106

    .line 2490
    :cond_140
    if-eqz p6, :cond_13d

    .line 2491
    add-int/lit8 v4, v16, 0x1

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    move-object/from16 v0, v17

    move-object/from16 v1, v17

    invoke-interface {v0, v4, v1, v5}, Lorg/mozilla/javascript/Scriptable;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_13d

    .line 2494
    .end local v9    # "cap_index":I
    :cond_14e
    move-object/from16 v0, v18

    move-object/from16 v1, p3

    iput-object v0, v1, Lorg/mozilla/javascript/regexp/RegExpImpl;->lastParen:Lorg/mozilla/javascript/regexp/SubString;

    goto/16 :goto_4f

    .line 2538
    .end local v16    # "num":I
    .end local v18    # "parsub":Lorg/mozilla/javascript/regexp/SubString;
    :cond_156
    move-object/from16 v0, p3

    iget-object v4, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->leftContext:Lorg/mozilla/javascript/regexp/SubString;

    const/4 v5, 0x0

    iput v5, v4, Lorg/mozilla/javascript/regexp/SubString;->index:I

    .line 2539
    move-object/from16 v0, p3

    iget-object v4, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->leftContext:Lorg/mozilla/javascript/regexp/SubString;

    iget v5, v3, Lorg/mozilla/javascript/regexp/REGlobalData;->skipped:I

    add-int/2addr v5, v6

    iput v5, v4, Lorg/mozilla/javascript/regexp/SubString;->length:I

    goto/16 :goto_bf
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .registers 9
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 2590
    const/4 v3, 0x0

    .local v3, "id":I
    const/4 v0, 0x0

    .line 2591
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    .line 2592
    .local v4, "s_length":I
    const/4 v5, 0x6

    if-ne v4, v5, :cond_2f

    .line 2593
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 2594
    .local v2, "c":I
    const/16 v5, 0x67

    if-ne v2, v5, :cond_27

    const-string v0, "global"

    const/4 v3, 0x3

    .line 2603
    .end local v2    # "c":I
    :cond_15
    :goto_15
    if-eqz v0, :cond_20

    if-eq v0, p1, :cond_20

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_20

    const/4 v3, 0x0

    .line 2609
    :cond_20
    if-nez v3, :cond_4f

    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v5

    .line 2625
    :goto_26
    return v5

    .line 2595
    .restart local v2    # "c":I
    :cond_27
    const/16 v5, 0x73

    if-ne v2, v5, :cond_15

    const-string v0, "source"

    const/4 v3, 0x2

    goto :goto_15

    .line 2597
    .end local v2    # "c":I
    :cond_2f
    const/16 v5, 0x9

    if-ne v4, v5, :cond_47

    .line 2598
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 2599
    .restart local v2    # "c":I
    const/16 v5, 0x6c

    if-ne v2, v5, :cond_3f

    const-string v0, "lastIndex"

    const/4 v3, 0x1

    goto :goto_15

    .line 2600
    :cond_3f
    const/16 v5, 0x6d

    if-ne v2, v5, :cond_15

    const-string v0, "multiline"

    const/4 v3, 0x5

    goto :goto_15

    .line 2602
    .end local v2    # "c":I
    :cond_47
    const/16 v5, 0xa

    if-ne v4, v5, :cond_15

    const-string v0, "ignoreCase"

    const/4 v3, 0x4

    goto :goto_15

    .line 2612
    :cond_4f
    packed-switch v3, :pswitch_data_62

    .line 2623
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5}, Ljava/lang/IllegalStateException;-><init>()V

    throw v5

    .line 2614
    :pswitch_58
    iget v1, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->lastIndexAttr:I

    .line 2625
    .local v1, "attr":I
    :goto_5a
    invoke-static {v1, v3}, Lorg/mozilla/javascript/regexp/NativeRegExp;->instanceIdInfo(II)I

    move-result v5

    goto :goto_26

    .line 2620
    .end local v1    # "attr":I
    :pswitch_5f
    const/4 v1, 0x7

    .line 2621
    .restart local v1    # "attr":I
    goto :goto_5a

    .line 2612
    nop

    :pswitch_data_62
    .packed-switch 0x1
        :pswitch_58
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
        :pswitch_5f
    .end packed-switch
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .registers 7
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/16 v4, 0x74

    .line 2745
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 2746
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    packed-switch v3, :pswitch_data_46

    .line 2758
    :cond_b
    :goto_b
    :pswitch_b
    if-eqz v0, :cond_16

    if-eq v0, p1, :cond_16

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_16

    const/4 v2, 0x0

    .line 2762
    :cond_16
    return v2

    .line 2747
    :pswitch_17
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 2748
    .local v1, "c":I
    const/16 v3, 0x65

    if-ne v1, v3, :cond_24

    const-string v0, "exec"

    const/4 v2, 0x4

    goto :goto_b

    .line 2749
    :cond_24
    if-ne v1, v4, :cond_b

    const-string v0, "test"

    const/4 v2, 0x5

    goto :goto_b

    .line 2751
    .end local v1    # "c":I
    :pswitch_2a
    const-string v0, "prefix"

    const/4 v2, 0x6

    goto :goto_b

    .line 2752
    :pswitch_2e
    const-string v0, "compile"

    const/4 v2, 0x1

    goto :goto_b

    .line 2753
    :pswitch_32
    const/4 v3, 0x3

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 2754
    .restart local v1    # "c":I
    const/16 v3, 0x6f

    if-ne v1, v3, :cond_3f

    const-string v0, "toSource"

    const/4 v2, 0x3

    goto :goto_b

    .line 2755
    :cond_3f
    if-ne v1, v4, :cond_b

    const-string v0, "toString"

    const/4 v2, 0x2

    goto :goto_b

    .line 2746
    nop

    :pswitch_data_46
    .packed-switch 0x4
        :pswitch_17
        :pswitch_b
        :pswitch_2a
        :pswitch_2e
        :pswitch_32
    .end packed-switch
.end method

.method public getClassName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 149
    const-string v0, "RegExp"

    return-object v0
.end method

.method getFlags()I
    .registers 2

    .prologue
    .line 2551
    iget-object v0, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->re:Lorg/mozilla/javascript/regexp/RECompiled;

    iget v0, v0, Lorg/mozilla/javascript/regexp/RECompiled;->flags:I

    return v0
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 2631
    packed-switch p1, :pswitch_data_18

    .line 2638
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 2632
    :pswitch_8
    const-string v0, "lastIndex"

    goto :goto_7

    .line 2633
    :pswitch_b
    const-string v0, "source"

    goto :goto_7

    .line 2634
    :pswitch_e
    const-string v0, "global"

    goto :goto_7

    .line 2635
    :pswitch_11
    const-string v0, "ignoreCase"

    goto :goto_7

    .line 2636
    :pswitch_14
    const-string v0, "multiline"

    goto :goto_7

    .line 2631
    nop

    :pswitch_data_18
    .packed-switch 0x1
        :pswitch_8
        :pswitch_b
        :pswitch_e
        :pswitch_11
        :pswitch_14
    .end packed-switch
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .registers 5
    .param p1, "id"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 2644
    packed-switch p1, :pswitch_data_44

    .line 2656
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    :goto_9
    return-object v0

    .line 2646
    :pswitch_a
    iget-object v0, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    goto :goto_9

    .line 2648
    :pswitch_d
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->re:Lorg/mozilla/javascript/regexp/RECompiled;

    iget-object v1, v1, Lorg/mozilla/javascript/regexp/RECompiled;->source:[C

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    goto :goto_9

    .line 2650
    :pswitch_17
    iget-object v2, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->re:Lorg/mozilla/javascript/regexp/RECompiled;

    iget v2, v2, Lorg/mozilla/javascript/regexp/RECompiled;->flags:I

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_24

    :goto_1f
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_9

    :cond_24
    move v0, v1

    goto :goto_1f

    .line 2652
    :pswitch_26
    iget-object v2, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->re:Lorg/mozilla/javascript/regexp/RECompiled;

    iget v2, v2, Lorg/mozilla/javascript/regexp/RECompiled;->flags:I

    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_33

    :goto_2e
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_9

    :cond_33
    move v0, v1

    goto :goto_2e

    .line 2654
    :pswitch_35
    iget-object v2, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->re:Lorg/mozilla/javascript/regexp/RECompiled;

    iget v2, v2, Lorg/mozilla/javascript/regexp/RECompiled;->flags:I

    and-int/lit8 v2, v2, 0x4

    if-eqz v2, :cond_42

    :goto_3d
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_9

    :cond_42
    move v0, v1

    goto :goto_3d

    .line 2644
    :pswitch_data_44
    .packed-switch 0x1
        :pswitch_a
        :pswitch_d
        :pswitch_17
        :pswitch_26
        :pswitch_35
    .end packed-switch
.end method

.method protected getMaxInstanceId()I
    .registers 2

    .prologue
    .line 2582
    const/4 v0, 0x5

    return v0
.end method

.method public getTypeOf()Ljava/lang/String;
    .registers 2

    .prologue
    .line 160
    const-string v0, "object"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .registers 6
    .param p1, "id"    # I

    .prologue
    .line 2690
    packed-switch p1, :pswitch_data_2a

    .line 2697
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 2691
    :pswitch_d
    const/4 v0, 0x2

    .local v0, "arity":I
    const-string v1, "compile"

    .line 2699
    .local v1, "s":Ljava/lang/String;
    :goto_10
    sget-object v2, Lorg/mozilla/javascript/regexp/NativeRegExp;->REGEXP_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lorg/mozilla/javascript/regexp/NativeRegExp;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 2700
    return-void

    .line 2692
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_16
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 2693
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toSource"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 2694
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1e
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "exec"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 2695
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_22
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "test"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 2696
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_26
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "prefix"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 2690
    :pswitch_data_2a
    .packed-switch 0x1
        :pswitch_d
        :pswitch_16
        :pswitch_1a
        :pswitch_1e
        :pswitch_22
        :pswitch_26
    .end packed-switch
.end method

.method protected setInstanceIdAttributes(II)V
    .registers 3
    .param p1, "id"    # I
    .param p2, "attr"    # I

    .prologue
    .line 2677
    packed-switch p1, :pswitch_data_a

    .line 2682
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->setInstanceIdAttributes(II)V

    .line 2683
    :goto_6
    return-void

    .line 2679
    :pswitch_7
    iput p2, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->lastIndexAttr:I

    goto :goto_6

    .line 2677
    :pswitch_data_a
    .packed-switch 0x1
        :pswitch_7
    .end packed-switch
.end method

.method protected setInstanceIdValue(ILjava/lang/Object;)V
    .registers 3
    .param p1, "id"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 2662
    packed-switch p1, :pswitch_data_a

    .line 2672
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->setInstanceIdValue(ILjava/lang/Object;)V

    .line 2673
    :goto_6
    :pswitch_6
    return-void

    .line 2664
    :pswitch_7
    iput-object p2, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    goto :goto_6

    .line 2662
    :pswitch_data_a
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    const/16 v2, 0x2f

    .line 198
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 199
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 200
    iget-object v1, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->re:Lorg/mozilla/javascript/regexp/RECompiled;

    iget-object v1, v1, Lorg/mozilla/javascript/regexp/RECompiled;->source:[C

    array-length v1, v1

    if-eqz v1, :cond_47

    .line 201
    iget-object v1, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->re:Lorg/mozilla/javascript/regexp/RECompiled;

    iget-object v1, v1, Lorg/mozilla/javascript/regexp/RECompiled;->source:[C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 206
    :goto_18
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 207
    iget-object v1, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->re:Lorg/mozilla/javascript/regexp/RECompiled;

    iget v1, v1, Lorg/mozilla/javascript/regexp/RECompiled;->flags:I

    and-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_28

    .line 208
    const/16 v1, 0x67

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 209
    :cond_28
    iget-object v1, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->re:Lorg/mozilla/javascript/regexp/RECompiled;

    iget v1, v1, Lorg/mozilla/javascript/regexp/RECompiled;->flags:I

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_35

    .line 210
    const/16 v1, 0x69

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 211
    :cond_35
    iget-object v1, p0, Lorg/mozilla/javascript/regexp/NativeRegExp;->re:Lorg/mozilla/javascript/regexp/RECompiled;

    iget v1, v1, Lorg/mozilla/javascript/regexp/RECompiled;->flags:I

    and-int/lit8 v1, v1, 0x4

    if-eqz v1, :cond_42

    .line 212
    const/16 v1, 0x6d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 213
    :cond_42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 204
    :cond_47
    const-string v1, "(?:)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_18
.end method
