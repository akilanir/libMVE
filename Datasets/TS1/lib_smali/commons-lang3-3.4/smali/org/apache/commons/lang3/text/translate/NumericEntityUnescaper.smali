.class public Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper;
.super Lorg/apache/commons/lang3/text/translate/CharSequenceTranslator;
.source "NumericEntityUnescaper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper$OPTION;
    }
.end annotation


# instance fields
.field private final options:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet",
            "<",
            "Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper$OPTION;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public varargs constructor <init>([Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper$OPTION;)V
    .registers 5
    .param p1, "options"    # [Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper$OPTION;

    .prologue
    .line 56
    invoke-direct {p0}, Lorg/apache/commons/lang3/text/translate/CharSequenceTranslator;-><init>()V

    .line 57
    array-length v0, p1

    if-lez v0, :cond_11

    .line 58
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/EnumSet;->copyOf(Ljava/util/Collection;)Ljava/util/EnumSet;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper;->options:Ljava/util/EnumSet;

    .line 62
    :goto_10
    return-void

    .line 60
    :cond_11
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper$OPTION;

    const/4 v1, 0x0

    sget-object v2, Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper$OPTION;->semiColonRequired:Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper$OPTION;

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/EnumSet;->copyOf(Ljava/util/Collection;)Ljava/util/EnumSet;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper;->options:Ljava/util/EnumSet;

    goto :goto_10
.end method


