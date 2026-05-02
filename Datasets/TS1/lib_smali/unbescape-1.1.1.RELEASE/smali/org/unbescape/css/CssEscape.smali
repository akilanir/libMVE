.class public final Lorg/unbescape/css/CssEscape;
.super Ljava/lang/Object;
.source "CssEscape.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 1007
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1008
    return-void
.end method

.method public static escapeCssIdentifier(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 641
    sget-object v0, Lorg/unbescape/css/CssIdentifierEscapeType;->BACKSLASH_ESCAPES_DEFAULT_TO_COMPACT_HEXA:Lorg/unbescape/css/CssIdentifierEscapeType;

    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/css/CssIdentifierEscapeLevel;

    invoke-static {p0, v0, v1}, Lorg/unbescape/css/CssEscape;->escapeCssIdentifier(Ljava/lang/String;Lorg/unbescape/css/CssIdentifierEscapeType;Lorg/unbescape/css/CssIdentifierEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeCssIdentifier(Ljava/lang/String;Lorg/unbescape/css/CssIdentifierEscapeType;Lorg/unbescape/css/CssIdentifierEscapeLevel;)Ljava/lang/String;
    .registers 5
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "type"    # Lorg/unbescape/css/CssIdentifierEscapeType;
    .param p2, "level"    # Lorg/unbescape/css/CssIdentifierEscapeLevel;

    .prologue
    .line 676
    if-nez p1, :cond_a

    .line 677
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The \'type\' argument cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 680
    :cond_a
    if-nez p2, :cond_14

    .line 681
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The \'level\' argument cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 684
    :cond_14
    invoke-static {p0, p1, p2}, Lorg/unbescape/css/CssIdentifierEscapeUtil;->escape(Ljava/lang/String;Lorg/unbescape/css/CssIdentifierEscapeType;Lorg/unbescape/css/CssIdentifierEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeCssIdentifier([CIILjava/io/Writer;)V
    .registers 10
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 864
    sget-object v4, Lorg/unbescape/css/CssIdentifierEscapeType;->BACKSLASH_ESCAPES_DEFAULT_TO_COMPACT_HEXA:Lorg/unbescape/css/CssIdentifierEscapeType;

    sget-object v5, Lorg/unbescape/css/CssIdentifierEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/css/CssIdentifierEscapeLevel;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v5}, Lorg/unbescape/css/CssEscape;->escapeCssIdentifier([CIILjava/io/Writer;Lorg/unbescape/css/CssIdentifierEscapeType;Lorg/unbescape/css/CssIdentifierEscapeLevel;)V

    .line 867
    return-void
.end method

.method public static escapeCssIdentifier([CIILjava/io/Writer;Lorg/unbescape/css/CssIdentifierEscapeType;Lorg/unbescape/css/CssIdentifierEscapeLevel;)V
    .registers 10
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "type"    # Lorg/unbescape/css/CssIdentifierEscapeType;
    .param p5, "level"    # Lorg/unbescape/css/CssIdentifierEscapeLevel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 901
    if-nez p3, :cond_a

    .line 902
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Argument \'writer\' cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 905
    :cond_a
    if-nez p4, :cond_14

    .line 906
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The \'type\' argument cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 909
    :cond_14
    if-nez p5, :cond_1e

    .line 910
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The \'level\' argument cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 913
    :cond_1e
    if-nez p0, :cond_52

    const/4 v0, 0x0

    .line 915
    .local v0, "textLen":I
    :goto_21
    if-ltz p1, :cond_25

    if-le p1, v0, :cond_54

    .line 916
    :cond_25
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid (offset, len). offset="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", len="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", text.length="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 913
    .end local v0    # "textLen":I
    :cond_52
    array-length v0, p0

    goto :goto_21

    .line 920
    .restart local v0    # "textLen":I
    :cond_54
    if-ltz p2, :cond_5a

    add-int v1, p1, p2

    if-le v1, v0, :cond_87

    .line 921
    :cond_5a
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid (offset, len). offset="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", len="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", text.length="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 925
    :cond_87
    invoke-static/range {p0 .. p5}, Lorg/unbescape/css/CssIdentifierEscapeUtil;->escape([CIILjava/io/Writer;Lorg/unbescape/css/CssIdentifierEscapeType;Lorg/unbescape/css/CssIdentifierEscapeLevel;)V

    .line 927
    return-void
.end method

.method public static escapeCssIdentifierMinimal(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 551
    sget-object v0, Lorg/unbescape/css/CssIdentifierEscapeType;->BACKSLASH_ESCAPES_DEFAULT_TO_COMPACT_HEXA:Lorg/unbescape/css/CssIdentifierEscapeType;

    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeLevel;->LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/css/CssIdentifierEscapeLevel;

    invoke-static {p0, v0, v1}, Lorg/unbescape/css/CssEscape;->escapeCssIdentifier(Ljava/lang/String;Lorg/unbescape/css/CssIdentifierEscapeType;Lorg/unbescape/css/CssIdentifierEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeCssIdentifierMinimal([CIILjava/io/Writer;)V
    .registers 10
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 772
    sget-object v4, Lorg/unbescape/css/CssIdentifierEscapeType;->BACKSLASH_ESCAPES_DEFAULT_TO_COMPACT_HEXA:Lorg/unbescape/css/CssIdentifierEscapeType;

    sget-object v5, Lorg/unbescape/css/CssIdentifierEscapeLevel;->LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/css/CssIdentifierEscapeLevel;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v5}, Lorg/unbescape/css/CssEscape;->escapeCssIdentifier([CIILjava/io/Writer;Lorg/unbescape/css/CssIdentifierEscapeType;Lorg/unbescape/css/CssIdentifierEscapeLevel;)V

    .line 775
    return-void
.end method

.method public static escapeCssString(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 245
    sget-object v0, Lorg/unbescape/css/CssStringEscapeType;->BACKSLASH_ESCAPES_DEFAULT_TO_COMPACT_HEXA:Lorg/unbescape/css/CssStringEscapeType;

    sget-object v1, Lorg/unbescape/css/CssStringEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/css/CssStringEscapeLevel;

    invoke-static {p0, v0, v1}, Lorg/unbescape/css/CssEscape;->escapeCssString(Ljava/lang/String;Lorg/unbescape/css/CssStringEscapeType;Lorg/unbescape/css/CssStringEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeCssString(Ljava/lang/String;Lorg/unbescape/css/CssStringEscapeType;Lorg/unbescape/css/CssStringEscapeLevel;)Ljava/lang/String;
    .registers 5
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "type"    # Lorg/unbescape/css/CssStringEscapeType;
    .param p2, "level"    # Lorg/unbescape/css/CssStringEscapeLevel;

    .prologue
    .line 280
    if-nez p1, :cond_a

    .line 281
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The \'type\' argument cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 284
    :cond_a
    if-nez p2, :cond_14

    .line 285
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The \'level\' argument cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 288
    :cond_14
    invoke-static {p0, p1, p2}, Lorg/unbescape/css/CssStringEscapeUtil;->escape(Ljava/lang/String;Lorg/unbescape/css/CssStringEscapeType;Lorg/unbescape/css/CssStringEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeCssString([CIILjava/io/Writer;)V
    .registers 10
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 400
    sget-object v4, Lorg/unbescape/css/CssStringEscapeType;->BACKSLASH_ESCAPES_DEFAULT_TO_COMPACT_HEXA:Lorg/unbescape/css/CssStringEscapeType;

    sget-object v5, Lorg/unbescape/css/CssStringEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/css/CssStringEscapeLevel;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v5}, Lorg/unbescape/css/CssEscape;->escapeCssString([CIILjava/io/Writer;Lorg/unbescape/css/CssStringEscapeType;Lorg/unbescape/css/CssStringEscapeLevel;)V

    .line 403
    return-void
.end method

.method public static escapeCssString([CIILjava/io/Writer;Lorg/unbescape/css/CssStringEscapeType;Lorg/unbescape/css/CssStringEscapeLevel;)V
    .registers 10
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "type"    # Lorg/unbescape/css/CssStringEscapeType;
    .param p5, "level"    # Lorg/unbescape/css/CssStringEscapeLevel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 437
    if-nez p3, :cond_a

    .line 438
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Argument \'writer\' cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 441
    :cond_a
    if-nez p4, :cond_14

    .line 442
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The \'type\' argument cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 445
    :cond_14
    if-nez p5, :cond_1e

    .line 446
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The \'level\' argument cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 449
    :cond_1e
    if-nez p0, :cond_52

    const/4 v0, 0x0

    .line 451
    .local v0, "textLen":I
    :goto_21
    if-ltz p1, :cond_25

    if-le p1, v0, :cond_54

    .line 452
    :cond_25
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid (offset, len). offset="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", len="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", text.length="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 449
    .end local v0    # "textLen":I
    :cond_52
    array-length v0, p0

    goto :goto_21

    .line 456
    .restart local v0    # "textLen":I
    :cond_54
    if-ltz p2, :cond_5a

    add-int v1, p1, p2

    if-le v1, v0, :cond_87

    .line 457
    :cond_5a
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid (offset, len). offset="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", len="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", text.length="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 461
    :cond_87
    invoke-static/range {p0 .. p5}, Lorg/unbescape/css/CssStringEscapeUtil;->escape([CIILjava/io/Writer;Lorg/unbescape/css/CssStringEscapeType;Lorg/unbescape/css/CssStringEscapeLevel;)V

    .line 463
    return-void
.end method

.method public static escapeCssStringMinimal(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 189
    sget-object v0, Lorg/unbescape/css/CssStringEscapeType;->BACKSLASH_ESCAPES_DEFAULT_TO_COMPACT_HEXA:Lorg/unbescape/css/CssStringEscapeType;

    sget-object v1, Lorg/unbescape/css/CssStringEscapeLevel;->LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/css/CssStringEscapeLevel;

    invoke-static {p0, v0, v1}, Lorg/unbescape/css/CssEscape;->escapeCssString(Ljava/lang/String;Lorg/unbescape/css/CssStringEscapeType;Lorg/unbescape/css/CssStringEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeCssStringMinimal([CIILjava/io/Writer;)V
    .registers 10
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 342
    sget-object v4, Lorg/unbescape/css/CssStringEscapeType;->BACKSLASH_ESCAPES_DEFAULT_TO_COMPACT_HEXA:Lorg/unbescape/css/CssStringEscapeType;

    sget-object v5, Lorg/unbescape/css/CssStringEscapeLevel;->LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/css/CssStringEscapeLevel;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v5}, Lorg/unbescape/css/CssEscape;->escapeCssString([CIILjava/io/Writer;Lorg/unbescape/css/CssStringEscapeType;Lorg/unbescape/css/CssStringEscapeLevel;)V

    .line 345
    return-void
.end method

.method public static unescapeCss(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 956
    invoke-static {p0}, Lorg/unbescape/css/CssUnescapeUtil;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static unescapeCss([CIILjava/io/Writer;)V
    .registers 8
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 982
    if-nez p3, :cond_a

    .line 983
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Argument \'writer\' cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 986
    :cond_a
    if-nez p0, :cond_3e

    const/4 v0, 0x0

    .line 988
    .local v0, "textLen":I
    :goto_d
    if-ltz p1, :cond_11

    if-le p1, v0, :cond_40

    .line 989
    :cond_11
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid (offset, len). offset="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", len="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", text.length="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 986
    .end local v0    # "textLen":I
    :cond_3e
    array-length v0, p0

    goto :goto_d

    .line 993
    .restart local v0    # "textLen":I
    :cond_40
    if-ltz p2, :cond_46

    add-int v1, p1, p2

    if-le v1, v0, :cond_73

    .line 994
    :cond_46
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid (offset, len). offset="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", len="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", text.length="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 998
    :cond_73
    invoke-static {p0, p1, p2, p3}, Lorg/unbescape/css/CssUnescapeUtil;->unescape([CIILjava/io/Writer;)V

    .line 1000
    return-void
.end method
