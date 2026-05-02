.class public final Lorg/unbescape/uri/UriEscape;
.super Ljava/lang/Object;
.source "UriEscape.java"


# static fields
.field public static final DEFAULT_ENCODING:Ljava/lang/String; = "UTF-8"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 1423
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1424
    return-void
.end method

.method public static escapeUriFragmentId(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 362
    const-string v0, "UTF-8"

    invoke-static {p0, v0}, Lorg/unbescape/uri/UriEscape;->escapeUriFragmentId(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeUriFragmentId(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 398
    if-nez p1, :cond_a

    .line 399
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'encoding\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 401
    :cond_a
    sget-object v0, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->FRAGMENT_ID:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    invoke-static {p0, v0, p1}, Lorg/unbescape/uri/UriEscapeUtil;->escape(Ljava/lang/String;Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeUriFragmentId([CIILjava/io/Writer;)V
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
    .line 730
    const-string v0, "UTF-8"

    invoke-static {p0, p1, p2, p3, v0}, Lorg/unbescape/uri/UriEscape;->escapeUriFragmentId([CIILjava/io/Writer;Ljava/lang/String;)V

    .line 731
    return-void
.end method

.method public static escapeUriFragmentId([CIILjava/io/Writer;Ljava/lang/String;)V
    .registers 12
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 769
    if-nez p3, :cond_a

    .line 770
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'writer\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 773
    :cond_a
    if-nez p4, :cond_14

    .line 774
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'encoding\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 777
    :cond_14
    if-nez p0, :cond_48

    const/4 v6, 0x0

    .line 779
    .local v6, "textLen":I
    :goto_17
    if-ltz p1, :cond_1b

    if-le p1, v6, :cond_4a

    .line 780
    :cond_1b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid (offset, len). offset="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", len="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", text.length="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 777
    .end local v6    # "textLen":I
    :cond_48
    array-length v6, p0

    goto :goto_17

    .line 784
    .restart local v6    # "textLen":I
    :cond_4a
    if-ltz p2, :cond_50

    add-int v0, p1, p2

    if-le v0, v6, :cond_7d

    .line 785
    :cond_50
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid (offset, len). offset="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", len="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", text.length="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 788
    :cond_7d
    sget-object v4, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->FRAGMENT_ID:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lorg/unbescape/uri/UriEscapeUtil;->escape([CIILjava/io/Writer;Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;Ljava/lang/String;)V

    .line 789
    return-void
.end method

.method public static escapeUriPath(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 139
    const-string v0, "UTF-8"

    invoke-static {p0, v0}, Lorg/unbescape/uri/UriEscape;->escapeUriPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeUriPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 175
    if-nez p1, :cond_a

    .line 176
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'encoding\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 178
    :cond_a
    sget-object v0, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->PATH:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    invoke-static {p0, v0, p1}, Lorg/unbescape/uri/UriEscapeUtil;->escape(Ljava/lang/String;Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeUriPath([CIILjava/io/Writer;)V
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
    .line 443
    const-string v0, "UTF-8"

    invoke-static {p0, p1, p2, p3, v0}, Lorg/unbescape/uri/UriEscape;->escapeUriPath([CIILjava/io/Writer;Ljava/lang/String;)V

    .line 444
    return-void
.end method

.method public static escapeUriPath([CIILjava/io/Writer;Ljava/lang/String;)V
    .registers 12
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 482
    if-nez p3, :cond_a

    .line 483
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'writer\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 486
    :cond_a
    if-nez p4, :cond_14

    .line 487
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'encoding\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 490
    :cond_14
    if-nez p0, :cond_48

    const/4 v6, 0x0

    .line 492
    .local v6, "textLen":I
    :goto_17
    if-ltz p1, :cond_1b

    if-le p1, v6, :cond_4a

    .line 493
    :cond_1b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid (offset, len). offset="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", len="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", text.length="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 490
    .end local v6    # "textLen":I
    :cond_48
    array-length v6, p0

    goto :goto_17

    .line 497
    .restart local v6    # "textLen":I
    :cond_4a
    if-ltz p2, :cond_50

    add-int v0, p1, p2

    if-le v0, v6, :cond_7d

    .line 498
    :cond_50
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid (offset, len). offset="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", len="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", text.length="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 502
    :cond_7d
    sget-object v4, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->PATH:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lorg/unbescape/uri/UriEscapeUtil;->escape([CIILjava/io/Writer;Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;Ljava/lang/String;)V

    .line 503
    return-void
.end method

.method public static escapeUriPathSegment(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 213
    const-string v0, "UTF-8"

    invoke-static {p0, v0}, Lorg/unbescape/uri/UriEscape;->escapeUriPathSegment(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeUriPathSegment(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 248
    if-nez p1, :cond_a

    .line 249
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'encoding\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 251
    :cond_a
    sget-object v0, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->PATH_SEGMENT:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    invoke-static {p0, v0, p1}, Lorg/unbescape/uri/UriEscapeUtil;->escape(Ljava/lang/String;Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeUriPathSegment([CIILjava/io/Writer;)V
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
    .line 539
    const-string v0, "UTF-8"

    invoke-static {p0, p1, p2, p3, v0}, Lorg/unbescape/uri/UriEscape;->escapeUriPathSegment([CIILjava/io/Writer;Ljava/lang/String;)V

    .line 540
    return-void
.end method

.method public static escapeUriPathSegment([CIILjava/io/Writer;Ljava/lang/String;)V
    .registers 12
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 577
    if-nez p3, :cond_a

    .line 578
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'writer\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 581
    :cond_a
    if-nez p4, :cond_14

    .line 582
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'encoding\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 585
    :cond_14
    if-nez p0, :cond_48

    const/4 v6, 0x0

    .line 587
    .local v6, "textLen":I
    :goto_17
    if-ltz p1, :cond_1b

    if-le p1, v6, :cond_4a

    .line 588
    :cond_1b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid (offset, len). offset="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", len="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", text.length="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 585
    .end local v6    # "textLen":I
    :cond_48
    array-length v6, p0

    goto :goto_17

    .line 592
    .restart local v6    # "textLen":I
    :cond_4a
    if-ltz p2, :cond_50

    add-int v0, p1, p2

    if-le v0, v6, :cond_7d

    .line 593
    :cond_50
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid (offset, len). offset="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", len="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", text.length="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 596
    :cond_7d
    sget-object v4, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->PATH_SEGMENT:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lorg/unbescape/uri/UriEscapeUtil;->escape([CIILjava/io/Writer;Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;Ljava/lang/String;)V

    .line 597
    return-void
.end method

.method public static escapeUriQueryParam(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 287
    const-string v0, "UTF-8"

    invoke-static {p0, v0}, Lorg/unbescape/uri/UriEscape;->escapeUriQueryParam(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeUriQueryParam(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 323
    if-nez p1, :cond_a

    .line 324
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'encoding\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 326
    :cond_a
    sget-object v0, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->QUERY_PARAM:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    invoke-static {p0, v0, p1}, Lorg/unbescape/uri/UriEscapeUtil;->escape(Ljava/lang/String;Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeUriQueryParam([CIILjava/io/Writer;)V
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
    .line 634
    const-string v0, "UTF-8"

    invoke-static {p0, p1, p2, p3, v0}, Lorg/unbescape/uri/UriEscape;->escapeUriQueryParam([CIILjava/io/Writer;Ljava/lang/String;)V

    .line 635
    return-void
.end method

.method public static escapeUriQueryParam([CIILjava/io/Writer;Ljava/lang/String;)V
    .registers 12
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 673
    if-nez p3, :cond_a

    .line 674
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'writer\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 677
    :cond_a
    if-nez p4, :cond_14

    .line 678
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'encoding\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 681
    :cond_14
    if-nez p0, :cond_48

    const/4 v6, 0x0

    .line 683
    .local v6, "textLen":I
    :goto_17
    if-ltz p1, :cond_1b

    if-le p1, v6, :cond_4a

    .line 684
    :cond_1b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid (offset, len). offset="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", len="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", text.length="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 681
    .end local v6    # "textLen":I
    :cond_48
    array-length v6, p0

    goto :goto_17

    .line 688
    .restart local v6    # "textLen":I
    :cond_4a
    if-ltz p2, :cond_50

    add-int v0, p1, p2

    if-le v0, v6, :cond_7d

    .line 689
    :cond_50
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid (offset, len). offset="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", len="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", text.length="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 692
    :cond_7d
    sget-object v4, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->QUERY_PARAM:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lorg/unbescape/uri/UriEscapeUtil;->escape([CIILjava/io/Writer;Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;Ljava/lang/String;)V

    .line 693
    return-void
.end method

.method public static unescapeUriFragmentId(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 1027
    const-string v0, "UTF-8"

    invoke-static {p0, v0}, Lorg/unbescape/uri/UriEscape;->unescapeUriFragmentId(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static unescapeUriFragmentId(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 1058
    if-nez p1, :cond_a

    .line 1059
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'encoding\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1061
    :cond_a
    sget-object v0, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->FRAGMENT_ID:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    invoke-static {p0, v0, p1}, Lorg/unbescape/uri/UriEscapeUtil;->unescape(Ljava/lang/String;Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static unescapeUriFragmentId([CIILjava/io/Writer;)V
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
    .line 1357
    const-string v0, "UTF-8"

    invoke-static {p0, p1, p2, p3, v0}, Lorg/unbescape/uri/UriEscape;->unescapeUriFragmentId([CIILjava/io/Writer;Ljava/lang/String;)V

    .line 1358
    return-void
.end method

.method public static unescapeUriFragmentId([CIILjava/io/Writer;Ljava/lang/String;)V
    .registers 12
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1391
    if-nez p3, :cond_a

    .line 1392
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'writer\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1395
    :cond_a
    if-nez p4, :cond_14

    .line 1396
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'encoding\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1399
    :cond_14
    if-nez p0, :cond_48

    const/4 v6, 0x0

    .line 1401
    .local v6, "textLen":I
    :goto_17
    if-ltz p1, :cond_1b

    if-le p1, v6, :cond_4a

    .line 1402
    :cond_1b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid (offset, len). offset="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", len="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", text.length="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1399
    .end local v6    # "textLen":I
    :cond_48
    array-length v6, p0

    goto :goto_17

    .line 1406
    .restart local v6    # "textLen":I
    :cond_4a
    if-ltz p2, :cond_50

    add-int v0, p1, p2

    if-le v0, v6, :cond_7d

    .line 1407
    :cond_50
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid (offset, len). offset="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", len="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", text.length="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1410
    :cond_7d
    sget-object v4, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->FRAGMENT_ID:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lorg/unbescape/uri/UriEscapeUtil;->unescape([CIILjava/io/Writer;Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;Ljava/lang/String;)V

    .line 1411
    return-void
.end method

.method public static unescapeUriPath(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 832
    const-string v0, "UTF-8"

    invoke-static {p0, v0}, Lorg/unbescape/uri/UriEscape;->unescapeUriPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static unescapeUriPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 863
    if-nez p1, :cond_a

    .line 864
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'encoding\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 866
    :cond_a
    sget-object v0, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->PATH:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    invoke-static {p0, v0, p1}, Lorg/unbescape/uri/UriEscapeUtil;->unescape(Ljava/lang/String;Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static unescapeUriPath([CIILjava/io/Writer;)V
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
    .line 1098
    const-string v0, "UTF-8"

    invoke-static {p0, p1, p2, p3, v0}, Lorg/unbescape/uri/UriEscape;->unescapeUriPath([CIILjava/io/Writer;Ljava/lang/String;)V

    .line 1099
    return-void
.end method

.method public static unescapeUriPath([CIILjava/io/Writer;Ljava/lang/String;)V
    .registers 12
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1132
    if-nez p3, :cond_a

    .line 1133
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'writer\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1136
    :cond_a
    if-nez p4, :cond_14

    .line 1137
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'encoding\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1140
    :cond_14
    if-nez p0, :cond_48

    const/4 v6, 0x0

    .line 1142
    .local v6, "textLen":I
    :goto_17
    if-ltz p1, :cond_1b

    if-le p1, v6, :cond_4a

    .line 1143
    :cond_1b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid (offset, len). offset="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", len="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", text.length="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1140
    .end local v6    # "textLen":I
    :cond_48
    array-length v6, p0

    goto :goto_17

    .line 1147
    .restart local v6    # "textLen":I
    :cond_4a
    if-ltz p2, :cond_50

    add-int v0, p1, p2

    if-le v0, v6, :cond_7d

    .line 1148
    :cond_50
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid (offset, len). offset="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", len="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", text.length="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1152
    :cond_7d
    sget-object v4, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->PATH:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lorg/unbescape/uri/UriEscapeUtil;->unescape([CIILjava/io/Writer;Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;Ljava/lang/String;)V

    .line 1153
    return-void
.end method

.method public static unescapeUriPathSegment(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 897
    const-string v0, "UTF-8"

    invoke-static {p0, v0}, Lorg/unbescape/uri/UriEscape;->unescapeUriPathSegment(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static unescapeUriPathSegment(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 928
    if-nez p1, :cond_a

    .line 929
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'encoding\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 931
    :cond_a
    sget-object v0, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->PATH_SEGMENT:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    invoke-static {p0, v0, p1}, Lorg/unbescape/uri/UriEscapeUtil;->unescape(Ljava/lang/String;Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static unescapeUriPathSegment([CIILjava/io/Writer;)V
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
    .line 1185
    const-string v0, "UTF-8"

    invoke-static {p0, p1, p2, p3, v0}, Lorg/unbescape/uri/UriEscape;->unescapeUriPathSegment([CIILjava/io/Writer;Ljava/lang/String;)V

    .line 1186
    return-void
.end method

.method public static unescapeUriPathSegment([CIILjava/io/Writer;Ljava/lang/String;)V
    .registers 12
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1219
    if-nez p3, :cond_a

    .line 1220
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'writer\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1223
    :cond_a
    if-nez p4, :cond_14

    .line 1224
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'encoding\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1227
    :cond_14
    if-nez p0, :cond_48

    const/4 v6, 0x0

    .line 1229
    .local v6, "textLen":I
    :goto_17
    if-ltz p1, :cond_1b

    if-le p1, v6, :cond_4a

    .line 1230
    :cond_1b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid (offset, len). offset="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", len="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", text.length="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1227
    .end local v6    # "textLen":I
    :cond_48
    array-length v6, p0

    goto :goto_17

    .line 1234
    .restart local v6    # "textLen":I
    :cond_4a
    if-ltz p2, :cond_50

    add-int v0, p1, p2

    if-le v0, v6, :cond_7d

    .line 1235
    :cond_50
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid (offset, len). offset="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", len="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", text.length="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1238
    :cond_7d
    sget-object v4, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->PATH_SEGMENT:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lorg/unbescape/uri/UriEscapeUtil;->unescape([CIILjava/io/Writer;Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;Ljava/lang/String;)V

    .line 1239
    return-void
.end method

.method public static unescapeUriQueryParam(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 962
    const-string v0, "UTF-8"

    invoke-static {p0, v0}, Lorg/unbescape/uri/UriEscape;->unescapeUriQueryParam(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static unescapeUriQueryParam(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 993
    if-nez p1, :cond_a

    .line 994
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'encoding\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 996
    :cond_a
    sget-object v0, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->QUERY_PARAM:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    invoke-static {p0, v0, p1}, Lorg/unbescape/uri/UriEscapeUtil;->unescape(Ljava/lang/String;Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static unescapeUriQueryParam([CIILjava/io/Writer;)V
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
    .line 1271
    const-string v0, "UTF-8"

    invoke-static {p0, p1, p2, p3, v0}, Lorg/unbescape/uri/UriEscape;->unescapeUriQueryParam([CIILjava/io/Writer;Ljava/lang/String;)V

    .line 1272
    return-void
.end method

.method public static unescapeUriQueryParam([CIILjava/io/Writer;Ljava/lang/String;)V
    .registers 12
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1305
    if-nez p3, :cond_a

    .line 1306
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'writer\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1309
    :cond_a
    if-nez p4, :cond_14

    .line 1310
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'encoding\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1313
    :cond_14
    if-nez p0, :cond_48

    const/4 v6, 0x0

    .line 1315
    .local v6, "textLen":I
    :goto_17
    if-ltz p1, :cond_1b

    if-le p1, v6, :cond_4a

    .line 1316
    :cond_1b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid (offset, len). offset="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", len="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", text.length="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1313
    .end local v6    # "textLen":I
    :cond_48
    array-length v6, p0

    goto :goto_17

    .line 1320
    .restart local v6    # "textLen":I
    :cond_4a
    if-ltz p2, :cond_50

    add-int v0, p1, p2

    if-le v0, v6, :cond_7d

    .line 1321
    :cond_50
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid (offset, len). offset="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", len="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", text.length="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1324
    :cond_7d
    sget-object v4, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->QUERY_PARAM:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lorg/unbescape/uri/UriEscapeUtil;->unescape([CIILjava/io/Writer;Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;Ljava/lang/String;)V

    .line 1325
    return-void
.end method
