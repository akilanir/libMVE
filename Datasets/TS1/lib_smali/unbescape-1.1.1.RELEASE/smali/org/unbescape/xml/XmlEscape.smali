.class public final Lorg/unbescape/xml/XmlEscape;
.super Ljava/lang/Object;
.source "XmlEscape.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 742
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 743
    return-void
.end method

.method private static escapeXml(Ljava/lang/String;Lorg/unbescape/xml/XmlEscapeSymbols;Lorg/unbescape/xml/XmlEscapeType;Lorg/unbescape/xml/XmlEscapeLevel;)Ljava/lang/String;
    .registers 6
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "symbols"    # Lorg/unbescape/xml/XmlEscapeSymbols;
    .param p2, "type"    # Lorg/unbescape/xml/XmlEscapeType;
    .param p3, "level"    # Lorg/unbescape/xml/XmlEscapeLevel;

    .prologue
    .line 375
    if-nez p2, :cond_a

    .line 376
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The \'type\' argument cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 379
    :cond_a
    if-nez p3, :cond_14

    .line 380
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The \'level\' argument cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 383
    :cond_14
    invoke-static {p0, p1, p2, p3}, Lorg/unbescape/xml/XmlEscapeUtil;->escape(Ljava/lang/String;Lorg/unbescape/xml/XmlEscapeSymbols;Lorg/unbescape/xml/XmlEscapeType;Lorg/unbescape/xml/XmlEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static escapeXml([CIILjava/io/Writer;Lorg/unbescape/xml/XmlEscapeSymbols;Lorg/unbescape/xml/XmlEscapeType;Lorg/unbescape/xml/XmlEscapeLevel;)V
    .registers 11
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "symbols"    # Lorg/unbescape/xml/XmlEscapeSymbols;
    .param p5, "type"    # Lorg/unbescape/xml/XmlEscapeType;
    .param p6, "level"    # Lorg/unbescape/xml/XmlEscapeLevel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 639
    if-nez p3, :cond_a

    .line 640
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Argument \'writer\' cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 643
    :cond_a
    if-nez p5, :cond_14

    .line 644
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The \'type\' argument cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 647
    :cond_14
    if-nez p6, :cond_1e

    .line 648
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The \'level\' argument cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 651
    :cond_1e
    if-nez p0, :cond_52

    const/4 v0, 0x0

    .line 653
    .local v0, "textLen":I
    :goto_21
    if-ltz p1, :cond_25

    if-le p1, v0, :cond_54

    .line 654
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

    .line 651
    .end local v0    # "textLen":I
    :cond_52
    array-length v0, p0

    goto :goto_21

    .line 658
    .restart local v0    # "textLen":I
    :cond_54
    if-ltz p2, :cond_5a

    add-int v1, p1, p2

    if-le v1, v0, :cond_87

    .line 659
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

    .line 663
    :cond_87
    invoke-static/range {p0 .. p6}, Lorg/unbescape/xml/XmlEscapeUtil;->escape([CIILjava/io/Writer;Lorg/unbescape/xml/XmlEscapeSymbols;Lorg/unbescape/xml/XmlEscapeType;Lorg/unbescape/xml/XmlEscapeLevel;)V

    .line 665
    return-void
.end method

.method public static escapeXml10(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 257
    sget-object v0, Lorg/unbescape/xml/XmlEscapeSymbols;->XML10_SYMBOLS:Lorg/unbescape/xml/XmlEscapeSymbols;

    sget-object v1, Lorg/unbescape/xml/XmlEscapeType;->CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_HEXA:Lorg/unbescape/xml/XmlEscapeType;

    sget-object v2, Lorg/unbescape/xml/XmlEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_MARKUP_SIGNIFICANT:Lorg/unbescape/xml/XmlEscapeLevel;

    invoke-static {p0, v0, v1, v2}, Lorg/unbescape/xml/XmlEscape;->escapeXml(Ljava/lang/String;Lorg/unbescape/xml/XmlEscapeSymbols;Lorg/unbescape/xml/XmlEscapeType;Lorg/unbescape/xml/XmlEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeXml10(Ljava/lang/String;Lorg/unbescape/xml/XmlEscapeType;Lorg/unbescape/xml/XmlEscapeLevel;)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "type"    # Lorg/unbescape/xml/XmlEscapeType;
    .param p2, "level"    # Lorg/unbescape/xml/XmlEscapeLevel;

    .prologue
    .line 334
    sget-object v0, Lorg/unbescape/xml/XmlEscapeSymbols;->XML10_SYMBOLS:Lorg/unbescape/xml/XmlEscapeSymbols;

    invoke-static {p0, v0, p1, p2}, Lorg/unbescape/xml/XmlEscape;->escapeXml(Ljava/lang/String;Lorg/unbescape/xml/XmlEscapeSymbols;Lorg/unbescape/xml/XmlEscapeType;Lorg/unbescape/xml/XmlEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeXml10([CIILjava/io/Writer;)V
    .registers 11
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
    .line 512
    sget-object v4, Lorg/unbescape/xml/XmlEscapeSymbols;->XML10_SYMBOLS:Lorg/unbescape/xml/XmlEscapeSymbols;

    sget-object v5, Lorg/unbescape/xml/XmlEscapeType;->CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_HEXA:Lorg/unbescape/xml/XmlEscapeType;

    sget-object v6, Lorg/unbescape/xml/XmlEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_MARKUP_SIGNIFICANT:Lorg/unbescape/xml/XmlEscapeLevel;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v6}, Lorg/unbescape/xml/XmlEscape;->escapeXml([CIILjava/io/Writer;Lorg/unbescape/xml/XmlEscapeSymbols;Lorg/unbescape/xml/XmlEscapeType;Lorg/unbescape/xml/XmlEscapeLevel;)V

    .line 515
    return-void
.end method

.method public static escapeXml10([CIILjava/io/Writer;Lorg/unbescape/xml/XmlEscapeType;Lorg/unbescape/xml/XmlEscapeLevel;)V
    .registers 13
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "type"    # Lorg/unbescape/xml/XmlEscapeType;
    .param p5, "level"    # Lorg/unbescape/xml/XmlEscapeLevel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 594
    sget-object v4, Lorg/unbescape/xml/XmlEscapeSymbols;->XML10_SYMBOLS:Lorg/unbescape/xml/XmlEscapeSymbols;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v5, p4

    move-object v6, p5

    invoke-static/range {v0 .. v6}, Lorg/unbescape/xml/XmlEscape;->escapeXml([CIILjava/io/Writer;Lorg/unbescape/xml/XmlEscapeSymbols;Lorg/unbescape/xml/XmlEscapeType;Lorg/unbescape/xml/XmlEscapeLevel;)V

    .line 595
    return-void
.end method

.method public static escapeXml10Minimal(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 175
    sget-object v0, Lorg/unbescape/xml/XmlEscapeSymbols;->XML10_SYMBOLS:Lorg/unbescape/xml/XmlEscapeSymbols;

    sget-object v1, Lorg/unbescape/xml/XmlEscapeType;->CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_HEXA:Lorg/unbescape/xml/XmlEscapeType;

    sget-object v2, Lorg/unbescape/xml/XmlEscapeLevel;->LEVEL_1_ONLY_MARKUP_SIGNIFICANT:Lorg/unbescape/xml/XmlEscapeLevel;

    invoke-static {p0, v0, v1, v2}, Lorg/unbescape/xml/XmlEscape;->escapeXml(Ljava/lang/String;Lorg/unbescape/xml/XmlEscapeSymbols;Lorg/unbescape/xml/XmlEscapeType;Lorg/unbescape/xml/XmlEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeXml10Minimal([CIILjava/io/Writer;)V
    .registers 11
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
    .line 425
    sget-object v4, Lorg/unbescape/xml/XmlEscapeSymbols;->XML10_SYMBOLS:Lorg/unbescape/xml/XmlEscapeSymbols;

    sget-object v5, Lorg/unbescape/xml/XmlEscapeType;->CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_HEXA:Lorg/unbescape/xml/XmlEscapeType;

    sget-object v6, Lorg/unbescape/xml/XmlEscapeLevel;->LEVEL_1_ONLY_MARKUP_SIGNIFICANT:Lorg/unbescape/xml/XmlEscapeLevel;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v6}, Lorg/unbescape/xml/XmlEscape;->escapeXml([CIILjava/io/Writer;Lorg/unbescape/xml/XmlEscapeSymbols;Lorg/unbescape/xml/XmlEscapeType;Lorg/unbescape/xml/XmlEscapeLevel;)V

    .line 428
    return-void
.end method

.method public static escapeXml11(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 302
    sget-object v0, Lorg/unbescape/xml/XmlEscapeSymbols;->XML11_SYMBOLS:Lorg/unbescape/xml/XmlEscapeSymbols;

    sget-object v1, Lorg/unbescape/xml/XmlEscapeType;->CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_HEXA:Lorg/unbescape/xml/XmlEscapeType;

    sget-object v2, Lorg/unbescape/xml/XmlEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_MARKUP_SIGNIFICANT:Lorg/unbescape/xml/XmlEscapeLevel;

    invoke-static {p0, v0, v1, v2}, Lorg/unbescape/xml/XmlEscape;->escapeXml(Ljava/lang/String;Lorg/unbescape/xml/XmlEscapeSymbols;Lorg/unbescape/xml/XmlEscapeType;Lorg/unbescape/xml/XmlEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeXml11(Ljava/lang/String;Lorg/unbescape/xml/XmlEscapeType;Lorg/unbescape/xml/XmlEscapeLevel;)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "type"    # Lorg/unbescape/xml/XmlEscapeType;
    .param p2, "level"    # Lorg/unbescape/xml/XmlEscapeLevel;

    .prologue
    .line 364
    sget-object v0, Lorg/unbescape/xml/XmlEscapeSymbols;->XML11_SYMBOLS:Lorg/unbescape/xml/XmlEscapeSymbols;

    invoke-static {p0, v0, p1, p2}, Lorg/unbescape/xml/XmlEscape;->escapeXml(Ljava/lang/String;Lorg/unbescape/xml/XmlEscapeSymbols;Lorg/unbescape/xml/XmlEscapeType;Lorg/unbescape/xml/XmlEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeXml11([CIILjava/io/Writer;)V
    .registers 11
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
    .line 559
    sget-object v4, Lorg/unbescape/xml/XmlEscapeSymbols;->XML11_SYMBOLS:Lorg/unbescape/xml/XmlEscapeSymbols;

    sget-object v5, Lorg/unbescape/xml/XmlEscapeType;->CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_HEXA:Lorg/unbescape/xml/XmlEscapeType;

    sget-object v6, Lorg/unbescape/xml/XmlEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_MARKUP_SIGNIFICANT:Lorg/unbescape/xml/XmlEscapeLevel;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v6}, Lorg/unbescape/xml/XmlEscape;->escapeXml([CIILjava/io/Writer;Lorg/unbescape/xml/XmlEscapeSymbols;Lorg/unbescape/xml/XmlEscapeType;Lorg/unbescape/xml/XmlEscapeLevel;)V

    .line 562
    return-void
.end method

.method public static escapeXml11([CIILjava/io/Writer;Lorg/unbescape/xml/XmlEscapeType;Lorg/unbescape/xml/XmlEscapeLevel;)V
    .registers 13
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "type"    # Lorg/unbescape/xml/XmlEscapeType;
    .param p5, "level"    # Lorg/unbescape/xml/XmlEscapeLevel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 627
    sget-object v4, Lorg/unbescape/xml/XmlEscapeSymbols;->XML11_SYMBOLS:Lorg/unbescape/xml/XmlEscapeSymbols;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v5, p4

    move-object v6, p5

    invoke-static/range {v0 .. v6}, Lorg/unbescape/xml/XmlEscape;->escapeXml([CIILjava/io/Writer;Lorg/unbescape/xml/XmlEscapeSymbols;Lorg/unbescape/xml/XmlEscapeType;Lorg/unbescape/xml/XmlEscapeLevel;)V

    .line 628
    return-void
.end method

.method public static escapeXml11Minimal(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 212
    sget-object v0, Lorg/unbescape/xml/XmlEscapeSymbols;->XML11_SYMBOLS:Lorg/unbescape/xml/XmlEscapeSymbols;

    sget-object v1, Lorg/unbescape/xml/XmlEscapeType;->CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_HEXA:Lorg/unbescape/xml/XmlEscapeType;

    sget-object v2, Lorg/unbescape/xml/XmlEscapeLevel;->LEVEL_1_ONLY_MARKUP_SIGNIFICANT:Lorg/unbescape/xml/XmlEscapeLevel;

    invoke-static {p0, v0, v1, v2}, Lorg/unbescape/xml/XmlEscape;->escapeXml(Ljava/lang/String;Lorg/unbescape/xml/XmlEscapeSymbols;Lorg/unbescape/xml/XmlEscapeType;Lorg/unbescape/xml/XmlEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeXml11Minimal([CIILjava/io/Writer;)V
    .registers 11
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
    .line 465
    sget-object v4, Lorg/unbescape/xml/XmlEscapeSymbols;->XML11_SYMBOLS:Lorg/unbescape/xml/XmlEscapeSymbols;

    sget-object v5, Lorg/unbescape/xml/XmlEscapeType;->CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_HEXA:Lorg/unbescape/xml/XmlEscapeType;

    sget-object v6, Lorg/unbescape/xml/XmlEscapeLevel;->LEVEL_1_ONLY_MARKUP_SIGNIFICANT:Lorg/unbescape/xml/XmlEscapeLevel;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v6}, Lorg/unbescape/xml/XmlEscape;->escapeXml([CIILjava/io/Writer;Lorg/unbescape/xml/XmlEscapeSymbols;Lorg/unbescape/xml/XmlEscapeType;Lorg/unbescape/xml/XmlEscapeLevel;)V

    .line 468
    return-void
.end method

.method public static unescapeXml(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 689
    sget-object v0, Lorg/unbescape/xml/XmlEscapeSymbols;->XML11_SYMBOLS:Lorg/unbescape/xml/XmlEscapeSymbols;

    invoke-static {p0, v0}, Lorg/unbescape/xml/XmlEscapeUtil;->unescape(Ljava/lang/String;Lorg/unbescape/xml/XmlEscapeSymbols;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static unescapeXml([CIILjava/io/Writer;)V
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
    .line 716
    if-nez p3, :cond_a

    .line 717
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Argument \'writer\' cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 720
    :cond_a
    if-nez p0, :cond_3e

    const/4 v0, 0x0

    .line 722
    .local v0, "textLen":I
    :goto_d
    if-ltz p1, :cond_11

    if-le p1, v0, :cond_40

    .line 723
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

    .line 720
    .end local v0    # "textLen":I
    :cond_3e
    array-length v0, p0

    goto :goto_d

    .line 727
    .restart local v0    # "textLen":I
    :cond_40
    if-ltz p2, :cond_46

    add-int v1, p1, p2

    if-le v1, v0, :cond_73

    .line 728
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

    .line 733
    :cond_73
    sget-object v1, Lorg/unbescape/xml/XmlEscapeSymbols;->XML11_SYMBOLS:Lorg/unbescape/xml/XmlEscapeSymbols;

    invoke-static {p0, p1, p2, p3, v1}, Lorg/unbescape/xml/XmlEscapeUtil;->unescape([CIILjava/io/Writer;Lorg/unbescape/xml/XmlEscapeSymbols;)V

    .line 735
    return-void
.end method
