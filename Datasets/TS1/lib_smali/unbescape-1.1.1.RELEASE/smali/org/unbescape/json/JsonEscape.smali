.class public final Lorg/unbescape/json/JsonEscape;
.super Ljava/lang/Object;
.source "JsonEscape.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 580
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 581
    return-void
.end method

.method public static escapeJson(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 270
    sget-object v0, Lorg/unbescape/json/JsonEscapeType;->SINGLE_ESCAPE_CHARS_DEFAULT_TO_UHEXA:Lorg/unbescape/json/JsonEscapeType;

    sget-object v1, Lorg/unbescape/json/JsonEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/json/JsonEscapeLevel;

    invoke-static {p0, v0, v1}, Lorg/unbescape/json/JsonEscape;->escapeJson(Ljava/lang/String;Lorg/unbescape/json/JsonEscapeType;Lorg/unbescape/json/JsonEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeJson(Ljava/lang/String;Lorg/unbescape/json/JsonEscapeType;Lorg/unbescape/json/JsonEscapeLevel;)Ljava/lang/String;
    .registers 5
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "type"    # Lorg/unbescape/json/JsonEscapeType;
    .param p2, "level"    # Lorg/unbescape/json/JsonEscapeLevel;

    .prologue
    .line 305
    if-nez p1, :cond_a

    .line 306
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The \'type\' argument cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 309
    :cond_a
    if-nez p2, :cond_14

    .line 310
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The \'level\' argument cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 313
    :cond_14
    invoke-static {p0, p1, p2}, Lorg/unbescape/json/JsonEscapeUtil;->escape(Ljava/lang/String;Lorg/unbescape/json/JsonEscapeType;Lorg/unbescape/json/JsonEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeJson([CIILjava/io/Writer;)V
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
    .line 440
    sget-object v4, Lorg/unbescape/json/JsonEscapeType;->SINGLE_ESCAPE_CHARS_DEFAULT_TO_UHEXA:Lorg/unbescape/json/JsonEscapeType;

    sget-object v5, Lorg/unbescape/json/JsonEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/json/JsonEscapeLevel;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v5}, Lorg/unbescape/json/JsonEscape;->escapeJson([CIILjava/io/Writer;Lorg/unbescape/json/JsonEscapeType;Lorg/unbescape/json/JsonEscapeLevel;)V

    .line 443
    return-void
.end method

.method public static escapeJson([CIILjava/io/Writer;Lorg/unbescape/json/JsonEscapeType;Lorg/unbescape/json/JsonEscapeLevel;)V
    .registers 10
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "type"    # Lorg/unbescape/json/JsonEscapeType;
    .param p5, "level"    # Lorg/unbescape/json/JsonEscapeLevel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 477
    if-nez p3, :cond_a

    .line 478
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Argument \'writer\' cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 481
    :cond_a
    if-nez p4, :cond_14

    .line 482
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The \'type\' argument cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 485
    :cond_14
    if-nez p5, :cond_1e

    .line 486
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The \'level\' argument cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 489
    :cond_1e
    if-nez p0, :cond_52

    const/4 v0, 0x0

    .line 491
    .local v0, "textLen":I
    :goto_21
    if-ltz p1, :cond_25

    if-le p1, v0, :cond_54

    .line 492
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

    .line 489
    .end local v0    # "textLen":I
    :cond_52
    array-length v0, p0

    goto :goto_21

    .line 496
    .restart local v0    # "textLen":I
    :cond_54
    if-ltz p2, :cond_5a

    add-int v1, p1, p2

    if-le v1, v0, :cond_87

    .line 497
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

    .line 501
    :cond_87
    invoke-static/range {p0 .. p5}, Lorg/unbescape/json/JsonEscapeUtil;->escape([CIILjava/io/Writer;Lorg/unbescape/json/JsonEscapeType;Lorg/unbescape/json/JsonEscapeLevel;)V

    .line 503
    return-void
.end method

.method public static escapeJsonMinimal(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 205
    sget-object v0, Lorg/unbescape/json/JsonEscapeType;->SINGLE_ESCAPE_CHARS_DEFAULT_TO_UHEXA:Lorg/unbescape/json/JsonEscapeType;

    sget-object v1, Lorg/unbescape/json/JsonEscapeLevel;->LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/json/JsonEscapeLevel;

    invoke-static {p0, v0, v1}, Lorg/unbescape/json/JsonEscape;->escapeJson(Ljava/lang/String;Lorg/unbescape/json/JsonEscapeType;Lorg/unbescape/json/JsonEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeJsonMinimal([CIILjava/io/Writer;)V
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
    .line 372
    sget-object v4, Lorg/unbescape/json/JsonEscapeType;->SINGLE_ESCAPE_CHARS_DEFAULT_TO_UHEXA:Lorg/unbescape/json/JsonEscapeType;

    sget-object v5, Lorg/unbescape/json/JsonEscapeLevel;->LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/json/JsonEscapeLevel;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v5}, Lorg/unbescape/json/JsonEscape;->escapeJson([CIILjava/io/Writer;Lorg/unbescape/json/JsonEscapeType;Lorg/unbescape/json/JsonEscapeLevel;)V

    .line 375
    return-void
.end method

.method public static unescapeJson(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 531
    invoke-static {p0}, Lorg/unbescape/json/JsonEscapeUtil;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static unescapeJson([CIILjava/io/Writer;)V
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
    .line 556
    if-nez p3, :cond_a

    .line 557
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Argument \'writer\' cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 560
    :cond_a
    if-nez p0, :cond_3e

    const/4 v0, 0x0

    .line 562
    .local v0, "textLen":I
    :goto_d
    if-ltz p1, :cond_11

    if-le p1, v0, :cond_40

    .line 563
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

    .line 560
    .end local v0    # "textLen":I
    :cond_3e
    array-length v0, p0

    goto :goto_d

    .line 567
    .restart local v0    # "textLen":I
    :cond_40
    if-ltz p2, :cond_46

    add-int v1, p1, p2

    if-le v1, v0, :cond_73

    .line 568
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

    .line 572
    :cond_73
    invoke-static {p0, p1, p2, p3}, Lorg/unbescape/json/JsonEscapeUtil;->unescape([CIILjava/io/Writer;)V

    .line 574
    return-void
.end method
