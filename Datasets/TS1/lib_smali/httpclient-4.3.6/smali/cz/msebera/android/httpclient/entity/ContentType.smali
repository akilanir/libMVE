.class public final Lcz/msebera/android/httpclient/entity/ContentType;
.super Ljava/lang/Object;
.source "ContentType.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# static fields
.field public static final APPLICATION_ATOM_XML:Lcz/msebera/android/httpclient/entity/ContentType;

.field public static final APPLICATION_FORM_URLENCODED:Lcz/msebera/android/httpclient/entity/ContentType;

.field public static final APPLICATION_JSON:Lcz/msebera/android/httpclient/entity/ContentType;

.field public static final APPLICATION_OCTET_STREAM:Lcz/msebera/android/httpclient/entity/ContentType;

.field public static final APPLICATION_SVG_XML:Lcz/msebera/android/httpclient/entity/ContentType;

.field public static final APPLICATION_XHTML_XML:Lcz/msebera/android/httpclient/entity/ContentType;

.field public static final APPLICATION_XML:Lcz/msebera/android/httpclient/entity/ContentType;

.field public static final DEFAULT_BINARY:Lcz/msebera/android/httpclient/entity/ContentType;

.field public static final DEFAULT_TEXT:Lcz/msebera/android/httpclient/entity/ContentType;

.field public static final MULTIPART_FORM_DATA:Lcz/msebera/android/httpclient/entity/ContentType;

.field public static final TEXT_HTML:Lcz/msebera/android/httpclient/entity/ContentType;

.field public static final TEXT_PLAIN:Lcz/msebera/android/httpclient/entity/ContentType;

.field public static final TEXT_XML:Lcz/msebera/android/httpclient/entity/ContentType;

.field public static final WILDCARD:Lcz/msebera/android/httpclient/entity/ContentType;

.field private static final serialVersionUID:J = -0x6bcff2af98b1a2b8L


# instance fields
.field private final charset:Ljava/nio/charset/Charset;

.field private final mimeType:Ljava/lang/String;

