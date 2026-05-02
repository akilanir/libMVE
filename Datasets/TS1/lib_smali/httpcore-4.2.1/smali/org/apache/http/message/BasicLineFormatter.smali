.class public Lorg/apache/http/message/BasicLineFormatter;
.super Ljava/lang/Object;
.source "BasicLineFormatter.java"

# interfaces
.implements Lorg/apache/http/message/LineFormatter;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field public static final DEFAULT:Lorg/apache/http/message/BasicLineFormatter;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 59
    new-instance v0, Lorg/apache/http/message/BasicLineFormatter;

    invoke-direct {v0}, Lorg/apache/http/message/BasicLineFormatter;-><init>()V

    sput-object v0, Lorg/apache/http/message/BasicLineFormatter;->DEFAULT:Lorg/apache/http/message/BasicLineFormatter;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final formatHeader(Lorg/apache/http/Header;Lorg/apache/http/message/LineFormatter;)Ljava/lang/String;
    .registers 3
    .param p0, "header"    # Lorg/apache/http/Header;
    .param p1, "formatter"    # Lorg/apache/http/message/LineFormatter;

    .prologue
    .line 278
    if-nez p1, :cond_4

    .line 279
    sget-object p1, Lorg/apache/http/message/BasicLineFormatter;->DEFAULT:Lorg/apache/http/message/BasicLineFormatter;

    .line 280
    :cond_4
    const/4 v0, 0x0

    invoke-interface {p1, v0, p0}, Lorg/apache/http/message/LineFormatter;->formatHeader(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/Header;)Lorg/apache/http/util/CharArrayBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final formatProtocolVersion(Lorg/apache/http/ProtocolVersion;Lorg/apache/http/message/LineFormatter;)Ljava/lang/String;
    .registers 3
    .param p0, "version"    # Lorg/apache/http/ProtocolVersion;
    .param p1, "formatter"    # Lorg/apache/http/message/LineFormatter;

    .prologue
    .line 97
    if-nez p1, :cond_4

    .line 98
    sget-object p1, Lorg/apache/http/message/BasicLineFormatter;->DEFAULT:Lorg/apache/http/message/BasicLineFormatter;

    .line 99
    :cond_4
    const/4 v0, 0x0

    invoke-interface {p1, v0, p0}, Lorg/apache/http/message/LineFormatter;->appendProtocolVersion(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/ProtocolVersion;)Lorg/apache/http/util/CharArrayBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final formatRequestLine(Lorg/apache/http/RequestLine;Lorg/apache/http/message/LineFormatter;)Ljava/lang/String;
    .registers 3
    .param p0, "reqline"    # Lorg/apache/http/RequestLine;
    .param p1, "formatter"    # Lorg/apache/http/message/LineFormatter;

    .prologue
    .line 156
    if-nez p1, :cond_4

    .line 157
    sget-object p1, Lorg/apache/http/message/BasicLineFormatter;->DEFAULT:Lorg/apache/http/message/BasicLineFormatter;

    .line 158
    :cond_4
    const/4 v0, 0x0

    invoke-interface {p1, v0, p0}, Lorg/apache/http/message/LineFormatter;->formatRequestLine(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/RequestLine;)Lorg/apache/http/util/CharArrayBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final formatStatusLine(Lorg/apache/http/StatusLine;Lorg/apache/http/message/LineFormatter;)Ljava/lang/String;
    .registers 3
    .param p0, "statline"    # Lorg/apache/http/StatusLine;
    .param p1, "formatter"    # Lorg/apache/http/message/LineFormatter;

    .prologue
    .line 216
    if-nez p1, :cond_4

    .line 217
    sget-object p1, Lorg/apache/http/message/BasicLineFormatter;->DEFAULT:Lorg/apache/http/message/BasicLineFormatter;

    .line 218
    :cond_4
    const/4 v0, 0x0

    invoke-interface {p1, v0, p0}, Lorg/apache/http/message/LineFormatter;->formatStatusLine(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/StatusLine;)Lorg/apache/http/util/CharArrayBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public appendProtocolVersion(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/ProtocolVersion;)Lorg/apache/http/util/CharArrayBuffer;
    .registers 7
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "version"    # Lorg/apache/http/ProtocolVersion;

    .prologue
    .line 106
    if-nez p2, :cond_a

    .line 107
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Protocol version may not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 112
    :cond_a
    move-object v1, p1

    .line 113
    .local v1, "result":Lorg/apache/http/util/CharArrayBuffer;
    invoke-virtual {p0, p2}, Lorg/apache/http/message/BasicLineFormatter;->estimateProtocolVersionLen(Lorg/apache/http/ProtocolVersion;)I

    move-result v0

    .line 114
    .local v0, "len":I
    if-nez v1, :cond_3e

    .line 115
    new-instance v1, Lorg/apache/http/util/CharArrayBuffer;

    .end local v1    # "result":Lorg/apache/http/util/CharArrayBuffer;
    invoke-direct {v1, v0}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 120
    .restart local v1    # "result":Lorg/apache/http/util/CharArrayBuffer;
    :goto_16
    invoke-virtual {p2}, Lorg/apache/http/ProtocolVersion;->getProtocol()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 121
    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Lorg/apache/http/util/CharArrayBuffer;->append(C)V

    .line 122
    invoke-virtual {p2}, Lorg/apache/http/ProtocolVersion;->getMajor()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 123
    const/16 v2, 0x2e

    invoke-virtual {v1, v2}, Lorg/apache/http/util/CharArrayBuffer;->append(C)V

    .line 124
    invoke-virtual {p2}, Lorg/apache/http/ProtocolVersion;->getMinor()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 126
    return-object v1

    .line 117
    :cond_3e
    invoke-virtual {v1, v0}, Lorg/apache/http/util/CharArrayBuffer;->ensureCapacity(I)V

    goto :goto_16