# virtual methods
.method public isSet(Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper$OPTION;)Z
    .registers 3
    .param p1, "option"    # Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper$OPTION;

    .prologue
    .line 71
    iget-object v0, p0, Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper;->options:Ljava/util/EnumSet;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper;->options:Ljava/util/EnumSet;

    invoke-virtual {v0, p1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method public translate(Ljava/lang/CharSequence;ILjava/io/Writer;)I
    .registers 15
    .param p1, "input"    # Ljava/lang/CharSequence;
    .param p2, "index"    # I
    .param p3, "out"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v7

    .line 81
    .local v7, "seqEnd":I
    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    const/16 v10, 0x26

    if-ne v9, v10, :cond_dd

    add-int/lit8 v9, v7, -0x2

    if-ge p2, v9, :cond_dd

    add-int/lit8 v9, p2, 0x1

    invoke-interface {p1, v9}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    const/16 v10, 0x23

    if-ne v9, v10, :cond_dd

    .line 82
    add-int/lit8 v8, p2, 0x2

    .line 83
    .local v8, "start":I
    const/4 v4, 0x0

    .line 85
    .local v4, "isHex":Z
    invoke-interface {p1, v8}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    .line 86
    .local v3, "firstChar":C
    const/16 v9, 0x78

    if-eq v3, v9, :cond_29

    const/16 v9, 0x58

    if-ne v3, v9, :cond_30

    .line 87
    :cond_29
    add-int/lit8 v8, v8, 0x1

    .line 88
    const/4 v4, 0x1

    .line 91
    if-ne v8, v7, :cond_30

    .line 92
    const/4 v9, 0x0

    .line 137
    .end local v3    # "firstChar":C
    .end local v4    # "isHex":Z
    .end local v8    # "start":I
    :goto_2f
    return v9

    .line 96
    .restart local v3    # "firstChar":C
    .restart local v4    # "isHex":Z
    .restart local v8    # "start":I
    :cond_30
    move v1, v8

    .line 98
    .local v1, "end":I
    :goto_31
    if-ge v1, v7, :cond_66

    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    const/16 v10, 0x30

    if-lt v9, v10, :cond_43

    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    const/16 v10, 0x39

    if-le v9, v10, :cond_63

    :cond_43
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    const/16 v10, 0x61

    if-lt v9, v10, :cond_53

    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    const/16 v10, 0x66

    if-le v9, v10, :cond_63

    :cond_53
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    const/16 v10, 0x41

    if-lt v9, v10, :cond_66

    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    const/16 v10, 0x46

    if-gt v9, v10, :cond_66

    .line 102
    :cond_63
    add-int/lit8 v1, v1, 0x1

    goto :goto_31

    .line 105
    :cond_66
    if-eq v1, v7, :cond_7d

    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    const/16 v10, 0x3b

    if-ne v9, v10, :cond_7d

    const/4 v6, 0x1

    .line 107
    .local v6, "semiNext":Z
    :goto_71
    if-nez v6, :cond_8f

    .line 108
    sget-object v9, Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper$OPTION;->semiColonRequired:Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper$OPTION;

    invoke-virtual {p0, v9}, Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper;->isSet(Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper$OPTION;)Z

    move-result v9

    if-eqz v9, :cond_7f

    .line 109
    const/4 v9, 0x0

    goto :goto_2f

    .line 105
    .end local v6    # "semiNext":Z
    :cond_7d
    const/4 v6, 0x0

    goto :goto_71

    .line 111
    .restart local v6    # "semiNext":Z
    :cond_7f
    sget-object v9, Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper$OPTION;->errorIfNoSemiColon:Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper$OPTION;

    invoke-virtual {p0, v9}, Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper;->isSet(Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper$OPTION;)Z

    move-result v9

    if-eqz v9, :cond_8f

    .line 112
    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "Semi-colon required at end of numeric entity"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 118
    :cond_8f
    if-eqz v4, :cond_c2

    .line 119
    :try_start_91
    invoke-interface {p1, v8, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v9

    invoke-interface {v9}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0x10

    invoke-static {v9, v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I
    :try_end_9e
    .catch Ljava/lang/NumberFormatException; {:try_start_91 .. :try_end_9e} :catch_d1

    move-result v2

    .line 127
    .local v2, "entityValue":I
    :goto_9f
    const v9, 0xffff

    if-le v2, v9, :cond_d5

    .line 128
    invoke-static {v2}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v0

    .line 129
    .local v0, "chrs":[C
    const/4 v9, 0x0

    aget-char v9, v0, v9

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write(I)V

    .line 130
    const/4 v9, 0x1

    aget-char v9, v0, v9

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write(I)V

    .line 135
    .end local v0    # "chrs":[C
    :goto_b4
    add-int/lit8 v9, v1, 0x2

    sub-int v10, v9, v8

    if-eqz v4, :cond_d9

    const/4 v9, 0x1

    :goto_bb
    add-int/2addr v10, v9

    if-eqz v6, :cond_db

    const/4 v9, 0x1

    :goto_bf
    add-int/2addr v9, v10

    goto/16 :goto_2f

    .line 121
    .end local v2    # "entityValue":I
    :cond_c2
    :try_start_c2
    invoke-interface {p1, v8, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v9

    invoke-interface {v9}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0xa

    invoke-static {v9, v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I
    :try_end_cf
    .catch Ljava/lang/NumberFormatException; {:try_start_c2 .. :try_end_cf} :catch_d1

    move-result v2

    .restart local v2    # "entityValue":I
    goto :goto_9f

    .line 123
    .end local v2    # "entityValue":I
    :catch_d1
    move-exception v5

    .line 124
    .local v5, "nfe":Ljava/lang/NumberFormatException;
    const/4 v9, 0x0

    goto/16 :goto_2f

    .line 132
    .end local v5    # "nfe":Ljava/lang/NumberFormatException;
    .restart local v2    # "entityValue":I
    :cond_d5
    invoke-virtual {p3, v2}, Ljava/io/Writer;->write(I)V

    goto :goto_b4

    .line 135
    :cond_d9
    const/4 v9, 0x0

    goto :goto_bb

    :cond_db
    const/4 v9, 0x0

    goto :goto_bf

    .line 137
    .end local v1    # "end":I
    .end local v2    # "entityValue":I
    .end local v3    # "firstChar":C
    .end local v4    # "isHex":Z
    .end local v6    # "semiNext":Z
    .end local v8    # "start":I
    :cond_dd
    const/4 v9, 0x0

    goto/16 :goto_2f
.end method
