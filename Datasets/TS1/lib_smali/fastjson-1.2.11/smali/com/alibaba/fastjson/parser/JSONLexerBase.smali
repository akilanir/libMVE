.class public abstract Lcom/alibaba/fastjson/parser/JSONLexerBase;
.super Ljava/lang/Object;
.source "JSONLexerBase.java"

# interfaces
.implements Lcom/alibaba/fastjson/parser/JSONLexer;
.implements Ljava/io/Closeable;


# static fields
.field protected static final INT_MULTMIN_RADIX_TEN:I = -0xccccccc

.field protected static final MULTMIN_RADIX_TEN:J = -0xcccccccccccccccL

.field private static final SBUF_LOCAL:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<[C>;"
        }
    .end annotation
.end field

.field protected static final digits:[I

.field protected static final typeFieldName:[C


# instance fields
.field protected bp:I

.field protected calendar:Ljava/util/Calendar;

.field protected ch:C

.field protected eofPos:I

.field protected features:I

.field protected hasSpecial:Z

.field protected locale:Ljava/util/Locale;

.field public matchStat:I

.field protected np:I

.field protected pos:I

.field protected sbuf:[C

.field protected sp:I

.field protected stringDefaultValue:Ljava/lang/String;

.field protected timeZone:Ljava/util/TimeZone;

.field protected token:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 81
    new-instance v1, Ljava/lang/ThreadLocal;

    invoke-direct {v1}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->SBUF_LOCAL:Ljava/lang/ThreadLocal;

    .line 1078
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\":\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->typeFieldName:[C

    .line 3009
    const/16 v1, 0x67

    new-array v1, v1, [I

    sput-object v1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->digits:[I

    .line 3012
    const/16 v0, 0x30

    .local v0, "i":I
    :goto_30
    const/16 v1, 0x39

    if-gt v0, v1, :cond_3d

    .line 3013
    sget-object v1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->digits:[I

    add-int/lit8 v2, v0, -0x30

    aput v2, v1, v0

    .line 3012
    add-int/lit8 v0, v0, 0x1

    goto :goto_30

    .line 3016
    :cond_3d
    const/16 v0, 0x61

    :goto_3f
    const/16 v1, 0x66

    if-gt v0, v1, :cond_4e

    .line 3017
    sget-object v1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->digits:[I

    add-int/lit8 v2, v0, -0x61

    add-int/lit8 v2, v2, 0xa

    aput v2, v1, v0

    .line 3016
    add-int/lit8 v0, v0, 0x1

    goto :goto_3f

    .line 3019
    :cond_4e
    const/16 v0, 0x41

    :goto_50
    const/16 v1, 0x46

    if-gt v0, v1, :cond_5f

    .line 3020
    sget-object v1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->digits:[I

    add-int/lit8 v2, v0, -0x41

    add-int/lit8 v2, v2, 0xa

    aput v2, v1, v0

    .line 3019
    add-int/lit8 v0, v0, 0x1

    goto :goto_50

    .line 3022
    :cond_5f
    return-void
.end method

.method public constructor <init>(I)V
    .registers 4
    .param p1, "features"    # I

    .prologue
    const/4 v1, 0x0

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    iput-object v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 76
    sget-object v0, Lcom/alibaba/fastjson/JSON;->defaultTimeZone:Ljava/util/TimeZone;

    iput-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->timeZone:Ljava/util/TimeZone;

    .line 77
    sget-object v0, Lcom/alibaba/fastjson/JSON;->defaultLocale:Ljava/util/Locale;

    iput-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->locale:Ljava/util/Locale;

    .line 79
    const/4 v0, 0x0

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 83
    iput-object v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringDefaultValue:Ljava/lang/String;

    .line 86
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->features:I

    .line 88
    sget-object v0, Lcom/alibaba/fastjson/parser/Feature;->InitStringFieldAsEmpty:Lcom/alibaba/fastjson/parser/Feature;

    iget v0, v0, Lcom/alibaba/fastjson/parser/Feature;->mask:I

    and-int/2addr v0, p1

    if-eqz v0, :cond_20

    .line 89
    const-string v0, ""

    iput-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringDefaultValue:Ljava/lang/String;

    .line 92
    :cond_20
    sget-object v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->SBUF_LOCAL:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [C

    iput-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 94
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    if-nez v0, :cond_34

    .line 95
    const/16 v0, 0x200

    new-array v0, v0, [C

    iput-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 97
    :cond_34
    return-void
.end method

.method public static isWhitespace(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    const/16 v0, 0x20

    .line 3003
    if-gt p0, v0, :cond_1c

    if-eq p0, v0, :cond_1a

    const/16 v0, 0xa

    if-eq p0, v0, :cond_1a

    const/16 v0, 0xd

    if-eq p0, v0, :cond_1a

    const/16 v0, 0x9

    if-eq p0, v0, :cond_1a

    const/16 v0, 0xc

    if-eq p0, v0, :cond_1a

    const/16 v0, 0x8

    if-ne p0, v0, :cond_1c

    :cond_1a
    const/4 v0, 0x1

    :goto_1b
    return v0

    :cond_1c
    const/4 v0, 0x0

    goto :goto_1b
.end method

.method public static readString([CI)Ljava/lang/String;
    .registers 15
    .param p0, "chars"    # [C
    .param p1, "chars_len"    # I

    .prologue
    const/4 v12, 0x4

    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 2586
    new-array v4, p1, [C

    .line 2587
    .local v4, "sbuf":[C
    const/4 v2, 0x0

    .line 2588
    .local v2, "len":I
    const/4 v1, 0x0

    .local v1, "i":I
    move v3, v2

    .end local v2    # "len":I
    .local v3, "len":I
    :goto_a
    if-ge v1, p1, :cond_e1

    .line 2589
    aget-char v0, p0, v1

    .line 2591
    .local v0, "ch":C
    const/16 v5, 0x5c

    if-eq v0, v5, :cond_1a

    .line 2592
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "len":I
    .restart local v2    # "len":I
    aput-char v0, v4, v3

    .line 2588
    :goto_16
    add-int/lit8 v1, v1, 0x1

    move v3, v2

    .end local v2    # "len":I
    .restart local v3    # "len":I
    goto :goto_a

    .line 2595
    :cond_1a
    add-int/lit8 v1, v1, 0x1

    aget-char v0, p0, v1

    .line 2597
    sparse-switch v0, :sswitch_data_e8

    .line 2664
    new-instance v5, Lcom/alibaba/fastjson/JSONException;

    const-string v6, "unclosed.str.lit"

    invoke-direct {v5, v6}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 2599
    :sswitch_29
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "len":I
    .restart local v2    # "len":I
    aput-char v8, v4, v3

    goto :goto_16

    .line 2602
    .end local v2    # "len":I
    .restart local v3    # "len":I
    :sswitch_2e
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "len":I
    .restart local v2    # "len":I
    aput-char v9, v4, v3

    goto :goto_16

    .line 2605
    .end local v2    # "len":I
    .restart local v3    # "len":I
    :sswitch_33
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "len":I
    .restart local v2    # "len":I
    aput-char v10, v4, v3

    goto :goto_16

    .line 2608
    .end local v2    # "len":I
    .restart local v3    # "len":I
    :sswitch_38
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "len":I
    .restart local v2    # "len":I
    aput-char v11, v4, v3

    goto :goto_16

    .line 2611
    .end local v2    # "len":I
    .restart local v3    # "len":I
    :sswitch_3d
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "len":I
    .restart local v2    # "len":I
    aput-char v12, v4, v3

    goto :goto_16

    .line 2614
    .end local v2    # "len":I
    .restart local v3    # "len":I
    :sswitch_42
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "len":I
    .restart local v2    # "len":I
    const/4 v5, 0x5

    aput-char v5, v4, v3

    goto :goto_16

    .line 2617
    .end local v2    # "len":I
    .restart local v3    # "len":I
    :sswitch_48
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "len":I
    .restart local v2    # "len":I
    const/4 v5, 0x6

    aput-char v5, v4, v3

    goto :goto_16

    .line 2620
    .end local v2    # "len":I
    .restart local v3    # "len":I
    :sswitch_4e
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "len":I
    .restart local v2    # "len":I
    const/4 v5, 0x7

    aput-char v5, v4, v3

    goto :goto_16

    .line 2623
    .end local v2    # "len":I
    .restart local v3    # "len":I
    :sswitch_54
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "len":I
    .restart local v2    # "len":I
    const/16 v5, 0x8

    aput-char v5, v4, v3

    goto :goto_16

    .line 2626
    .end local v2    # "len":I
    .restart local v3    # "len":I
    :sswitch_5b
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "len":I
    .restart local v2    # "len":I
    const/16 v5, 0x9

    aput-char v5, v4, v3

    goto :goto_16

    .line 2629
    .end local v2    # "len":I
    .restart local v3    # "len":I
    :sswitch_62
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "len":I
    .restart local v2    # "len":I
    const/16 v5, 0xa

    aput-char v5, v4, v3

    goto :goto_16

    .line 2632
    .end local v2    # "len":I
    .restart local v3    # "len":I
    :sswitch_69
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "len":I
    .restart local v2    # "len":I
    const/16 v5, 0xb

    aput-char v5, v4, v3

    goto :goto_16

    .line 2636
    .end local v2    # "len":I
    .restart local v3    # "len":I
    :sswitch_70
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "len":I
    .restart local v2    # "len":I
    const/16 v5, 0xc

    aput-char v5, v4, v3

    goto :goto_16

    .line 2639
    .end local v2    # "len":I
    .restart local v3    # "len":I
    :sswitch_77
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "len":I
    .restart local v2    # "len":I
    const/16 v5, 0xd

    aput-char v5, v4, v3

    goto :goto_16

    .line 2642
    .end local v2    # "len":I
    .restart local v3    # "len":I
    :sswitch_7e
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "len":I
    .restart local v2    # "len":I
    const/16 v5, 0x22

    aput-char v5, v4, v3

    goto :goto_16

    .line 2645
    .end local v2    # "len":I
    .restart local v3    # "len":I
    :sswitch_85
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "len":I
    .restart local v2    # "len":I
    const/16 v5, 0x27

    aput-char v5, v4, v3

    goto :goto_16

    .line 2648
    .end local v2    # "len":I
    .restart local v3    # "len":I
    :sswitch_8c
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "len":I
    .restart local v2    # "len":I
    const/16 v5, 0x2f

    aput-char v5, v4, v3

    goto :goto_16

    .line 2651
    .end local v2    # "len":I
    .restart local v3    # "len":I
    :sswitch_93
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "len":I
    .restart local v2    # "len":I
    const/16 v5, 0x5c

    aput-char v5, v4, v3

    goto/16 :goto_16

    .line 2654
    .end local v2    # "len":I
    .restart local v3    # "len":I
    :sswitch_9b
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "len":I
    .restart local v2    # "len":I
    sget-object v5, Lcom/alibaba/fastjson/parser/JSONLexerBase;->digits:[I

    add-int/lit8 v1, v1, 0x1

    aget-char v6, p0, v1

    aget v5, v5, v6

    mul-int/lit8 v5, v5, 0x10

    sget-object v6, Lcom/alibaba/fastjson/parser/JSONLexerBase;->digits:[I

    add-int/lit8 v1, v1, 0x1

    aget-char v7, p0, v1

    aget v6, v6, v7

    add-int/2addr v5, v6

    int-to-char v5, v5

    aput-char v5, v4, v3

    goto/16 :goto_16

    .line 2657
    .end local v2    # "len":I
    .restart local v3    # "len":I
    :sswitch_b5
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "len":I
    .restart local v2    # "len":I
    new-instance v5, Ljava/lang/String;

    new-array v6, v12, [C

    add-int/lit8 v1, v1, 0x1

    aget-char v7, p0, v1

    aput-char v7, v6, v8

    add-int/lit8 v1, v1, 0x1

    aget-char v7, p0, v1

    aput-char v7, v6, v9

    add-int/lit8 v1, v1, 0x1

    aget-char v7, p0, v1

    aput-char v7, v6, v10

    add-int/lit8 v1, v1, 0x1

    aget-char v7, p0, v1

    aput-char v7, v6, v11

    invoke-direct {v5, v6}, Ljava/lang/String;-><init>([C)V

    const/16 v6, 0x10

    invoke-static {v5, v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v5

    int-to-char v5, v5

    aput-char v5, v4, v3

    goto/16 :goto_16

    .line 2667
    .end local v0    # "ch":C
    .end local v2    # "len":I
    .restart local v3    # "len":I
    :cond_e1
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v4, v8, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v5

    .line 2597
    nop

    :sswitch_data_e8
    .sparse-switch
        0x22 -> :sswitch_7e
        0x27 -> :sswitch_85
        0x2f -> :sswitch_8c
        0x30 -> :sswitch_29
        0x31 -> :sswitch_2e
        0x32 -> :sswitch_33
        0x33 -> :sswitch_38
        0x34 -> :sswitch_3d
        0x35 -> :sswitch_42
        0x36 -> :sswitch_48
        0x37 -> :sswitch_4e
        0x46 -> :sswitch_70
        0x5c -> :sswitch_93
        0x62 -> :sswitch_54
        0x66 -> :sswitch_70
        0x6e -> :sswitch_62
        0x72 -> :sswitch_77
        0x74 -> :sswitch_5b
        0x75 -> :sswitch_b5
        0x76 -> :sswitch_69
        0x78 -> :sswitch_9b
    .end sparse-switch
.end method

.method private scanStringSingleQuote()V
    .registers 11

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x4

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 2706
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 2707
    iput-boolean v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->hasSpecial:Z

    .line 2710
    :goto_b
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v0

    .line 2712
    .local v0, "chLocal":C
    const/16 v2, 0x27

    if-ne v0, v2, :cond_19

    .line 2822
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2823
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2824
    return-void

    .line 2716
    :cond_19
    const/16 v2, 0x1a

    if-ne v0, v2, :cond_31

    .line 2717
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isEOF()Z

    move-result v2

    if-nez v2, :cond_29

    .line 2718
    const/16 v2, 0x1a

    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto :goto_b

    .line 2721
    :cond_29
    new-instance v2, Lcom/alibaba/fastjson/JSONException;

    const-string v3, "unclosed single-quote string"

    invoke-direct {v2, v3}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 2724
    :cond_31
    const/16 v2, 0x5c

    if-ne v0, v2, :cond_11c

    .line 2725
    iget-boolean v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->hasSpecial:Z

    if-nez v2, :cond_5d

    .line 2726
    iput-boolean v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->hasSpecial:Z

    .line 2728
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    iget-object v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    array-length v3, v3

    if-le v2, v3, :cond_52

    .line 2729
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    mul-int/lit8 v2, v2, 0x2

    new-array v1, v2, [C

    .line 2730
    .local v1, "newsbuf":[C
    iget-object v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    iget-object v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    array-length v3, v3

    invoke-static {v2, v5, v1, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2731
    iput-object v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 2735
    .end local v1    # "newsbuf":[C
    :cond_52
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    add-int/lit8 v2, v2, 0x1

    iget v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    iget-object v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    invoke-virtual {p0, v2, v3, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->copyTo(II[C)V

    .line 2739
    :cond_5d
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v0

    .line 2741
    sparse-switch v0, :sswitch_data_140

    .line 2804
    iput-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 2805
    new-instance v2, Lcom/alibaba/fastjson/JSONException;

    const-string v3, "unclosed single-quote string"

    invoke-direct {v2, v3}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 2743
    :sswitch_6e
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto :goto_b

    .line 2746
    :sswitch_72
    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto :goto_b

    .line 2749
    :sswitch_76
    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto :goto_b

    .line 2752
    :sswitch_7a
    invoke-virtual {p0, v9}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto :goto_b

    .line 2755
    :sswitch_7e
    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto :goto_b

    .line 2758
    :sswitch_82
    const/4 v2, 0x5

    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto :goto_b

    .line 2761
    :sswitch_87
    const/4 v2, 0x6

    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto :goto_b

    .line 2764
    :sswitch_8c
    const/4 v2, 0x7

    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_b

    .line 2767
    :sswitch_92
    const/16 v2, 0x8

    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_b

    .line 2770
    :sswitch_99
    const/16 v2, 0x9

    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_b

    .line 2773
    :sswitch_a0
    const/16 v2, 0xa

    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_b

    .line 2776
    :sswitch_a7
    const/16 v2, 0xb

    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_b

    .line 2780
    :sswitch_ae
    const/16 v2, 0xc

    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_b

    .line 2783
    :sswitch_b5
    const/16 v2, 0xd

    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_b

    .line 2786
    :sswitch_bc
    const/16 v2, 0x22

    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_b

    .line 2789
    :sswitch_c3
    const/16 v2, 0x27

    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_b

    .line 2792
    :sswitch_ca
    const/16 v2, 0x2f

    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_b

    .line 2795
    :sswitch_d1
    const/16 v2, 0x5c

    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_b

    .line 2798
    :sswitch_d8
    sget-object v2, Lcom/alibaba/fastjson/parser/JSONLexerBase;->digits:[I

    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v3

    aget v2, v2, v3

    mul-int/lit8 v2, v2, 0x10

    sget-object v3, Lcom/alibaba/fastjson/parser/JSONLexerBase;->digits:[I

    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v4

    aget v3, v3, v4

    add-int/2addr v2, v3

    int-to-char v2, v2

    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_b

    .line 2801
    :sswitch_f1
    new-instance v2, Ljava/lang/String;

    new-array v3, v7, [C

    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v4

    aput-char v4, v3, v5

    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v4

    aput-char v4, v3, v6

    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v4

    aput-char v4, v3, v8

    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v4

    aput-char v4, v3, v9

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>([C)V

    const/16 v3, 0x10

    invoke-static {v2, v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v2

    int-to-char v2, v2

    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_b

    .line 2810
    :cond_11c
    iget-boolean v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->hasSpecial:Z

    if-nez v2, :cond_128

    .line 2811
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    goto/16 :goto_b

    .line 2815
    :cond_128
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    iget-object v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    array-length v3, v3

    if-ne v2, v3, :cond_134

    .line 2816
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_b

    .line 2818
    :cond_134
    iget-object v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    iget v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    aput-char v0, v2, v3

    goto/16 :goto_b

    .line 2741
    :sswitch_data_140
    .sparse-switch
        0x22 -> :sswitch_bc
        0x27 -> :sswitch_c3
        0x2f -> :sswitch_ca
        0x30 -> :sswitch_6e
        0x31 -> :sswitch_72
        0x32 -> :sswitch_76
        0x33 -> :sswitch_7a
        0x34 -> :sswitch_7e
        0x35 -> :sswitch_82
        0x36 -> :sswitch_87
        0x37 -> :sswitch_8c
        0x46 -> :sswitch_ae
        0x5c -> :sswitch_d1
        0x62 -> :sswitch_92
        0x66 -> :sswitch_ae
        0x6e -> :sswitch_a0
        0x72 -> :sswitch_b5
        0x74 -> :sswitch_99
        0x75 -> :sswitch_f1
        0x76 -> :sswitch_a7
        0x78 -> :sswitch_d8
    .end sparse-switch
.end method


# virtual methods
.method public abstract addSymbol(IIILcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;
.end method

.method protected abstract arrayCopy(I[CII)V
.end method

.method public abstract bytesValue()[B
.end method

.method protected abstract charArrayCompare([C)Z
.end method

.method public abstract charAt(I)C
.end method

.method public close()V
    .registers 3

    .prologue
    .line 1061
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    array-length v0, v0

    const/16 v1, 0x2000

    if-gt v0, v1, :cond_e

    .line 1062
    sget-object v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->SBUF_LOCAL:Ljava/lang/ThreadLocal;

    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 1064
    :cond_e
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 1065
    return-void
.end method

.method public config(Lcom/alibaba/fastjson/parser/Feature;Z)V
    .registers 5
    .param p1, "feature"    # Lcom/alibaba/fastjson/parser/Feature;
    .param p2, "state"    # Z

    .prologue
    .line 510
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->features:I

    invoke-static {v0, p1, p2}, Lcom/alibaba/fastjson/parser/Feature;->config(ILcom/alibaba/fastjson/parser/Feature;Z)I

    move-result v0

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->features:I

    .line 512
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->features:I

    sget-object v1, Lcom/alibaba/fastjson/parser/Feature;->InitStringFieldAsEmpty:Lcom/alibaba/fastjson/parser/Feature;

    iget v1, v1, Lcom/alibaba/fastjson/parser/Feature;->mask:I

    and-int/2addr v0, v1

    if-eqz v0, :cond_15

    .line 513
    const-string v0, ""

    iput-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringDefaultValue:Ljava/lang/String;

    .line 515
    :cond_15
    return-void
.end method

.method protected abstract copyTo(II[C)V
.end method

.method public final decimalValue(Z)Ljava/lang/Number;
    .registers 7
    .param p1, "decimal"    # Z

    .prologue
    .line 2977
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    iget v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int/2addr v2, v3

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2979
    .local v0, "chLocal":C
    const/16 v2, 0x46

    if-ne v0, v2, :cond_1c

    .line 2980
    :try_start_f
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    .line 2990
    :goto_1b
    return-object v2

    .line 2983
    :cond_1c
    const/16 v2, 0x44

    if-ne v0, v2, :cond_2d

    .line 2984
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    goto :goto_1b

    .line 2987
    :cond_2d
    if-eqz p1, :cond_34

    .line 2988
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->decimalValue()Ljava/math/BigDecimal;

    move-result-object v2

    goto :goto_1b

    .line 2990
    :cond_34
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->doubleValue()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;
    :try_end_3b
    .catch Ljava/lang/NumberFormatException; {:try_start_f .. :try_end_3b} :catch_3d

    move-result-object v2

    goto :goto_1b

    .line 2992
    :catch_3d
    move-exception v1

    .line 2993
    .local v1, "ex":Ljava/lang/NumberFormatException;
    new-instance v2, Lcom/alibaba/fastjson/JSONException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->info()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public final decimalValue()Ljava/math/BigDecimal;
    .registers 3

    .prologue
    .line 2998
    new-instance v0, Ljava/math/BigDecimal;

    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public doubleValue()D
    .registers 3

    .prologue
    .line 506
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    return-wide v0
.end method

.method public floatValue()F
    .registers 2

    .prologue
    .line 502
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    return v0
.end method

.method public getCalendar()Ljava/util/Calendar;
    .registers 2

    .prologue
    .line 985
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    return-object v0
.end method

.method public final getCurrent()C
    .registers 2

    .prologue
    .line 530
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    return v0
.end method

.method public getLocale()Ljava/util/Locale;
    .registers 2

    .prologue
    .line 997
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->locale:Ljava/util/Locale;

    return-object v0
.end method

.method public getTimeZone()Ljava/util/TimeZone;
    .registers 2

    .prologue
    .line 989
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->timeZone:Ljava/util/TimeZone;

    return-object v0
.end method

.method public abstract indexOf(CI)I
.end method

.method public info()Ljava/lang/String;
    .registers 2

    .prologue
    .line 797
    const-string v0, ""

    return-object v0
.end method

.method public final intValue()I
    .registers 13

    .prologue
    .line 1005
    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    const/4 v11, -0x1

    if-ne v10, v11, :cond_8

    .line 1006
    const/4 v10, 0x0

    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 1009
    :cond_8
    const/4 v9, 0x0

    .line 1010
    .local v9, "result":I
    const/4 v8, 0x0

    .line 1011
    .local v8, "negative":Z
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .local v2, "i":I
    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    iget v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int v5, v10, v11

    .line 1015
    .local v5, "max":I
    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v10

    const/16 v11, 0x2d

    if-ne v10, v11, :cond_4e

    .line 1016
    const/4 v8, 0x1

    .line 1017
    const/high16 v4, -0x80000000

    .line 1018
    .local v4, "limit":I
    add-int/lit8 v2, v2, 0x1

    move v3, v2

    .line 1022
    .end local v2    # "i":I
    .local v3, "i":I
    :goto_22
    const-wide/32 v6, -0xccccccc

    .line 1023
    .local v6, "multmin":J
    if-ge v3, v5, :cond_31

    .line 1024
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v10

    add-int/lit8 v1, v10, -0x30

    .line 1025
    .local v1, "digit":I
    neg-int v9, v1

    move v3, v2

    .line 1027
    .end local v1    # "digit":I
    .end local v2    # "i":I
    .restart local v3    # "i":I
    :cond_31
    :goto_31
    if-ge v3, v5, :cond_83

    .line 1029
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1031
    .local v0, "chLocal":C
    const/16 v10, 0x4c

    if-eq v0, v10, :cond_45

    const/16 v10, 0x53

    if-eq v0, v10, :cond_45

    const/16 v10, 0x42

    if-ne v0, v10, :cond_53

    .line 1047
    .end local v0    # "chLocal":C
    :cond_45
    :goto_45
    if-eqz v8, :cond_81

    .line 1048
    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    add-int/lit8 v10, v10, 0x1

    if-le v2, v10, :cond_77

    .line 1054
    .end local v9    # "result":I
    :goto_4d
    return v9

    .line 1020
    .end local v4    # "limit":I
    .end local v6    # "multmin":J
    .restart local v9    # "result":I
    :cond_4e
    const v4, -0x7fffffff

    .restart local v4    # "limit":I
    move v3, v2

    .end local v2    # "i":I
    .restart local v3    # "i":I
    goto :goto_22

    .line 1035
    .end local v3    # "i":I
    .restart local v0    # "chLocal":C
    .restart local v2    # "i":I
    .restart local v6    # "multmin":J
    :cond_53
    add-int/lit8 v1, v0, -0x30

    .line 1037
    .restart local v1    # "digit":I
    int-to-long v10, v9

    cmp-long v10, v10, v6

    if-gez v10, :cond_64

    .line 1038
    new-instance v10, Ljava/lang/NumberFormatException;

    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 1040
    :cond_64
    mul-int/lit8 v9, v9, 0xa

    .line 1041
    add-int v10, v4, v1

    if-ge v9, v10, :cond_74

    .line 1042
    new-instance v10, Ljava/lang/NumberFormatException;

    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 1044
    :cond_74
    sub-int/2addr v9, v1

    move v3, v2

    .line 1045
    .end local v2    # "i":I
    .restart local v3    # "i":I
    goto :goto_31

    .line 1051
    .end local v0    # "chLocal":C
    .end local v1    # "digit":I
    .end local v3    # "i":I
    .restart local v2    # "i":I
    :cond_77
    new-instance v10, Ljava/lang/NumberFormatException;

    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 1054
    :cond_81
    neg-int v9, v9

    goto :goto_4d

    .end local v2    # "i":I
    .restart local v3    # "i":I
    :cond_83
    move v2, v3

    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_45
.end method

.method public final integerValue()Ljava/lang/Number;
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 409
    const-wide/16 v9, 0x0

    .line 410
    .local v9, "result":J
    const/4 v8, 0x0

    .line 411
    .local v8, "negative":Z
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    const/4 v13, -0x1

    if-ne v12, v13, :cond_b

    .line 412
    const/4 v12, 0x0

    iput v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 414
    :cond_b
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .local v1, "i":I
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    iget v13, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int v5, v12, v13

    .line 419
    .local v5, "max":I
    const/16 v11, 0x20

    .line 421
    .local v11, "type":C
    add-int/lit8 v12, v5, -0x1

    invoke-virtual {p0, v12}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v12

    sparse-switch v12, :sswitch_data_fc

    .line 438
    :goto_1e
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    invoke-virtual {p0, v12}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v12

    const/16 v13, 0x2d

    if-ne v12, v13, :cond_67

    .line 439
    const/4 v8, 0x1

    .line 440
    const-wide/high16 v3, -0x8000000000000000L

    .line 441
    .local v3, "limit":J
    add-int/lit8 v1, v1, 0x1

    move v2, v1

    .line 445
    .end local v1    # "i":I
    .local v2, "i":I
    :goto_2e
    const-wide v6, -0xcccccccccccccccL

    .line 446
    .local v6, "multmin":J
    if-ge v2, v5, :cond_40

    .line 447
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v12

    add-int/lit8 v0, v12, -0x30

    .line 448
    .local v0, "digit":I
    neg-int v12, v0

    int-to-long v9, v12

    move v2, v1

    .line 450
    .end local v0    # "digit":I
    .end local v1    # "i":I
    .restart local v2    # "i":I
    :cond_40
    :goto_40
    if-ge v2, v5, :cond_85

    .line 452
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v12

    add-int/lit8 v0, v12, -0x30

    .line 453
    .restart local v0    # "digit":I
    cmp-long v12, v9, v6

    if-gez v12, :cond_6e

    .line 454
    new-instance v12, Ljava/math/BigInteger;

    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 493
    .end local v0    # "digit":I
    :goto_57
    return-object v12

    .line 423
    .end local v3    # "limit":J
    .end local v6    # "multmin":J
    :sswitch_58
    add-int/lit8 v5, v5, -0x1

    .line 424
    const/16 v11, 0x4c

    .line 425
    goto :goto_1e

    .line 427
    :sswitch_5d
    add-int/lit8 v5, v5, -0x1

    .line 428
    const/16 v11, 0x53

    .line 429
    goto :goto_1e

    .line 431
    :sswitch_62
    add-int/lit8 v5, v5, -0x1

    .line 432
    const/16 v11, 0x42

    .line 433
    goto :goto_1e

    .line 443
    :cond_67
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .restart local v3    # "limit":J
    move v2, v1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    goto :goto_2e

    .line 456
    .end local v2    # "i":I
    .restart local v0    # "digit":I
    .restart local v1    # "i":I
    .restart local v6    # "multmin":J
    :cond_6e
    const-wide/16 v12, 0xa

    mul-long/2addr v9, v12

    .line 457
    int-to-long v12, v0

    add-long/2addr v12, v3

    cmp-long v12, v9, v12

    if-gez v12, :cond_81

    .line 458
    new-instance v12, Ljava/math/BigInteger;

    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    goto :goto_57

    .line 460
    :cond_81
    int-to-long v12, v0

    sub-long/2addr v9, v12

    move v2, v1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    goto :goto_40

    .line 463
    .end local v0    # "digit":I
    :cond_85
    if-eqz v8, :cond_c7

    .line 464
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    add-int/lit8 v12, v12, 0x1

    if-le v2, v12, :cond_bd

    .line 465
    const-wide/32 v12, -0x80000000

    cmp-long v12, v9, v12

    if-ltz v12, :cond_b7

    const/16 v12, 0x4c

    if-eq v11, v12, :cond_b7

    .line 466
    const/16 v12, 0x53

    if-ne v11, v12, :cond_a4

    .line 467
    long-to-int v12, v9

    int-to-short v12, v12

    invoke-static {v12}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v12

    move v1, v2

    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_57

    .line 470
    .end local v1    # "i":I
    .restart local v2    # "i":I
    :cond_a4
    const/16 v12, 0x42

    if-ne v11, v12, :cond_b0

    .line 471
    long-to-int v12, v9

    int-to-byte v12, v12

    invoke-static {v12}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v12

    move v1, v2

    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_57

    .line 474
    .end local v1    # "i":I
    .restart local v2    # "i":I
    :cond_b0
    long-to-int v12, v9

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    move v1, v2

    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_57

    .line 476
    .end local v1    # "i":I
    .restart local v2    # "i":I
    :cond_b7
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    move v1, v2

    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_57

    .line 478
    .end local v1    # "i":I
    .restart local v2    # "i":I
    :cond_bd
    new-instance v12, Ljava/lang/NumberFormatException;

    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 481
    :cond_c7
    neg-long v9, v9

    .line 482
    const-wide/32 v12, 0x7fffffff

    cmp-long v12, v9, v12

    if-gtz v12, :cond_f5

    const/16 v12, 0x4c

    if-eq v11, v12, :cond_f5

    .line 483
    const/16 v12, 0x53

    if-ne v11, v12, :cond_e0

    .line 484
    long-to-int v12, v9

    int-to-short v12, v12

    invoke-static {v12}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v12

    move v1, v2

    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto/16 :goto_57

    .line 487
    .end local v1    # "i":I
    .restart local v2    # "i":I
    :cond_e0
    const/16 v12, 0x42

    if-ne v11, v12, :cond_ed

    .line 488
    long-to-int v12, v9

    int-to-byte v12, v12

    invoke-static {v12}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v12

    move v1, v2

    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto/16 :goto_57

    .line 491
    .end local v1    # "i":I
    .restart local v2    # "i":I
    :cond_ed
    long-to-int v12, v9

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    move v1, v2

    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto/16 :goto_57

    .line 493
    .end local v1    # "i":I
    .restart local v2    # "i":I
    :cond_f5
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    move v1, v2

    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto/16 :goto_57

    .line 421
    :sswitch_data_fc
    .sparse-switch
        0x42 -> :sswitch_62
        0x4c -> :sswitch_58
        0x53 -> :sswitch_5d
    .end sparse-switch
.end method

.method public final isBlankInput()Z
    .registers 4

    .prologue
    .line 2673
    const/4 v1, 0x0

    .line 2674
    .local v1, "i":I
    :goto_1
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2675
    .local v0, "chLocal":C
    const/16 v2, 0x1a

    if-ne v0, v2, :cond_b

    .line 2684
    const/4 v2, 0x1

    :goto_a
    return v2

    .line 2679
    :cond_b
    invoke-static {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    move-result v2

    if-nez v2, :cond_13

    .line 2680
    const/4 v2, 0x0

    goto :goto_a

    .line 2673
    :cond_13
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public abstract isEOF()Z
.end method

.method public final isEnabled(I)Z
    .registers 3
    .param p1, "feature"    # I

    .prologue
    .line 522
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->features:I

    and-int/2addr v0, p1

    if-eqz v0, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public final isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z
    .registers 3
    .param p1, "feature"    # Lcom/alibaba/fastjson/parser/Feature;

    .prologue
    .line 518
    iget v0, p1, Lcom/alibaba/fastjson/parser/Feature;->mask:I

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isEnabled(I)Z

    move-result v0

    return v0
.end method

.method public final isRef()Z
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 1068
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    const/4 v2, 0x4

    if-eq v1, v2, :cond_7

    .line 1075
    :cond_6
    :goto_6
    return v0

    .line 1072
    :cond_7
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v1

    const/16 v2, 0x24

    if-ne v1, v2, :cond_6

    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    add-int/lit8 v1, v1, 0x2

    .line 1073
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v1

    const/16 v2, 0x72

    if-ne v1, v2, :cond_6

    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    add-int/lit8 v1, v1, 0x3

    .line 1074
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v1

    const/16 v2, 0x65

    if-ne v1, v2, :cond_6

    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    add-int/lit8 v1, v1, 0x4

    .line 1075
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v1

    const/16 v2, 0x66

    if-ne v1, v2, :cond_6

    const/4 v0, 0x1

    goto :goto_6
.end method

.method protected varargs lexError(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 50
    const/4 v0, 0x1

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 51
    return-void
.end method

.method public final longValue()J
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 2923
    const-wide/16 v10, 0x0

    .line 2924
    .local v10, "result":J
    const/4 v9, 0x0

    .line 2928
    .local v9, "negative":Z
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    const/4 v13, -0x1

    if-ne v12, v13, :cond_b

    .line 2929
    const/4 v12, 0x0

    iput v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 2932
    :cond_b
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .local v2, "i":I
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    iget v13, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int v6, v12, v13

    .line 2934
    .local v6, "max":I
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    invoke-virtual {p0, v12}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v12

    const/16 v13, 0x2d

    if-ne v12, v13, :cond_52

    .line 2935
    const/4 v9, 0x1

    .line 2936
    const-wide/high16 v4, -0x8000000000000000L

    .line 2937
    .local v4, "limit":J
    add-int/lit8 v2, v2, 0x1

    move v3, v2

    .line 2941
    .end local v2    # "i":I
    .local v3, "i":I
    :goto_23
    const-wide v7, -0xcccccccccccccccL

    .line 2942
    .local v7, "multmin":J
    if-ge v3, v6, :cond_35

    .line 2943
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v12

    add-int/lit8 v1, v12, -0x30

    .line 2944
    .local v1, "digit":I
    neg-int v12, v1

    int-to-long v10, v12

    move v3, v2

    .line 2946
    .end local v1    # "digit":I
    .end local v2    # "i":I
    .restart local v3    # "i":I
    :cond_35
    :goto_35
    if-ge v3, v6, :cond_8c

    .line 2948
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2950
    .local v0, "chLocal":C
    const/16 v12, 0x4c

    if-eq v0, v12, :cond_49

    const/16 v12, 0x53

    if-eq v0, v12, :cond_49

    const/16 v12, 0x42

    if-ne v0, v12, :cond_59

    .line 2965
    .end local v0    # "chLocal":C
    :cond_49
    :goto_49
    if-eqz v9, :cond_8a

    .line 2966
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    add-int/lit8 v12, v12, 0x1

    if-le v2, v12, :cond_80

    .line 2972
    .end local v10    # "result":J
    :goto_51
    return-wide v10

    .line 2939
    .end local v4    # "limit":J
    .end local v7    # "multmin":J
    .restart local v10    # "result":J
    :cond_52
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .restart local v4    # "limit":J
    move v3, v2

    .end local v2    # "i":I
    .restart local v3    # "i":I
    goto :goto_23

    .line 2954
    .end local v3    # "i":I
    .restart local v0    # "chLocal":C
    .restart local v2    # "i":I
    .restart local v7    # "multmin":J
    :cond_59
    add-int/lit8 v1, v0, -0x30

    .line 2955
    .restart local v1    # "digit":I
    cmp-long v12, v10, v7

    if-gez v12, :cond_69

    .line 2956
    new-instance v12, Ljava/lang/NumberFormatException;

    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 2958
    :cond_69
    const-wide/16 v12, 0xa

    mul-long/2addr v10, v12

    .line 2959
    int-to-long v12, v1

    add-long/2addr v12, v4

    cmp-long v12, v10, v12

    if-gez v12, :cond_7c

    .line 2960
    new-instance v12, Ljava/lang/NumberFormatException;

    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 2962
    :cond_7c
    int-to-long v12, v1

    sub-long/2addr v10, v12

    move v3, v2

    .line 2963
    .end local v2    # "i":I
    .restart local v3    # "i":I
    goto :goto_35

    .line 2969
    .end local v0    # "chLocal":C
    .end local v1    # "digit":I
    .end local v3    # "i":I
    .restart local v2    # "i":I
    :cond_80
    new-instance v12, Ljava/lang/NumberFormatException;

    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->numberString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 2972
    :cond_8a
    neg-long v10, v10

    goto :goto_51

    .end local v2    # "i":I
    .restart local v3    # "i":I
    :cond_8c
    move v2, v3

    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_49
.end method

.method public final matchField([C)Z
    .registers 5
    .param p1, "fieldName"    # [C

    .prologue
    const/16 v2, 0x5b

    .line 1131
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    move-result v0

    if-nez v0, :cond_a

    .line 1132
    const/4 v0, 0x0

    .line 1152
    :goto_9
    return v0

    .line 1135
    :cond_a
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    array-length v1, p1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1136
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    iput-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1138
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x7b

    if-ne v0, v1, :cond_27

    .line 1139
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 1140
    const/16 v0, 0xc

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1152
    :goto_25
    const/4 v0, 0x1

    goto :goto_9

    .line 1141
    :cond_27
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v0, v2, :cond_33

    .line 1142
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 1143
    const/16 v0, 0xe

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_25

    .line 1144
    :cond_33
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x53

    if-ne v0, v1, :cond_6e

    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    const/16 v1, 0x65

    if-ne v0, v1, :cond_6e

    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v0, v0, 0x2

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    const/16 v1, 0x74

    if-ne v0, v1, :cond_6e

    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v0, v0, 0x3

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    if-ne v0, v2, :cond_6e

    .line 1145
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v0, v0, 0x3

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1146
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    iput-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1147
    const/16 v0, 0x15

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_25

    .line 1149
    :cond_6e
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V

    goto :goto_25
.end method

.method public final matchStat()I
    .registers 2

    .prologue
    .line 100
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    return v0
.end method

.method public abstract next()C
.end method

.method public final nextIdent()V
    .registers 3

    .prologue
    .line 359
    :goto_0
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    invoke-static {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 360
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto :goto_0

    .line 362
    :cond_c
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x5f

    if-eq v0, v1, :cond_1a

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    invoke-static {v0}, Ljava/lang/Character;->isLetter(C)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 363
    :cond_1a
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanIdent()V

    .line 367
    :goto_1d
    return-void

    .line 365
    :cond_1e
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V

    goto :goto_1d
.end method

.method public final nextToken()V
    .registers 5

    .prologue
    const/16 v2, 0x14

    const/4 v3, 0x0

    .line 112
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 115
    :goto_5
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->pos:I

    .line 117
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x2f

    if-ne v0, v1, :cond_13

    .line 118
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipComment()V

    goto :goto_5

    .line 122
    :cond_13
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x22

    if-ne v0, v1, :cond_1d

    .line 123
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanString()V

    .line 218
    :goto_1c
    return-void

    .line 127
    :cond_1d
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x2c

    if-ne v0, v1, :cond_2b

    .line 128
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 129
    const/16 v0, 0x10

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_1c

    .line 133
    :cond_2b
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x30

    if-lt v0, v1, :cond_3b

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x39

    if-gt v0, v1, :cond_3b

    .line 134
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanNumber()V

    goto :goto_1c

    .line 138
    :cond_3b
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x2d

    if-ne v0, v1, :cond_45

    .line 139
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanNumber()V

    goto :goto_1c

    .line 143
    :cond_45
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    sparse-switch v0, :sswitch_data_f0

    .line 202
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isEOF()Z

    move-result v0

    if-eqz v0, :cond_ca

    .line 203
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    if-ne v0, v2, :cond_c0

    .line 204
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "EOF error"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 145
    :sswitch_5c
    sget-object v0, Lcom/alibaba/fastjson/parser/Feature;->AllowSingleQuotes:Lcom/alibaba/fastjson/parser/Feature;

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v0

    if-nez v0, :cond_6c

    .line 146
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "Feature.AllowSingleQuotes is false"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 148
    :cond_6c
    invoke-direct {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanStringSingleQuote()V

    goto :goto_1c

    .line 156
    :sswitch_70
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto :goto_5

    .line 159
    :sswitch_74
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanTrue()V

    goto :goto_1c

    .line 162
    :sswitch_78
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanFalse()V

    goto :goto_1c

    .line 165
    :sswitch_7c
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanNullOrNew()V

    goto :goto_1c

    .line 171
    :sswitch_80
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanIdent()V

    goto :goto_1c

    .line 174
    :sswitch_84
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 175
    const/16 v0, 0xa

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_1c

    .line 178
    :sswitch_8c
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 179
    const/16 v0, 0xb

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_1c

    .line 182
    :sswitch_94
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 183
    const/16 v0, 0xe

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_1c

    .line 186
    :sswitch_9c
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 187
    const/16 v0, 0xf

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto/16 :goto_1c

    .line 190
    :sswitch_a5
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 191
    const/16 v0, 0xc

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto/16 :goto_1c

    .line 194
    :sswitch_ae
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 195
    const/16 v0, 0xd

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto/16 :goto_1c

    .line 198
    :sswitch_b7
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 199
    const/16 v0, 0x11

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto/16 :goto_1c

    .line 207
    :cond_c0
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 208
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->eofPos:I

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->pos:I

    goto/16 :goto_1c

    .line 210
    :cond_ca
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x1f

    if-le v0, v1, :cond_d6

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x7f

    if-ne v0, v1, :cond_db

    .line 211
    :cond_d6
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto/16 :goto_5

    .line 214
    :cond_db
    const-string v0, "illegal.char"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-char v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-virtual {p0, v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->lexError(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 215
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto/16 :goto_1c

    .line 143
    :sswitch_data_f0
    .sparse-switch
        0x8 -> :sswitch_70
        0x9 -> :sswitch_70
        0xa -> :sswitch_70
        0xc -> :sswitch_70
        0xd -> :sswitch_70
        0x20 -> :sswitch_70
        0x27 -> :sswitch_5c
        0x28 -> :sswitch_84
        0x29 -> :sswitch_8c
        0x3a -> :sswitch_b7
        0x4e -> :sswitch_80
        0x53 -> :sswitch_80
        0x54 -> :sswitch_80
        0x5b -> :sswitch_94
        0x5d -> :sswitch_9c
        0x66 -> :sswitch_78
        0x6e -> :sswitch_7c
        0x74 -> :sswitch_74
        0x75 -> :sswitch_80
        0x7b -> :sswitch_a5
        0x7d -> :sswitch_ae
    .end sparse-switch
.end method

.method public final nextToken(I)V
    .registers 9
    .param p1, "expect"    # I

    .prologue
    const/16 v6, 0xd

    const/16 v5, 0x7b

    const/16 v4, 0x5b

    const/16 v3, 0xe

    const/16 v2, 0xc

    .line 225
    const/4 v0, 0x0

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 228
    :goto_d
    packed-switch p1, :pswitch_data_126

    .line 348
    :cond_10
    :pswitch_10
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x20

    if-eq v0, v1, :cond_30

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0xa

    if-eq v0, v1, :cond_30

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-eq v0, v6, :cond_30

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x9

    if-eq v0, v1, :cond_30

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-eq v0, v2, :cond_30

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x8

    if-ne v0, v1, :cond_121

    .line 349
    :cond_30
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto :goto_d

    .line 230
    :pswitch_34
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v0, v5, :cond_3e

    .line 231
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 232
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 356
    :goto_3d
    return-void

    .line 235
    :cond_3e
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v0, v4, :cond_10

    .line 236
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 237
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto :goto_3d

    .line 242
    :pswitch_48
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x2c

    if-ne v0, v1, :cond_56

    .line 243
    const/16 v0, 0x10

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 244
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto :goto_3d

    .line 248
    :cond_56
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x7d

    if-ne v0, v1, :cond_62

    .line 249
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 250
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto :goto_3d

    .line 254
    :cond_62
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x5d

    if-ne v0, v1, :cond_70

    .line 255
    const/16 v0, 0xf

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 256
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto :goto_3d

    .line 260
    :cond_70
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x1a

    if-ne v0, v1, :cond_10

    .line 261
    const/16 v0, 0x14

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_3d

    .line 266
    :pswitch_7b
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x30

    if-lt v0, v1, :cond_8f

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x39

    if-gt v0, v1, :cond_8f

    .line 267
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->pos:I

    .line 268
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanNumber()V

    goto :goto_3d

    .line 272
    :cond_8f
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x22

    if-ne v0, v1, :cond_9d

    .line 273
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->pos:I

    .line 274
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanString()V

    goto :goto_3d

    .line 278
    :cond_9d
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v0, v4, :cond_a7

    .line 279
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 280
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto :goto_3d

    .line 284
    :cond_a7
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v0, v5, :cond_10

    .line 285
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 286
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto :goto_3d

    .line 292
    :pswitch_b1
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x22

    if-ne v0, v1, :cond_c0

    .line 293
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->pos:I

    .line 294
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanString()V

    goto/16 :goto_3d

    .line 298
    :cond_c0
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x30

    if-lt v0, v1, :cond_d5

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x39

    if-gt v0, v1, :cond_d5

    .line 299
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->pos:I

    .line 300
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanNumber()V

    goto/16 :goto_3d

    .line 304
    :cond_d5
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v0, v4, :cond_e0

    .line 305
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 306
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto/16 :goto_3d

    .line 310
    :cond_e0
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v0, v5, :cond_10

    .line 311
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 312
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto/16 :goto_3d

    .line 317
    :pswitch_eb
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v0, v4, :cond_f6

    .line 318
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 319
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto/16 :goto_3d

    .line 323
    :cond_f6
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v0, v5, :cond_10

    .line 324
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 325
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto/16 :goto_3d

    .line 330
    :pswitch_101
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x5d

    if-ne v0, v1, :cond_110

    .line 331
    const/16 v0, 0xf

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 332
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto/16 :goto_3d

    .line 336
    :cond_110
    :pswitch_110
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x1a

    if-ne v0, v1, :cond_10

    .line 337
    const/16 v0, 0x14

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto/16 :goto_3d

    .line 342
    :pswitch_11c
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextIdent()V

    goto/16 :goto_3d

    .line 353
    :cond_121
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V

    goto/16 :goto_3d

    .line 228
    :pswitch_data_126
    .packed-switch 0x2
        :pswitch_7b
        :pswitch_10
        :pswitch_b1
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_34
        :pswitch_10
        :pswitch_eb
        :pswitch_101
        :pswitch_48
        :pswitch_10
        :pswitch_11c
        :pswitch_10
        :pswitch_110
    .end packed-switch
.end method

.method public final nextTokenWithChar(C)V
    .registers 5
    .param p1, "expect"    # C

    .prologue
    .line 374
    const/4 v0, 0x0

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 377
    :goto_3
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v0, p1, :cond_e

    .line 378
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 379
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V

    .line 380
    return-void

    .line 383
    :cond_e
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x20

    if-eq v0, v1, :cond_32

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0xa

    if-eq v0, v1, :cond_32

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0xd

    if-eq v0, v1, :cond_32

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x9

    if-eq v0, v1, :cond_32

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0xc

    if-eq v0, v1, :cond_32

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x8

    if-ne v0, v1, :cond_36

    .line 384
    :cond_32
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto :goto_3

    .line 388
    :cond_36
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "not match "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-char v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final nextTokenWithColon()V
    .registers 2

    .prologue
    .line 370
    const/16 v0, 0x3a

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextTokenWithChar(C)V

    .line 371
    return-void
.end method

.method public final nextTokenWithColon(I)V
    .registers 3
    .param p1, "expect"    # I

    .prologue
    .line 498
    const/16 v0, 0x3a

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextTokenWithChar(C)V

    .line 499
    return-void
.end method

.method public abstract numberString()Ljava/lang/String;
.end method

.method public final pos()I
    .registers 2

    .prologue
    .line 401
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->pos:I

    return v0
.end method

.method protected final putChar(C)V
    .registers 6
    .param p1, "ch"    # C

    .prologue
    const/4 v3, 0x0

    .line 2830
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    iget-object v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    array-length v2, v2

    if-ne v1, v2, :cond_19

    .line 2831
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x2

    new-array v0, v1, [C

    .line 2832
    .local v0, "newsbuf":[C
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    iget-object v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    array-length v2, v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2833
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 2835
    .end local v0    # "newsbuf":[C
    :cond_19
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    aput-char p1, v1, v2

    .line 2836
    return-void
.end method

.method public final resetStringPosition()V
    .registers 2

    .prologue
    .line 793
    const/4 v0, 0x0

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 794
    return-void
.end method

.method public scanBoolean(C)Z
    .registers 11
    .param p1, "expectNext"    # C

    .prologue
    const/16 v8, 0x65

    const/4 v4, 0x0

    const/4 v7, -0x1

    .line 1808
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1810
    const/4 v1, 0x0

    .line 1811
    .local v1, "offset":I
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "offset":I
    .local v2, "offset":I
    add-int/2addr v5, v1

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1813
    .local v0, "chLocal":C
    const/4 v3, 0x0

    .line 1814
    .local v3, "value":Z
    const/16 v5, 0x74

    if-ne v0, v5, :cond_62

    .line 1815
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v5

    const/16 v6, 0x72

    if-ne v5, v6, :cond_5e

    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v5, v5, 0x1

    add-int/lit8 v5, v5, 0x1

    .line 1816
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v5

    const/16 v6, 0x75

    if-ne v5, v6, :cond_5e

    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v5, v5, 0x1

    add-int/lit8 v5, v5, 0x2

    .line 1817
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v5

    if-ne v5, v8, :cond_5e

    .line 1818
    add-int/lit8 v1, v2, 0x3

    .line 1819
    .end local v2    # "offset":I
    .restart local v1    # "offset":I
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v4, v4, 0x4

    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1820
    const/4 v3, 0x1

    move v2, v1

    .line 1846
    .end local v1    # "offset":I
    .restart local v2    # "offset":I
    :cond_49
    :goto_49
    if-ne v0, p1, :cond_d0

    .line 1847
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v4, v2

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1848
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v4

    iput-char v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1849
    const/4 v4, 0x3

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v1, v2

    .end local v2    # "offset":I
    .restart local v1    # "offset":I
    move v4, v3

    .line 1857
    :goto_5d
    return v4

    .line 1822
    .end local v1    # "offset":I
    .restart local v2    # "offset":I
    :cond_5e
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v1, v2

    .line 1823
    .end local v2    # "offset":I
    .restart local v1    # "offset":I
    goto :goto_5d

    .line 1825
    .end local v1    # "offset":I
    .restart local v2    # "offset":I
    :cond_62
    const/16 v5, 0x66

    if-ne v0, v5, :cond_ad

    .line 1826
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v5

    const/16 v6, 0x61

    if-ne v5, v6, :cond_a9

    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v5, v5, 0x1

    add-int/lit8 v5, v5, 0x1

    .line 1827
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v5

    const/16 v6, 0x6c

    if-ne v5, v6, :cond_a9

    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v5, v5, 0x1

    add-int/lit8 v5, v5, 0x2

    .line 1828
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v5

    const/16 v6, 0x73

    if-ne v5, v6, :cond_a9

    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v5, v5, 0x1

    add-int/lit8 v5, v5, 0x3

    .line 1829
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v5

    if-ne v5, v8, :cond_a9

    .line 1830
    add-int/lit8 v1, v2, 0x4

    .line 1831
    .end local v2    # "offset":I
    .restart local v1    # "offset":I
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v4, v4, 0x5

    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1832
    const/4 v3, 0x0

    move v2, v1

    .end local v1    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_49

    .line 1834
    :cond_a9
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v1, v2

    .line 1835
    .end local v2    # "offset":I
    .restart local v1    # "offset":I
    goto :goto_5d

    .line 1837
    .end local v1    # "offset":I
    .restart local v2    # "offset":I
    :cond_ad
    const/16 v4, 0x31

    if-ne v0, v4, :cond_be

    .line 1838
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v1, v2, 0x1

    .end local v2    # "offset":I
    .restart local v1    # "offset":I
    add-int/lit8 v4, v4, 0x1

    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1839
    const/4 v3, 0x1

    move v2, v1

    .end local v1    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_49

    .line 1840
    :cond_be
    const/16 v4, 0x30

    if-ne v0, v4, :cond_49

    .line 1841
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v1, v2, 0x1

    .end local v2    # "offset":I
    .restart local v1    # "offset":I
    add-int/lit8 v4, v4, 0x1

    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1842
    const/4 v3, 0x0

    move v2, v1

    .end local v1    # "offset":I
    .restart local v2    # "offset":I
    goto/16 :goto_49

    .line 1852
    :cond_d0
    invoke-static {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    move-result v4

    if-eqz v4, :cond_e2

    .line 1853
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v1, v2, 0x1

    .end local v2    # "offset":I
    .restart local v1    # "offset":I
    add-int/2addr v4, v2

    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    move v2, v1

    .line 1854
    .end local v1    # "offset":I
    .restart local v2    # "offset":I
    goto/16 :goto_49

    .line 1856
    :cond_e2
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v1, v2

    .end local v2    # "offset":I
    .restart local v1    # "offset":I
    move v4, v3

    .line 1857
    goto/16 :goto_5d
.end method

.method public final scanDouble(C)D
    .registers 14
    .param p1, "seperator"    # C

    .prologue
    const-wide/16 v6, 0x0

    const/4 v11, -0x1

    const/16 v10, 0x39

    const/16 v9, 0x30

    .line 2281
    const/4 v8, 0x0

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2283
    const/4 v2, 0x0

    .line 2284
    .local v2, "offset":I
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .local v3, "offset":I
    add-int/2addr v8, v2

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2287
    .local v0, "chLocal":C
    if-lt v0, v9, :cond_73

    if-gt v0, v10, :cond_73

    move v2, v3

    .line 2289
    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    :goto_19
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    add-int/2addr v8, v2

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2290
    if-lt v0, v9, :cond_28

    if-gt v0, v10, :cond_28

    move v2, v3

    .line 2291
    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_19

    .line 2297
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    :cond_28
    const/16 v8, 0x2e

    if-ne v0, v8, :cond_4b

    .line 2298
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    add-int/2addr v8, v3

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2299
    if-lt v0, v9, :cond_48

    if-gt v0, v10, :cond_48

    .line 2301
    :goto_39
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    add-int/2addr v8, v2

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2302
    if-lt v0, v9, :cond_4b

    if-gt v0, v10, :cond_4b

    move v2, v3

    .line 2303
    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_39

    .line 2309
    :cond_48
    iput v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2331
    :goto_4a
    return-wide v6

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    :cond_4b
    move v2, v3

    .line 2314
    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2315
    .local v4, "start":I
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v8, v2

    sub-int/2addr v8, v4

    add-int/lit8 v1, v8, -0x1

    .line 2316
    .local v1, "count":I
    invoke-virtual {p0, v4, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    move-result-object v5

    .line 2317
    .local v5, "text":Ljava/lang/String;
    invoke-static {v5}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v6

    .line 2323
    .local v6, "value":D
    if-ne v0, p1, :cond_77

    .line 2324
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v8, v2

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2325
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v8

    iput-char v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 2326
    const/4 v8, 0x3

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2327
    const/16 v8, 0x10

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_4a

    .line 2319
    .end local v1    # "count":I
    .end local v2    # "offset":I
    .end local v4    # "start":I
    .end local v5    # "text":Ljava/lang/String;
    .end local v6    # "value":D
    .restart local v3    # "offset":I
    :cond_73
    iput v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v2, v3

    .line 2320
    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_4a

    .line 2330
    .restart local v1    # "count":I
    .restart local v4    # "start":I
    .restart local v5    # "text":Ljava/lang/String;
    .restart local v6    # "value":D
    :cond_77
    iput v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    goto :goto_4a
.end method

.method public scanEnum(Ljava/lang/Class;Lcom/alibaba/fastjson/parser/SymbolTable;C)Ljava/lang/Enum;
    .registers 6
    .param p2, "symbolTable"    # Lcom/alibaba/fastjson/parser/SymbolTable;
    .param p3, "serperator"    # C
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/alibaba/fastjson/parser/SymbolTable;",
            "C)",
            "Ljava/lang/Enum",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 1408
    .local p1, "enumClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p2, p3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanSymbolWithSeperator(Lcom/alibaba/fastjson/parser/SymbolTable;C)Ljava/lang/String;

    move-result-object v0

    .line 1409
    .local v0, "name":Ljava/lang/String;
    if-nez v0, :cond_8

    .line 1410
    const/4 v1, 0x0

    .line 1412
    :goto_7
    return-object v1

    :cond_8
    invoke-static {p1, v0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v1

    goto :goto_7
.end method

.method public final scanFalse()V
    .registers 3

    .prologue
    .line 2511
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x66

    if-eq v0, v1, :cond_e

    .line 2512
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "error parse false"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2514
    :cond_e
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2516
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x61

    if-eq v0, v1, :cond_1f

    .line 2517
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "error parse false"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2519
    :cond_1f
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2521
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x6c

    if-eq v0, v1, :cond_30

    .line 2522
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "error parse false"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2524
    :cond_30
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2526
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x73

    if-eq v0, v1, :cond_41

    .line 2527
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "error parse false"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2529
    :cond_41
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2531
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x65

    if-eq v0, v1, :cond_52

    .line 2532
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "error parse false"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2534
    :cond_52
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2536
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x20

    if-eq v0, v1, :cond_97

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x2c

    if-eq v0, v1, :cond_97

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x7d

    if-eq v0, v1, :cond_97

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x5d

    if-eq v0, v1, :cond_97

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0xa

    if-eq v0, v1, :cond_97

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0xd

    if-eq v0, v1, :cond_97

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x9

    if-eq v0, v1, :cond_97

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x1a

    if-eq v0, v1, :cond_97

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0xc

    if-eq v0, v1, :cond_97

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x8

    if-eq v0, v1, :cond_97

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x3a

    if-ne v0, v1, :cond_9b

    .line 2538
    :cond_97
    const/4 v0, 0x7

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2542
    return-void

    .line 2540
    :cond_9b
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "scan false error"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public scanFieldBoolean([C)Z
    .registers 13
    .param p1, "fieldName"    # [C

    .prologue
    const/16 v10, 0x2c

    const/16 v9, 0x1a

    const/16 v8, 0x10

    const/4 v7, -0x1

    const/4 v4, 0x0

    .line 1915
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1917
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    move-result v5

    if-nez v5, :cond_15

    .line 1918
    const/4 v5, -0x2

    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v3, v4

    .line 2003
    :goto_14
    return v3

    .line 1922
    :cond_15
    array-length v1, p1

    .line 1923
    .local v1, "offset":I
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "offset":I
    .local v2, "offset":I
    add-int/2addr v5, v1

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1926
    .local v0, "chLocal":C
    const/16 v5, 0x74

    if-ne v0, v5, :cond_75

    .line 1927
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v1, v2, 0x1

    .end local v2    # "offset":I
    .restart local v1    # "offset":I
    add-int/2addr v5, v2

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v5

    const/16 v6, 0x72

    if-eq v5, v6, :cond_34

    .line 1928
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v3, v4

    .line 1929
    goto :goto_14

    .line 1931
    :cond_34
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "offset":I
    .restart local v2    # "offset":I
    add-int/2addr v5, v1

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v5

    const/16 v6, 0x75

    if-eq v5, v6, :cond_45

    .line 1932
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v3, v4

    .line 1933
    goto :goto_14

    .line 1935
    :cond_45
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v1, v2, 0x1

    .end local v2    # "offset":I
    .restart local v1    # "offset":I
    add-int/2addr v5, v2

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v5

    const/16 v6, 0x65

    if-eq v5, v6, :cond_56

    .line 1936
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v3, v4

    .line 1937
    goto :goto_14

    .line 1940
    :cond_56
    const/4 v3, 0x1

    .line 1965
    .local v3, "value":Z
    :goto_57
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "offset":I
    .restart local v2    # "offset":I
    add-int/2addr v5, v1

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1966
    if-ne v0, v10, :cond_c8

    .line 1967
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v4, v2

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1968
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v4

    iput-char v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1969
    const/4 v4, 0x3

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1970
    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_14

    .line 1941
    .end local v3    # "value":Z
    :cond_75
    const/16 v5, 0x66

    if-ne v0, v5, :cond_c3

    .line 1942
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v1, v2, 0x1

    .end local v2    # "offset":I
    .restart local v1    # "offset":I
    add-int/2addr v5, v2

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v5

    const/16 v6, 0x61

    if-eq v5, v6, :cond_8a

    .line 1943
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v3, v4

    .line 1944
    goto :goto_14

    .line 1946
    :cond_8a
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "offset":I
    .restart local v2    # "offset":I
    add-int/2addr v5, v1

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v5

    const/16 v6, 0x6c

    if-eq v5, v6, :cond_9c

    .line 1947
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v3, v4

    .line 1948
    goto/16 :goto_14

    .line 1950
    :cond_9c
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v1, v2, 0x1

    .end local v2    # "offset":I
    .restart local v1    # "offset":I
    add-int/2addr v5, v2

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v5

    const/16 v6, 0x73

    if-eq v5, v6, :cond_ae

    .line 1951
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v3, v4

    .line 1952
    goto/16 :goto_14

    .line 1954
    :cond_ae
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "offset":I
    .restart local v2    # "offset":I
    add-int/2addr v5, v1

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v5

    const/16 v6, 0x65

    if-eq v5, v6, :cond_c0

    .line 1955
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v3, v4

    .line 1956
    goto/16 :goto_14

    .line 1959
    :cond_c0
    const/4 v3, 0x0

    .restart local v3    # "value":Z
    move v1, v2

    .end local v2    # "offset":I
    .restart local v1    # "offset":I
    goto :goto_57

    .line 1961
    .end local v1    # "offset":I
    .end local v3    # "value":Z
    .restart local v2    # "offset":I
    :cond_c3
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v3, v4

    .line 1962
    goto/16 :goto_14

    .line 1975
    .restart local v3    # "value":Z
    :cond_c8
    const/16 v5, 0x7d

    if-ne v0, v5, :cond_12c

    .line 1976
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v1, v2, 0x1

    .end local v2    # "offset":I
    .restart local v1    # "offset":I
    add-int/2addr v5, v2

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1977
    if-ne v0, v10, :cond_eb

    .line 1978
    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1979
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v4, v1

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1980
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v4

    iput-char v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1997
    :goto_e6
    const/4 v4, 0x4

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    goto/16 :goto_14

    .line 1981
    :cond_eb
    const/16 v5, 0x5d

    if-ne v0, v5, :cond_101

    .line 1982
    const/16 v4, 0xf

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1983
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v4, v1

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1984
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v4

    iput-char v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_e6

    .line 1985
    :cond_101
    const/16 v5, 0x7d

    if-ne v0, v5, :cond_117

    .line 1986
    const/16 v4, 0xd

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1987
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v4, v1

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1988
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v4

    iput-char v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_e6

    .line 1989
    :cond_117
    if-ne v0, v9, :cond_127

    .line 1990
    const/16 v4, 0x14

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1991
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v5, v1, -0x1

    add-int/2addr v4, v5

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1992
    iput-char v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_e6

    .line 1994
    :cond_127
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v3, v4

    .line 1995
    goto/16 :goto_14

    .line 1999
    .end local v1    # "offset":I
    .restart local v2    # "offset":I
    :cond_12c
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v3, v4

    .line 2000
    goto/16 :goto_14
.end method

.method public final scanFieldDouble([C)D
    .registers 12
    .param p1, "fieldName"    # [C

    .prologue
    .line 2336
    const/4 v8, 0x0

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2338
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    move-result v8

    if-nez v8, :cond_f

    .line 2339
    const/4 v8, -0x2

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2340
    const-wide/16 v6, 0x0

    .line 2433
    :goto_e
    return-wide v6

    .line 2343
    :cond_f
    array-length v2, p1

    .line 2344
    .local v2, "offset":I
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .local v3, "offset":I
    add-int/2addr v8, v2

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2347
    .local v0, "chLocal":C
    const/16 v8, 0x30

    if-lt v0, v8, :cond_c6

    const/16 v8, 0x39

    if-gt v0, v8, :cond_c6

    move v2, v3

    .line 2349
    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    :goto_22
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    add-int/2addr v8, v2

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2350
    const/16 v8, 0x30

    if-lt v0, v8, :cond_35

    const/16 v8, 0x39

    if-gt v0, v8, :cond_35

    move v2, v3

    .line 2351
    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_22

    .line 2357
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    :cond_35
    const/16 v8, 0x2e

    if-ne v0, v8, :cond_63

    .line 2358
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    add-int/2addr v8, v3

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2359
    const/16 v8, 0x30

    if-lt v0, v8, :cond_5d

    const/16 v8, 0x39

    if-gt v0, v8, :cond_5d

    .line 2361
    :goto_4a
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    add-int/2addr v8, v2

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2362
    const/16 v8, 0x30

    if-lt v0, v8, :cond_63

    const/16 v8, 0x39

    if-gt v0, v8, :cond_63

    move v2, v3

    .line 2363
    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_4a

    .line 2369
    :cond_5d
    const/4 v8, -0x1

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2370
    const-wide/16 v6, 0x0

    goto :goto_e

    .line 2374
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    :cond_63
    const/16 v8, 0x65

    if-eq v0, v8, :cond_6b

    const/16 v8, 0x45

    if-ne v0, v8, :cond_98

    .line 2375
    :cond_6b
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    add-int/2addr v8, v3

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2376
    const/16 v8, 0x2b

    if-eq v0, v8, :cond_7c

    const/16 v8, 0x2d

    if-ne v0, v8, :cond_142

    .line 2377
    :cond_7c
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    add-int/2addr v8, v2

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2380
    :goto_85
    const/16 v8, 0x30

    if-lt v0, v8, :cond_98

    const/16 v8, 0x39

    if-gt v0, v8, :cond_98

    .line 2381
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    add-int/2addr v8, v3

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    move v3, v2

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    goto :goto_85

    :cond_98
    move v2, v3

    .line 2388
    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    array-length v9, p1

    add-int v4, v8, v9

    .line 2389
    .local v4, "start":I
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v8, v2

    sub-int/2addr v8, v4

    add-int/lit8 v1, v8, -0x1

    .line 2390
    .local v1, "count":I
    invoke-virtual {p0, v4, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    move-result-object v5

    .line 2391
    .local v5, "text":Ljava/lang/String;
    invoke-static {v5}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v6

    .line 2397
    .local v6, "value":D
    const/16 v8, 0x2c

    if-ne v0, v8, :cond_cd

    .line 2398
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v8, v2

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2399
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v8

    iput-char v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 2400
    const/4 v8, 0x3

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2401
    const/16 v8, 0x10

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto/16 :goto_e

    .line 2393
    .end local v1    # "count":I
    .end local v2    # "offset":I
    .end local v4    # "start":I
    .end local v5    # "text":Ljava/lang/String;
    .end local v6    # "value":D
    .restart local v3    # "offset":I
    :cond_c6
    const/4 v8, -0x1

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2394
    const-wide/16 v6, 0x0

    goto/16 :goto_e

    .line 2405
    .end local v3    # "offset":I
    .restart local v1    # "count":I
    .restart local v2    # "offset":I
    .restart local v4    # "start":I
    .restart local v5    # "text":Ljava/lang/String;
    .restart local v6    # "value":D
    :cond_cd
    const/16 v8, 0x7d

    if-ne v0, v8, :cond_13b

    .line 2406
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    add-int/2addr v8, v2

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2407
    const/16 v8, 0x2c

    if-ne v0, v8, :cond_f4

    .line 2408
    const/16 v8, 0x10

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2409
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v8, v3

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2410
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v8

    iput-char v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 2427
    :goto_ef
    const/4 v8, 0x4

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    goto/16 :goto_e

    .line 2411
    :cond_f4
    const/16 v8, 0x5d

    if-ne v0, v8, :cond_10a

    .line 2412
    const/16 v8, 0xf

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2413
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v8, v3

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2414
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v8

    iput-char v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_ef

    .line 2415
    :cond_10a
    const/16 v8, 0x7d

    if-ne v0, v8, :cond_120

    .line 2416
    const/16 v8, 0xd

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2417
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v8, v3

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2418
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v8

    iput-char v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_ef

    .line 2419
    :cond_120
    const/16 v8, 0x1a

    if-ne v0, v8, :cond_134

    .line 2420
    const/16 v8, 0x14

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2421
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v9, v3, -0x1

    add-int/2addr v8, v9

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2422
    const/16 v8, 0x1a

    iput-char v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_ef

    .line 2424
    :cond_134
    const/4 v8, -0x1

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2425
    const-wide/16 v6, 0x0

    goto/16 :goto_e

    .line 2429
    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    :cond_13b
    const/4 v8, -0x1

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2430
    const-wide/16 v6, 0x0

    goto/16 :goto_e

    .end local v1    # "count":I
    .end local v4    # "start":I
    .end local v5    # "text":Ljava/lang/String;
    .end local v6    # "value":D
    :cond_142
    move v3, v2

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    goto/16 :goto_85
.end method

.method public final scanFieldFloat([C)F
    .registers 15
    .param p1, "fieldName"    # [C

    .prologue
    const/16 v12, 0x10

    const/16 v11, 0x39

    const/16 v9, 0x30

    const/4 v10, -0x1

    const/4 v7, 0x0

    .line 2139
    const/4 v8, 0x0

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2141
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    move-result v8

    if-nez v8, :cond_16

    .line 2142
    const/4 v8, -0x2

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v6, v7

    .line 2222
    :goto_15
    return v6

    .line 2146
    :cond_16
    array-length v2, p1

    .line 2147
    .local v2, "offset":I
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .local v3, "offset":I
    add-int/2addr v8, v2

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2150
    .local v0, "chLocal":C
    if-lt v0, v9, :cond_83

    if-gt v0, v11, :cond_83

    move v2, v3

    .line 2152
    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    :goto_25
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    add-int/2addr v8, v2

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2153
    if-lt v0, v9, :cond_34

    if-gt v0, v11, :cond_34

    move v2, v3

    .line 2154
    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_25

    .line 2160
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    :cond_34
    const/16 v8, 0x2e

    if-ne v0, v8, :cond_58

    .line 2161
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    add-int/2addr v8, v3

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2162
    if-lt v0, v9, :cond_54

    if-gt v0, v11, :cond_54

    .line 2164
    :goto_45
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    add-int/2addr v8, v2

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2165
    if-lt v0, v9, :cond_58

    if-gt v0, v11, :cond_58

    move v2, v3

    .line 2166
    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_45

    .line 2172
    :cond_54
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v6, v7

    .line 2173
    goto :goto_15

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    :cond_58
    move v2, v3

    .line 2177
    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    array-length v9, p1

    add-int v4, v8, v9

    .line 2178
    .local v4, "start":I
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v8, v2

    sub-int/2addr v8, v4

    add-int/lit8 v1, v8, -0x1

    .line 2179
    .local v1, "count":I
    invoke-virtual {p0, v4, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    move-result-object v5

    .line 2180
    .local v5, "text":Ljava/lang/String;
    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v6

    .line 2186
    .local v6, "value":F
    const/16 v8, 0x2c

    if-ne v0, v8, :cond_87

    .line 2187
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v7, v2

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2188
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v7

    iput-char v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 2189
    const/4 v7, 0x3

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2190
    iput v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_15

    .line 2182
    .end local v1    # "count":I
    .end local v2    # "offset":I
    .end local v4    # "start":I
    .end local v5    # "text":Ljava/lang/String;
    .end local v6    # "value":F
    .restart local v3    # "offset":I
    :cond_83
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v6, v7

    .line 2183
    goto :goto_15

    .line 2194
    .end local v3    # "offset":I
    .restart local v1    # "count":I
    .restart local v2    # "offset":I
    .restart local v4    # "start":I
    .restart local v5    # "text":Ljava/lang/String;
    .restart local v6    # "value":F
    :cond_87
    const/16 v8, 0x7d

    if-ne v0, v8, :cond_f1

    .line 2195
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    add-int/2addr v8, v2

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2196
    const/16 v8, 0x2c

    if-ne v0, v8, :cond_ac

    .line 2197
    iput v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2198
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v7, v3

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2199
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v7

    iput-char v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 2216
    :goto_a7
    const/4 v7, 0x4

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    goto/16 :goto_15

    .line 2200
    :cond_ac
    const/16 v8, 0x5d

    if-ne v0, v8, :cond_c2

    .line 2201
    const/16 v7, 0xf

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2202
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v7, v3

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2203
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v7

    iput-char v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_a7

    .line 2204
    :cond_c2
    const/16 v8, 0x7d

    if-ne v0, v8, :cond_d8

    .line 2205
    const/16 v7, 0xd

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2206
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v7, v3

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2207
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v7

    iput-char v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_a7

    .line 2208
    :cond_d8
    const/16 v8, 0x1a

    if-ne v0, v8, :cond_ec

    .line 2209
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v8, v3, -0x1

    add-int/2addr v7, v8

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2210
    const/16 v7, 0x14

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2211
    const/16 v7, 0x1a

    iput-char v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_a7

    .line 2213
    :cond_ec
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v6, v7

    .line 2214
    goto/16 :goto_15

    .line 2218
    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    :cond_f1
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v6, v7

    .line 2219
    goto/16 :goto_15
.end method

.method public scanFieldInt([C)I
    .registers 14
    .param p1, "fieldName"    # [C

    .prologue
    const/16 v11, 0x2c

    const/16 v10, 0x1a

    const/16 v9, 0x10

    const/4 v8, -0x1

    const/4 v5, 0x0

    .line 1725
    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1727
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    move-result v6

    if-nez v6, :cond_15

    .line 1728
    const/4 v6, -0x2

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v4, v5

    .line 1804
    :cond_14
    :goto_14
    return v4

    .line 1732
    :cond_15
    array-length v2, p1

    .line 1733
    .local v2, "offset":I
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .local v3, "offset":I
    add-int/2addr v6, v2

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1735
    .local v0, "chLocal":C
    const/16 v6, 0x2d

    if-ne v0, v6, :cond_52

    const/4 v1, 0x1

    .line 1736
    .local v1, "negative":Z
    :goto_24
    if-eqz v1, :cond_f9

    .line 1737
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    add-int/2addr v6, v3

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1741
    :goto_2f
    const/16 v6, 0x30

    if-lt v0, v6, :cond_71

    const/16 v6, 0x39

    if-gt v0, v6, :cond_71

    .line 1742
    add-int/lit8 v4, v0, -0x30

    .line 1744
    .local v4, "value":I
    :goto_39
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    add-int/2addr v6, v2

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1745
    const/16 v6, 0x30

    if-lt v0, v6, :cond_54

    const/16 v6, 0x39

    if-gt v0, v6, :cond_54

    .line 1746
    mul-int/lit8 v6, v4, 0xa

    add-int/lit8 v7, v0, -0x30

    add-int v4, v6, v7

    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_39

    .end local v1    # "negative":Z
    .end local v2    # "offset":I
    .end local v4    # "value":I
    .restart local v3    # "offset":I
    :cond_52
    move v1, v5

    .line 1735
    goto :goto_24

    .line 1747
    .restart local v1    # "negative":Z
    .restart local v4    # "value":I
    :cond_54
    const/16 v6, 0x2e

    if-ne v0, v6, :cond_5c

    .line 1748
    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v4, v5

    .line 1749
    goto :goto_14

    .line 1754
    :cond_5c
    if-ltz v4, :cond_63

    array-length v6, p1

    add-int/lit8 v6, v6, 0xe

    if-le v3, v6, :cond_75

    .line 1756
    :cond_63
    const/high16 v6, -0x80000000

    if-ne v4, v6, :cond_6d

    const/16 v6, 0x11

    if-ne v3, v6, :cond_6d

    if-nez v1, :cond_75

    .line 1759
    :cond_6d
    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v4, v5

    .line 1760
    goto :goto_14

    .line 1764
    .end local v3    # "offset":I
    .end local v4    # "value":I
    .restart local v2    # "offset":I
    :cond_71
    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v4, v5

    .line 1765
    goto :goto_14

    .line 1768
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    .restart local v4    # "value":I
    :cond_75
    if-ne v0, v11, :cond_8d

    .line 1769
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v5, v3

    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1770
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v5

    iput-char v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1771
    const/4 v5, 0x3

    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1772
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1773
    if-eqz v1, :cond_14

    neg-int v4, v4

    goto :goto_14

    .line 1776
    :cond_8d
    const/16 v6, 0x7d

    if-ne v0, v6, :cond_f4

    .line 1777
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    add-int/2addr v6, v3

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1778
    if-ne v0, v11, :cond_b3

    .line 1779
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1780
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v5, v2

    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1781
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v5

    iput-char v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1798
    :goto_ab
    const/4 v5, 0x4

    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1804
    if-eqz v1, :cond_14

    neg-int v4, v4

    goto/16 :goto_14

    .line 1782
    :cond_b3
    const/16 v6, 0x5d

    if-ne v0, v6, :cond_c9

    .line 1783
    const/16 v5, 0xf

    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1784
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v5, v2

    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1785
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v5

    iput-char v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_ab

    .line 1786
    :cond_c9
    const/16 v6, 0x7d

    if-ne v0, v6, :cond_df

    .line 1787
    const/16 v5, 0xd

    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1788
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v5, v2

    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1789
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v5

    iput-char v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_ab

    .line 1790
    :cond_df
    if-ne v0, v10, :cond_ef

    .line 1791
    const/16 v5, 0x14

    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1792
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v6, v2, -0x1

    add-int/2addr v5, v6

    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1793
    iput-char v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_ab

    .line 1795
    :cond_ef
    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v4, v5

    .line 1796
    goto/16 :goto_14

    .line 1800
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    :cond_f4
    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v4, v5

    .line 1801
    goto/16 :goto_14

    .end local v4    # "value":I
    :cond_f9
    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto/16 :goto_2f
.end method

.method public scanFieldLong([C)J
    .registers 12
    .param p1, "fieldName"    # [C

    .prologue
    .line 2007
    const/4 v6, 0x0

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2009
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    move-result v6

    if-nez v6, :cond_f

    .line 2010
    const/4 v6, -0x2

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2011
    const-wide/16 v4, 0x0

    .line 2082
    :cond_e
    :goto_e
    return-wide v4

    .line 2014
    :cond_f
    array-length v2, p1

    .line 2015
    .local v2, "offset":I
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .local v3, "offset":I
    add-int/2addr v6, v2

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2017
    .local v0, "chLocal":C
    const/4 v1, 0x0

    .line 2018
    .local v1, "negative":Z
    const/16 v6, 0x2d

    if-ne v0, v6, :cond_102

    .line 2019
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    add-int/2addr v6, v3

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2020
    const/4 v1, 0x1

    .line 2024
    :goto_28
    const/16 v6, 0x30

    if-lt v0, v6, :cond_68

    const/16 v6, 0x39

    if-gt v0, v6, :cond_68

    .line 2025
    add-int/lit8 v6, v0, -0x30

    int-to-long v4, v6

    .line 2027
    .local v4, "value":J
    :goto_33
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    add-int/2addr v6, v2

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2028
    const/16 v6, 0x30

    if-lt v0, v6, :cond_4e

    const/16 v6, 0x39

    if-gt v0, v6, :cond_4e

    .line 2029
    const-wide/16 v6, 0xa

    mul-long/2addr v6, v4

    add-int/lit8 v8, v0, -0x30

    int-to-long v8, v8

    add-long v4, v6, v8

    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_33

    .line 2030
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    :cond_4e
    const/16 v6, 0x2e

    if-ne v0, v6, :cond_58

    .line 2031
    const/4 v6, -0x1

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2032
    const-wide/16 v4, 0x0

    goto :goto_e

    .line 2037
    :cond_58
    const-wide/16 v6, 0x0

    cmp-long v6, v4, v6

    if-ltz v6, :cond_62

    const/16 v6, 0x15

    if-le v3, v6, :cond_6e

    .line 2038
    :cond_62
    const/4 v6, -0x1

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2039
    const-wide/16 v4, 0x0

    goto :goto_e

    .line 2042
    .end local v3    # "offset":I
    .end local v4    # "value":J
    .restart local v2    # "offset":I
    :cond_68
    const/4 v6, -0x1

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2043
    const-wide/16 v4, 0x0

    goto :goto_e

    .line 2046
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    .restart local v4    # "value":J
    :cond_6e
    const/16 v6, 0x2c

    if-ne v0, v6, :cond_8a

    .line 2047
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v6, v3

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2048
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v6

    iput-char v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 2049
    const/4 v6, 0x3

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2050
    const/16 v6, 0x10

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2051
    if-eqz v1, :cond_e

    neg-long v4, v4

    goto :goto_e

    .line 2054
    :cond_8a
    const/16 v6, 0x7d

    if-ne v0, v6, :cond_fb

    .line 2055
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    add-int/2addr v6, v3

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2056
    const/16 v6, 0x2c

    if-ne v0, v6, :cond_b4

    .line 2057
    const/16 v6, 0x10

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2058
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v6, v2

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2059
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v6

    iput-char v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 2076
    :goto_ac
    const/4 v6, 0x4

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2082
    if-eqz v1, :cond_e

    neg-long v4, v4

    goto/16 :goto_e

    .line 2060
    :cond_b4
    const/16 v6, 0x5d

    if-ne v0, v6, :cond_ca

    .line 2061
    const/16 v6, 0xf

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2062
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v6, v2

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2063
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v6

    iput-char v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_ac

    .line 2064
    :cond_ca
    const/16 v6, 0x7d

    if-ne v0, v6, :cond_e0

    .line 2065
    const/16 v6, 0xd

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2066
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v6, v2

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2067
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v6

    iput-char v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_ac

    .line 2068
    :cond_e0
    const/16 v6, 0x1a

    if-ne v0, v6, :cond_f4

    .line 2069
    const/16 v6, 0x14

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2070
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v7, v2, -0x1

    add-int/2addr v6, v7

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2071
    const/16 v6, 0x1a

    iput-char v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_ac

    .line 2073
    :cond_f4
    const/4 v6, -0x1

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2074
    const-wide/16 v4, 0x0

    goto/16 :goto_e

    .line 2078
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    :cond_fb
    const/4 v6, -0x1

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2079
    const-wide/16 v4, 0x0

    goto/16 :goto_e

    .end local v4    # "value":J
    :cond_102
    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto/16 :goto_28
.end method

.method public scanFieldString([C)Ljava/lang/String;
    .registers 16
    .param p1, "fieldName"    # [C

    .prologue
    .line 1160
    const/4 v12, 0x0

    iput v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1162
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    move-result v12

    if-nez v12, :cond_11

    .line 1163
    const/4 v12, -0x2

    iput v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1164
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringDefaultValue()Ljava/lang/String;

    move-result-object v10

    .line 1250
    :goto_10
    return-object v10

    .line 1169
    :cond_11
    array-length v5, p1

    .line 1170
    .local v5, "offset":I
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "offset":I
    .local v6, "offset":I
    add-int/2addr v12, v5

    invoke-virtual {p0, v12}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1172
    .local v0, "chLocal":C
    const/16 v12, 0x22

    if-eq v0, v12, :cond_27

    .line 1173
    const/4 v12, -0x1

    iput v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1175
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringDefaultValue()Ljava/lang/String;

    move-result-object v10

    goto :goto_10

    .line 1180
    :cond_27
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    array-length v13, p1

    add-int/2addr v12, v13

    add-int/lit8 v8, v12, 0x1

    .line 1181
    .local v8, "startIndex":I
    const/16 v12, 0x22

    invoke-virtual {p0, v12, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->indexOf(CI)I

    move-result v3

    .line 1182
    .local v3, "endIndex":I
    const/4 v12, -0x1

    if-ne v3, v12, :cond_3e

    .line 1183
    new-instance v12, Lcom/alibaba/fastjson/JSONException;

    const-string v13, "unclosed str"

    invoke-direct {v12, v13}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 1186
    :cond_3e
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    array-length v13, p1

    add-int/2addr v12, v13

    add-int/lit8 v9, v12, 0x1

    .line 1187
    .local v9, "startIndex2":I
    sub-int v12, v3, v9

    invoke-virtual {p0, v9, v12}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    move-result-object v11

    .line 1188
    .local v11, "stringVal":Ljava/lang/String;
    const/16 v12, 0x5c

    invoke-virtual {v11, v12}, Ljava/lang/String;->indexOf(I)I

    move-result v12

    const/4 v13, -0x1

    if-eq v12, v13, :cond_7f

    .line 1190
    :goto_53
    const/4 v7, 0x0

    .line 1191
    .local v7, "slashCount":I
    add-int/lit8 v4, v3, -0x1

    .local v4, "i":I
    :goto_56
    if-ltz v4, :cond_65

    .line 1192
    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v12

    const/16 v13, 0x5c

    if-ne v12, v13, :cond_65

    .line 1193
    add-int/lit8 v7, v7, 0x1

    .line 1191
    add-int/lit8 v4, v4, -0x1

    goto :goto_56

    .line 1198
    :cond_65
    rem-int/lit8 v12, v7, 0x2

    if-nez v12, :cond_ab

    .line 1204
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    array-length v13, p1

    add-int/2addr v12, v13

    add-int/lit8 v12, v12, 0x1

    sub-int v2, v3, v12

    .line 1205
    .local v2, "chars_len":I
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    array-length v13, p1

    add-int/2addr v12, v13

    add-int/lit8 v12, v12, 0x1

    invoke-virtual {p0, v12, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sub_chars(II)[C

    move-result-object v1

    .line 1207
    .local v1, "chars":[C
    invoke-static {v1, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->readString([CI)Ljava/lang/String;

    move-result-object v11

    .line 1210
    .end local v1    # "chars":[C
    .end local v2    # "chars_len":I
    .end local v4    # "i":I
    .end local v7    # "slashCount":I
    :cond_7f
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    array-length v13, p1

    add-int/2addr v12, v13

    add-int/lit8 v12, v12, 0x1

    sub-int v12, v3, v12

    add-int/lit8 v12, v12, 0x1

    add-int v5, v6, v12

    .line 1211
    .end local v6    # "offset":I
    .restart local v5    # "offset":I
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "offset":I
    .restart local v6    # "offset":I
    add-int/2addr v12, v5

    invoke-virtual {p0, v12}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1212
    move-object v10, v11

    .line 1215
    .local v10, "strVal":Ljava/lang/String;
    const/16 v12, 0x2c

    if-ne v0, v12, :cond_b4

    .line 1216
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v12, v6

    iput v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1217
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v12}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v12

    iput-char v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1218
    const/4 v12, 0x3

    iput v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    goto/16 :goto_10

    .line 1201
    .end local v10    # "strVal":Ljava/lang/String;
    .restart local v4    # "i":I
    .restart local v7    # "slashCount":I
    :cond_ab
    const/16 v12, 0x22

    add-int/lit8 v13, v3, 0x1

    invoke-virtual {p0, v12, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->indexOf(CI)I

    move-result v3

    .line 1202
    goto :goto_53

    .line 1222
    .end local v4    # "i":I
    .end local v7    # "slashCount":I
    .restart local v10    # "strVal":Ljava/lang/String;
    :cond_b4
    const/16 v12, 0x7d

    if-ne v0, v12, :cond_124

    .line 1223
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v5, v6, 0x1

    .end local v6    # "offset":I
    .restart local v5    # "offset":I
    add-int/2addr v12, v6

    invoke-virtual {p0, v12}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1224
    const/16 v12, 0x2c

    if-ne v0, v12, :cond_db

    .line 1225
    const/16 v12, 0x10

    iput v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1226
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v12, v5

    iput v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1227
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v12}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v12

    iput-char v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1244
    :goto_d6
    const/4 v12, 0x4

    iput v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    goto/16 :goto_10

    .line 1228
    :cond_db
    const/16 v12, 0x5d

    if-ne v0, v12, :cond_f1

    .line 1229
    const/16 v12, 0xf

    iput v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1230
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v12, v5

    iput v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1231
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v12}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v12

    iput-char v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_d6

    .line 1232
    :cond_f1
    const/16 v12, 0x7d

    if-ne v0, v12, :cond_107

    .line 1233
    const/16 v12, 0xd

    iput v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1234
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v12, v5

    iput v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1235
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v12}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v12

    iput-char v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_d6

    .line 1236
    :cond_107
    const/16 v12, 0x1a

    if-ne v0, v12, :cond_11b

    .line 1237
    const/16 v12, 0x14

    iput v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1238
    iget v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v13, v5, -0x1

    add-int/2addr v12, v13

    iput v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1239
    const/16 v12, 0x1a

    iput-char v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_d6

    .line 1241
    :cond_11b
    const/4 v12, -0x1

    iput v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1242
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringDefaultValue()Ljava/lang/String;

    move-result-object v10

    goto/16 :goto_10

    .line 1246
    .end local v5    # "offset":I
    .restart local v6    # "offset":I
    :cond_124
    const/4 v12, -0x1

    iput v12, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1247
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringDefaultValue()Ljava/lang/String;

    move-result-object v10

    goto/16 :goto_10
.end method

.method public scanFieldStringArray([CLjava/lang/Class;)Ljava/util/Collection;
    .registers 19
    .param p1, "fieldName"    # [C
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([C",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1489
    .local p2, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1491
    invoke-virtual/range {p0 .. p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    move-result v14

    if-nez v14, :cond_12

    .line 1492
    const/4 v14, -0x2

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1493
    const/4 v7, 0x0

    .line 1622
    :goto_11
    return-object v7

    .line 1498
    :cond_12
    const-class v14, Ljava/util/HashSet;

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v14

    if-eqz v14, :cond_3c

    .line 1499
    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    .line 1512
    .local v7, "list":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    :goto_21
    move-object/from16 v0, p1

    array-length v8, v0

    .line 1513
    .local v8, "offset":I
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v9, v8, 0x1

    .end local v8    # "offset":I
    .local v9, "offset":I
    add-int/2addr v14, v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v1

    .line 1515
    .local v1, "chLocal":C
    const/16 v14, 0x5b

    if-eq v1, v14, :cond_5e

    .line 1516
    const/4 v14, -0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1517
    const/4 v7, 0x0

    goto :goto_11

    .line 1500
    .end local v1    # "chLocal":C
    .end local v7    # "list":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .end local v9    # "offset":I
    :cond_3c
    const-class v14, Ljava/util/ArrayList;

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v14

    if-eqz v14, :cond_4c

    .line 1501
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .restart local v7    # "list":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    goto :goto_21

    .line 1504
    .end local v7    # "list":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    :cond_4c
    :try_start_4c
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Collection;
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_52} :catch_53

    .restart local v7    # "list":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    goto :goto_21

    .line 1505
    .end local v7    # "list":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    :catch_53
    move-exception v4

    .line 1506
    .local v4, "e":Ljava/lang/Exception;
    new-instance v14, Lcom/alibaba/fastjson/JSONException;

    invoke-virtual {v4}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15, v4}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v14

    .line 1520
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v1    # "chLocal":C
    .restart local v7    # "list":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .restart local v9    # "offset":I
    :cond_5e
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v8, v9, 0x1

    .end local v9    # "offset":I
    .restart local v8    # "offset":I
    add-int/2addr v14, v9

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v1

    move v9, v8

    .line 1524
    .end local v8    # "offset":I
    .restart local v9    # "offset":I
    :goto_6c
    const/16 v14, 0x22

    if-ne v1, v14, :cond_108

    .line 1525
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int v11, v14, v9

    .line 1526
    .local v11, "startIndex":I
    const/16 v14, 0x22

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v11}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->indexOf(CI)I

    move-result v5

    .line 1527
    .local v5, "endIndex":I
    const/4 v14, -0x1

    if-ne v5, v14, :cond_89

    .line 1528
    new-instance v14, Lcom/alibaba/fastjson/JSONException;

    const-string v15, "unclosed str"

    invoke-direct {v14, v15}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 1531
    :cond_89
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int v12, v14, v9

    .line 1532
    .local v12, "startIndex2":I
    sub-int v14, v5, v12

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v14}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    move-result-object v13

    .line 1533
    .local v13, "stringVal":Ljava/lang/String;
    const/16 v14, 0x5c

    invoke-virtual {v13, v14}, Ljava/lang/String;->indexOf(I)I

    move-result v14

    const/4 v15, -0x1

    if-eq v14, v15, :cond_ce

    .line 1535
    :goto_a0
    const/4 v10, 0x0

    .line 1536
    .local v10, "slashCount":I
    add-int/lit8 v6, v5, -0x1

    .local v6, "i":I
    :goto_a3
    if-ltz v6, :cond_b4

    .line 1537
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v14

    const/16 v15, 0x5c

    if-ne v14, v15, :cond_b4

    .line 1538
    add-int/lit8 v10, v10, 0x1

    .line 1536
    add-int/lit8 v6, v6, -0x1

    goto :goto_a3

    .line 1543
    :cond_b4
    rem-int/lit8 v14, v10, 0x2

    if-nez v14, :cond_fd

    .line 1549
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v14, v9

    sub-int v3, v5, v14

    .line 1550
    .local v3, "chars_len":I
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v14, v9

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sub_chars(II)[C

    move-result-object v2

    .line 1552
    .local v2, "chars":[C
    invoke-static {v2, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->readString([CI)Ljava/lang/String;

    move-result-object v13

    .line 1555
    .end local v2    # "chars":[C
    .end local v3    # "chars_len":I
    .end local v6    # "i":I
    .end local v10    # "slashCount":I
    :cond_ce
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v14, v9

    sub-int v14, v5, v14

    add-int/lit8 v14, v14, 0x1

    add-int v8, v9, v14

    .line 1556
    .end local v9    # "offset":I
    .restart local v8    # "offset":I
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v9, v8, 0x1

    .end local v8    # "offset":I
    .restart local v9    # "offset":I
    add-int/2addr v14, v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v1

    .line 1558
    invoke-interface {v7, v13}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 1573
    .end local v5    # "endIndex":I
    .end local v11    # "startIndex":I
    .end local v12    # "startIndex2":I
    .end local v13    # "stringVal":Ljava/lang/String;
    :goto_e9
    const/16 v14, 0x2c

    if-ne v1, v14, :cond_193

    .line 1574
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v8, v9, 0x1

    .end local v9    # "offset":I
    .restart local v8    # "offset":I
    add-int/2addr v14, v9

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v1

    move v9, v8

    .line 1575
    .end local v8    # "offset":I
    .restart local v9    # "offset":I
    goto/16 :goto_6c

    .line 1546
    .restart local v5    # "endIndex":I
    .restart local v6    # "i":I
    .restart local v10    # "slashCount":I
    .restart local v11    # "startIndex":I
    .restart local v12    # "startIndex2":I
    .restart local v13    # "stringVal":Ljava/lang/String;
    :cond_fd
    const/16 v14, 0x22

    add-int/lit8 v15, v5, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->indexOf(CI)I

    move-result v5

    .line 1547
    goto :goto_a0

    .line 1559
    .end local v5    # "endIndex":I
    .end local v6    # "i":I
    .end local v10    # "slashCount":I
    .end local v11    # "startIndex":I
    .end local v12    # "startIndex2":I
    .end local v13    # "stringVal":Ljava/lang/String;
    :cond_108
    const/16 v14, 0x6e

    if-ne v1, v14, :cond_151

    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v14, v9

    .line 1560
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v14

    const/16 v15, 0x75

    if-ne v14, v15, :cond_151

    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v14, v9

    add-int/lit8 v14, v14, 0x1

    .line 1561
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v14

    const/16 v15, 0x6c

    if-ne v14, v15, :cond_151

    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v14, v9

    add-int/lit8 v14, v14, 0x2

    .line 1562
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v14

    const/16 v15, 0x6c

    if-ne v14, v15, :cond_151

    .line 1563
    add-int/lit8 v8, v9, 0x3

    .line 1564
    .end local v9    # "offset":I
    .restart local v8    # "offset":I
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v9, v8, 0x1

    .end local v8    # "offset":I
    .restart local v9    # "offset":I
    add-int/2addr v14, v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v1

    .line 1565
    const/4 v14, 0x0

    invoke-interface {v7, v14}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_e9

    .line 1566
    :cond_151
    const/16 v14, 0x5d

    if-ne v1, v14, :cond_18b

    invoke-interface {v7}, Ljava/util/Collection;->size()I

    move-result v14

    if-nez v14, :cond_18b

    .line 1567
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v8, v9, 0x1

    .end local v9    # "offset":I
    .restart local v8    # "offset":I
    add-int/2addr v14, v9

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v1

    move v9, v8

    .line 1587
    .end local v8    # "offset":I
    .restart local v9    # "offset":I
    :goto_169
    const/16 v14, 0x2c

    if-ne v1, v14, :cond_1ae

    .line 1588
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v14, v9

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1589
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v14

    move-object/from16 v0, p0

    iput-char v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1590
    const/4 v14, 0x3

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    goto/16 :goto_11

    .line 1570
    :cond_18b
    new-instance v14, Lcom/alibaba/fastjson/JSONException;

    const-string v15, "illega str"

    invoke-direct {v14, v15}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 1578
    :cond_193
    const/16 v14, 0x5d

    if-ne v1, v14, :cond_1a6

    .line 1579
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v8, v9, 0x1

    .end local v9    # "offset":I
    .restart local v8    # "offset":I
    add-int/2addr v14, v9

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v1

    move v9, v8

    .line 1580
    .end local v8    # "offset":I
    .restart local v9    # "offset":I
    goto :goto_169

    .line 1583
    :cond_1a6
    const/4 v14, -0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1584
    const/4 v7, 0x0

    goto/16 :goto_11

    .line 1594
    :cond_1ae
    const/16 v14, 0x7d

    if-ne v1, v14, :cond_24f

    .line 1595
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v8, v9, 0x1

    .end local v9    # "offset":I
    .restart local v8    # "offset":I
    add-int/2addr v14, v9

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v1

    .line 1596
    const/16 v14, 0x2c

    if-ne v1, v14, :cond_1e7

    .line 1597
    const/16 v14, 0x10

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1598
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v14, v8

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1599
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v14

    move-object/from16 v0, p0

    iput-char v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1616
    :goto_1e0
    const/4 v14, 0x4

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    goto/16 :goto_11

    .line 1600
    :cond_1e7
    const/16 v14, 0x5d

    if-ne v1, v14, :cond_209

    .line 1601
    const/16 v14, 0xf

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1602
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v14, v8

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1603
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v14

    move-object/from16 v0, p0

    iput-char v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_1e0

    .line 1604
    :cond_209
    const/16 v14, 0x7d

    if-ne v1, v14, :cond_22b

    .line 1605
    const/16 v14, 0xd

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1606
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v14, v8

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1607
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v14

    move-object/from16 v0, p0

    iput-char v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_1e0

    .line 1608
    :cond_22b
    const/16 v14, 0x1a

    if-ne v1, v14, :cond_247

    .line 1609
    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v15, v8, -0x1

    add-int/2addr v14, v15

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1610
    const/16 v14, 0x14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1611
    const/16 v14, 0x1a

    move-object/from16 v0, p0

    iput-char v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_1e0

    .line 1613
    :cond_247
    const/4 v14, -0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1614
    const/4 v7, 0x0

    goto/16 :goto_11

    .line 1618
    .end local v8    # "offset":I
    .restart local v9    # "offset":I
    :cond_24f
    const/4 v14, -0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1619
    const/4 v7, 0x0

    goto/16 :goto_11
.end method

.method public scanFieldSymbol([CLcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;
    .registers 16
    .param p1, "fieldName"    # [C
    .param p2, "symbolTable"    # Lcom/alibaba/fastjson/parser/SymbolTable;

    .prologue
    const/16 v12, 0x2c

    const/16 v9, 0x22

    const/16 v11, 0x1a

    const/4 v10, -0x1

    const/4 v7, 0x0

    .line 1333
    const/4 v8, 0x0

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1335
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    move-result v8

    if-nez v8, :cond_16

    .line 1336
    const/4 v8, -0x2

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move-object v6, v7

    .line 1403
    :goto_15
    return-object v6

    .line 1340
    :cond_16
    array-length v3, p1

    .line 1341
    .local v3, "offset":I
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v4, v3, 0x1

    .end local v3    # "offset":I
    .local v4, "offset":I
    add-int/2addr v8, v3

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1343
    .local v0, "chLocal":C
    if-eq v0, v9, :cond_26

    .line 1344
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move-object v6, v7

    .line 1345
    goto :goto_15

    .line 1349
    :cond_26
    const/4 v1, 0x0

    .local v1, "hash":I
    move v3, v4

    .line 1351
    .end local v4    # "offset":I
    .restart local v3    # "offset":I
    :goto_28
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v4, v3, 0x1

    .end local v3    # "offset":I
    .restart local v4    # "offset":I
    add-int/2addr v8, v3

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1352
    if-ne v0, v9, :cond_5f

    .line 1353
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    array-length v9, p1

    add-int/2addr v8, v9

    add-int/lit8 v5, v8, 0x1

    .line 1354
    .local v5, "start":I
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v8, v4

    sub-int/2addr v8, v5

    add-int/lit8 v2, v8, -0x1

    .line 1355
    .local v2, "len":I
    invoke-virtual {p0, v5, v2, v1, p2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->addSymbol(IIILcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;

    move-result-object v6

    .line 1356
    .local v6, "strVal":Ljava/lang/String;
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v4, 0x1

    .end local v4    # "offset":I
    .restart local v3    # "offset":I
    add-int/2addr v8, v4

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1368
    if-ne v0, v12, :cond_6b

    .line 1369
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v7, v3

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1370
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v7

    iput-char v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1371
    const/4 v7, 0x3

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    goto :goto_15

    .line 1360
    .end local v2    # "len":I
    .end local v3    # "offset":I
    .end local v5    # "start":I
    .end local v6    # "strVal":Ljava/lang/String;
    .restart local v4    # "offset":I
    :cond_5f
    mul-int/lit8 v8, v1, 0x1f

    add-int v1, v8, v0

    .line 1362
    const/16 v8, 0x5c

    if-ne v0, v8, :cond_d5

    .line 1363
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move-object v6, v7

    .line 1364
    goto :goto_15

    .line 1375
    .end local v4    # "offset":I
    .restart local v2    # "len":I
    .restart local v3    # "offset":I
    .restart local v5    # "start":I
    .restart local v6    # "strVal":Ljava/lang/String;
    :cond_6b
    const/16 v8, 0x7d

    if-ne v0, v8, :cond_d0

    .line 1376
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v4, v3, 0x1

    .end local v3    # "offset":I
    .restart local v4    # "offset":I
    add-int/2addr v8, v3

    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1377
    if-ne v0, v12, :cond_8f

    .line 1378
    const/16 v7, 0x10

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1379
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v7, v4

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1380
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v7

    iput-char v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1397
    :goto_8b
    const/4 v7, 0x4

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    goto :goto_15

    .line 1381
    :cond_8f
    const/16 v8, 0x5d

    if-ne v0, v8, :cond_a5

    .line 1382
    const/16 v7, 0xf

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1383
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v7, v4

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1384
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v7

    iput-char v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_8b

    .line 1385
    :cond_a5
    const/16 v8, 0x7d

    if-ne v0, v8, :cond_bb

    .line 1386
    const/16 v7, 0xd

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1387
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v7, v4

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1388
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v7

    iput-char v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_8b

    .line 1389
    :cond_bb
    if-ne v0, v11, :cond_cb

    .line 1390
    const/16 v7, 0x14

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1391
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v8, v4, -0x1

    add-int/2addr v7, v8

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1392
    iput-char v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_8b

    .line 1394
    :cond_cb
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move-object v6, v7

    .line 1395
    goto/16 :goto_15

    .line 1399
    .end local v4    # "offset":I
    .restart local v3    # "offset":I
    :cond_d0
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move-object v6, v7

    .line 1400
    goto/16 :goto_15

    .end local v2    # "len":I
    .end local v3    # "offset":I
    .end local v5    # "start":I
    .end local v6    # "strVal":Ljava/lang/String;
    .restart local v4    # "offset":I
    :cond_d5
    move v3, v4

    .end local v4    # "offset":I
    .restart local v3    # "offset":I
    goto/16 :goto_28
.end method

.method public final scanFloat(C)F
    .registers 13
    .param p1, "seperator"    # C

    .prologue
    const/4 v6, 0x0

    const/4 v10, -0x1

    const/16 v9, 0x39

    const/16 v8, 0x30

    .line 2226
    const/4 v7, 0x0

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2228
    const/4 v2, 0x0

    .line 2229
    .local v2, "offset":I
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .local v3, "offset":I
    add-int/2addr v7, v2

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2232
    .local v0, "chLocal":C
    if-lt v0, v8, :cond_72

    if-gt v0, v9, :cond_72

    move v2, v3

    .line 2234
    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    :goto_18
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    add-int/2addr v7, v2

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2235
    if-lt v0, v8, :cond_27

    if-gt v0, v9, :cond_27

    move v2, v3

    .line 2236
    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_18

    .line 2242
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    :cond_27
    const/16 v7, 0x2e

    if-ne v0, v7, :cond_4a

    .line 2243
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    add-int/2addr v7, v3

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2244
    if-lt v0, v8, :cond_47

    if-gt v0, v9, :cond_47

    .line 2246
    :goto_38
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    add-int/2addr v7, v2

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2247
    if-lt v0, v8, :cond_4a

    if-gt v0, v9, :cond_4a

    move v2, v3

    .line 2248
    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_38

    .line 2254
    :cond_47
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2276
    :goto_49
    return v6

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    :cond_4a
    move v2, v3

    .line 2259
    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2260
    .local v4, "start":I
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v7, v2

    sub-int/2addr v7, v4

    add-int/lit8 v1, v7, -0x1

    .line 2261
    .local v1, "count":I
    invoke-virtual {p0, v4, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    move-result-object v5

    .line 2262
    .local v5, "text":Ljava/lang/String;
    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v6

    .line 2268
    .local v6, "value":F
    if-ne v0, p1, :cond_76

    .line 2269
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v7, v2

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2270
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v7

    iput-char v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 2271
    const/4 v7, 0x3

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2272
    const/16 v7, 0x10

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_49

    .line 2264
    .end local v1    # "count":I
    .end local v2    # "offset":I
    .end local v4    # "start":I
    .end local v5    # "text":Ljava/lang/String;
    .end local v6    # "value":F
    .restart local v3    # "offset":I
    :cond_72
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v2, v3

    .line 2265
    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_49

    .line 2275
    .restart local v1    # "count":I
    .restart local v4    # "start":I
    .restart local v5    # "text":Ljava/lang/String;
    .restart local v6    # "value":F
    :cond_76
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    goto :goto_49
.end method

.method public final scanIdent()V
    .registers 3

    .prologue
    .line 2545
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 2546
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->hasSpecial:Z

    .line 2549
    :cond_9
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 2551
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2552
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    invoke-static {v1}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v1

    if-nez v1, :cond_9

    .line 2556
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringVal()Ljava/lang/String;

    move-result-object v0

    .line 2558
    .local v0, "ident":Ljava/lang/String;
    const-string v1, "null"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 2559
    const/16 v1, 0x8

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2575
    :goto_2a
    return-void

    .line 2560
    :cond_2b
    const-string v1, "new"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_38

    .line 2561
    const/16 v1, 0x9

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_2a

    .line 2562
    :cond_38
    const-string v1, "true"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_44

    .line 2563
    const/4 v1, 0x6

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_2a

    .line 2564
    :cond_44
    const-string v1, "false"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_50

    .line 2565
    const/4 v1, 0x7

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_2a

    .line 2566
    :cond_50
    const-string v1, "undefined"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5d

    .line 2567
    const/16 v1, 0x17

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_2a

    .line 2568
    :cond_5d
    const-string v1, "Set"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6a

    .line 2569
    const/16 v1, 0x15

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_2a

    .line 2570
    :cond_6a
    const-string v1, "TreeSet"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_77

    .line 2571
    const/16 v1, 0x16

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_2a

    .line 2573
    :cond_77
    const/16 v1, 0x12

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_2a
.end method

.method public scanInt(C)I
    .registers 13
    .param p1, "expectNext"    # C

    .prologue
    const/16 v10, 0x39

    const/16 v9, 0x30

    const/4 v8, -0x1

    const/4 v5, 0x0

    .line 1863
    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1865
    const/4 v2, 0x0

    .line 1866
    .local v2, "offset":I
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .local v3, "offset":I
    add-int/2addr v6, v2

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1868
    .local v0, "chLocal":C
    const/16 v6, 0x2d

    if-ne v0, v6, :cond_3e

    const/4 v1, 0x1

    .line 1869
    .local v1, "negative":Z
    :goto_17
    if-eqz v1, :cond_86

    .line 1870
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    add-int/lit8 v6, v6, 0x1

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1874
    :goto_23
    if-lt v0, v9, :cond_50

    if-gt v0, v10, :cond_50

    .line 1875
    add-int/lit8 v4, v0, -0x30

    .line 1877
    .local v4, "value":I
    :goto_29
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    add-int/2addr v6, v2

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1878
    if-lt v0, v9, :cond_40

    if-gt v0, v10, :cond_40

    .line 1879
    mul-int/lit8 v6, v4, 0xa

    add-int/lit8 v7, v0, -0x30

    add-int v4, v6, v7

    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_29

    .end local v1    # "negative":Z
    .end local v2    # "offset":I
    .end local v4    # "value":I
    .restart local v3    # "offset":I
    :cond_3e
    move v1, v5

    .line 1868
    goto :goto_17

    .line 1880
    .restart local v1    # "negative":Z
    .restart local v4    # "value":I
    :cond_40
    const/16 v6, 0x2e

    if-ne v0, v6, :cond_49

    .line 1881
    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    move v4, v5

    .line 1909
    .end local v4    # "value":I
    :goto_48
    return v4

    .line 1887
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    .restart local v4    # "value":I
    :cond_49
    if-gez v4, :cond_64

    .line 1888
    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    move v4, v5

    .line 1889
    goto :goto_48

    .line 1892
    .end local v4    # "value":I
    :cond_50
    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v4, v5

    .line 1893
    goto :goto_48

    .line 1904
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    .restart local v4    # "value":I
    :cond_54
    invoke-static {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    move-result v5

    if-eqz v5, :cond_7f

    .line 1905
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    add-int/2addr v5, v3

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    move v3, v2

    .line 1897
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    :cond_64
    if-ne v0, p1, :cond_54

    .line 1898
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v5, v3

    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1899
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v5

    iput-char v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1900
    const/4 v5, 0x3

    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1901
    const/16 v5, 0x10

    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1902
    if-eqz v1, :cond_7d

    neg-int v4, v4

    .end local v4    # "value":I
    :cond_7d
    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_48

    .line 1908
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    .restart local v4    # "value":I
    :cond_7f
    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1909
    if-eqz v1, :cond_84

    neg-int v4, v4

    .end local v4    # "value":I
    :cond_84
    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_48

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    :cond_86
    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_23
.end method

.method public scanLong(C)J
    .registers 12
    .param p1, "expectNextChar"    # C

    .prologue
    .line 2086
    const/4 v6, 0x0

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2088
    const/4 v2, 0x0

    .line 2089
    .local v2, "offset":I
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .local v3, "offset":I
    add-int/2addr v6, v2

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2091
    .local v0, "chLocal":C
    const/16 v6, 0x2d

    if-ne v0, v6, :cond_44

    const/4 v1, 0x1

    .line 2092
    .local v1, "negative":Z
    :goto_12
    if-eqz v1, :cond_94

    .line 2093
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    add-int/lit8 v6, v6, 0x1

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2097
    :goto_1e
    const/16 v6, 0x30

    if-lt v0, v6, :cond_5e

    const/16 v6, 0x39

    if-gt v0, v6, :cond_5e

    .line 2098
    add-int/lit8 v6, v0, -0x30

    int-to-long v4, v6

    .line 2100
    .local v4, "value":J
    :goto_29
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    add-int/2addr v6, v2

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 2101
    const/16 v6, 0x30

    if-lt v0, v6, :cond_46

    const/16 v6, 0x39

    if-gt v0, v6, :cond_46

    .line 2102
    const-wide/16 v6, 0xa

    mul-long/2addr v6, v4

    add-int/lit8 v8, v0, -0x30

    int-to-long v8, v8

    add-long v4, v6, v8

    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_29

    .line 2091
    .end local v1    # "negative":Z
    .end local v2    # "offset":I
    .end local v4    # "value":J
    .restart local v3    # "offset":I
    :cond_44
    const/4 v1, 0x0

    goto :goto_12

    .line 2103
    .restart local v1    # "negative":Z
    .restart local v4    # "value":J
    :cond_46
    const/16 v6, 0x2e

    if-ne v0, v6, :cond_51

    .line 2104
    const/4 v6, -0x1

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2105
    const-wide/16 v4, 0x0

    move v2, v3

    .line 2133
    .end local v3    # "offset":I
    .end local v4    # "value":J
    .restart local v2    # "offset":I
    :goto_50
    return-wide v4

    .line 2110
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    .restart local v4    # "value":J
    :cond_51
    const-wide/16 v6, 0x0

    cmp-long v6, v4, v6

    if-gez v6, :cond_74

    .line 2111
    const/4 v6, -0x1

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2112
    const-wide/16 v4, 0x0

    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_50

    .line 2115
    .end local v4    # "value":J
    :cond_5e
    const/4 v6, -0x1

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2116
    const-wide/16 v4, 0x0

    goto :goto_50

    .line 2127
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    .restart local v4    # "value":J
    :cond_64
    invoke-static {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    move-result v6

    if-eqz v6, :cond_8f

    .line 2128
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    add-int/2addr v6, v3

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    move v3, v2

    .line 2120
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    :cond_74
    if-ne v0, p1, :cond_64

    .line 2121
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v6, v3

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2122
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v6

    iput-char v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 2123
    const/4 v6, 0x3

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 2124
    const/16 v6, 0x10

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2125
    if-eqz v1, :cond_8d

    neg-long v4, v4

    .end local v4    # "value":J
    :cond_8d
    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_50

    .line 2132
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    .restart local v4    # "value":J
    :cond_8f
    const/4 v6, -0x1

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v2, v3

    .line 2133
    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_50

    .end local v2    # "offset":I
    .end local v4    # "value":J
    .restart local v3    # "offset":I
    :cond_94
    move v2, v3

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_1e
.end method

.method public final scanNullOrNew()V
    .registers 8

    .prologue
    const/16 v6, 0xd

    const/16 v5, 0xc

    const/16 v4, 0xa

    const/16 v3, 0x9

    const/16 v2, 0x8

    .line 2466
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x6e

    if-eq v0, v1, :cond_18

    .line 2467
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "error parse null or new"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2469
    :cond_18
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2471
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x75

    if-ne v0, v1, :cond_83

    .line 2472
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2473
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x6c

    if-eq v0, v1, :cond_32

    .line 2474
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "error parse null"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2476
    :cond_32
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2478
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x6c

    if-eq v0, v1, :cond_43

    .line 2479
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "error parse null"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2481
    :cond_43
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2483
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x20

    if-eq v0, v1, :cond_78

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x2c

    if-eq v0, v1, :cond_78

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x7d

    if-eq v0, v1, :cond_78

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x5d

    if-eq v0, v1, :cond_78

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-eq v0, v4, :cond_78

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-eq v0, v6, :cond_78

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-eq v0, v3, :cond_78

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x1a

    if-eq v0, v1, :cond_78

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-eq v0, v5, :cond_78

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v0, v2, :cond_7b

    .line 2485
    :cond_78
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2508
    :goto_7a
    return-void

    .line 2487
    :cond_7b
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "scan null error"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2492
    :cond_83
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x65

    if-eq v0, v1, :cond_91

    .line 2493
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "error parse new"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2495
    :cond_91
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2497
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x77

    if-eq v0, v1, :cond_a2

    .line 2498
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "error parse new"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2500
    :cond_a2
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2502
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x20

    if-eq v0, v1, :cond_d7

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x2c

    if-eq v0, v1, :cond_d7

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x7d

    if-eq v0, v1, :cond_d7

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x5d

    if-eq v0, v1, :cond_d7

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-eq v0, v4, :cond_d7

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-eq v0, v6, :cond_d7

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-eq v0, v3, :cond_d7

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x1a

    if-eq v0, v1, :cond_d7

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-eq v0, v5, :cond_d7

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v0, v2, :cond_da

    .line 2504
    :cond_d7
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_7a

    .line 2506
    :cond_da
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "scan new error"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final scanNumber()V
    .registers 9

    .prologue
    const/16 v7, 0x46

    const/16 v6, 0x44

    const/16 v5, 0x2d

    const/16 v4, 0x39

    const/16 v3, 0x30

    .line 2839
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 2841
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v1, v5, :cond_1b

    .line 2842
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 2843
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2847
    :cond_1b
    :goto_1b
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-lt v1, v3, :cond_2d

    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-gt v1, v4, :cond_2d

    .line 2848
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 2852
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto :goto_1b

    .line 2855
    :cond_2d
    const/4 v0, 0x0

    .line 2857
    .local v0, "isDouble":Z
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v2, 0x2e

    if-ne v1, v2, :cond_50

    .line 2858
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 2859
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2860
    const/4 v0, 0x1

    .line 2863
    :goto_3e
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-lt v1, v3, :cond_50

    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-gt v1, v4, :cond_50

    .line 2864
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 2868
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto :goto_3e

    .line 2872
    :cond_50
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v2, 0x4c

    if-ne v1, v2, :cond_65

    .line 2873
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 2874
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2915
    :cond_5f
    :goto_5f
    if-eqz v0, :cond_f1

    .line 2916
    const/4 v1, 0x3

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2920
    :goto_64
    return-void

    .line 2875
    :cond_65
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v2, 0x53

    if-ne v1, v2, :cond_75

    .line 2876
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 2877
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto :goto_5f

    .line 2878
    :cond_75
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v2, 0x42

    if-ne v1, v2, :cond_85

    .line 2879
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 2880
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto :goto_5f

    .line 2881
    :cond_85
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v1, v7, :cond_94

    .line 2882
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 2883
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2884
    const/4 v0, 0x1

    goto :goto_5f

    .line 2885
    :cond_94
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v1, v6, :cond_a3

    .line 2886
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 2887
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2888
    const/4 v0, 0x1

    goto :goto_5f

    .line 2889
    :cond_a3
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v2, 0x65

    if-eq v1, v2, :cond_af

    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v2, 0x45

    if-ne v1, v2, :cond_5f

    .line 2890
    :cond_af
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 2891
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2893
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v2, 0x2b

    if-eq v1, v2, :cond_c2

    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v1, v5, :cond_cb

    .line 2894
    :cond_c2
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 2895
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2899
    :cond_cb
    :goto_cb
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-lt v1, v3, :cond_dd

    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-gt v1, v4, :cond_dd

    .line 2900
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 2904
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto :goto_cb

    .line 2907
    :cond_dd
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-eq v1, v6, :cond_e5

    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v1, v7, :cond_ee

    .line 2908
    :cond_e5
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 2909
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2912
    :cond_ee
    const/4 v0, 0x1

    goto/16 :goto_5f

    .line 2918
    :cond_f1
    const/4 v1, 0x2

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto/16 :goto_64
.end method

.method public scanString(C)Ljava/lang/String;
    .registers 15
    .param p1, "expectNextChar"    # C

    .prologue
    .line 1254
    const/4 v11, 0x0

    iput v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1256
    const/4 v5, 0x0

    .line 1257
    .local v5, "offset":I
    iget v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "offset":I
    .local v6, "offset":I
    add-int/2addr v11, v5

    invoke-virtual {p0, v11}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1259
    .local v0, "chLocal":C
    const/16 v11, 0x6e

    if-ne v0, v11, :cond_65

    .line 1260
    iget v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v11, v11, 0x1

    invoke-virtual {p0, v11}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v11

    const/16 v12, 0x75

    if-ne v11, v12, :cond_5a

    iget v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v11, v11, 0x1

    add-int/lit8 v11, v11, 0x1

    invoke-virtual {p0, v11}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v11

    const/16 v12, 0x6c

    if-ne v11, v12, :cond_5a

    iget v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v11, v11, 0x1

    add-int/lit8 v11, v11, 0x2

    invoke-virtual {p0, v11}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v11

    const/16 v12, 0x6c

    if-ne v11, v12, :cond_5a

    .line 1261
    add-int/lit8 v5, v6, 0x3

    .line 1262
    .end local v6    # "offset":I
    .restart local v5    # "offset":I
    iget v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v5, v5, 0x1

    add-int/lit8 v11, v11, 0x4

    invoke-virtual {p0, v11}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1268
    if-ne v0, p1, :cond_60

    .line 1269
    iget v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v11, v11, 0x5

    iput v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1270
    iget v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v11}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v11

    iput-char v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1271
    const/4 v11, 0x3

    iput v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1272
    const/4 v9, 0x0

    .line 1328
    :goto_59
    return-object v9

    .line 1264
    .end local v5    # "offset":I
    .restart local v6    # "offset":I
    :cond_5a
    const/4 v11, -0x1

    iput v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1265
    const/4 v9, 0x0

    move v5, v6

    .end local v6    # "offset":I
    .restart local v5    # "offset":I
    goto :goto_59

    .line 1274
    :cond_60
    const/4 v11, -0x1

    iput v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1275
    const/4 v9, 0x0

    goto :goto_59

    .line 1279
    .end local v5    # "offset":I
    .restart local v6    # "offset":I
    :cond_65
    const/16 v11, 0x22

    if-eq v0, v11, :cond_72

    .line 1280
    const/4 v11, -0x1

    iput v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1282
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringDefaultValue()Ljava/lang/String;

    move-result-object v9

    move v5, v6

    .end local v6    # "offset":I
    .restart local v5    # "offset":I
    goto :goto_59

    .line 1287
    .end local v5    # "offset":I
    .restart local v6    # "offset":I
    :cond_72
    iget v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v8, v11, 0x1

    .line 1288
    .local v8, "startIndex":I
    const/16 v11, 0x22

    invoke-virtual {p0, v11, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->indexOf(CI)I

    move-result v3

    .line 1289
    .local v3, "endIndex":I
    const/4 v11, -0x1

    if-ne v3, v11, :cond_87

    .line 1290
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    const-string v12, "unclosed str"

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 1293
    :cond_87
    iget v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v11, v11, 0x1

    sub-int v12, v3, v8

    invoke-virtual {p0, v11, v12}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    move-result-object v10

    .line 1294
    .local v10, "stringVal":Ljava/lang/String;
    const/16 v11, 0x5c

    invoke-virtual {v10, v11}, Ljava/lang/String;->indexOf(I)I

    move-result v11

    const/4 v12, -0x1

    if-eq v11, v12, :cond_be

    .line 1296
    :goto_9a
    const/4 v7, 0x0

    .line 1297
    .local v7, "slashCount":I
    add-int/lit8 v4, v3, -0x1

    .local v4, "i":I
    :goto_9d
    if-ltz v4, :cond_ac

    .line 1298
    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v11

    const/16 v12, 0x5c

    if-ne v11, v12, :cond_ac

    .line 1299
    add-int/lit8 v7, v7, 0x1

    .line 1297
    add-int/lit8 v4, v4, -0x1

    goto :goto_9d

    .line 1304
    :cond_ac
    rem-int/lit8 v11, v7, 0x2

    if-nez v11, :cond_e7

    .line 1310
    sub-int v2, v3, v8

    .line 1311
    .local v2, "chars_len":I
    iget v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v11, v11, 0x1

    invoke-virtual {p0, v11, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sub_chars(II)[C

    move-result-object v1

    .line 1313
    .local v1, "chars":[C
    invoke-static {v1, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->readString([CI)Ljava/lang/String;

    move-result-object v10

    .line 1316
    .end local v1    # "chars":[C
    .end local v2    # "chars_len":I
    .end local v4    # "i":I
    .end local v7    # "slashCount":I
    :cond_be
    iget v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v11, v11, 0x1

    sub-int v11, v3, v11

    add-int/lit8 v11, v11, 0x1

    add-int/lit8 v5, v11, 0x1

    .line 1317
    .end local v6    # "offset":I
    .restart local v5    # "offset":I
    iget v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "offset":I
    .restart local v6    # "offset":I
    add-int/2addr v11, v5

    invoke-virtual {p0, v11}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1318
    move-object v9, v10

    .line 1321
    .local v9, "strVal":Ljava/lang/String;
    if-ne v0, p1, :cond_f0

    .line 1322
    iget v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v11, v6

    iput v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1323
    iget v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v11}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v11

    iput-char v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1324
    const/4 v11, 0x3

    iput v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v5, v6

    .line 1325
    .end local v6    # "offset":I
    .restart local v5    # "offset":I
    goto/16 :goto_59

    .line 1307
    .end local v5    # "offset":I
    .end local v9    # "strVal":Ljava/lang/String;
    .restart local v4    # "i":I
    .restart local v6    # "offset":I
    .restart local v7    # "slashCount":I
    :cond_e7
    const/16 v11, 0x22

    add-int/lit8 v12, v3, 0x1

    invoke-virtual {p0, v11, v12}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->indexOf(CI)I

    move-result v3

    .line 1308
    goto :goto_9a

    .line 1327
    .end local v4    # "i":I
    .end local v7    # "slashCount":I
    .restart local v9    # "strVal":Ljava/lang/String;
    :cond_f0
    const/4 v11, -0x1

    iput v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v5, v6

    .line 1328
    .end local v6    # "offset":I
    .restart local v5    # "offset":I
    goto/16 :goto_59
.end method

.method public final scanString()V
    .registers 18

    .prologue
    .line 850
    move-object/from16 v0, p0

    iget v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    move-object/from16 v0, p0

    iput v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 851
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->hasSpecial:Z

    .line 854
    :goto_d
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v1

    .line 856
    .local v1, "ch":C
    const/16 v13, 0x22

    if-ne v1, v13, :cond_23

    .line 980
    const/4 v13, 0x4

    move-object/from16 v0, p0

    iput v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 981
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v13

    move-object/from16 v0, p0

    iput-char v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 982
    return-void

    .line 860
    :cond_23
    const/16 v13, 0x1a

    if-ne v1, v13, :cond_4e

    .line 861
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isEOF()Z

    move-result v13

    if-nez v13, :cond_35

    .line 862
    const/16 v13, 0x1a

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto :goto_d

    .line 865
    :cond_35
    new-instance v13, Lcom/alibaba/fastjson/JSONException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "unclosed string : "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 868
    :cond_4e
    const/16 v13, 0x5c

    if-ne v1, v13, :cond_1ba

    .line 869
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->hasSpecial:Z

    if-nez v13, :cond_a8

    .line 870
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->hasSpecial:Z

    .line 872
    move-object/from16 v0, p0

    iget v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    array-length v14, v14

    if-lt v13, v14, :cond_95

    .line 873
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    array-length v13, v13

    mul-int/lit8 v2, v13, 0x2

    .line 874
    .local v2, "newCapcity":I
    move-object/from16 v0, p0

    iget v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    if-le v13, v2, :cond_79

    .line 875
    move-object/from16 v0, p0

    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 877
    :cond_79
    new-array v3, v2, [C

    .line 878
    .local v3, "newsbuf":[C
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-static {v13, v14, v3, v15, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 879
    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 882
    .end local v2    # "newCapcity":I
    .end local v3    # "newsbuf":[C
    :cond_95
    move-object/from16 v0, p0

    iget v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    add-int/lit8 v13, v13, 0x1

    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14, v15}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->copyTo(II[C)V

    .line 887
    :cond_a8
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v1

    .line 889
    sparse-switch v1, :sswitch_data_1f0

    .line 962
    move-object/from16 v0, p0

    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 963
    new-instance v13, Lcom/alibaba/fastjson/JSONException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "unclosed string : "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 891
    :sswitch_cc
    const/4 v13, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_d

    .line 894
    :sswitch_d4
    const/4 v13, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_d

    .line 897
    :sswitch_dc
    const/4 v13, 0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_d

    .line 900
    :sswitch_e4
    const/4 v13, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_d

    .line 903
    :sswitch_ec
    const/4 v13, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_d

    .line 906
    :sswitch_f4
    const/4 v13, 0x5

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_d

    .line 909
    :sswitch_fc
    const/4 v13, 0x6

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_d

    .line 912
    :sswitch_104
    const/4 v13, 0x7

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_d

    .line 915
    :sswitch_10c
    const/16 v13, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_d

    .line 918
    :sswitch_115
    const/16 v13, 0x9

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_d

    .line 921
    :sswitch_11e
    const/16 v13, 0xa

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_d

    .line 924
    :sswitch_127
    const/16 v13, 0xb

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_d

    .line 928
    :sswitch_130
    const/16 v13, 0xc

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_d

    .line 931
    :sswitch_139
    const/16 v13, 0xd

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_d

    .line 934
    :sswitch_142
    const/16 v13, 0x22

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_d

    .line 937
    :sswitch_14b
    const/16 v13, 0x27

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_d

    .line 940
    :sswitch_154
    const/16 v13, 0x2f

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_d

    .line 943
    :sswitch_15d
    const/16 v13, 0x5c

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_d

    .line 946
    :sswitch_166
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v1

    move v9, v1

    .line 947
    .local v9, "x1":C
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v1

    move v10, v1

    .line 949
    .local v10, "x2":C
    sget-object v13, Lcom/alibaba/fastjson/parser/JSONLexerBase;->digits:[I

    aget v13, v13, v9

    mul-int/lit8 v13, v13, 0x10

    sget-object v14, Lcom/alibaba/fastjson/parser/JSONLexerBase;->digits:[I

    aget v14, v14, v10

    add-int v12, v13, v14

    .line 950
    .local v12, "x_val":I
    int-to-char v11, v12

    .line 951
    .local v11, "x_char":C
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_d

    .line 954
    .end local v9    # "x1":C
    .end local v10    # "x2":C
    .end local v11    # "x_char":C
    .end local v12    # "x_val":I
    :sswitch_184
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v1

    move v4, v1

    .line 955
    .local v4, "u1":C
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v1

    move v5, v1

    .line 956
    .local v5, "u2":C
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v1

    move v6, v1

    .line 957
    .local v6, "u3":C
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v1

    move v7, v1

    .line 958
    .local v7, "u4":C
    new-instance v13, Ljava/lang/String;

    const/4 v14, 0x4

    new-array v14, v14, [C

    const/4 v15, 0x0

    aput-char v4, v14, v15

    const/4 v15, 0x1

    aput-char v5, v14, v15

    const/4 v15, 0x2

    aput-char v6, v14, v15

    const/4 v15, 0x3

    aput-char v7, v14, v15

    invoke-direct {v13, v14}, Ljava/lang/String;-><init>([C)V

    const/16 v14, 0x10

    invoke-static {v13, v14}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v8

    .line 959
    .local v8, "val":I
    int-to-char v13, v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_d

    .line 968
    .end local v4    # "u1":C
    .end local v5    # "u2":C
    .end local v6    # "u3":C
    .end local v7    # "u4":C
    .end local v8    # "val":I
    :cond_1ba
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->hasSpecial:Z

    if-nez v13, :cond_1cc

    .line 969
    move-object/from16 v0, p0

    iget v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int/lit8 v13, v13, 0x1

    move-object/from16 v0, p0

    iput v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    goto/16 :goto_d

    .line 973
    :cond_1cc
    move-object/from16 v0, p0

    iget v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    array-length v14, v14

    if-ne v13, v14, :cond_1de

    .line 974
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_d

    .line 976
    :cond_1de
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    move-object/from16 v0, p0

    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int/lit8 v15, v14, 0x1

    move-object/from16 v0, p0

    iput v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    aput-char v1, v13, v14

    goto/16 :goto_d

    .line 889
    :sswitch_data_1f0
    .sparse-switch
        0x22 -> :sswitch_142
        0x27 -> :sswitch_14b
        0x2f -> :sswitch_154
        0x30 -> :sswitch_cc
        0x31 -> :sswitch_d4
        0x32 -> :sswitch_dc
        0x33 -> :sswitch_e4
        0x34 -> :sswitch_ec
        0x35 -> :sswitch_f4
        0x36 -> :sswitch_fc
        0x37 -> :sswitch_104
        0x46 -> :sswitch_130
        0x5c -> :sswitch_15d
        0x62 -> :sswitch_10c
        0x66 -> :sswitch_130
        0x6e -> :sswitch_11e
        0x72 -> :sswitch_139
        0x74 -> :sswitch_115
        0x75 -> :sswitch_184
        0x76 -> :sswitch_127
        0x78 -> :sswitch_166
    .end sparse-switch
.end method

.method public scanStringArray(Ljava/util/Collection;C)V
    .registers 15
    .param p2, "seperator"    # C
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;C)V"
        }
    .end annotation

    .prologue
    .line 1626
    .local p1, "list":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    const/4 v10, 0x0

    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1628
    const/4 v5, 0x0

    .line 1629
    .local v5, "offset":I
    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "offset":I
    .local v6, "offset":I
    add-int/2addr v10, v5

    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1631
    .local v0, "chLocal":C
    const/16 v10, 0x6e

    if-ne v0, v10, :cond_58

    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v10, v10, 0x1

    .line 1632
    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v10

    const/16 v11, 0x75

    if-ne v10, v11, :cond_58

    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v10, v10, 0x1

    add-int/lit8 v10, v10, 0x1

    .line 1633
    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v10

    const/16 v11, 0x6c

    if-ne v10, v11, :cond_58

    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v10, v10, 0x1

    add-int/lit8 v10, v10, 0x2

    .line 1634
    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v10

    const/16 v11, 0x6c

    if-ne v10, v11, :cond_58

    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v10, v10, 0x1

    add-int/lit8 v10, v10, 0x3

    .line 1635
    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v10

    if-ne v10, p2, :cond_58

    .line 1637
    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v10, v10, 0x5

    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1638
    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v10

    iput-char v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1639
    const/4 v10, 0x5

    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v5, v6

    .line 1720
    .end local v6    # "offset":I
    .restart local v5    # "offset":I
    :goto_57
    return-void

    .line 1643
    .end local v5    # "offset":I
    .restart local v6    # "offset":I
    :cond_58
    const/16 v10, 0x5b

    if-eq v0, v10, :cond_61

    .line 1644
    const/4 v10, -0x1

    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v5, v6

    .line 1645
    .end local v6    # "offset":I
    .restart local v5    # "offset":I
    goto :goto_57

    .line 1648
    .end local v5    # "offset":I
    .restart local v6    # "offset":I
    :cond_61
    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v5, v6, 0x1

    .end local v6    # "offset":I
    .restart local v5    # "offset":I
    add-int/lit8 v10, v10, 0x1

    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    move v6, v5

    .line 1651
    .end local v5    # "offset":I
    .restart local v6    # "offset":I
    :goto_6c
    const/16 v10, 0x6e

    if-ne v0, v10, :cond_b3

    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v10, v6

    .line 1652
    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v10

    const/16 v11, 0x75

    if-ne v10, v11, :cond_b3

    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v10, v6

    add-int/lit8 v10, v10, 0x1

    .line 1653
    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v10

    const/16 v11, 0x6c

    if-ne v10, v11, :cond_b3

    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v10, v6

    add-int/lit8 v10, v10, 0x2

    .line 1654
    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v10

    const/16 v11, 0x6c

    if-ne v10, v11, :cond_b3

    .line 1655
    add-int/lit8 v5, v6, 0x3

    .line 1656
    .end local v6    # "offset":I
    .restart local v5    # "offset":I
    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "offset":I
    .restart local v6    # "offset":I
    add-int/2addr v10, v5

    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1657
    const/4 v10, 0x0

    invoke-interface {p1, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 1699
    :goto_a4
    const/16 v10, 0x2c

    if-ne v0, v10, :cond_14e

    .line 1700
    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v5, v6, 0x1

    .end local v6    # "offset":I
    .restart local v5    # "offset":I
    add-int/2addr v10, v6

    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    move v6, v5

    .line 1701
    .end local v5    # "offset":I
    .restart local v6    # "offset":I
    goto :goto_6c

    .line 1658
    :cond_b3
    const/16 v10, 0x5d

    if-ne v0, v10, :cond_da

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v10

    if-nez v10, :cond_da

    .line 1659
    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v5, v6, 0x1

    .end local v6    # "offset":I
    .restart local v5    # "offset":I
    add-int/2addr v10, v6

    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1713
    :goto_c6
    if-ne v0, p2, :cond_163

    .line 1714
    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v10, v5

    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1715
    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v10

    iput-char v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1716
    const/4 v10, 0x3

    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    goto/16 :goto_57

    .line 1661
    .end local v5    # "offset":I
    .restart local v6    # "offset":I
    :cond_da
    const/16 v10, 0x22

    if-eq v0, v10, :cond_e4

    .line 1662
    const/4 v10, -0x1

    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v5, v6

    .line 1663
    .end local v6    # "offset":I
    .restart local v5    # "offset":I
    goto/16 :goto_57

    .line 1665
    .end local v5    # "offset":I
    .restart local v6    # "offset":I
    :cond_e4
    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int v8, v10, v6

    .line 1666
    .local v8, "startIndex":I
    const/16 v10, 0x22

    invoke-virtual {p0, v10, v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->indexOf(CI)I

    move-result v3

    .line 1667
    .local v3, "endIndex":I
    const/4 v10, -0x1

    if-ne v3, v10, :cond_f9

    .line 1668
    new-instance v10, Lcom/alibaba/fastjson/JSONException;

    const-string v11, "unclosed str"

    invoke-direct {v10, v11}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 1671
    :cond_f9
    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v10, v6

    sub-int v11, v3, v8

    invoke-virtual {p0, v10, v11}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->subString(II)Ljava/lang/String;

    move-result-object v9

    .line 1672
    .local v9, "stringVal":Ljava/lang/String;
    const/16 v10, 0x5c

    invoke-virtual {v9, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v10

    const/4 v11, -0x1

    if-eq v10, v11, :cond_12e

    .line 1674
    :goto_10b
    const/4 v7, 0x0

    .line 1675
    .local v7, "slashCount":I
    add-int/lit8 v4, v3, -0x1

    .local v4, "i":I
    :goto_10e
    if-ltz v4, :cond_11d

    .line 1676
    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v10

    const/16 v11, 0x5c

    if-ne v10, v11, :cond_11d

    .line 1677
    add-int/lit8 v7, v7, 0x1

    .line 1675
    add-int/lit8 v4, v4, -0x1

    goto :goto_10e

    .line 1682
    :cond_11d
    rem-int/lit8 v10, v7, 0x2

    if-nez v10, :cond_145

    .line 1688
    sub-int v2, v3, v8

    .line 1689
    .local v2, "chars_len":I
    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v10, v6

    invoke-virtual {p0, v10, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sub_chars(II)[C

    move-result-object v1

    .line 1691
    .local v1, "chars":[C
    invoke-static {v1, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->readString([CI)Ljava/lang/String;

    move-result-object v9

    .line 1694
    .end local v1    # "chars":[C
    .end local v2    # "chars_len":I
    .end local v4    # "i":I
    .end local v7    # "slashCount":I
    :cond_12e
    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v10, v6

    sub-int v10, v3, v10

    add-int/lit8 v10, v10, 0x1

    add-int v5, v6, v10

    .line 1695
    .end local v6    # "offset":I
    .restart local v5    # "offset":I
    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "offset":I
    .restart local v6    # "offset":I
    add-int/2addr v10, v5

    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1696
    invoke-interface {p1, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto/16 :goto_a4

    .line 1685
    .restart local v4    # "i":I
    .restart local v7    # "slashCount":I
    :cond_145
    const/16 v10, 0x22

    add-int/lit8 v11, v3, 0x1

    invoke-virtual {p0, v10, v11}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->indexOf(CI)I

    move-result v3

    .line 1686
    goto :goto_10b

    .line 1704
    .end local v3    # "endIndex":I
    .end local v4    # "i":I
    .end local v7    # "slashCount":I
    .end local v8    # "startIndex":I
    .end local v9    # "stringVal":Ljava/lang/String;
    :cond_14e
    const/16 v10, 0x5d

    if-ne v0, v10, :cond_15d

    .line 1705
    iget v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v5, v6, 0x1

    .end local v6    # "offset":I
    .restart local v5    # "offset":I
    add-int/2addr v10, v6

    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1706
    goto/16 :goto_c6

    .line 1709
    .end local v5    # "offset":I
    .restart local v6    # "offset":I
    :cond_15d
    const/4 v10, -0x1

    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v5, v6

    .line 1710
    .end local v6    # "offset":I
    .restart local v5    # "offset":I
    goto/16 :goto_57

    .line 1719
    :cond_163
    const/4 v10, -0x1

    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    goto/16 :goto_57
.end method

.method public final scanSymbol(Lcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;
    .registers 6
    .param p1, "symbolTable"    # Lcom/alibaba/fastjson/parser/SymbolTable;

    .prologue
    const/16 v3, 0x27

    const/16 v2, 0x22

    const/4 v0, 0x0

    .line 576
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipWhitespace()V

    .line 578
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v1, v2, :cond_11

    .line 579
    invoke-virtual {p0, p1, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanSymbol(Lcom/alibaba/fastjson/parser/SymbolTable;C)Ljava/lang/String;

    move-result-object v0

    .line 611
    :goto_10
    return-object v0

    .line 582
    :cond_11
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v1, v3, :cond_2a

    .line 583
    sget-object v0, Lcom/alibaba/fastjson/parser/Feature;->AllowSingleQuotes:Lcom/alibaba/fastjson/parser/Feature;

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v0

    if-nez v0, :cond_25

    .line 584
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "syntax error"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 587
    :cond_25
    invoke-virtual {p0, p1, v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanSymbol(Lcom/alibaba/fastjson/parser/SymbolTable;C)Ljava/lang/String;

    move-result-object v0

    goto :goto_10

    .line 590
    :cond_2a
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v2, 0x7d

    if-ne v1, v2, :cond_38

    .line 591
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 592
    const/16 v1, 0xd

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_10

    .line 596
    :cond_38
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v2, 0x2c

    if-ne v1, v2, :cond_46

    .line 597
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 598
    const/16 v1, 0x10

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_10

    .line 602
    :cond_46
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v2, 0x1a

    if-ne v1, v2, :cond_51

    .line 603
    const/16 v1, 0x14

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_10

    .line 607
    :cond_51
    sget-object v0, Lcom/alibaba/fastjson/parser/Feature;->AllowUnQuotedFieldNames:Lcom/alibaba/fastjson/parser/Feature;

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    move-result v0

    if-nez v0, :cond_61

    .line 608
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "syntax error"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 611
    :cond_61
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanSymbolUnQuoted(Lcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;

    move-result-object v0

    goto :goto_10
.end method

.method public final scanSymbol(Lcom/alibaba/fastjson/parser/SymbolTable;C)Ljava/lang/String;
    .registers 28
    .param p1, "symbolTable"    # Lcom/alibaba/fastjson/parser/SymbolTable;
    .param p2, "quote"    # C

    .prologue
    .line 619
    const/4 v11, 0x0

    .line 621
    .local v11, "hash":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    move/from16 v21, v0

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 622
    const/16 v21, 0x0

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 623
    const/4 v10, 0x0

    .line 626
    .local v10, "hasSpecial":Z
    :goto_16
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v9

    .line 628
    .local v9, "chLocal":C
    move/from16 v0, p2

    if-ne v9, v0, :cond_53

    .line 770
    const/16 v21, 0x4

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 773
    if-nez v10, :cond_2d5

    .line 776
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    move/from16 v21, v0

    const/16 v22, -0x1

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_2cb

    .line 777
    const/4 v14, 0x0

    .line 781
    .local v14, "offset":I
    :goto_37
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    move/from16 v21, v0

    move-object/from16 v0, p0

    move/from16 v1, v21

    move-object/from16 v2, p1

    invoke-virtual {v0, v14, v1, v11, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->addSymbol(IIILcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;

    move-result-object v16

    .line 786
    .end local v14    # "offset":I
    .local v16, "value":Ljava/lang/String;
    :goto_47
    const/16 v21, 0x0

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 787
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 789
    return-object v16

    .line 632
    .end local v16    # "value":Ljava/lang/String;
    :cond_53
    const/16 v21, 0x1a

    move/from16 v0, v21

    if-ne v9, v0, :cond_61

    .line 633
    new-instance v21, Lcom/alibaba/fastjson/JSONException;

    const-string v22, "unclosed.str"

    invoke-direct/range {v21 .. v22}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v21

    .line 636
    :cond_61
    const/16 v21, 0x5c

    move/from16 v0, v21

    if-ne v9, v0, :cond_27f

    .line 637
    if-nez v10, :cond_e5

    .line 638
    const/4 v10, 0x1

    .line 640
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v21

    move/from16 v1, v22

    if-lt v0, v1, :cond_c2

    .line 641
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v21, v0

    mul-int/lit8 v12, v21, 0x2

    .line 642
    .local v12, "newCapcity":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    move/from16 v21, v0

    move/from16 v0, v21

    if-le v0, v12, :cond_9c

    .line 643
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 645
    :cond_9c
    new-array v13, v12, [C

    .line 646
    .local v13, "newsbuf":[C
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    move-object/from16 v21, v0

    const/16 v22, 0x0

    const/16 v23, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    array-length v0, v0

    move/from16 v24, v0

    move-object/from16 v0, v21

    move/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    invoke-static {v0, v1, v13, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 647
    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 652
    .end local v12    # "newCapcity":I
    .end local v13    # "newsbuf":[C
    :cond_c2
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    move/from16 v21, v0

    add-int/lit8 v21, v21, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    move-object/from16 v22, v0

    const/16 v23, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    move/from16 v24, v0

    move-object/from16 v0, p0

    move/from16 v1, v21

    move-object/from16 v2, v22

    move/from16 v3, v23

    move/from16 v4, v24

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->arrayCopy(I[CII)V

    .line 655
    :cond_e5
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v9

    .line 657
    sparse-switch v9, :sswitch_data_2f2

    .line 750
    move-object/from16 v0, p0

    iput-char v9, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 751
    new-instance v21, Lcom/alibaba/fastjson/JSONException;

    const-string v22, "unclosed.str.lit"

    invoke-direct/range {v21 .. v22}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v21

    .line 659
    :sswitch_f8
    mul-int/lit8 v21, v11, 0x1f

    add-int v11, v21, v9

    .line 660
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_16

    .line 663
    :sswitch_107
    mul-int/lit8 v21, v11, 0x1f

    add-int v11, v21, v9

    .line 664
    const/16 v21, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_16

    .line 667
    :sswitch_116
    mul-int/lit8 v21, v11, 0x1f

    add-int v11, v21, v9

    .line 668
    const/16 v21, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_16

    .line 671
    :sswitch_125
    mul-int/lit8 v21, v11, 0x1f

    add-int v11, v21, v9

    .line 672
    const/16 v21, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_16

    .line 675
    :sswitch_134
    mul-int/lit8 v21, v11, 0x1f

    add-int v11, v21, v9

    .line 676
    const/16 v21, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_16

    .line 679
    :sswitch_143
    mul-int/lit8 v21, v11, 0x1f

    add-int v11, v21, v9

    .line 680
    const/16 v21, 0x5

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_16

    .line 683
    :sswitch_152
    mul-int/lit8 v21, v11, 0x1f

    add-int v11, v21, v9

    .line 684
    const/16 v21, 0x6

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_16

    .line 687
    :sswitch_161
    mul-int/lit8 v21, v11, 0x1f

    add-int v11, v21, v9

    .line 688
    const/16 v21, 0x7

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_16

    .line 691
    :sswitch_170
    mul-int/lit8 v21, v11, 0x1f

    add-int/lit8 v11, v21, 0x8

    .line 692
    const/16 v21, 0x8

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_16

    .line 695
    :sswitch_17f
    mul-int/lit8 v21, v11, 0x1f

    add-int/lit8 v11, v21, 0x9

    .line 696
    const/16 v21, 0x9

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_16

    .line 699
    :sswitch_18e
    mul-int/lit8 v21, v11, 0x1f

    add-int/lit8 v11, v21, 0xa

    .line 700
    const/16 v21, 0xa

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_16

    .line 703
    :sswitch_19d
    mul-int/lit8 v21, v11, 0x1f

    add-int/lit8 v11, v21, 0xb

    .line 704
    const/16 v21, 0xb

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_16

    .line 708
    :sswitch_1ac
    mul-int/lit8 v21, v11, 0x1f

    add-int/lit8 v11, v21, 0xc

    .line 709
    const/16 v21, 0xc

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_16

    .line 712
    :sswitch_1bb
    mul-int/lit8 v21, v11, 0x1f

    add-int/lit8 v11, v21, 0xd

    .line 713
    const/16 v21, 0xd

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_16

    .line 716
    :sswitch_1ca
    mul-int/lit8 v21, v11, 0x1f

    add-int/lit8 v11, v21, 0x22

    .line 717
    const/16 v21, 0x22

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_16

    .line 720
    :sswitch_1d9
    mul-int/lit8 v21, v11, 0x1f

    add-int/lit8 v11, v21, 0x27

    .line 721
    const/16 v21, 0x27

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_16

    .line 724
    :sswitch_1e8
    mul-int/lit8 v21, v11, 0x1f

    add-int/lit8 v11, v21, 0x2f

    .line 725
    const/16 v21, 0x2f

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_16

    .line 728
    :sswitch_1f7
    mul-int/lit8 v21, v11, 0x1f

    add-int/lit8 v11, v21, 0x5c

    .line 729
    const/16 v21, 0x5c

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_16

    .line 732
    :sswitch_206
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-char v0, v1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 733
    .local v17, "x1":C
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v18

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-char v0, v1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 735
    .local v18, "x2":C
    sget-object v21, Lcom/alibaba/fastjson/parser/JSONLexerBase;->digits:[I

    aget v21, v21, v17

    mul-int/lit8 v21, v21, 0x10

    sget-object v22, Lcom/alibaba/fastjson/parser/JSONLexerBase;->digits:[I

    aget v22, v22, v18

    add-int v20, v21, v22

    .line 736
    .local v20, "x_val":I
    move/from16 v0, v20

    int-to-char v0, v0

    move/from16 v19, v0

    .line 737
    .local v19, "x_char":C
    mul-int/lit8 v21, v11, 0x1f

    add-int v11, v21, v19

    .line 738
    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_16

    .line 741
    .end local v17    # "x1":C
    .end local v18    # "x2":C
    .end local v19    # "x_char":C
    .end local v20    # "x_val":I
    :sswitch_238
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v9

    move v5, v9

    .line 742
    .local v5, "c1":C
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v9

    move v6, v9

    .line 743
    .local v6, "c2":C
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v9

    move v7, v9

    .line 744
    .local v7, "c3":C
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v9

    move v8, v9

    .line 745
    .local v8, "c4":C
    new-instance v21, Ljava/lang/String;

    const/16 v22, 0x4

    move/from16 v0, v22

    new-array v0, v0, [C

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aput-char v5, v22, v23

    const/16 v23, 0x1

    aput-char v6, v22, v23

    const/16 v23, 0x2

    aput-char v7, v22, v23

    const/16 v23, 0x3

    aput-char v8, v22, v23

    invoke-direct/range {v21 .. v22}, Ljava/lang/String;-><init>([C)V

    const/16 v22, 0x10

    invoke-static/range {v21 .. v22}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v15

    .line 746
    .local v15, "val":I
    mul-int/lit8 v21, v11, 0x1f

    add-int v11, v21, v15

    .line 747
    int-to-char v0, v15

    move/from16 v21, v0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_16

    .line 756
    .end local v5    # "c1":C
    .end local v6    # "c2":C
    .end local v7    # "c3":C
    .end local v8    # "c4":C
    .end local v15    # "val":I
    :cond_27f
    mul-int/lit8 v21, v11, 0x1f

    add-int v11, v21, v9

    .line 758
    if-nez v10, :cond_295

    .line 759
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    move/from16 v21, v0

    add-int/lit8 v21, v21, 0x1

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    goto/16 :goto_16

    .line 763
    :cond_295
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_2b3

    .line 764
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->putChar(C)V

    goto/16 :goto_16

    .line 766
    :cond_2b3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    move/from16 v22, v0

    add-int/lit8 v23, v22, 0x1

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    aput-char v9, v21, v22

    goto/16 :goto_16

    .line 779
    :cond_2cb
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    move/from16 v21, v0

    add-int/lit8 v14, v21, 0x1

    .restart local v14    # "offset":I
    goto/16 :goto_37

    .line 783
    .end local v14    # "offset":I
    :cond_2d5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    move-object/from16 v21, v0

    const/16 v22, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    move/from16 v23, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-virtual {v0, v1, v2, v3, v11}, Lcom/alibaba/fastjson/parser/SymbolTable;->addSymbol([CIII)Ljava/lang/String;

    move-result-object v16

    .restart local v16    # "value":Ljava/lang/String;
    goto/16 :goto_47

    .line 657
    nop

    :sswitch_data_2f2
    .sparse-switch
        0x22 -> :sswitch_1ca
        0x27 -> :sswitch_1d9
        0x2f -> :sswitch_1e8
        0x30 -> :sswitch_f8
        0x31 -> :sswitch_107
        0x32 -> :sswitch_116
        0x33 -> :sswitch_125
        0x34 -> :sswitch_134
        0x35 -> :sswitch_143
        0x36 -> :sswitch_152
        0x37 -> :sswitch_161
        0x46 -> :sswitch_1ac
        0x5c -> :sswitch_1f7
        0x62 -> :sswitch_170
        0x66 -> :sswitch_1ac
        0x6e -> :sswitch_18e
        0x72 -> :sswitch_1bb
        0x74 -> :sswitch_17f
        0x75 -> :sswitch_238
        0x76 -> :sswitch_19d
        0x78 -> :sswitch_206
    .end sparse-switch
.end method

.method public final scanSymbolUnQuoted(Lcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;
    .registers 13
    .param p1, "symbolTable"    # Lcom/alibaba/fastjson/parser/SymbolTable;

    .prologue
    const/16 v10, 0x6c

    const/4 v7, 0x1

    .line 801
    sget-object v4, Lcom/alibaba/fastjson/util/IOUtils;->firstIdentifierFlags:[Z

    .line 802
    .local v4, "firstIdentifierFlags":[Z
    iget-char v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 804
    .local v2, "first":C
    iget-char v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    array-length v9, v4

    if-ge v8, v9, :cond_10

    aget-boolean v8, v4, v2

    if-eqz v8, :cond_36

    :cond_10
    move v3, v7

    .line 805
    .local v3, "firstFlag":Z
    :goto_11
    if-nez v3, :cond_38

    .line 806
    new-instance v7, Lcom/alibaba/fastjson/JSONException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "illegal identifier : "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-char v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 807
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->info()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 804
    .end local v3    # "firstFlag":Z
    :cond_36
    const/4 v3, 0x0

    goto :goto_11

    .line 810
    .restart local v3    # "firstFlag":Z
    :cond_38
    sget-object v6, Lcom/alibaba/fastjson/util/IOUtils;->identifierFlags:[Z

    .line 812
    .local v6, "identifierFlags":[Z
    move v5, v2

    .line 814
    .local v5, "hash":I
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 815
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 818
    :goto_41
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    move-result v1

    .line 820
    .local v1, "chLocal":C
    array-length v7, v6

    if-ge v1, v7, :cond_91

    .line 821
    aget-boolean v7, v6, v1

    if-nez v7, :cond_91

    .line 832
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v7

    iput-char v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 833
    const/16 v7, 0x12

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 835
    const v0, 0x33c587

    .line 836
    .local v0, "NULL_HASH":I
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    const/4 v8, 0x4

    if-ne v7, v8, :cond_9c

    const v7, 0x33c587

    if-ne v5, v7, :cond_9c

    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v7

    const/16 v8, 0x6e

    if-ne v7, v8, :cond_9c

    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v7

    const/16 v8, 0x75

    if-ne v7, v8, :cond_9c

    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    add-int/lit8 v7, v7, 0x2

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v7

    if-ne v7, v10, :cond_9c

    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    add-int/lit8 v7, v7, 0x3

    .line 837
    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v7

    if-ne v7, v10, :cond_9c

    .line 838
    const/4 v7, 0x0

    .line 843
    :goto_90
    return-object v7

    .line 826
    .end local v0    # "NULL_HASH":I
    :cond_91
    mul-int/lit8 v7, v5, 0x1f

    add-int v5, v7, v1

    .line 828
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    goto :goto_41

    .line 843
    .restart local v0    # "NULL_HASH":I
    :cond_9c
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    invoke-virtual {p0, v7, v8, v5, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->addSymbol(IIILcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;

    move-result-object v7

    goto :goto_90
.end method

.method public scanSymbolWithSeperator(Lcom/alibaba/fastjson/parser/SymbolTable;C)Ljava/lang/String;
    .registers 15
    .param p1, "symbolTable"    # Lcom/alibaba/fastjson/parser/SymbolTable;
    .param p2, "serperator"    # C

    .prologue
    const/16 v11, 0x6c

    const/16 v8, 0x22

    const/4 v10, 0x3

    const/4 v6, 0x0

    const/4 v9, -0x1

    .line 1416
    const/4 v7, 0x0

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1418
    const/4 v3, 0x0

    .line 1419
    .local v3, "offset":I
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v4, v3, 0x1

    .end local v3    # "offset":I
    .local v4, "offset":I
    add-int/2addr v7, v3

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1421
    .local v0, "chLocal":C
    const/16 v7, 0x6e

    if-ne v0, v7, :cond_62

    .line 1422
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v7

    const/16 v8, 0x75

    if-ne v7, v8, :cond_5b

    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v7, v7, 0x1

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v7

    if-ne v7, v11, :cond_5b

    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v7, v7, 0x1

    add-int/lit8 v7, v7, 0x2

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v7

    if-ne v7, v11, :cond_5b

    .line 1423
    add-int/lit8 v3, v4, 0x3

    .line 1424
    .end local v4    # "offset":I
    .restart local v3    # "offset":I
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v7, v7, 0x4

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1430
    if-ne v0, p2, :cond_5f

    .line 1431
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v7, v7, 0x5

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1432
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v7

    iput-char v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1433
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1482
    :goto_5a
    return-object v6

    .line 1426
    .end local v3    # "offset":I
    .restart local v4    # "offset":I
    :cond_5b
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v3, v4

    .line 1427
    .end local v4    # "offset":I
    .restart local v3    # "offset":I
    goto :goto_5a

    .line 1436
    :cond_5f
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    goto :goto_5a

    .line 1441
    .end local v3    # "offset":I
    .restart local v4    # "offset":I
    :cond_62
    if-eq v0, v8, :cond_68

    .line 1442
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v3, v4

    .line 1443
    .end local v4    # "offset":I
    .restart local v3    # "offset":I
    goto :goto_5a

    .line 1448
    .end local v3    # "offset":I
    .restart local v4    # "offset":I
    :cond_68
    const/4 v1, 0x0

    .local v1, "hash":I
    move v3, v4

    .line 1450
    .end local v4    # "offset":I
    .restart local v3    # "offset":I
    :goto_6a
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v4, v3, 0x1

    .end local v3    # "offset":I
    .restart local v4    # "offset":I
    add-int/2addr v7, v3

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    .line 1451
    if-ne v0, v8, :cond_a2

    .line 1454
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v7, v7, 0x0

    add-int/lit8 v5, v7, 0x1

    .line 1455
    .local v5, "start":I
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v7, v4

    sub-int/2addr v7, v5

    add-int/lit8 v2, v7, -0x1

    .line 1456
    .local v2, "len":I
    invoke-virtual {p0, v5, v2, v1, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->addSymbol(IIILcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;

    move-result-object v6

    .line 1457
    .local v6, "strVal":Ljava/lang/String;
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v4, 0x1

    .end local v4    # "offset":I
    .restart local v3    # "offset":I
    add-int/2addr v7, v4

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    move v4, v3

    .line 1470
    .end local v3    # "offset":I
    .restart local v4    # "offset":I
    :goto_8f
    if-ne v0, p2, :cond_ae

    .line 1471
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr v7, v4

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1472
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v7

    iput-char v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1473
    iput v10, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v3, v4

    .line 1474
    .end local v4    # "offset":I
    .restart local v3    # "offset":I
    goto :goto_5a

    .line 1461
    .end local v2    # "len":I
    .end local v3    # "offset":I
    .end local v5    # "start":I
    .end local v6    # "strVal":Ljava/lang/String;
    .restart local v4    # "offset":I
    :cond_a2
    mul-int/lit8 v7, v1, 0x1f

    add-int v1, v7, v0

    .line 1463
    const/16 v7, 0x5c

    if-ne v0, v7, :cond_c3

    .line 1464
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v3, v4

    .line 1465
    .end local v4    # "offset":I
    .restart local v3    # "offset":I
    goto :goto_5a

    .line 1476
    .end local v3    # "offset":I
    .restart local v2    # "len":I
    .restart local v4    # "offset":I
    .restart local v5    # "start":I
    .restart local v6    # "strVal":Ljava/lang/String;
    :cond_ae
    invoke-static {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    move-result v7

    if-eqz v7, :cond_bf

    .line 1477
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v3, v4, 0x1

    .end local v4    # "offset":I
    .restart local v3    # "offset":I
    add-int/2addr v7, v4

    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v0

    move v4, v3

    .line 1478
    .end local v3    # "offset":I
    .restart local v4    # "offset":I
    goto :goto_8f

    .line 1481
    :cond_bf
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    move v3, v4

    .line 1482
    .end local v4    # "offset":I
    .restart local v3    # "offset":I
    goto :goto_5a

    .end local v2    # "len":I
    .end local v3    # "offset":I
    .end local v5    # "start":I
    .end local v6    # "strVal":Ljava/lang/String;
    .restart local v4    # "offset":I
    :cond_c3
    move v3, v4

    .end local v4    # "offset":I
    .restart local v3    # "offset":I
    goto :goto_6a
.end method

.method public final scanTrue()V
    .registers 3

    .prologue
    .line 2437
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x74

    if-eq v0, v1, :cond_e

    .line 2438
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "error parse true"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2440
    :cond_e
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2442
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x72

    if-eq v0, v1, :cond_1f

    .line 2443
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "error parse true"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2445
    :cond_1f
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2447
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x75

    if-eq v0, v1, :cond_30

    .line 2448
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "error parse true"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2450
    :cond_30
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2452
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x65

    if-eq v0, v1, :cond_41

    .line 2453
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "error parse true"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2455
    :cond_41
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 2457
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x20

    if-eq v0, v1, :cond_86

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x2c

    if-eq v0, v1, :cond_86

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x7d

    if-eq v0, v1, :cond_86

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x5d

    if-eq v0, v1, :cond_86

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0xa

    if-eq v0, v1, :cond_86

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0xd

    if-eq v0, v1, :cond_86

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x9

    if-eq v0, v1, :cond_86

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x1a

    if-eq v0, v1, :cond_86

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0xc

    if-eq v0, v1, :cond_86

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x8

    if-eq v0, v1, :cond_86

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x3a

    if-ne v0, v1, :cond_8a

    .line 2459
    :cond_86
    const/4 v0, 0x6

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2463
    return-void

    .line 2461
    :cond_8a
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "scan true error"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final scanType(Ljava/lang/String;)I
    .registers 11
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0x7d

    const/16 v7, 0x2c

    const/16 v6, 0x10

    const/4 v3, -0x1

    .line 1081
    const/4 v4, 0x0

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1083
    sget-object v4, Lcom/alibaba/fastjson/parser/JSONLexerBase;->typeFieldName:[C

    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charArrayCompare([C)Z

    move-result v4

    if-nez v4, :cond_14

    .line 1084
    const/4 v3, -0x2

    .line 1127
    :cond_13
    :goto_13
    return v3

    .line 1087
    :cond_14
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    sget-object v5, Lcom/alibaba/fastjson/parser/JSONLexerBase;->typeFieldName:[C

    array-length v5, v5

    add-int v0, v4, v5

    .line 1089
    .local v0, "bpLocal":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 1090
    .local v2, "typeLength":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_20
    if-ge v1, v2, :cond_31

    .line 1091
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    add-int v5, v0, v1

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v5

    if-ne v4, v5, :cond_13

    .line 1090
    add-int/lit8 v1, v1, 0x1

    goto :goto_20

    .line 1095
    :cond_31
    add-int/2addr v0, v2

    .line 1096
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v4

    const/16 v5, 0x22

    if-ne v4, v5, :cond_13

    .line 1100
    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v4

    iput-char v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1102
    iget-char v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v4, v7, :cond_54

    .line 1103
    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v3

    iput-char v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1104
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1105
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1106
    const/4 v3, 0x3

    goto :goto_13

    .line 1107
    :cond_54
    iget-char v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v4, v8, :cond_71

    .line 1108
    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v4

    iput-char v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1109
    iget-char v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v4, v7, :cond_76

    .line 1110
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1111
    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v3

    iput-char v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1123
    :goto_6e
    const/4 v3, 0x4

    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 1126
    :cond_71
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1127
    iget v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    goto :goto_13

    .line 1112
    :cond_76
    iget-char v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v5, 0x5d

    if-ne v4, v5, :cond_89

    .line 1113
    const/16 v3, 0xf

    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1114
    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v3

    iput-char v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_6e

    .line 1115
    :cond_89
    iget-char v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v4, v8, :cond_9a

    .line 1116
    const/16 v3, 0xd

    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1117
    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->charAt(I)C

    move-result v3

    iput-char v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_6e

    .line 1118
    :cond_9a
    iget-char v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v5, 0x1a

    if-ne v4, v5, :cond_13

    .line 1119
    const/16 v3, 0x14

    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_6e
.end method

.method public setLocale(Ljava/util/Locale;)V
    .registers 2
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 1001
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->locale:Ljava/util/Locale;

    .line 1002
    return-void
.end method

.method public setTimeZone(Ljava/util/TimeZone;)V
    .registers 2
    .param p1, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 993
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->timeZone:Ljava/util/TimeZone;

    .line 994
    return-void
.end method

.method public setToken(I)V
    .registers 2
    .param p1, "token"    # I

    .prologue
    .line 108
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 109
    return-void
.end method

.method protected skipComment()V
    .registers 5

    .prologue
    const/16 v3, 0x2f

    const/16 v2, 0x2a

    .line 546
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 547
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v0, v3, :cond_18

    .line 549
    :cond_b
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 550
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0xa

    if-ne v0, v1, :cond_b

    .line 551
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 573
    :cond_17
    :goto_17
    return-void

    .line 555
    :cond_18
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v0, v2, :cond_38

    .line 556
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 558
    :cond_1f
    :goto_1f
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x1a

    if-eq v0, v1, :cond_17

    .line 559
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v0, v2, :cond_34

    .line 560
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    .line 561
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v0, v3, :cond_1f

    .line 562
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto :goto_17

    .line 568
    :cond_34
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto :goto_1f

    .line 571
    :cond_38
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "invalid comment"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final skipWhitespace()V
    .registers 4

    .prologue
    const/16 v2, 0x2f

    .line 2689
    :goto_2
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-gt v0, v2, :cond_36

    .line 2690
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x20

    if-eq v0, v1, :cond_2a

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0xd

    if-eq v0, v1, :cond_2a

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0xa

    if-eq v0, v1, :cond_2a

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x9

    if-eq v0, v1, :cond_2a

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0xc

    if-eq v0, v1, :cond_2a

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x8

    if-ne v0, v1, :cond_2e

    .line 2691
    :cond_2a
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->next()C

    goto :goto_2

    .line 2693
    :cond_2e
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v0, v2, :cond_36

    .line 2694
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipComment()V

    goto :goto_2

    .line 2703
    :cond_36
    return-void
.end method

.method public final stringDefaultValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 405
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringDefaultValue:Ljava/lang/String;

    return-object v0
.end method

.method public abstract stringVal()Ljava/lang/String;
.end method

.method public abstract subString(II)Ljava/lang/String;
.end method

.method protected abstract sub_chars(II)[C
.end method

.method public final token()I
    .registers 2

    .prologue
    .line 393
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    return v0
.end method

.method public final tokenName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 397
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    invoke-static {v0}, Lcom/alibaba/fastjson/parser/JSONToken;->name(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