.end method

.method protected doFormatHeader(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/Header;)V
    .registers 7
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "header"    # Lorg/apache/http/Header;

    .prologue
    .line 315
    invoke-interface {p2}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v1

    .line 316
    .local v1, "name":Ljava/lang/String;
    invoke-interface {p2}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 318
    .local v2, "value":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v0, v3, 0x2

    .line 319
    .local v0, "len":I
    if-eqz v2, :cond_15

    .line 320
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v0, v3

    .line 322
    :cond_15
    invoke-virtual {p1, v0}, Lorg/apache/http/util/CharArrayBuffer;->ensureCapacity(I)V

    .line 324
    invoke-virtual {p1, v1}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 325
    const-string v3, ": "

    invoke-virtual {p1, v3}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 326
    if-eqz v2, :cond_25

    .line 327
    invoke-virtual {p1, v2}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 329
    :cond_25
    return-void
.end method

.method protected doFormatRequestLine(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/RequestLine;)V
    .registers 9
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "reqline"    # Lorg/apache/http/RequestLine;

    .prologue
    const/16 v5, 0x20

    .line 187
    invoke-interface {p2}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v1

    .line 188
    .local v1, "method":Ljava/lang/String;
    invoke-interface {p2}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v2

    .line 191
    .local v2, "uri":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    invoke-interface {p2}, Lorg/apache/http/RequestLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/http/message/BasicLineFormatter;->estimateProtocolVersionLen(Lorg/apache/http/ProtocolVersion;)I

    move-result v4

    add-int v0, v3, v4

    .line 193
    .local v0, "len":I
    invoke-virtual {p1, v0}, Lorg/apache/http/util/CharArrayBuffer;->ensureCapacity(I)V

    .line 195
    invoke-virtual {p1, v1}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 196
    invoke-virtual {p1, v5}, Lorg/apache/http/util/CharArrayBuffer;->append(C)V

    .line 197
    invoke-virtual {p1, v2}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 198
    invoke-virtual {p1, v5}, Lorg/apache/http/util/CharArrayBuffer;->append(C)V

    .line 199
    invoke-interface {p2}, Lorg/apache/http/RequestLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v3

    invoke-virtual {p0, p1, v3}, Lorg/apache/http/message/BasicLineFormatter;->appendProtocolVersion(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/ProtocolVersion;)Lorg/apache/http/util/CharArrayBuffer;

    .line 200
    return-void
.end method

