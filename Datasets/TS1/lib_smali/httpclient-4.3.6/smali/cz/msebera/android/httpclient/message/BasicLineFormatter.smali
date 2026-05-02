.class public Lcz/msebera/android/httpclient/message/BasicLineFormatter;
.super Ljava/lang/Object;
.source "BasicLineFormatter.java"

# interfaces
.implements Lcz/msebera/android/httpclient/message/LineFormatter;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# static fields
.field public static final DEFAULT:Lcz/msebera/android/httpclient/message/BasicLineFormatter;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final INSTANCE:Lcz/msebera/android/httpclient/message/BasicLineFormatter;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 63
    new-instance v0, Lcz/msebera/android/httpclient/message/BasicLineFormatter;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/message/BasicLineFormatter;-><init>()V

    sput-object v0, Lcz/msebera/android/httpclient/message/BasicLineFormatter;->DEFAULT:Lcz/msebera/android/httpclient/message/BasicLineFormatter;

    .line 65
    new-instance v0, Lcz/msebera/android/httpclient/message/BasicLineFormatter;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/message/BasicLineFormatter;-><init>()V

    sput-object v0, Lcz/msebera/android/httpclient/message/BasicLineFormatter;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicLineFormatter;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    return-void
.end method

.method public static formatHeader(Lcz/msebera/android/httpclient/Header;Lcz/msebera/android/httpclient/message/LineFormatter;)Ljava/lang/String;
    .registers 3
    .param p0, "header"    # Lcz/msebera/android/httpclient/Header;
    .param p1, "formatter"    # Lcz/msebera/android/httpclient/message/LineFormatter;

    .prologue
    .line 269
    if-eqz p1, :cond_c

    .end local p1    # "formatter":Lcz/msebera/android/httpclient/message/LineFormatter;
    :goto_2
    const/4 v0, 0x0

    .line 270
    invoke-interface {p1, v0, p0}, Lcz/msebera/android/httpclient/message/LineFormatter;->formatHeader(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/Header;)Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 269
    .restart local p1    # "formatter":Lcz/msebera/android/httpclient/message/LineFormatter;
    :cond_c
    sget-object p1, Lcz/msebera/android/httpclient/message/BasicLineFormatter;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicLineFormatter;

    goto :goto_2
.end method

.method public static formatProtocolVersion(Lcz/msebera/android/httpclient/ProtocolVersion;Lcz/msebera/android/httpclient/message/LineFormatter;)Ljava/lang/String;
    .registers 3
    .param p0, "version"    # Lcz/msebera/android/httpclient/ProtocolVersion;
    .param p1, "formatter"    # Lcz/msebera/android/httpclient/message/LineFormatter;

    .prologue
    .line 103
    if-eqz p1, :cond_c

    .end local p1    # "formatter":Lcz/msebera/android/httpclient/message/LineFormatter;
    :goto_2
    const/4 v0, 0x0

    .line 104
    invoke-interface {p1, v0, p0}, Lcz/msebera/android/httpclient/message/LineFormatter;->appendProtocolVersion(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/ProtocolVersion;)Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 103
    .restart local p1    # "formatter":Lcz/msebera/android/httpclient/message/LineFormatter;
    :cond_c
    sget-object p1, Lcz/msebera/android/httpclient/message/BasicLineFormatter;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicLineFormatter;

    goto :goto_2
.end method

.method public static formatRequestLine(Lcz/msebera/android/httpclient/RequestLine;Lcz/msebera/android/httpclient/message/LineFormatter;)Ljava/lang/String;
    .registers 3
    .param p0, "reqline"    # Lcz/msebera/android/httpclient/RequestLine;
    .param p1, "formatter"    # Lcz/msebera/android/httpclient/message/LineFormatter;

    .prologue
    .line 157
    if-eqz p1, :cond_c

    .end local p1    # "formatter":Lcz/msebera/android/httpclient/message/LineFormatter;
    :goto_2
    const/4 v0, 0x0

    .line 158
    invoke-interface {p1, v0, p0}, Lcz/msebera/android/httpclient/message/LineFormatter;->formatRequestLine(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/RequestLine;)Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 157
    .restart local p1    # "formatter":Lcz/msebera/android/httpclient/message/LineFormatter;
    :cond_c
    sget-object p1, Lcz/msebera/android/httpclient/message/BasicLineFormatter;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicLineFormatter;

    goto :goto_2
.end method

