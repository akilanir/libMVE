.class public final Lorg/unbescape/javascript/JavaScriptEscape;
.super Ljava/lang/Object;
.source "JavaScriptEscape.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 629
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 630
    return-void
.end method

.method public static escapeJavaScript(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 304
    sget-object v0, Lorg/unbescape/javascript/JavaScriptEscapeType;->SINGLE_ESCAPE_CHARS_DEFAULT_TO_XHEXA_AND_UHEXA:Lorg/unbescape/javascript/JavaScriptEscapeType;

    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    invoke-static {p0, v0, v1}, Lorg/unbescape/javascript/JavaScriptEscape;->escapeJavaScript(Ljava/lang/String;Lorg/unbescape/javascript/JavaScriptEscapeType;Lorg/unbescape/javascript/JavaScriptEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeJavaScript(Ljava/lang/String;Lorg/unbescape/javascript/JavaScriptEscapeType;Lorg/unbescape/javascript/JavaScriptEscapeLevel;)Ljava/lang/String;
    .registers 5
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "type"    # Lorg/unbescape/javascript/JavaScriptEscapeType;
    .param p2, "level"    # Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    .prologue
    .line 339
    if-nez p1, :cond_a

    .line 340
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The \'type\' argument cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 343
    :cond_a
    if-nez p2, :cond_14

    .line 344
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The \'level\' argument cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 347
    :cond_14
    invoke-static {p0, p1, p2}, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->escape(Ljava/lang/String;Lorg/unbescape/javascript/JavaScriptEscapeType;Lorg/unbescape/javascript/JavaScriptEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeJavaScript([CIILjava/io/Writer;)V
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
    .line 487
    sget-object v4, Lorg/unbescape/javascript/JavaScriptEscapeType;->SINGLE_ESCAPE_CHARS_DEFAULT_TO_XHEXA_AND_UHEXA:Lorg/unbescape/javascript/JavaScriptEscapeType;

    sget-object v5, Lorg/unbescape/javascript/JavaScriptEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v5}, Lorg/unbescape/javascript/JavaScriptEscape;->escapeJavaScript([CIILjava/io/Writer;Lorg/unbescape/javascript/JavaScriptEscapeType;Lorg/unbescape/javascript/JavaScriptEscapeLevel;)V

    .line 490
    return-void
.end method

.method public static escapeJavaScript([CIILjava/io/Writer;Lorg/unbescape/javascript/JavaScriptEscapeType;Lorg/unbescape/javascript/JavaScriptEscapeLevel;)V
    .registers 10
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "type"    # Lorg/unbescape/javascript/JavaScriptEscapeType;
    .param p5, "level"    # Lorg/unbescape/javascript/JavaScriptEscapeLevel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 524
    if-nez p3, :cond_a

    .line 525
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Argument \'writer\' cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 528
    :cond_a
    if-nez p4, :cond_14

    .line 529
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The \'type\' argument cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 532
    :cond_14
    if-nez p5, :cond_1e

    .line 533
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The \'level\' argument cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 536
    :cond_1e
    if-nez p0, :cond_52

    const/4 v0, 0x0

    .line 538
    .local v0, "textLen":I
    :goto_21
    if-ltz p1, :cond_25

    if-le p1, v0, :cond_54

    .line 539
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

    .line 536
    .end local v0    # "textLen":I
    :cond_52
    array-length v0, p0

    goto :goto_21

    .line 543
    .restart local v0    # "textLen":I
    :cond_54
    if-ltz p2, :cond_5a

    add-int v1, p1, p2

    if-le v1, v0, :cond_87

    .line 544
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

    .line 548
    :cond_87
    invoke-static/range {p0 .. p5}, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->escape([CIILjava/io/Writer;Lorg/unbescape/javascript/JavaScriptEscapeType;Lorg/unbescape/javascript/JavaScriptEscapeLevel;)V

    .line 550
    return-void
.end method

.method public static escapeJavaScriptMinimal(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 232
    sget-object v0, Lorg/unbescape/javascript/JavaScriptEscapeType;->SINGLE_ESCAPE_CHARS_DEFAULT_TO_XHEXA_AND_UHEXA:Lorg/unbescape/javascript/JavaScriptEscapeType;

    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeLevel;->LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    invoke-static {p0, v0, v1}, Lorg/unbescape/javascript/JavaScriptEscape;->escapeJavaScript(Ljava/lang/String;Lorg/unbescape/javascript/JavaScriptEscapeType;Lorg/unbescape/javascript/JavaScriptEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeJavaScriptMinimal([CIILjava/io/Writer;)V
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
    .line 412
    sget-object v4, Lorg/unbescape/javascript/JavaScriptEscapeType;->SINGLE_ESCAPE_CHARS_DEFAULT_TO_XHEXA_AND_UHEXA:Lorg/unbescape/javascript/JavaScriptEscapeType;

    sget-object v5, Lorg/unbescape/javascript/JavaScriptEscapeLevel;->LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v5}, Lorg/unbescape/javascript/JavaScriptEscape;->escapeJavaScript([CIILjava/io/Writer;Lorg/unbescape/javascript/JavaScriptEscapeType;Lorg/unbescape/javascript/JavaScriptEscapeLevel;)V

    .line 415
    return-void
.end method

.method public static unescapeJavaScript(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 579
    invoke-static {p0}, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static unescapeJavaScript([CIILjava/io/Writer;)V
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
    .line 605
    if-nez p3, :cond_a

    .line 606
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Argument \'writer\' cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 609
    :cond_a
    if-nez p0, :cond_3e

    const/4 v0, 0x0

    .line 611
    .local v0, "textLen":I
    :goto_d
    if-ltz p1, :cond_11

    if-le p1, v0, :cond_40

    .line 612
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

    .line 609
    .end local v0    # "textLen":I
    :cond_3e
    array-length v0, p0

    goto :goto_d

    .line 616
    .restart local v0    # "textLen":I
    :cond_40
    if-ltz p2, :cond_46

    add-int v1, p1, p2

    if-le v1, v0, :cond_73

    .line 617
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

    .line 621
    :cond_73
    invoke-static {p0, p1, p2, p3}, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->unescape([CIILjava/io/Writer;)V

    .line 623
    return-void
.end method
