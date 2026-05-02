.class public final Lorg/unbescape/properties/PropertiesEscape;
.super Ljava/lang/Object;
.source "PropertiesEscape.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 833
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 834
    return-void
.end method

.method public static escapePropertiesKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 556
    sget-object v0, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    invoke-static {p0, v0}, Lorg/unbescape/properties/PropertiesEscape;->escapePropertiesKey(Ljava/lang/String;Lorg/unbescape/properties/PropertiesKeyEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapePropertiesKey(Ljava/lang/String;Lorg/unbescape/properties/PropertiesKeyEscapeLevel;)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "level"    # Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    .prologue
    .line 585
    if-nez p1, :cond_a

    .line 586
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The \'level\' argument cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 589
    :cond_a
    invoke-static {p0, p1}, Lorg/unbescape/properties/PropertiesKeyEscapeUtil;->escape(Ljava/lang/String;Lorg/unbescape/properties/PropertiesKeyEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapePropertiesKey([CIILjava/io/Writer;)V
    .registers 5
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
    .line 701
    sget-object v0, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    invoke-static {p0, p1, p2, p3, v0}, Lorg/unbescape/properties/PropertiesEscape;->escapePropertiesKey([CIILjava/io/Writer;Lorg/unbescape/properties/PropertiesKeyEscapeLevel;)V

    .line 702
    return-void
.end method

.method public static escapePropertiesKey([CIILjava/io/Writer;Lorg/unbescape/properties/PropertiesKeyEscapeLevel;)V
    .registers 9
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "level"    # Lorg/unbescape/properties/PropertiesKeyEscapeLevel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 733
    if-nez p3, :cond_a

    .line 734
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Argument \'writer\' cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 737
    :cond_a
    if-nez p4, :cond_14

    .line 738
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The \'level\' argument cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 741
    :cond_14
    if-nez p0, :cond_48

    const/4 v0, 0x0

    .line 743
    .local v0, "textLen":I
    :goto_17
    if-ltz p1, :cond_1b

    if-le p1, v0, :cond_4a

    .line 744
    :cond_1b
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

    .line 741
    .end local v0    # "textLen":I
    :cond_48
    array-length v0, p0

    goto :goto_17

    .line 748
    .restart local v0    # "textLen":I
    :cond_4a
    if-ltz p2, :cond_50

    add-int v1, p1, p2

    if-le v1, v0, :cond_7d

    .line 749
    :cond_50
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

    .line 753
    :cond_7d
    invoke-static {p0, p1, p2, p3, p4}, Lorg/unbescape/properties/PropertiesKeyEscapeUtil;->escape([CIILjava/io/Writer;Lorg/unbescape/properties/PropertiesKeyEscapeLevel;)V

    .line 755
    return-void
.end method

.method public static escapePropertiesKeyMinimal(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 498
    sget-object v0, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;->LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    invoke-static {p0, v0}, Lorg/unbescape/properties/PropertiesEscape;->escapePropertiesKey(Ljava/lang/String;Lorg/unbescape/properties/PropertiesKeyEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapePropertiesKeyMinimal([CIILjava/io/Writer;)V
    .registers 5
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
    .line 641
    sget-object v0, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;->LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    invoke-static {p0, p1, p2, p3, v0}, Lorg/unbescape/properties/PropertiesEscape;->escapePropertiesKey([CIILjava/io/Writer;Lorg/unbescape/properties/PropertiesKeyEscapeLevel;)V

    .line 642
    return-void
.end method

.method public static escapePropertiesValue(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 250
    sget-object v0, Lorg/unbescape/properties/PropertiesValueEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/properties/PropertiesValueEscapeLevel;

    invoke-static {p0, v0}, Lorg/unbescape/properties/PropertiesEscape;->escapePropertiesValue(Ljava/lang/String;Lorg/unbescape/properties/PropertiesValueEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapePropertiesValue(Ljava/lang/String;Lorg/unbescape/properties/PropertiesValueEscapeLevel;)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "level"    # Lorg/unbescape/properties/PropertiesValueEscapeLevel;

    .prologue
    .line 279
    if-nez p1, :cond_a

    .line 280
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The \'level\' argument cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 283
    :cond_a
    invoke-static {p0, p1}, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->escape(Ljava/lang/String;Lorg/unbescape/properties/PropertiesValueEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapePropertiesValue([CIILjava/io/Writer;)V
    .registers 5
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
    .line 390
    sget-object v0, Lorg/unbescape/properties/PropertiesValueEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/properties/PropertiesValueEscapeLevel;

    invoke-static {p0, p1, p2, p3, v0}, Lorg/unbescape/properties/PropertiesEscape;->escapePropertiesValue([CIILjava/io/Writer;Lorg/unbescape/properties/PropertiesValueEscapeLevel;)V

    .line 391
    return-void
.end method

.method public static escapePropertiesValue([CIILjava/io/Writer;Lorg/unbescape/properties/PropertiesValueEscapeLevel;)V
    .registers 9
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "level"    # Lorg/unbescape/properties/PropertiesValueEscapeLevel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 422
    if-nez p3, :cond_a

    .line 423
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Argument \'writer\' cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 426
    :cond_a
    if-nez p4, :cond_14

    .line 427
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The \'level\' argument cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 430
    :cond_14
    if-nez p0, :cond_48

    const/4 v0, 0x0

    .line 432
    .local v0, "textLen":I
    :goto_17
    if-ltz p1, :cond_1b

    if-le p1, v0, :cond_4a

    .line 433
    :cond_1b
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

    .line 430
    .end local v0    # "textLen":I
    :cond_48
    array-length v0, p0

    goto :goto_17

    .line 437
    .restart local v0    # "textLen":I
    :cond_4a
    if-ltz p2, :cond_50

    add-int v1, p1, p2

    if-le v1, v0, :cond_7d

    .line 438
    :cond_50
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

    .line 442
    :cond_7d
    invoke-static {p0, p1, p2, p3, p4}, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->escape([CIILjava/io/Writer;Lorg/unbescape/properties/PropertiesValueEscapeLevel;)V

    .line 444
    return-void
.end method

.method public static escapePropertiesValueMinimal(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 195
    sget-object v0, Lorg/unbescape/properties/PropertiesValueEscapeLevel;->LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/properties/PropertiesValueEscapeLevel;

    invoke-static {p0, v0}, Lorg/unbescape/properties/PropertiesEscape;->escapePropertiesValue(Ljava/lang/String;Lorg/unbescape/properties/PropertiesValueEscapeLevel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapePropertiesValueMinimal([CIILjava/io/Writer;)V
    .registers 5
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
    .line 333
    sget-object v0, Lorg/unbescape/properties/PropertiesValueEscapeLevel;->LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/properties/PropertiesValueEscapeLevel;

    invoke-static {p0, p1, p2, p3, v0}, Lorg/unbescape/properties/PropertiesEscape;->escapePropertiesValue([CIILjava/io/Writer;Lorg/unbescape/properties/PropertiesValueEscapeLevel;)V

    .line 334
    return-void
.end method

.method public static unescapeProperties(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 783
    invoke-static {p0}, Lorg/unbescape/properties/PropertiesUnescapeUtil;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static unescapeProperties([CIILjava/io/Writer;)V
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
    .line 808
    if-nez p3, :cond_a

    .line 809
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Argument \'writer\' cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 812
    :cond_a
    if-nez p0, :cond_3e

    const/4 v0, 0x0

    .line 814
    .local v0, "textLen":I
    :goto_d
    if-ltz p1, :cond_11

    if-le p1, v0, :cond_40

    .line 815
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

    .line 812
    .end local v0    # "textLen":I
    :cond_3e
    array-length v0, p0

    goto :goto_d

    .line 819
    .restart local v0    # "textLen":I
    :cond_40
    if-ltz p2, :cond_46

    add-int v1, p1, p2

    if-le v1, v0, :cond_73

    .line 820
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

    .line 824
    :cond_73
    invoke-static {p0, p1, p2, p3}, Lorg/unbescape/properties/PropertiesUnescapeUtil;->unescape([CIILjava/io/Writer;)V

    .line 826
    return-void
.end method