.field private final params:[Lcz/msebera/android/httpclient/NameValuePair;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 64
    const-string v0, "application/atom+xml"

    sget-object v2, Lcz/msebera/android/httpclient/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-static {v0, v2}, Lcz/msebera/android/httpclient/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lcz/msebera/android/httpclient/entity/ContentType;

    move-result-object v0

    sput-object v0, Lcz/msebera/android/httpclient/entity/ContentType;->APPLICATION_ATOM_XML:Lcz/msebera/android/httpclient/entity/ContentType;

    .line 66
    const-string v0, "application/x-www-form-urlencoded"

    sget-object v2, Lcz/msebera/android/httpclient/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-static {v0, v2}, Lcz/msebera/android/httpclient/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lcz/msebera/android/httpclient/entity/ContentType;

    move-result-object v0

    sput-object v0, Lcz/msebera/android/httpclient/entity/ContentType;->APPLICATION_FORM_URLENCODED:Lcz/msebera/android/httpclient/entity/ContentType;

    .line 68
    const-string v0, "application/json"

    sget-object v2, Lcz/msebera/android/httpclient/Consts;->UTF_8:Ljava/nio/charset/Charset;

    invoke-static {v0, v2}, Lcz/msebera/android/httpclient/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lcz/msebera/android/httpclient/entity/ContentType;

    move-result-object v0

    sput-object v0, Lcz/msebera/android/httpclient/entity/ContentType;->APPLICATION_JSON:Lcz/msebera/android/httpclient/entity/ContentType;

    .line 70
    const-string v2, "application/octet-stream"

    move-object v0, v1

    check-cast v0, Ljava/nio/charset/Charset;

    invoke-static {v2, v0}, Lcz/msebera/android/httpclient/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lcz/msebera/android/httpclient/entity/ContentType;

    move-result-object v0

    sput-object v0, Lcz/msebera/android/httpclient/entity/ContentType;->APPLICATION_OCTET_STREAM:Lcz/msebera/android/httpclient/entity/ContentType;

    .line 72
    const-string v0, "application/svg+xml"

    sget-object v2, Lcz/msebera/android/httpclient/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-static {v0, v2}, Lcz/msebera/android/httpclient/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lcz/msebera/android/httpclient/entity/ContentType;

    move-result-object v0

    sput-object v0, Lcz/msebera/android/httpclient/entity/ContentType;->APPLICATION_SVG_XML:Lcz/msebera/android/httpclient/entity/ContentType;

    .line 74
    const-string v0, "application/xhtml+xml"

    sget-object v2, Lcz/msebera/android/httpclient/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-static {v0, v2}, Lcz/msebera/android/httpclient/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lcz/msebera/android/httpclient/entity/ContentType;

    move-result-object v0

    sput-object v0, Lcz/msebera/android/httpclient/entity/ContentType;->APPLICATION_XHTML_XML:Lcz/msebera/android/httpclient/entity/ContentType;

    .line 76
    const-string v0, "application/xml"

    sget-object v2, Lcz/msebera/android/httpclient/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-static {v0, v2}, Lcz/msebera/android/httpclient/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lcz/msebera/android/httpclient/entity/ContentType;

    move-result-object v0

    sput-object v0, Lcz/msebera/android/httpclient/entity/ContentType;->APPLICATION_XML:Lcz/msebera/android/httpclient/entity/ContentType;

    .line 78
    const-string v0, "multipart/form-data"

    sget-object v2, Lcz/msebera/android/httpclient/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-static {v0, v2}, Lcz/msebera/android/httpclient/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lcz/msebera/android/httpclient/entity/ContentType;

    move-result-object v0

    sput-object v0, Lcz/msebera/android/httpclient/entity/ContentType;->MULTIPART_FORM_DATA:Lcz/msebera/android/httpclient/entity/ContentType;

    .line 80
    const-string v0, "text/html"

    sget-object v2, Lcz/msebera/android/httpclient/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-static {v0, v2}, Lcz/msebera/android/httpclient/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lcz/msebera/android/httpclient/entity/ContentType;

    move-result-object v0

    sput-object v0, Lcz/msebera/android/httpclient/entity/ContentType;->TEXT_HTML:Lcz/msebera/android/httpclient/entity/ContentType;

    .line 82
    const-string v0, "text/plain"

    sget-object v2, Lcz/msebera/android/httpclient/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-static {v0, v2}, Lcz/msebera/android/httpclient/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lcz/msebera/android/httpclient/entity/ContentType;

    move-result-object v0

    sput-object v0, Lcz/msebera/android/httpclient/entity/ContentType;->TEXT_PLAIN:Lcz/msebera/android/httpclient/entity/ContentType;

    .line 84
    const-string v0, "text/xml"

    sget-object v2, Lcz/msebera/android/httpclient/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-static {v0, v2}, Lcz/msebera/android/httpclient/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lcz/msebera/android/httpclient/entity/ContentType;

    move-result-object v0

    sput-object v0, Lcz/msebera/android/httpclient/entity/ContentType;->TEXT_XML:Lcz/msebera/android/httpclient/entity/ContentType;

    .line 86
    const-string v0, "*/*"

    check-cast v1, Ljava/nio/charset/Charset;

    invoke-static {v0, v1}, Lcz/msebera/android/httpclient/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lcz/msebera/android/httpclient/entity/ContentType;

    move-result-object v0

    sput-object v0, Lcz/msebera/android/httpclient/entity/ContentType;->WILDCARD:Lcz/msebera/android/httpclient/entity/ContentType;

    .line 90
    sget-object v0, Lcz/msebera/android/httpclient/entity/ContentType;->TEXT_PLAIN:Lcz/msebera/android/httpclient/entity/ContentType;

    sput-object v0, Lcz/msebera/android/httpclient/entity/ContentType;->DEFAULT_TEXT:Lcz/msebera/android/httpclient/entity/ContentType;

    .line 91
    sget-object v0, Lcz/msebera/android/httpclient/entity/ContentType;->APPLICATION_OCTET_STREAM:Lcz/msebera/android/httpclient/entity/ContentType;

    sput-object v0, Lcz/msebera/android/httpclient/entity/ContentType;->DEFAULT_BINARY:Lcz/msebera/android/httpclient/entity/ContentType;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/nio/charset/Charset;)V
    .registers 4
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    iput-object p1, p0, Lcz/msebera/android/httpclient/entity/ContentType;->mimeType:Ljava/lang/String;

    .line 101
    iput-object p2, p0, Lcz/msebera/android/httpclient/entity/ContentType;->charset:Ljava/nio/charset/Charset;

    .line 102
    const/4 v0, 0x0

    iput-object v0, p0, Lcz/msebera/android/httpclient/entity/ContentType;->params:[Lcz/msebera/android/httpclient/NameValuePair;

    .line 103
    return-void
.end method

.method constructor <init>(Ljava/lang/String;[Lcz/msebera/android/httpclient/NameValuePair;)V
    .registers 5
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "params"    # [Lcz/msebera/android/httpclient/NameValuePair;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/charset/UnsupportedCharsetException;
        }
    .end annotation

    .prologue
    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    iput-object p1, p0, Lcz/msebera/android/httpclient/entity/ContentType;->mimeType:Ljava/lang/String;

    .line 109
    iput-object p2, p0, Lcz/msebera/android/httpclient/entity/ContentType;->params:[Lcz/msebera/android/httpclient/NameValuePair;

    .line 110
    const-string v1, "charset"

    invoke-virtual {p0, v1}, Lcz/msebera/android/httpclient/entity/ContentType;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 111
    .local v0, "s":Ljava/lang/String;
    invoke-static {v0}, Lcz/msebera/android/httpclient/util/TextUtils;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1a

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    :goto_17
    iput-object v1, p0, Lcz/msebera/android/httpclient/entity/ContentType;->charset:Ljava/nio/charset/Charset;

    .line 112
    return-void

    .line 111
    :cond_1a
    const/4 v1, 0x0

    goto :goto_17
.end method

.method private static create(Lcz/msebera/android/httpclient/HeaderElement;)Lcz/msebera/android/httpclient/entity/ContentType;
    .registers 5
    .param p0, "helem"    # Lcz/msebera/android/httpclient/HeaderElement;

    .prologue
    .line 208
    invoke-interface {p0}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v0

    .line 209
    .local v0, "mimeType":Ljava/lang/String;
    invoke-interface {p0}, Lcz/msebera/android/httpclient/HeaderElement;->getParameters()[Lcz/msebera/android/httpclient/NameValuePair;

    move-result-object v1

    .line 210
    .local v1, "params":[Lcz/msebera/android/httpclient/NameValuePair;
    new-instance v2, Lcz/msebera/android/httpclient/entity/ContentType;

    if-eqz v1, :cond_13

    array-length v3, v1

    if-lez v3, :cond_13

    .end local v1    # "params":[Lcz/msebera/android/httpclient/NameValuePair;
    :goto_f
    invoke-direct {v2, v0, v1}, Lcz/msebera/android/httpclient/entity/ContentType;-><init>(Ljava/lang/String;[Lcz/msebera/android/httpclient/NameValuePair;)V

    return-object v2

    .restart local v1    # "params":[Lcz/msebera/android/httpclient/NameValuePair;
    :cond_13
    const/4 v1, 0x0

    goto :goto_f
.end method

.method public static create(Ljava/lang/String;)Lcz/msebera/android/httpclient/entity/ContentType;
    .registers 3
    .param p0, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 188
    new-instance v1, Lcz/msebera/android/httpclient/entity/ContentType;

    const/4 v0, 0x0

    check-cast v0, Ljava/nio/charset/Charset;

    invoke-direct {v1, p0, v0}, Lcz/msebera/android/httpclient/entity/ContentType;-><init>(Ljava/lang/String;Ljava/nio/charset/Charset;)V

    return-object v1
.end method

.method public static create(Ljava/lang/String;Ljava/lang/String;)Lcz/msebera/android/httpclient/entity/ContentType;
    .registers 3
    .param p0, "mimeType"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/charset/UnsupportedCharsetException;
        }
    .end annotation

    .prologue
    .line 204
    invoke-static {p1}, Lcz/msebera/android/httpclient/util/TextUtils;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_f

    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    :goto_a
    invoke-static {p0, v0}, Lcz/msebera/android/httpclient/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lcz/msebera/android/httpclient/entity/ContentType;

    move-result-object v0

    return-object v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public static create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lcz/msebera/android/httpclient/entity/ContentType;
    .registers 5
    .param p0, "mimeType"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 175
    const-string v1, "MIME type"

    invoke-static {p0, v1}, Lcz/msebera/android/httpclient/util/Args;->notBlank(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 176
    .local v0, "type":Ljava/lang/String;
    invoke-static {v0}, Lcz/msebera/android/httpclient/entity/ContentType;->valid(Ljava/lang/String;)Z

    move-result v1

    const-string v2, "MIME type may not contain reserved characters"

    invoke-static {v1, v2}, Lcz/msebera/android/httpclient/util/Args;->check(ZLjava/lang/String;)V

    .line 177
    new-instance v1, Lcz/msebera/android/httpclient/entity/ContentType;

    invoke-direct {v1, v0, p1}, Lcz/msebera/android/httpclient/entity/ContentType;-><init>(Ljava/lang/String;Ljava/nio/charset/Charset;)V

    return-object v1
.end method

.method public static get(Lcz/msebera/android/httpclient/HttpEntity;)Lcz/msebera/android/httpclient/entity/ContentType;
    .registers 5
    .param p0, "entity"    # Lcz/msebera/android/httpclient/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/ParseException;,
            Ljava/nio/charset/UnsupportedCharsetException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 251
    if-nez p0, :cond_4

    .line 261
    :cond_3
    :goto_3
    return-object v2

    .line 254
    :cond_4
    invoke-interface {p0}, Lcz/msebera/android/httpclient/HttpEntity;->getContentType()Lcz/msebera/android/httpclient/Header;

    move-result-object v1

    .line 255
    .local v1, "header":Lcz/msebera/android/httpclient/Header;
    if-eqz v1, :cond_3

    .line 256
    invoke-interface {v1}, Lcz/msebera/android/httpclient/Header;->getElements()[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v0

    .line 257
    .local v0, "elements":[Lcz/msebera/android/httpclient/HeaderElement;
    array-length v3, v0

    if-lez v3, :cond_3

    .line 258
    const/4 v2, 0x0

    aget-object v2, v0, v2

    invoke-static {v2}, Lcz/msebera/android/httpclient/entity/ContentType;->create(Lcz/msebera/android/httpclient/HeaderElement;)Lcz/msebera/android/httpclient/entity/ContentType;

    move-result-object v2

    goto :goto_3
.end method

.method public static getOrDefault(Lcz/msebera/android/httpclient/HttpEntity;)Lcz/msebera/android/httpclient/entity/ContentType;
    .registers 2
    .param p0, "entity"    # Lcz/msebera/android/httpclient/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/ParseException;,
            Ljava/nio/charset/UnsupportedCharsetException;
        }
    .end annotation

    .prologue
    .line 277
    invoke-static {p0}, Lcz/msebera/android/httpclient/entity/ContentType;->get(Lcz/msebera/android/httpclient/HttpEntity;)Lcz/msebera/android/httpclient/entity/ContentType;

    move-result-object v0

    .line 278
    .local v0, "contentType":Lcz/msebera/android/httpclient/entity/ContentType;
    if-eqz v0, :cond_7

    .end local v0    # "contentType":Lcz/msebera/android/httpclient/entity/ContentType;
    :goto_6
    return-object v0

    .restart local v0    # "contentType":Lcz/msebera/android/httpclient/entity/ContentType;
    :cond_7
    sget-object v0, Lcz/msebera/android/httpclient/entity/ContentType;->DEFAULT_TEXT:Lcz/msebera/android/httpclient/entity/ContentType;

    goto :goto_6
.end method

.method public static parse(Ljava/lang/String;)Lcz/msebera/android/httpclient/entity/ContentType;
    .registers 7
    .param p0, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/ParseException;,
            Ljava/nio/charset/UnsupportedCharsetException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 225
    const-string v3, "Content type"

    invoke-static {p0, v3}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 226
    new-instance v0, Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-direct {v0, v3}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;-><init>(I)V

    .line 227
    .local v0, "buf":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    invoke-virtual {v0, p0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 228
    new-instance v1, Lcz/msebera/android/httpclient/message/ParserCursor;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-direct {v1, v4, v3}, Lcz/msebera/android/httpclient/message/ParserCursor;-><init>(II)V

    .line 229
    .local v1, "cursor":Lcz/msebera/android/httpclient/message/ParserCursor;
    sget-object v3, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;

    invoke-virtual {v3, v0, v1}, Lcz/msebera/android/httpclient/message/BasicHeaderValueParser;->parseElements(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/message/ParserCursor;)[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v2

    .line 230
    .local v2, "elements":[Lcz/msebera/android/httpclient/HeaderElement;
    array-length v3, v2

    if-lez v3, :cond_2b

    .line 231
    aget-object v3, v2, v4

    invoke-static {v3}, Lcz/msebera/android/httpclient/entity/ContentType;->create(Lcz/msebera/android/httpclient/HeaderElement;)Lcz/msebera/android/httpclient/entity/ContentType;

    move-result-object v3

    return-object v3

    .line 233
    :cond_2b
    new-instance v3, Lcz/msebera/android/httpclient/ParseException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid content type: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcz/msebera/android/httpclient/ParseException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private static valid(Ljava/lang/String;)Z
    .registers 4
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 157
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1c

    .line 158
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 159
    .local v0, "ch":C
    const/16 v2, 0x22

    if-eq v0, v2, :cond_17

    const/16 v2, 0x2c

    if-eq v0, v2, :cond_17

    const/16 v2, 0x3b

    if-ne v0, v2, :cond_19

    .line 160
    :cond_17
    const/4 v2, 0x0

    .line 163
    .end local v0    # "ch":C
    :goto_18
    return v2

    .line 157
    .restart local v0    # "ch":C
    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 163
    .end local v0    # "ch":C
    :cond_1c
    const/4 v2, 0x1

    goto :goto_18
.end method


# virtual methods
.method public getCharset()Ljava/nio/charset/Charset;
    .registers 2

    .prologue
    .line 119
    iget-object v0, p0, Lcz/msebera/android/httpclient/entity/ContentType;->charset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public getMimeType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 115
    iget-object v0, p0, Lcz/msebera/android/httpclient/entity/ContentType;->mimeType:Ljava/lang/String;

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 126
    const-string v2, "Parameter name"

    invoke-static {p1, v2}, Lcz/msebera/android/httpclient/util/Args;->notEmpty(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 127
    iget-object v2, p0, Lcz/msebera/android/httpclient/entity/ContentType;->params:[Lcz/msebera/android/httpclient/NameValuePair;

    if-nez v2, :cond_b

    .line 135
    :cond_a
    :goto_a
    return-object v1

    .line 130
    :cond_b
    iget-object v3, p0, Lcz/msebera/android/httpclient/entity/ContentType;->params:[Lcz/msebera/android/httpclient/NameValuePair;

    array-length v4, v3

    const/4 v2, 0x0

    :goto_f
    if-ge v2, v4, :cond_a

    aget-object v0, v3, v2

    .line 131
    .local v0, "param":Lcz/msebera/android/httpclient/NameValuePair;
    invoke-interface {v0}, Lcz/msebera/android/httpclient/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_22

    .line 132
    invoke-interface {v0}, Lcz/msebera/android/httpclient/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v1

    goto :goto_a

    .line 130
    :cond_22
    add-int/lit8 v2, v2, 0x1

    goto :goto_f
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 144
    new-instance v0, Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;-><init>(I)V

    .line 145
    .local v0, "buf":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    iget-object v1, p0, Lcz/msebera/android/httpclient/entity/ContentType;->mimeType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 146
    iget-object v1, p0, Lcz/msebera/android/httpclient/entity/ContentType;->params:[Lcz/msebera/android/httpclient/NameValuePair;

    if-eqz v1, :cond_22

    .line 147
    const-string v1, "; "

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 148
    sget-object v1, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;

    iget-object v2, p0, Lcz/msebera/android/httpclient/entity/ContentType;->params:[Lcz/msebera/android/httpclient/NameValuePair;

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v2, v3}, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->formatParameters(Lcz/msebera/android/httpclient/util/CharArrayBuffer;[Lcz/msebera/android/httpclient/NameValuePair;Z)Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    .line 153
    :cond_1d
    :goto_1d
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 149
    :cond_22
    iget-object v1, p0, Lcz/msebera/android/httpclient/entity/ContentType;->charset:Ljava/nio/charset/Charset;

    if-eqz v1, :cond_1d

    .line 150
    const-string v1, "; charset="

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 151
    iget-object v1, p0, Lcz/msebera/android/httpclient/entity/ContentType;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    goto :goto_1d
.end method

.method public withCharset(Ljava/lang/String;)Lcz/msebera/android/httpclient/entity/ContentType;
    .registers 3
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 302
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/entity/ContentType;->getMimeType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcz/msebera/android/httpclient/entity/ContentType;->create(Ljava/lang/String;Ljava/lang/String;)Lcz/msebera/android/httpclient/entity/ContentType;

    move-result-object v0

    return-object v0
.end method

.method public withCharset(Ljava/nio/charset/Charset;)Lcz/msebera/android/httpclient/entity/ContentType;
    .registers 3
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 289
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/entity/ContentType;->getMimeType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcz/msebera/android/httpclient/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lcz/msebera/android/httpclient/entity/ContentType;

    move-result-object v0

    return-object v0
.end method
