.class public abstract Lorg/apache/http/impl/io/AbstractMessageParser;
.super Ljava/lang/Object;
.source "AbstractMessageParser.java"

# interfaces
.implements Lorg/apache/http/io/HttpMessageParser;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lorg/apache/http/HttpMessage;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/apache/http/io/HttpMessageParser",
        "<TT;>;"
    }
.end annotation

.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field private static final HEADERS:I = 0x1

.field private static final HEAD_LINE:I


# instance fields
.field private final headerLines:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/util/CharArrayBuffer;",
            ">;"
        }
    .end annotation
.end field

.field protected final lineParser:Lorg/apache/http/message/LineParser;

.field private final maxHeaderCount:I

.field private final maxLineLen:I

.field private message:Lorg/apache/http/HttpMessage;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final sessionBuffer:Lorg/apache/http/io/SessionInputBuffer;

.field private state:I


# direct methods
.method public constructor <init>(Lorg/apache/http/io/SessionInputBuffer;Lorg/apache/http/message/LineParser;Lorg/apache/http/params/HttpParams;)V
    .registers 6
    .param p1, "buffer"    # Lorg/apache/http/io/SessionInputBuffer;
    .param p2, "parser"    # Lorg/apache/http/message/LineParser;
    .param p3, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .local p0, "this":Lorg/apache/http/impl/io/AbstractMessageParser;, "Lorg/apache/http/impl/io/AbstractMessageParser<TT;>;"
    const/4 v1, -0x1

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    if-nez p1, :cond_e

    .line 89
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Session input buffer may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 91
    :cond_e
    if-nez p3, :cond_18

    .line 92
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 94
    :cond_18
    iput-object p1, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->sessionBuffer:Lorg/apache/http/io/SessionInputBuffer;

    .line 95
    const-string v0, "http.connection.max-header-count"

    invoke-interface {p3, v0, v1}, Lorg/apache/http/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->maxHeaderCount:I

    .line 97
    const-string v0, "http.connection.max-line-length"

    invoke-interface {p3, v0, v1}, Lorg/apache/http/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->maxLineLen:I

    .line 99
    if-eqz p2, :cond_39

    .end local p2    # "parser":Lorg/apache/http/message/LineParser;
    :goto_2c
    iput-object p2, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->lineParser:Lorg/apache/http/message/LineParser;

    .line 100
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->headerLines:Ljava/util/List;

    .line 101
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->state:I

    .line 102
    return-void

    .line 99
    .restart local p2    # "parser":Lorg/apache/http/message/LineParser;
    :cond_39
    sget-object p2, Lorg/apache/http/message/BasicLineParser;->DEFAULT:Lorg/apache/http/message/BasicLineParser;

    goto :goto_2c
.end method