.method protected doFormatStatusLine(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/StatusLine;)V
    .registers 7
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "statline"    # Lorg/apache/http/StatusLine;

    .prologue
    const/16 v3, 0x20

    .line 248
    invoke-interface {p2}, Lorg/apache/http/StatusLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/http/message/BasicLineFormatter;->estimateProtocolVersionLen(Lorg/apache/http/ProtocolVersion;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v2, v2, 0x3

    add-int/lit8 v0, v2, 0x1

    .line 250
    .local v0, "len":I
    invoke-interface {p2}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v1

    .line 251
    .local v1, "reason":Ljava/lang/String;
    if-eqz v1, :cond_1b

    .line 252
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v0, v2

    .line 254
    :cond_1b
    invoke-virtual {p1, v0}, Lorg/apache/http/util/CharArrayBuffer;->ensureCapacity(I)V

    .line 256
    invoke-interface {p2}, Lorg/apache/http/StatusLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Lorg/apache/http/message/BasicLineFormatter;->appendProtocolVersion(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/ProtocolVersion;)Lorg/apache/http/util/CharArrayBuffer;

    .line 257
    invoke-virtual {p1, v3}, Lorg/apache/http/util/CharArrayBuffer;->append(C)V

    .line 258
    invoke-interface {p2}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 259
    invoke-virtual {p1, v3}, Lorg/apache/http/util/CharArrayBuffer;->append(C)V

    .line 260
    if-eqz v1, :cond_3b

    .line 261
    invoke-virtual {p1, v1}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 263
    :cond_3b
    return-void
.end method

.method protected estimateProtocolVersionLen(Lorg/apache/http/ProtocolVersion;)I
    .registers 3
    .param p1, "version"    # Lorg/apache/http/ProtocolVersion;

    .prologue
    .line 140
    invoke-virtual {p1}, Lorg/apache/http/ProtocolVersion;->getProtocol()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public formatHeader(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/Header;)Lorg/apache/http/util/CharArrayBuffer;
    .registers 6
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "header"    # Lorg/apache/http/Header;

    .prologue
    .line 287
    if-nez p2, :cond_a

    .line 288
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Header may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 291
    :cond_a
    const/4 v0, 0x0

    .line 293
    .local v0, "result":Lorg/apache/http/util/CharArrayBuffer;
    instance-of v1, p2, Lorg/apache/http/FormattedHeader;

    if-eqz v1, :cond_16

    .line 295
    check-cast p2, Lorg/apache/http/FormattedHeader;

    .end local p2    # "header":Lorg/apache/http/Header;
    invoke-interface {p2}, Lorg/apache/http/FormattedHeader;->getBuffer()Lorg/apache/http/util/CharArrayBuffer;

    move-result-object v0

    .line 300
    :goto_15
    return-object v0

    .line 297
    .restart local p2    # "header":Lorg/apache/http/Header;
    :cond_16
    invoke-virtual {p0, p1}, Lorg/apache/http/message/BasicLineFormatter;->initBuffer(Lorg/apache/http/util/CharArrayBuffer;)Lorg/apache/http/util/CharArrayBuffer;

    move-result-object v0

    .line 298
    invoke-virtual {p0, v0, p2}, Lorg/apache/http/message/BasicLineFormatter;->doFormatHeader(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/Header;)V

    goto :goto_15
.end method

.method public formatRequestLine(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/RequestLine;)Lorg/apache/http/util/CharArrayBuffer;
    .registers 6
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "reqline"    # Lorg/apache/http/RequestLine;

    .prologue
    .line 165
    if-nez p2, :cond_a

    .line 166
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Request line may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 170
    :cond_a
    invoke-virtual {p0, p1}, Lorg/apache/http/message/BasicLineFormatter;->initBuffer(Lorg/apache/http/util/CharArrayBuffer;)Lorg/apache/http/util/CharArrayBuffer;

    move-result-object v0

    .line 171
    .local v0, "result":Lorg/apache/http/util/CharArrayBuffer;
    invoke-virtual {p0, v0, p2}, Lorg/apache/http/message/BasicLineFormatter;->doFormatRequestLine(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/RequestLine;)V

    .line 173
    return-object v0
.end method

.method public formatStatusLine(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/StatusLine;)Lorg/apache/http/util/CharArrayBuffer;
    .registers 6
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "statline"    # Lorg/apache/http/StatusLine;

    .prologue
    .line 225
    if-nez p2, :cond_a

    .line 226
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Status line may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 230
    :cond_a
    invoke-virtual {p0, p1}, Lorg/apache/http/message/BasicLineFormatter;->initBuffer(Lorg/apache/http/util/CharArrayBuffer;)Lorg/apache/http/util/CharArrayBuffer;

    move-result-object v0

    .line 231
    .local v0, "result":Lorg/apache/http/util/CharArrayBuffer;
    invoke-virtual {p0, v0, p2}, Lorg/apache/http/message/BasicLineFormatter;->doFormatStatusLine(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/StatusLine;)V

    .line 233
    return-object v0
.end method

.method protected initBuffer(Lorg/apache/http/util/CharArrayBuffer;)Lorg/apache/http/util/CharArrayBuffer;
    .registers 3
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;

    .prologue
    .line 75
    if-eqz p1, :cond_6

    .line 76
    invoke-virtual {p1}, Lorg/apache/http/util/CharArrayBuffer;->clear()V

    .line 80
    :goto_5
    return-object p1

    .line 78
    :cond_6
    new-instance p1, Lorg/apache/http/util/CharArrayBuffer;

    .end local p1    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    const/16 v0, 0x40

    invoke-direct {p1, v0}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .restart local p1    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    goto :goto_5
.end method
