.class public final Lorg/apache/http/entity/ContentType;
.super Ljava/lang/Object;
.source "ContentType.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field public static final APPLICATION_ATOM_XML:Lorg/apache/http/entity/ContentType;

.field public static final APPLICATION_FORM_URLENCODED:Lorg/apache/http/entity/ContentType;

.field public static final APPLICATION_JSON:Lorg/apache/http/entity/ContentType;

.field public static final APPLICATION_OCTET_STREAM:Lorg/apache/http/entity/ContentType;

.field public static final APPLICATION_SVG_XML:Lorg/apache/http/entity/ContentType;

.field public static final APPLICATION_XHTML_XML:Lorg/apache/http/entity/ContentType;

.field public static final APPLICATION_XML:Lorg/apache/http/entity/ContentType;

.field public static final DEFAULT_BINARY:Lorg/apache/http/entity/ContentType;

.field public static final DEFAULT_TEXT:Lorg/apache/http/entity/ContentType;

.field public static final MULTIPART_FORM_DATA:Lorg/apache/http/entity/ContentType;

.field public static final TEXT_HTML:Lorg/apache/http/entity/ContentType;

.field public static final TEXT_PLAIN:Lorg/apache/http/entity/ContentType;

.field public static final TEXT_XML:Lorg/apache/http/entity/ContentType;

.field public static final WILDCARD:Lorg/apache/http/entity/ContentType;


# instance fields
.field private final charset:Ljava/nio/charset/Charset;

.field private final mimeType:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 56
    const-string v0, "application/atom+xml"

    sget-object v2, Lorg/apache/http/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-static {v0, v2}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/http/entity/ContentType;

    move-result-object v0

    sput-object v0, Lorg/apache/http/entity/ContentType;->APPLICATION_ATOM_XML:Lorg/apache/http/entity/ContentType;

    .line 58
    const-string v0, "application/x-www-form-urlencoded"

    sget-object v2, Lorg/apache/http/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-static {v0, v2}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/http/entity/ContentType;

    move-result-object v0

    sput-object v0, Lorg/apache/http/entity/ContentType;->APPLICATION_FORM_URLENCODED:Lorg/apache/http/entity/ContentType;

    .line 60
    const-string v0, "application/json"

    sget-object v2, Lorg/apache/http/Consts;->UTF_8:Ljava/nio/charset/Charset;

    invoke-static {v0, v2}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/http/entity/ContentType;

    move-result-object v0

    sput-object v0, Lorg/apache/http/entity/ContentType;->APPLICATION_JSON:Lorg/apache/http/entity/ContentType;

    .line 62
    const-string v2, "application/octet-stream"

    move-object v0, v1

    check-cast v0, Ljava/nio/charset/Charset;

    invoke-static {v2, v0}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/http/entity/ContentType;

    move-result-object v0

    sput-object v0, Lorg/apache/http/entity/ContentType;->APPLICATION_OCTET_STREAM:Lorg/apache/http/entity/ContentType;

    .line 64
    const-string v0, "application/svg+xml"

    sget-object v2, Lorg/apache/http/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-static {v0, v2}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/http/entity/ContentType;

    move-result-object v0

    sput-object v0, Lorg/apache/http/entity/ContentType;->APPLICATION_SVG_XML:Lorg/apache/http/entity/ContentType;

    .line 66
    const-string v0, "application/xhtml+xml"

    sget-object v2, Lorg/apache/http/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-static {v0, v2}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/http/entity/ContentType;

    move-result-object v0

    sput-object v0, Lorg/apache/http/entity/ContentType;->APPLICATION_XHTML_XML:Lorg/apache/http/entity/ContentType;

    .line 68
    const-string v0, "application/xml"

    sget-object v2, Lorg/apache/http/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-static {v0, v2}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/http/entity/ContentType;

    move-result-object v0

    sput-object v0, Lorg/apache/http/entity/ContentType;->APPLICATION_XML:Lorg/apache/http/entity/ContentType;

    .line 70
    const-string v0, "multipart/form-data"

    sget-object v2, Lorg/apache/http/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-static {v0, v2}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/http/entity/ContentType;

    move-result-object v0

    sput-object v0, Lorg/apache/http/entity/ContentType;->MULTIPART_FORM_DATA:Lorg/apache/http/entity/ContentType;

    .line 72
    const-string v0, "text/html"

    sget-object v2, Lorg/apache/http/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-static {v0, v2}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/http/entity/ContentType;

    move-result-object v0

    sput-object v0, Lorg/apache/http/entity/ContentType;->TEXT_HTML:Lorg/apache/http/entity/ContentType;

    .line 74
    const-string v0, "text/plain"

    sget-object v2, Lorg/apache/http/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-static {v0, v2}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/http/entity/ContentType;

    move-result-object v0

    sput-object v0, Lorg/apache/http/entity/ContentType;->TEXT_PLAIN:Lorg/apache/http/entity/ContentType;

    .line 76
    const-string v0, "text/xml"

    sget-object v2, Lorg/apache/http/Consts;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-static {v0, v2}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/http/entity/ContentType;

    move-result-object v0

    sput-object v0, Lorg/apache/http/entity/ContentType;->TEXT_XML:Lorg/apache/http/entity/ContentType;

    .line 78
    const-string v0, "*/*"

    check-cast v1, Ljava/nio/charset/Charset;

    invoke-static {v0, v1}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/http/entity/ContentType;

    move-result-object v0

    sput-object v0, Lorg/apache/http/entity/ContentType;->WILDCARD:Lorg/apache/http/entity/ContentType;

    .line 82
    sget-object v0, Lorg/apache/http/entity/ContentType;->TEXT_PLAIN:Lorg/apache/http/entity/ContentType;

    sput-object v0, Lorg/apache/http/entity/ContentType;->DEFAULT_TEXT:Lorg/apache/http/entity/ContentType;

    .line 83
    sget-object v0, Lorg/apache/http/entity/ContentType;->APPLICATION_OCTET_STREAM:Lorg/apache/http/entity/ContentType;

    sput-object v0, Lorg/apache/http/entity/ContentType;->DEFAULT_BINARY:Lorg/apache/http/entity/ContentType;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/nio/charset/Charset;)V
    .registers 3
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    iput-object p1, p0, Lorg/apache/http/entity/ContentType;->mimeType:Ljava/lang/String;

    .line 97
    iput-object p2, p0, Lorg/apache/http/entity/ContentType;->charset:Ljava/nio/charset/Charset;

    .line 98
    return-void