.method public static formatStatusLine(Lcz/msebera/android/httpclient/StatusLine;Lcz/msebera/android/httpclient/message/LineFormatter;)Ljava/lang/String;
    .registers 3
    .param p0, "statline"    # Lcz/msebera/android/httpclient/StatusLine;
    .param p1, "formatter"    # Lcz/msebera/android/httpclient/message/LineFormatter;

    .prologue
    .line 212
    if-eqz p1, :cond_c

    .end local p1    # "formatter":Lcz/msebera/android/httpclient/message/LineFormatter;
    :goto_2
    const/4 v0, 0x0

    .line 213
    invoke-interface {p1, v0, p0}, Lcz/msebera/android/httpclient/message/LineFormatter;->formatStatusLine(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/StatusLine;)Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 212
    .restart local p1    # "formatter":Lcz/msebera/android/httpclient/message/LineFormatter;
    :cond_c
    sget-object p1, Lcz/msebera/android/httpclient/message/BasicLineFormatter;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicLineFormatter;

    goto :goto_2
.end method


# virtual methods
.method public appendProtocolVersion(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/ProtocolVersion;)Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .registers 6
    .param p1, "buffer"    # Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .param p2, "version"    # Lcz/msebera/android/httpclient/ProtocolVersion;

    .prologue
    .line 111
    const-string v2, "Protocol version"

    invoke-static {p2, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 113
    move-object v1, p1

    .line 114
    .local v1, "result":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    invoke-virtual {p0, p2}, Lcz/msebera/android/httpclient/message/BasicLineFormatter;->estimateProtocolVersionLen(Lcz/msebera/android/httpclient/ProtocolVersion;)I

    move-result v0

    .line 115
    .local v0, "len":I
    if-nez v1, :cond_39

    .line 116
    new-instance v1, Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    .end local v1    # "result":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    invoke-direct {v1, v0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;-><init>(I)V

    .line 121
    .restart local v1    # "result":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    :goto_11
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/ProtocolVersion;->getProtocol()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 122
    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(C)V

    .line 123
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/ProtocolVersion;->getMajor()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 124
    const/16 v2, 0x2e

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(C)V

    .line 125
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/ProtocolVersion;->getMinor()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 127
    return-object v1

    .line 118
    :cond_39
    invoke-virtual {v1, v0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->ensureCapacity(I)V

    goto :goto_11
.end method

.method protected doFormatHeader(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/Header;)V
    .registers 7
    .param p1, "buffer"    # Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .param p2, "header"    # Lcz/msebera/android/httpclient/Header;

    .prologue
    .line 302
    invoke-interface {p2}, Lcz/msebera/android/httpclient/Header;->getName()Ljava/lang/String;

    move-result-object v1

    .line 303
    .local v1, "name":Ljava/lang/String;
    invoke-interface {p2}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 305
    .local v2, "value":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v0, v3, 0x2

    .line 306
    .local v0, "len":I
    if-eqz v2, :cond_15

    .line 307
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v0, v3

    .line 309
    :cond_15
    invoke-virtual {p1, v0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->ensureCapacity(I)V

    .line 311
    invoke-virtual {p1, v1}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 312
    const-string v3, ": "

    invoke-virtual {p1, v3}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 313
    if-eqz v2, :cond_25

    .line 314
    invoke-virtual {p1, v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 316
    :cond_25
    return-void
.end method

.method protected doFormatRequestLine(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/RequestLine;)V
    .registers 9
    .param p1, "buffer"    # Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .param p2, "reqline"    # Lcz/msebera/android/httpclient/RequestLine;

    .prologue
    const/16 v5, 0x20

    .line 183
    invoke-interface {p2}, Lcz/msebera/android/httpclient/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v1

    .line 184
    .local v1, "method":Ljava/lang/String;
    invoke-interface {p2}, Lcz/msebera/android/httpclient/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v2

    .line 187
    .local v2, "uri":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    .line 188
    invoke-interface {p2}, Lcz/msebera/android/httpclient/RequestLine;->getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcz/msebera/android/httpclient/message/BasicLineFormatter;->estimateProtocolVersionLen(Lcz/msebera/android/httpclient/ProtocolVersion;)I

    move-result v4

    add-int v0, v3, v4

    .line 189
    .local v0, "len":I
    invoke-virtual {p1, v0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->ensureCapacity(I)V

    .line 191
    invoke-virtual {p1, v1}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 192
    invoke-virtual {p1, v5}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(C)V

    .line 193
    invoke-virtual {p1, v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 194
    invoke-virtual {p1, v5}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(C)V

    .line 195
    invoke-interface {p2}, Lcz/msebera/android/httpclient/RequestLine;->getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v3

    invoke-virtual {p0, p1, v3}, Lcz/msebera/android/httpclient/message/BasicLineFormatter;->appendProtocolVersion(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/ProtocolVersion;)Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    .line 196
    return-void
.end method

.method protected doFormatStatusLine(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/StatusLine;)V
    .registers 7
    .param p1, "buffer"    # Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .param p2, "statline"    # Lcz/msebera/android/httpclient/StatusLine;

    .prologue
    const/16 v3, 0x20

    .line 239
    invoke-interface {p2}, Lcz/msebera/android/httpclient/StatusLine;->getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcz/msebera/android/httpclient/message/BasicLineFormatter;->estimateProtocolVersionLen(Lcz/msebera/android/httpclient/ProtocolVersion;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v2, v2, 0x3

    add-int/lit8 v0, v2, 0x1

    .line 241
    .local v0, "len":I
    invoke-interface {p2}, Lcz/msebera/android/httpclient/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v1

    .line 242
    .local v1, "reason":Ljava/lang/String;
    if-eqz v1, :cond_1b

    .line 243
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v0, v2

    .line 245
    :cond_1b
    invoke-virtual {p1, v0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->ensureCapacity(I)V

    .line 247
    invoke-interface {p2}, Lcz/msebera/android/httpclient/StatusLine;->getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Lcz/msebera/android/httpclient/message/BasicLineFormatter;->appendProtocolVersion(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/ProtocolVersion;)Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    .line 248
    invoke-virtual {p1, v3}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(C)V

    .line 249
    invoke-interface {p2}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 250
    invoke-virtual {p1, v3}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(C)V

    .line 251
    if-eqz v1, :cond_3b

    .line 252
    invoke-virtual {p1, v1}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 254
    :cond_3b
    return-void
.end method

.method protected estimateProtocolVersionLen(Lcz/msebera/android/httpclient/ProtocolVersion;)I
    .registers 3
    .param p1, "version"    # Lcz/msebera/android/httpclient/ProtocolVersion;

    .prologue
    .line 141
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/ProtocolVersion;->getProtocol()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public formatHeader(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/Header;)Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .registers 5
    .param p1, "buffer"    # Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .param p2, "header"    # Lcz/msebera/android/httpclient/Header;

    .prologue
    .line 277
    const-string v1, "Header"

    invoke-static {p2, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 280
    instance-of v1, p2, Lcz/msebera/android/httpclient/FormattedHeader;

    if-eqz v1, :cond_10

    .line 282
    check-cast p2, Lcz/msebera/android/httpclient/FormattedHeader;

    .end local p2    # "header":Lcz/msebera/android/httpclient/Header;
    invoke-interface {p2}, Lcz/msebera/android/httpclient/FormattedHeader;->getBuffer()Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    move-result-object v0

    .line 287
    .local v0, "result":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    :goto_f
    return-object v0

    .line 284
    .end local v0    # "result":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .restart local p2    # "header":Lcz/msebera/android/httpclient/Header;
    :cond_10
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/message/BasicLineFormatter;->initBuffer(Lcz/msebera/android/httpclient/util/CharArrayBuffer;)Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    move-result-object v0

    .line 285
    .restart local v0    # "result":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    invoke-virtual {p0, v0, p2}, Lcz/msebera/android/httpclient/message/BasicLineFormatter;->doFormatHeader(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/Header;)V

    goto :goto_f
.end method

.method public formatRequestLine(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/RequestLine;)Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .registers 5
    .param p1, "buffer"    # Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .param p2, "reqline"    # Lcz/msebera/android/httpclient/RequestLine;

    .prologue
    .line 165
    const-string v1, "Request line"

    invoke-static {p2, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 166
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/message/BasicLineFormatter;->initBuffer(Lcz/msebera/android/httpclient/util/CharArrayBuffer;)Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    move-result-object v0

    .line 167
    .local v0, "result":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    invoke-virtual {p0, v0, p2}, Lcz/msebera/android/httpclient/message/BasicLineFormatter;->doFormatRequestLine(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/RequestLine;)V

    .line 169
    return-object v0
.end method

.method public formatStatusLine(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/StatusLine;)Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .registers 5
    .param p1, "buffer"    # Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .param p2, "statline"    # Lcz/msebera/android/httpclient/StatusLine;

    .prologue
    .line 220
    const-string v1, "Status line"

    invoke-static {p2, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 221
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/message/BasicLineFormatter;->initBuffer(Lcz/msebera/android/httpclient/util/CharArrayBuffer;)Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    move-result-object v0

    .line 222
    .local v0, "result":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    invoke-virtual {p0, v0, p2}, Lcz/msebera/android/httpclient/message/BasicLineFormatter;->doFormatStatusLine(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/StatusLine;)V

    .line 224
    return-object v0
.end method

.method protected initBuffer(Lcz/msebera/android/httpclient/util/CharArrayBuffer;)Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .registers 4
    .param p1, "charBuffer"    # Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    .prologue
    .line 80
    move-object v0, p1

    .line 81
    .local v0, "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    if-eqz v0, :cond_7

    .line 82
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->clear()V

    .line 86
    :goto_6
    return-object v0

    .line 84
    :cond_7
    new-instance v0, Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    .end local v0    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    const/16 v1, 0x40

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;-><init>(I)V

    .restart local v0    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    goto :goto_6
.end method
