.class public abstract Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;
.super Ljava/lang/Object;
.source "AbstractMessageParser.java"

# interfaces
.implements Lcz/msebera/android/httpclient/io/HttpMessageParser;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcz/msebera/android/httpclient/HttpMessage;",
        ">",
        "Ljava/lang/Object;",
        "Lcz/msebera/android/httpclient/io/HttpMessageParser",
        "<TT;>;"
    }
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
            "Lcz/msebera/android/httpclient/util/CharArrayBuffer;",
            ">;"
        }
    .end annotation
.end field

.field protected final lineParser:Lcz/msebera/android/httpclient/message/LineParser;

.field private message:Lcz/msebera/android/httpclient/HttpMessage;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final messageConstraints:Lcz/msebera/android/httpclient/config/MessageConstraints;

.field private final sessionBuffer:Lcz/msebera/android/httpclient/io/SessionInputBuffer;

.field private state:I


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/io/SessionInputBuffer;Lcz/msebera/android/httpclient/message/LineParser;Lcz/msebera/android/httpclient/config/MessageConstraints;)V
    .registers 5
    .param p1, "buffer"    # Lcz/msebera/android/httpclient/io/SessionInputBuffer;
    .param p2, "lineParser"    # Lcz/msebera/android/httpclient/message/LineParser;
    .param p3, "constraints"    # Lcz/msebera/android/httpclient/config/MessageConstraints;

    .prologue
    .line 112
    .local p0, "this":Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;, "Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    const-string v0, "Session input buffer"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/io/SessionInputBuffer;

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->sessionBuffer:Lcz/msebera/android/httpclient/io/SessionInputBuffer;

    .line 114
    if-eqz p2, :cond_20

    .end local p2    # "lineParser":Lcz/msebera/android/httpclient/message/LineParser;
    :goto_f
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->lineParser:Lcz/msebera/android/httpclient/message/LineParser;

    .line 115
    if-eqz p3, :cond_23

    .end local p3    # "constraints":Lcz/msebera/android/httpclient/config/MessageConstraints;
    :goto_13
    iput-object p3, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->messageConstraints:Lcz/msebera/android/httpclient/config/MessageConstraints;

    .line 116
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->headerLines:Ljava/util/List;

    .line 117
    const/4 v0, 0x0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->state:I

    .line 118
    return-void

    .line 114
    .restart local p2    # "lineParser":Lcz/msebera/android/httpclient/message/LineParser;
    .restart local p3    # "constraints":Lcz/msebera/android/httpclient/config/MessageConstraints;
    :cond_20
    sget-object p2, Lcz/msebera/android/httpclient/message/BasicLineParser;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicLineParser;

    goto :goto_f

    .line 115
    .end local p2    # "lineParser":Lcz/msebera/android/httpclient/message/LineParser;
    :cond_23
    sget-object p3, Lcz/msebera/android/httpclient/config/MessageConstraints;->DEFAULT:Lcz/msebera/android/httpclient/config/MessageConstraints;

    goto :goto_13
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/io/SessionInputBuffer;Lcz/msebera/android/httpclient/message/LineParser;Lcz/msebera/android/httpclient/params/HttpParams;)V
    .registers 5
    .param p1, "buffer"    # Lcz/msebera/android/httpclient/io/SessionInputBuffer;
    .param p2, "parser"    # Lcz/msebera/android/httpclient/message/LineParser;
    .param p3, "params"    # Lcz/msebera/android/httpclient/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 87
    .local p0, "this":Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;, "Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    const-string v0, "Session input buffer"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 89
    const-string v0, "HTTP parameters"

    invoke-static {p3, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 90
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->sessionBuffer:Lcz/msebera/android/httpclient/io/SessionInputBuffer;

    .line 91
    invoke-static {p3}, Lcz/msebera/android/httpclient/params/HttpParamConfig;->getMessageConstraints(Lcz/msebera/android/httpclient/params/HttpParams;)Lcz/msebera/android/httpclient/config/MessageConstraints;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->messageConstraints:Lcz/msebera/android/httpclient/config/MessageConstraints;

    .line 92
    if-eqz p2, :cond_24

    .end local p2    # "parser":Lcz/msebera/android/httpclient/message/LineParser;
    :goto_17
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->lineParser:Lcz/msebera/android/httpclient/message/LineParser;

    .line 93
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->headerLines:Ljava/util/List;

    .line 94
    const/4 v0, 0x0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->state:I

    .line 95
    return-void

    .line 92
    .restart local p2    # "parser":Lcz/msebera/android/httpclient/message/LineParser;
    :cond_24
    sget-object p2, Lcz/msebera/android/httpclient/message/BasicLineParser;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicLineParser;

    goto :goto_17
.end method

.method public static parseHeaders(Lcz/msebera/android/httpclient/io/SessionInputBuffer;IILcz/msebera/android/httpclient/message/LineParser;)[Lcz/msebera/android/httpclient/Header;
    .registers 6
    .param p0, "inbuffer"    # Lcz/msebera/android/httpclient/io/SessionInputBuffer;
    .param p1, "maxHeaderCount"    # I
    .param p2, "maxLineLen"    # I
    .param p3, "parser"    # Lcz/msebera/android/httpclient/message/LineParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 144
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 145
    .local v0, "headerLines":Ljava/util/List;, "Ljava/util/List<Lcz/msebera/android/httpclient/util/CharArrayBuffer;>;"
    if-eqz p3, :cond_c

    .end local p3    # "parser":Lcz/msebera/android/httpclient/message/LineParser;
    :goto_7
    invoke-static {p0, p1, p2, p3, v0}, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->parseHeaders(Lcz/msebera/android/httpclient/io/SessionInputBuffer;IILcz/msebera/android/httpclient/message/LineParser;Ljava/util/List;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v1

    return-object v1

    .restart local p3    # "parser":Lcz/msebera/android/httpclient/message/LineParser;
    :cond_c
    sget-object p3, Lcz/msebera/android/httpclient/message/BasicLineParser;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicLineParser;

    goto :goto_7
.end method

.method public static parseHeaders(Lcz/msebera/android/httpclient/io/SessionInputBuffer;IILcz/msebera/android/httpclient/message/LineParser;Ljava/util/List;)[Lcz/msebera/android/httpclient/Header;
    .registers 15
    .param p0, "inbuffer"    # Lcz/msebera/android/httpclient/io/SessionInputBuffer;
    .param p1, "maxHeaderCount"    # I
    .param p2, "maxLineLen"    # I
    .param p3, "parser"    # Lcz/msebera/android/httpclient/message/LineParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/io/SessionInputBuffer;",
            "II",
            "Lcz/msebera/android/httpclient/message/LineParser;",
            "Ljava/util/List",
            "<",
            "Lcz/msebera/android/httpclient/util/CharArrayBuffer;",
            ">;)[",
            "Lcz/msebera/android/httpclient/Header;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 180
    .local p4, "headerLines":Ljava/util/List;, "Ljava/util/List<Lcz/msebera/android/httpclient/util/CharArrayBuffer;>;"
    const-string v8, "Session input buffer"

    invoke-static {p0, v8}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 181
    const-string v8, "Line parser"

    invoke-static {p3, v8}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 182
    const-string v8, "Header line list"

    invoke-static {p4, v8}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 184
    const/4 v2, 0x0

    .line 185
    .local v2, "current":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    const/4 v7, 0x0

    .line 187
    .local v7, "previous":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    :cond_11
    if-nez v2, :cond_44

    .line 188
    new-instance v2, Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    .end local v2    # "current":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    const/16 v8, 0x40

    invoke-direct {v2, v8}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;-><init>(I)V

    .line 192
    .restart local v2    # "current":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    :goto_1a
    invoke-interface {p0, v2}, Lcz/msebera/android/httpclient/io/SessionInputBuffer;->readLine(Lcz/msebera/android/httpclient/util/CharArrayBuffer;)I

    move-result v6

    .line 193
    .local v6, "l":I
    const/4 v8, -0x1

    if-eq v6, v8, :cond_28

    invoke-virtual {v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->length()I

    move-result v8

    const/4 v9, 0x1

    if-ge v8, v9, :cond_48

    .line 226
    :cond_28
    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v8

    new-array v4, v8, [Lcz/msebera/android/httpclient/Header;

    .line 227
    .local v4, "headers":[Lcz/msebera/android/httpclient/Header;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2f
    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v8

    if-ge v5, v8, :cond_b8

    .line 228
    invoke-interface {p4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    .line 230
    .local v0, "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    :try_start_3b
    invoke-interface {p3, v0}, Lcz/msebera/android/httpclient/message/LineParser;->parseHeader(Lcz/msebera/android/httpclient/util/CharArrayBuffer;)Lcz/msebera/android/httpclient/Header;

    move-result-object v8

    aput-object v8, v4, v5
    :try_end_41
    .catch Lcz/msebera/android/httpclient/ParseException; {:try_start_3b .. :try_end_41} :catch_ad

    .line 227
    add-int/lit8 v5, v5, 0x1

    goto :goto_2f

    .line 190
    .end local v0    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .end local v4    # "headers":[Lcz/msebera/android/httpclient/Header;
    .end local v5    # "i":I
    .end local v6    # "l":I
    :cond_44
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->clear()V

    goto :goto_1a

    .line 200
    .restart local v6    # "l":I
    :cond_48
    const/4 v8, 0x0

    invoke-virtual {v2, v8}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->charAt(I)C

    move-result v8

    const/16 v9, 0x20

    if-eq v8, v9, :cond_5a

    const/4 v8, 0x0

    invoke-virtual {v2, v8}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->charAt(I)C

    move-result v8

    const/16 v9, 0x9

    if-ne v8, v9, :cond_a7

    :cond_5a
    if-eqz v7, :cond_a7

    .line 203
    const/4 v5, 0x0

    .line 204
    .restart local v5    # "i":I
    :goto_5d
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->length()I

    move-result v8

    if-ge v5, v8, :cond_6f

    .line 205
    invoke-virtual {v2, v5}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->charAt(I)C

    move-result v1

    .line 206
    .local v1, "ch":C
    const/16 v8, 0x20

    if-eq v1, v8, :cond_87

    const/16 v8, 0x9

    if-eq v1, v8, :cond_87

    .line 211
    .end local v1    # "ch":C
    :cond_6f
    if-lez p2, :cond_8a

    .line 212
    invoke-virtual {v7}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->length()I

    move-result v8

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->length()I

    move-result v9

    add-int/2addr v8, v9

    sub-int/2addr v8, v5

    if-le v8, p2, :cond_8a

    .line 213
    new-instance v8, Lcz/msebera/android/httpclient/MessageConstraintException;

    const-string v9, "Maximum line length limit exceeded"

    invoke-direct {v8, v9}, Lcz/msebera/android/httpclient/MessageConstraintException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 209
    .restart local v1    # "ch":C
    :cond_87
    add-int/lit8 v5, v5, 0x1

    .line 210
    goto :goto_5d

    .line 215
    .end local v1    # "ch":C
    :cond_8a
    const/16 v8, 0x20

    invoke-virtual {v7, v8}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(C)V

    .line 216
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->length()I

    move-result v8

    sub-int/2addr v8, v5

    invoke-virtual {v7, v2, v5, v8}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Lcz/msebera/android/httpclient/util/CharArrayBuffer;II)V

    .line 222
    .end local v5    # "i":I
    :goto_97
    if-lez p1, :cond_11

    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v8

    if-lt v8, p1, :cond_11

    .line 223
    new-instance v8, Lcz/msebera/android/httpclient/MessageConstraintException;

    const-string v9, "Maximum header count exceeded"

    invoke-direct {v8, v9}, Lcz/msebera/android/httpclient/MessageConstraintException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 218
    :cond_a7
    invoke-interface {p4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 219
    move-object v7, v2

    .line 220
    const/4 v2, 0x0

    goto :goto_97

    .line 231
    .restart local v0    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .restart local v4    # "headers":[Lcz/msebera/android/httpclient/Header;
    .restart local v5    # "i":I
    :catch_ad
    move-exception v3

    .line 232
    .local v3, "ex":Lcz/msebera/android/httpclient/ParseException;
    new-instance v8, Lcz/msebera/android/httpclient/ProtocolException;

    invoke-virtual {v3}, Lcz/msebera/android/httpclient/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lcz/msebera/android/httpclient/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 235
    .end local v0    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .end local v3    # "ex":Lcz/msebera/android/httpclient/ParseException;
    :cond_b8
    return-object v4
.end method


# virtual methods
.method public parse()Lcz/msebera/android/httpclient/HttpMessage;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/HttpException;
        }
    .end annotation

    .prologue
    .line 256
    .local p0, "this":Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;, "Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser<TT;>;"
    iget v3, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->state:I

    .line 257
    .local v3, "st":I
    packed-switch v3, :pswitch_data_4c

    .line 280
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "Inconsistent parser state"

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 260
    :pswitch_d
    :try_start_d
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->sessionBuffer:Lcz/msebera/android/httpclient/io/SessionInputBuffer;

    invoke-virtual {p0, v4}, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->parseHead(Lcz/msebera/android/httpclient/io/SessionInputBuffer;)Lcz/msebera/android/httpclient/HttpMessage;

    move-result-object v4

    iput-object v4, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->message:Lcz/msebera/android/httpclient/HttpMessage;
    :try_end_15
    .catch Lcz/msebera/android/httpclient/ParseException; {:try_start_d .. :try_end_15} :catch_41

    .line 264
    const/4 v4, 0x1

    iput v4, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->state:I

    .line 267
    :pswitch_18
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->sessionBuffer:Lcz/msebera/android/httpclient/io/SessionInputBuffer;

    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->messageConstraints:Lcz/msebera/android/httpclient/config/MessageConstraints;

    .line 269
    invoke-virtual {v5}, Lcz/msebera/android/httpclient/config/MessageConstraints;->getMaxHeaderCount()I

    move-result v5

    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->messageConstraints:Lcz/msebera/android/httpclient/config/MessageConstraints;

    .line 270
    invoke-virtual {v6}, Lcz/msebera/android/httpclient/config/MessageConstraints;->getMaxLineLength()I

    move-result v6

    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->lineParser:Lcz/msebera/android/httpclient/message/LineParser;

    iget-object v8, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->headerLines:Ljava/util/List;

    .line 267
    invoke-static {v4, v5, v6, v7, v8}, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->parseHeaders(Lcz/msebera/android/httpclient/io/SessionInputBuffer;IILcz/msebera/android/httpclient/message/LineParser;Ljava/util/List;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    .line 273
    .local v0, "headers":[Lcz/msebera/android/httpclient/Header;
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->message:Lcz/msebera/android/httpclient/HttpMessage;

    invoke-interface {v4, v0}, Lcz/msebera/android/httpclient/HttpMessage;->setHeaders([Lcz/msebera/android/httpclient/Header;)V

    .line 274
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->message:Lcz/msebera/android/httpclient/HttpMessage;

    .line 275
    .local v2, "result":Lcz/msebera/android/httpclient/HttpMessage;, "TT;"
    const/4 v4, 0x0

    iput-object v4, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->message:Lcz/msebera/android/httpclient/HttpMessage;

    .line 276
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->headerLines:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 277
    const/4 v4, 0x0

    iput v4, p0, Lcz/msebera/android/httpclient/impl/io/AbstractMessageParser;->state:I

    .line 278
    return-object v2

    .line 261
    .end local v0    # "headers":[Lcz/msebera/android/httpclient/Header;
    .end local v2    # "result":Lcz/msebera/android/httpclient/HttpMessage;, "TT;"
    :catch_41
    move-exception v1

    .line 262
    .local v1, "px":Lcz/msebera/android/httpclient/ParseException;
    new-instance v4, Lcz/msebera/android/httpclient/ProtocolException;

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Lcz/msebera/android/httpclient/ProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 257
    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_d
        :pswitch_18
    .end packed-switch
.end method

.method protected abstract parseHead(Lcz/msebera/android/httpclient/io/SessionInputBuffer;)Lcz/msebera/android/httpclient/HttpMessage;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/io/SessionInputBuffer;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/HttpException;,
            Lcz/msebera/android/httpclient/ParseException;
        }
    .end annotation
.end method