.end method

.method public static create(Ljava/lang/String;)Lorg/apache/http/entity/ContentType;
    .registers 3
    .param p0, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 163
    new-instance v1, Lorg/apache/http/entity/ContentType;

    const/4 v0, 0x0

    check-cast v0, Ljava/nio/charset/Charset;

    invoke-direct {v1, p0, v0}, Lorg/apache/http/entity/ContentType;-><init>(Ljava/lang/String;Ljava/nio/charset/Charset;)V

    return-object v1
.end method

.method public static create(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/ContentType;
    .registers 3
    .param p0, "mimeType"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/charset/UnsupportedCharsetException;
        }
    .end annotation

    .prologue
    .line 177
    if-eqz p1, :cond_b

    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    :goto_6
    invoke-static {p0, v0}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/http/entity/ContentType;

    move-result-object v0

    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public static create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/http/entity/ContentType;
    .registers 5
    .param p0, "mimeType"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 142
    if-nez p0, :cond_a

    .line 143
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "MIME type may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 145
    :cond_a
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 146
    .local v0, "type":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_22

    .line 147
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "MIME type may not be empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 149
    :cond_22
    invoke-static {v0}, Lorg/apache/http/entity/ContentType;->valid(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_30

    .line 150
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "MIME type may not contain reserved characters"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 152
    :cond_30
    new-instance v1, Lorg/apache/http/entity/ContentType;

    invoke-direct {v1, v0, p1}, Lorg/apache/http/entity/ContentType;-><init>(Ljava/lang/String;Ljava/nio/charset/Charset;)V

    return-object v1
.end method

.method private static create(Lorg/apache/http/HeaderElement;)Lorg/apache/http/entity/ContentType;
    .registers 5
    .param p0, "helem"    # Lorg/apache/http/HeaderElement;

    .prologue
    .line 181
    invoke-interface {p0}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v1

    .line 182
    .local v1, "mimeType":Ljava/lang/String;
    const/4 v0, 0x0

    .line 183
    .local v0, "charset":Ljava/lang/String;
    const-string v3, "charset"

    invoke-interface {p0, v3}, Lorg/apache/http/HeaderElement;->getParameterByName(Ljava/lang/String;)Lorg/apache/http/NameValuePair;

    move-result-object v2

    .line 184
    .local v2, "param":Lorg/apache/http/NameValuePair;
    if-eqz v2, :cond_11

    .line 185
    invoke-interface {v2}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 187
    :cond_11
    invoke-static {v1, v0}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/ContentType;

    move-result-object v3

    return-object v3
.end method

.method public static get(Lorg/apache/http/HttpEntity;)Lorg/apache/http/entity/ContentType;
    .registers 5
    .param p0, "entity"    # Lorg/apache/http/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ParseException;,
            Ljava/nio/charset/UnsupportedCharsetException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 223
    if-nez p0, :cond_4

    .line 233
    :cond_3
    :goto_3
    return-object v2

    .line 226
    :cond_4
    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContentType()Lorg/apache/http/Header;

    move-result-object v1

    .line 227
    .local v1, "header":Lorg/apache/http/Header;
    if-eqz v1, :cond_3

    .line 228
    invoke-interface {v1}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v0

    .line 229
    .local v0, "elements":[Lorg/apache/http/HeaderElement;
    array-length v3, v0

    if-lez v3, :cond_3

    .line 230
    const/4 v2, 0x0

    aget-object v2, v0, v2

    invoke-static {v2}, Lorg/apache/http/entity/ContentType;->create(Lorg/apache/http/HeaderElement;)Lorg/apache/http/entity/ContentType;

    move-result-object v2

    goto :goto_3
.end method

.method public static getOrDefault(Lorg/apache/http/HttpEntity;)Lorg/apache/http/entity/ContentType;
    .registers 2
    .param p0, "entity"    # Lorg/apache/http/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ParseException;
        }
    .end annotation

    .prologue
    .line 246
    invoke-static {p0}, Lorg/apache/http/entity/ContentType;->get(Lorg/apache/http/HttpEntity;)Lorg/apache/http/entity/ContentType;

    move-result-object v0

    .line 247
    .local v0, "contentType":Lorg/apache/http/entity/ContentType;
    if-eqz v0, :cond_7

    .end local v0    # "contentType":Lorg/apache/http/entity/ContentType;
    :goto_6
    return-object v0

    .restart local v0    # "contentType":Lorg/apache/http/entity/ContentType;
    :cond_7
    sget-object v0, Lorg/apache/http/entity/ContentType;->DEFAULT_TEXT:Lorg/apache/http/entity/ContentType;

    goto :goto_6
.end method

.method public static parse(Ljava/lang/String;)Lorg/apache/http/entity/ContentType;
    .registers 5
    .param p0, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ParseException;,
            Ljava/nio/charset/UnsupportedCharsetException;
        }
    .end annotation

    .prologue
    .line 200
    if-nez p0, :cond_a

    .line 201
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Content type may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 203
    :cond_a
    const/4 v1, 0x0

    invoke-static {p0, v1}, Lorg/apache/http/message/BasicHeaderValueParser;->parseElements(Ljava/lang/String;Lorg/apache/http/message/HeaderValueParser;)[Lorg/apache/http/HeaderElement;

    move-result-object v0

    .line 204
    .local v0, "elements":[Lorg/apache/http/HeaderElement;
    array-length v1, v0

    if-lez v1, :cond_1a

    .line 205
    const/4 v1, 0x0

    aget-object v1, v0, v1

    invoke-static {v1}, Lorg/apache/http/entity/ContentType;->create(Lorg/apache/http/HeaderElement;)Lorg/apache/http/entity/ContentType;

    move-result-object v1

    return-object v1

    .line 207
    :cond_1a
    new-instance v1, Lorg/apache/http/ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid content type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/http/ParseException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static valid(Ljava/lang/String;)Z
    .registers 4
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 124
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1c

    .line 125
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 126
    .local v0, "ch":C
    const/16 v2, 0x22

    if-eq v0, v2, :cond_17

    const/16 v2, 0x2c

    if-eq v0, v2, :cond_17

    const/16 v2, 0x3b

    if-ne v0, v2, :cond_19

    .line 127
    :cond_17
    const/4 v2, 0x0

    .line 130
    .end local v0    # "ch":C
    :goto_18
    return v2

    .line 124
    .restart local v0    # "ch":C
    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 130
    .end local v0    # "ch":C
    :cond_1c
    const/4 v2, 0x1

    goto :goto_18
.end method


# virtual methods
.method public getCharset()Ljava/nio/charset/Charset;
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lorg/apache/http/entity/ContentType;->charset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public getMimeType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lorg/apache/http/entity/ContentType;->mimeType:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 114
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .local v0, "buf":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lorg/apache/http/entity/ContentType;->mimeType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    iget-object v1, p0, Lorg/apache/http/entity/ContentType;->charset:Ljava/nio/charset/Charset;

    if-eqz v1, :cond_1c

    .line 117
    const-string v1, "; charset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    iget-object v1, p0, Lorg/apache/http/entity/ContentType;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    :cond_1c
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