.method public static parseHeaders(Lorg/apache/http/io/SessionInputBuffer;IILorg/apache/http/message/LineParser;)[Lorg/apache/http/Header;
    .registers 6
    .param p0, "inbuffer"    # Lorg/apache/http/io/SessionInputBuffer;
    .param p1, "maxHeaderCount"    # I
    .param p2, "maxLineLen"    # I
    .param p3, "parser"    # Lorg/apache/http/message/LineParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    if-nez p3, :cond_4

    .line 130
    sget-object p3, Lorg/apache/http/message/BasicLineParser;->DEFAULT:Lorg/apache/http/message/BasicLineParser;

    .line 132
    :cond_4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 133
    .local v0, "headerLines":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/util/CharArrayBuffer;>;"
    invoke-static {p0, p1, p2, p3, v0}, Lorg/apache/http/impl/io/AbstractMessageParser;->parseHeaders(Lorg/apache/http/io/SessionInputBuffer;IILorg/apache/http/message/LineParser;Ljava/util/List;)[Lorg/apache/http/Header;

    move-result-object v1

    return-object v1
.end method

.method public static parseHeaders(Lorg/apache/http/io/SessionInputBuffer;IILorg/apache/http/message/LineParser;Ljava/util/List;)[Lorg/apache/http/Header;
    .registers 15
    .param p0, "inbuffer"    # Lorg/apache/http/io/SessionInputBuffer;
    .param p1, "maxHeaderCount"    # I
    .param p2, "maxLineLen"    # I
    .param p3, "parser"    # Lorg/apache/http/message/LineParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/io/SessionInputBuffer;",
            "II",
            "Lorg/apache/http/message/LineParser;",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/util/CharArrayBuffer;",
            ">;)[",
            "Lorg/apache/http/Header;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 168
    .local p4, "headerLines":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/util/CharArrayBuffer;>;"
    if-nez p0, :cond_a

    .line 169
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "Session input buffer may not be null"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 171
    :cond_a
    if-nez p3, :cond_14

    .line 172
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "Line parser may not be null"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 174
    :cond_14
    if-nez p4, :cond_1e

    .line 175
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "Header line list may not be null"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 178
    :cond_1e
    const/4 v2, 0x0

    .line 179
    .local v2, "current":Lorg/apache/http/util/CharArrayBuffer;
    const/4 v7, 0x0

    .line 181
    .local v7, "previous":Lorg/apache/http/util/CharArrayBuffer;
    :cond_20
    if-nez v2, :cond_53

    .line 182
    new-instance v2, Lorg/apache/http/util/CharArrayBuffer;

    .end local v2    # "current":Lorg/apache/http/util/CharArrayBuffer;
    const/16 v8, 0x40

    invoke-direct {v2, v8}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 186
    .restart local v2    # "current":Lorg/apache/http/util/CharArrayBuffer;
    :goto_29
    invoke-interface {p0, v2}, Lorg/apache/http/io/SessionInputBuffer;->readLine(Lorg/apache/http/util/CharArrayBuffer;)I

    move-result v6

    .line 187
    .local v6, "l":I
    const/4 v8, -0x1

    if-eq v6, v8, :cond_37

    invoke-virtual {v2}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v8

    const/4 v9, 0x1

    if-ge v8, v9, :cond_57

    .line 220
    :cond_37
    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v8

    new-array v4, v8, [Lorg/apache/http/Header;

    .line 221
    .local v4, "headers":[Lorg/apache/http/Header;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_3e
    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v8

    if-ge v5, v8, :cond_c7

    .line 222
    invoke-interface {p4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/util/CharArrayBuffer;

    .line 224
    .local v0, "buffer":Lorg/apache/http/util/CharArrayBuffer;
    :try_start_4a
    invoke-interface {p3, v0}, Lorg/apache/http/message/LineParser;->parseHeader(Lorg/apache/http/util/CharArrayBuffer;)Lorg/apache/http/Header;

    move-result-object v8

    aput-object v8, v4, v5
    :try_end_50
    .catch Lorg/apache/http/ParseException; {:try_start_4a .. :try_end_50} :catch_bc

    .line 221
    add-int/lit8 v5, v5, 0x1

    goto :goto_3e

    .line 184
    .end local v0    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    .end local v4    # "headers":[Lorg/apache/http/Header;
    .end local v5    # "i":I
    .end local v6    # "l":I
    :cond_53
    invoke-virtual {v2}, Lorg/apache/http/util/CharArrayBuffer;->clear()V

    goto :goto_29

    .line 194
    .restart local v6    # "l":I
    :cond_57
    const/4 v8, 0x0

    invoke-virtual {v2, v8}, Lorg/apache/http/util/CharArrayBuffer;->charAt(I)C

    move-result v8

    const/16 v9, 0x20

    if-eq v8, v9, :cond_69

    const/4 v8, 0x0

    invoke-virtual {v2, v8}, Lorg/apache/http/util/CharArrayBuffer;->charAt(I)C

    move-result v8

    const/16 v9, 0x9

    if-ne v8, v9, :cond_b6

    :cond_69
    if-eqz v7, :cond_b6

    .line 197
    const/4 v5, 0x0

    .line 198
    .restart local v5    # "i":I
    :goto_6c
    invoke-virtual {v2}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v8

    if-ge v5, v8, :cond_7e

    .line 199
    invoke-virtual {v2, v5}, Lorg/apache/http/util/CharArrayBuffer;->charAt(I)C

    move-result v1

    .line 200
    .local v1, "ch":C
    const/16 v8, 0x20

    if-eq v1, v8, :cond_96

    const/16 v8, 0x9

    if-eq v1, v8, :cond_96

    .line 205
    .end local v1    # "ch":C
    :cond_7e
    if-lez p2, :cond_99

    invoke-virtual {v7}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v8

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v2}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v9

    add-int/2addr v8, v9

    sub-int/2addr v8, v5

    if-le v8, p2, :cond_99

    .line 207
    new-instance v8, Ljava/io/IOException;

    const-string v9, "Maximum line length limit exceeded"

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 203
    .restart local v1    # "ch":C
    :cond_96
    add-int/lit8 v5, v5, 0x1

    .line 204
    goto :goto_6c

    .line 209
    .end local v1    # "ch":C
    :cond_99
    const/16 v8, 0x20

    invoke-virtual {v7, v8}, Lorg/apache/http/util/CharArrayBuffer;->append(C)V

    .line 210
    invoke-virtual {v2}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v8

    sub-int/2addr v8, v5

    invoke-virtual {v7, v2, v5, v8}, Lorg/apache/http/util/CharArrayBuffer;->append(Lorg/apache/http/util/CharArrayBuffer;II)V

    .line 216
    .end local v5    # "i":I
    :goto_a6
    if-lez p1, :cond_20

    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v8

    if-lt v8, p1, :cond_20

    .line 217
    new-instance v8, Ljava/io/IOException;

    const-string v9, "Maximum header count exceeded"

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 212
    :cond_b6
    invoke-interface {p4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 213
    move-object v7, v2

    .line 214
    const/4 v2, 0x0

    goto :goto_a6

    .line 225
    .restart local v0    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    .restart local v4    # "headers":[Lorg/apache/http/Header;
    .restart local v5    # "i":I
    :catch_bc
    move-exception v3

    .line 226
    .local v3, "ex":Lorg/apache/http/ParseException;
    new-instance v8, Lorg/apache/http/ProtocolException;

    invoke-virtual {v3}, Lorg/apache/http/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 229
    .end local v0    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    .end local v3    # "ex":Lorg/apache/http/ParseException;
    :cond_c7
    return-object v4
.end method


# virtual methods
.method public parse()Lorg/apache/http/HttpMessage;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 250
    .local p0, "this":Lorg/apache/http/impl/io/AbstractMessageParser;, "Lorg/apache/http/impl/io/AbstractMessageParser<TT;>;"
    iget v3, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->state:I

    .line 251
    .local v3, "st":I
    packed-switch v3, :pswitch_data_44

    .line 274
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "Inconsistent parser state"

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 254
    :pswitch_d
    :try_start_d
    iget-object v4, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->sessionBuffer:Lorg/apache/http/io/SessionInputBuffer;

    invoke-virtual {p0, v4}, Lorg/apache/http/impl/io/AbstractMessageParser;->parseHead(Lorg/apache/http/io/SessionInputBuffer;)Lorg/apache/http/HttpMessage;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->message:Lorg/apache/http/HttpMessage;
    :try_end_15
    .catch Lorg/apache/http/ParseException; {:try_start_d .. :try_end_15} :catch_39

    .line 258
    const/4 v4, 0x1

    iput v4, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->state:I

    .line 261
    :pswitch_18
    iget-object v4, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->sessionBuffer:Lorg/apache/http/io/SessionInputBuffer;

    iget v5, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->maxHeaderCount:I

    iget v6, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->maxLineLen:I

    iget-object v7, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->lineParser:Lorg/apache/http/message/LineParser;

    iget-object v8, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->headerLines:Ljava/util/List;

    invoke-static {v4, v5, v6, v7, v8}, Lorg/apache/http/impl/io/AbstractMessageParser;->parseHeaders(Lorg/apache/http/io/SessionInputBuffer;IILorg/apache/http/message/LineParser;Ljava/util/List;)[Lorg/apache/http/Header;

    move-result-object v0

    .line 267
    .local v0, "headers":[Lorg/apache/http/Header;
    iget-object v4, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->message:Lorg/apache/http/HttpMessage;

    invoke-interface {v4, v0}, Lorg/apache/http/HttpMessage;->setHeaders([Lorg/apache/http/Header;)V

    .line 268
    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->message:Lorg/apache/http/HttpMessage;

    .line 269
    .local v2, "result":Lorg/apache/http/HttpMessage;, "TT;"
    const/4 v4, 0x0

    iput-object v4, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->message:Lorg/apache/http/HttpMessage;

    .line 270
    iget-object v4, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->headerLines:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 271
    const/4 v4, 0x0

    iput v4, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->state:I

    .line 272
    return-object v2

    .line 255
    .end local v0    # "headers":[Lorg/apache/http/Header;
    .end local v2    # "result":Lorg/apache/http/HttpMessage;, "TT;"
    :catch_39
    move-exception v1

    .line 256
    .local v1, "px":Lorg/apache/http/ParseException;
    new-instance v4, Lorg/apache/http/ProtocolException;

    invoke-virtual {v1}, Lorg/apache/http/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 251
    :pswitch_data_44
    .packed-switch 0x0
        :pswitch_d
        :pswitch_18
    .end packed-switch
.end method

.method protected abstract parseHead(Lorg/apache/http/io/SessionInputBuffer;)Lorg/apache/http/HttpMessage;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/io/SessionInputBuffer;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;,
            Lorg/apache/http/ParseException;
        }
    .end annotation
.end method
