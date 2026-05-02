.class public final Lorg/unbescape/html/HtmlEscape;
.super Ljava/lang/Object;
.source "HtmlEscape.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 672
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 673
    return-void
.end method

.method public static escapeHtml(Ljava/lang/String;Lorg/unbescape/html/HtmlEscapeType;Lorg/unbescape/html/HtmlEscapeLevel;)Ljava/lang/String;
    .registers 5
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "type"    # Lorg/unbescape/html/HtmlEscapeType;
    .param p2, "level"    # Lorg/unbescape/html/HtmlEscapeLevel;

    .prologue
    .line 343
    if-nez p1, :cond_a

    .line 344
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The \'type\' argument cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 347
    :cond_a
    if-nez p2, :cond_14

    .line 348
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The \'level\' argument cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 351
    :cond_14
    invoke-static {p0, p1, p2}, Lorg/unbescape/html/HtmlEscapeUtil;->escape(Ljava/lang/String;Lorg/unbescape/html/HtmlEscapeType;Lorg/unbescape/html/HtmlEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeHtml([CIILjava/io/Writer;Lorg/unbescape/html/HtmlEscapeType;Lorg/unbescape/html/HtmlEscapeLevel;)V
    .registers 10
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "type"    # Lorg/unbescape/html/HtmlEscapeType;
    .param p5, "level"    # Lorg/unbescape/html/HtmlEscapeLevel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 568
    if-nez p3, :cond_a

    .line 569
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Argument \'writer\' cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 572
    :cond_a
    if-nez p4, :cond_14

    .line 573
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The \'type\' argument cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 576
    :cond_14
    if-nez p5, :cond_1e

    .line 577
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The \'level\' argument cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 580
    :cond_1e
    if-nez p0, :cond_52

    const/4 v0, 0x0

    .line 582
    .local v0, "textLen":I
    :goto_21
    if-ltz p1, :cond_25

    if-le p1, v0, :cond_54

    .line 583
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

    .line 580
    .end local v0    # "textLen":I
    :cond_52
    array-length v0, p0

    goto :goto_21

    .line 587
    .restart local v0    # "textLen":I
    :cond_54
    if-ltz p2, :cond_5a

    add-int v1, p1, p2

    if-le v1, v0, :cond_87

    .line 588
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

    .line 592
    :cond_87
    invoke-static/range {p0 .. p5}, Lorg/unbescape/html/HtmlEscapeUtil;->escape([CIILjava/io/Writer;Lorg/unbescape/html/HtmlEscapeType;Lorg/unbescape/html/HtmlEscapeLevel;)V

    .line 594
    return-void
.end method

.method public static escapeHtml4(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 270
    sget-object v0, Lorg/unbescape/html/HtmlEscapeType;->HTML4_NAMED_REFERENCES_DEFAULT_TO_DECIMAL:Lorg/unbescape/html/HtmlEscapeType;

    sget-object v1, Lorg/unbescape/html/HtmlEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_MARKUP_SIGNIFICANT:Lorg/unbescape/html/HtmlEscapeLevel;

    invoke-static {p0, v0, v1}, Lorg/unbescape/html/HtmlEscape;->escapeHtml(Ljava/lang/String;Lorg/unbescape/html/HtmlEscapeType;Lorg/unbescape/html/HtmlEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeHtml4([CIILjava/io/Writer;)V
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
    .line 490
    sget-object v4, Lorg/unbescape/html/HtmlEscapeType;->HTML4_NAMED_REFERENCES_DEFAULT_TO_DECIMAL:Lorg/unbescape/html/HtmlEscapeType;

    sget-object v5, Lorg/unbescape/html/HtmlEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_MARKUP_SIGNIFICANT:Lorg/unbescape/html/HtmlEscapeLevel;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v5}, Lorg/unbescape/html/HtmlEscape;->escapeHtml([CIILjava/io/Writer;Lorg/unbescape/html/HtmlEscapeType;Lorg/unbescape/html/HtmlEscapeLevel;)V

    .line 492
    return-void
.end method

.method public static escapeHtml4Xml(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 311
    sget-object v0, Lorg/unbescape/html/HtmlEscapeType;->HTML4_NAMED_REFERENCES_DEFAULT_TO_DECIMAL:Lorg/unbescape/html/HtmlEscapeType;

    sget-object v1, Lorg/unbescape/html/HtmlEscapeLevel;->LEVEL_1_ONLY_MARKUP_SIGNIFICANT:Lorg/unbescape/html/HtmlEscapeLevel;

    invoke-static {p0, v0, v1}, Lorg/unbescape/html/HtmlEscape;->escapeHtml(Ljava/lang/String;Lorg/unbescape/html/HtmlEscapeType;Lorg/unbescape/html/HtmlEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeHtml4Xml([CIILjava/io/Writer;)V
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
    .line 533
    sget-object v4, Lorg/unbescape/html/HtmlEscapeType;->HTML4_NAMED_REFERENCES_DEFAULT_TO_DECIMAL:Lorg/unbescape/html/HtmlEscapeType;

    sget-object v5, Lorg/unbescape/html/HtmlEscapeLevel;->LEVEL_1_ONLY_MARKUP_SIGNIFICANT:Lorg/unbescape/html/HtmlEscapeLevel;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v5}, Lorg/unbescape/html/HtmlEscape;->escapeHtml([CIILjava/io/Writer;Lorg/unbescape/html/HtmlEscapeType;Lorg/unbescape/html/HtmlEscapeLevel;)V

    .line 535
    return-void
.end method

.method public static escapeHtml5(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 186
    sget-object v0, Lorg/unbescape/html/HtmlEscapeType;->HTML5_NAMED_REFERENCES_DEFAULT_TO_DECIMAL:Lorg/unbescape/html/HtmlEscapeType;

    sget-object v1, Lorg/unbescape/html/HtmlEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_MARKUP_SIGNIFICANT:Lorg/unbescape/html/HtmlEscapeLevel;

    invoke-static {p0, v0, v1}, Lorg/unbescape/html/HtmlEscape;->escapeHtml(Ljava/lang/String;Lorg/unbescape/html/HtmlEscapeType;Lorg/unbescape/html/HtmlEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeHtml5([CIILjava/io/Writer;)V
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
    .line 401
    sget-object v4, Lorg/unbescape/html/HtmlEscapeType;->HTML5_NAMED_REFERENCES_DEFAULT_TO_DECIMAL:Lorg/unbescape/html/HtmlEscapeType;

    sget-object v5, Lorg/unbescape/html/HtmlEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_MARKUP_SIGNIFICANT:Lorg/unbescape/html/HtmlEscapeLevel;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v5}, Lorg/unbescape/html/HtmlEscape;->escapeHtml([CIILjava/io/Writer;Lorg/unbescape/html/HtmlEscapeType;Lorg/unbescape/html/HtmlEscapeLevel;)V

    .line 403
    return-void
.end method

.method public static escapeHtml5Xml(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 227
    sget-object v0, Lorg/unbescape/html/HtmlEscapeType;->HTML5_NAMED_REFERENCES_DEFAULT_TO_DECIMAL:Lorg/unbescape/html/HtmlEscapeType;

    sget-object v1, Lorg/unbescape/html/HtmlEscapeLevel;->LEVEL_1_ONLY_MARKUP_SIGNIFICANT:Lorg/unbescape/html/HtmlEscapeLevel;

    invoke-static {p0, v0, v1}, Lorg/unbescape/html/HtmlEscape;->escapeHtml(Ljava/lang/String;Lorg/unbescape/html/HtmlEscapeType;Lorg/unbescape/html/HtmlEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeHtml5Xml([CIILjava/io/Writer;)V
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
    .line 445
    sget-object v4, Lorg/unbescape/html/HtmlEscapeType;->HTML5_NAMED_REFERENCES_DEFAULT_TO_DECIMAL:Lorg/unbescape/html/HtmlEscapeType;

    sget-object v5, Lorg/unbescape/html/HtmlEscapeLevel;->LEVEL_1_ONLY_MARKUP_SIGNIFICANT:Lorg/unbescape/html/HtmlEscapeLevel;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v5}, Lorg/unbescape/html/HtmlEscape;->escapeHtml([CIILjava/io/Writer;Lorg/unbescape/html/HtmlEscapeType;Lorg/unbescape/html/HtmlEscapeLevel;)V

    .line 447
    return-void
.end method

.method public static unescapeHtml(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 621
    invoke-static {p0}, Lorg/unbescape/html/HtmlEscapeUtil;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static unescapeHtml([CIILjava/io/Writer;)V
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
    .line 648
    if-nez p3, :cond_a

    .line 649
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Argument \'writer\' cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 652
    :cond_a
    if-nez p0, :cond_3e

    const/4 v0, 0x0

    .line 654
    .local v0, "textLen":I
    :goto_d
    if-ltz p1, :cond_11

    if-le p1, v0, :cond_40

    .line 655
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

    .line 652
    .end local v0    # "textLen":I
    :cond_3e
    array-length v0, p0

    goto :goto_d

    .line 659
    .restart local v0    # "textLen":I
    :cond_40
    if-ltz p2, :cond_46

    add-int v1, p1, p2

    if-le v1, v0, :cond_73

    .line 660
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

    .line 664
    :cond_73
    invoke-static {p0, p1, p2, p3}, Lorg/unbescape/html/HtmlEscapeUtil;->unescape([CIILjava/io/Writer;)V

    .line 666
    return-void
.end method
