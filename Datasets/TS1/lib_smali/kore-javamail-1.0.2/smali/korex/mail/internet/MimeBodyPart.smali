.class public Lkorex/mail/internet/MimeBodyPart;
.super Lkorex/mail/BodyPart;
.source "MimeBodyPart.java"

# interfaces
.implements Lkorex/mail/internet/MimePart;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkorex/mail/internet/MimeBodyPart$MimePartDataHandler;,
        Lkorex/mail/internet/MimeBodyPart$EncodedFileDataSource;
    }
.end annotation


# static fields
.field static final cacheMultipart:Z

.field private static final decodeFileName:Z

.field private static final encodeFileName:Z

.field private static final ignoreMultipartEncoding:Z

.field private static final setContentTypeFileName:Z

.field private static final setDefaultTextCharset:Z


# instance fields
.field protected cachedContent:Ljava/lang/Object;

.field protected content:[B

.field protected contentStream:Ljava/io/InputStream;

.field protected dh:Lkorex/activation/DataHandler;

.field protected headers:Lkorex/mail/internet/InternetHeaders;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 91
    const-string v0, "mail.mime.setdefaulttextcharset"

    .line 92
    invoke-static {v0, v1}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lkorex/mail/internet/MimeBodyPart;->setDefaultTextCharset:Z

    .line 95
    const-string v0, "mail.mime.setcontenttypefilename"

    .line 96
    invoke-static {v0, v1}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lkorex/mail/internet/MimeBodyPart;->setContentTypeFileName:Z

    .line 99
    const-string v0, "mail.mime.encodefilename"

    .line 100
    invoke-static {v0, v2}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lkorex/mail/internet/MimeBodyPart;->encodeFileName:Z

    .line 101
    const-string v0, "mail.mime.decodefilename"

    .line 102
    invoke-static {v0, v2}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lkorex/mail/internet/MimeBodyPart;->decodeFileName:Z

    .line 103
    const-string v0, "mail.mime.ignoremultipartencoding"

    .line 104
    invoke-static {v0, v1}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lkorex/mail/internet/MimeBodyPart;->ignoreMultipartEncoding:Z

    .line 109
    const-string v0, "mail.mime.cachemultipart"

    .line 110
    invoke-static {v0, v1}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lkorex/mail/internet/MimeBodyPart;->cacheMultipart:Z

    .line 109
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 160
    invoke-direct {p0}, Lkorex/mail/BodyPart;-><init>()V

    .line 161
    new-instance v0, Lkorex/mail/internet/InternetHeaders;

    invoke-direct {v0}, Lkorex/mail/internet/InternetHeaders;-><init>()V

    iput-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    .line 162
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 9
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 180
    invoke-direct {p0}, Lkorex/mail/BodyPart;-><init>()V

    .line 181
    instance-of v3, p1, Ljava/io/ByteArrayInputStream;

    if-nez v3, :cond_15

    instance-of v3, p1, Ljava/io/BufferedInputStream;

    if-nez v3, :cond_15

    instance-of v3, p1, Lkorex/mail/internet/SharedInputStream;

    if-nez v3, :cond_15

    .line 184
    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-direct {v1, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .end local p1    # "is":Ljava/io/InputStream;
    .local v1, "is":Ljava/io/InputStream;
    move-object p1, v1

    .line 186
    .end local v1    # "is":Ljava/io/InputStream;
    .restart local p1    # "is":Ljava/io/InputStream;
    :cond_15
    new-instance v3, Lkorex/mail/internet/InternetHeaders;

    invoke-direct {v3, p1}, Lkorex/mail/internet/InternetHeaders;-><init>(Ljava/io/InputStream;)V

    iput-object v3, p0, Lkorex/mail/internet/MimeBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    .line 188
    instance-of v3, p1, Lkorex/mail/internet/SharedInputStream;

    if-eqz v3, :cond_30

    move-object v2, p1

    .line 189
    check-cast v2, Lkorex/mail/internet/SharedInputStream;

    .line 190
    .local v2, "sis":Lkorex/mail/internet/SharedInputStream;
    invoke-interface {v2}, Lkorex/mail/internet/SharedInputStream;->getPosition()J

    move-result-wide v3

    const-wide/16 v5, -0x1

    invoke-interface {v2, v3, v4, v5, v6}, Lkorex/mail/internet/SharedInputStream;->newStream(JJ)Ljava/io/InputStream;

    move-result-object v3

    iput-object v3, p0, Lkorex/mail/internet/MimeBodyPart;->contentStream:Ljava/io/InputStream;

    .line 199
    .end local v2    # "sis":Lkorex/mail/internet/SharedInputStream;
    :goto_2f
    return-void

    .line 193
    :cond_30
    :try_start_30
    invoke-static {p1}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/io/InputStream;)[B

    move-result-object v3

    iput-object v3, p0, Lkorex/mail/internet/MimeBodyPart;->content:[B
    :try_end_36
    .catch Ljava/io/IOException; {:try_start_30 .. :try_end_36} :catch_37

    goto :goto_2f

    .line 194
    :catch_37
    move-exception v0

    .line 195
    .local v0, "ioex":Ljava/io/IOException;
    new-instance v3, Lkorex/mail/MessagingException;

    const-string v4, "Error reading input stream"

    invoke-direct {v3, v4, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v3
.end method

.method public constructor <init>(Lkorex/mail/internet/InternetHeaders;[B)V
    .registers 3
    .param p1, "headers"    # Lkorex/mail/internet/InternetHeaders;
    .param p2, "content"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 213
    invoke-direct {p0}, Lkorex/mail/BodyPart;-><init>()V

    .line 214
    iput-object p1, p0, Lkorex/mail/internet/MimeBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    .line 215
    iput-object p2, p0, Lkorex/mail/internet/MimeBodyPart;->content:[B

    .line 216
    return-void
.end method

.method static getContentLanguage(Lkorex/mail/internet/MimePart;)[Ljava/lang/String;
    .registers 8
    .param p0, "part"    # Lkorex/mail/internet/MimePart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 1306
    const-string v6, "Content-Language"

    invoke-interface {p0, v6, v1}, Lkorex/mail/internet/MimePart;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1308
    .local v2, "s":Ljava/lang/String;
    if-nez v2, :cond_a

    .line 1334
    :cond_9
    :goto_9
    return-object v1

    .line 1312
    :cond_a
    new-instance v0, Lkorex/mail/internet/HeaderTokenizer;

    const-string v6, "()<>@,;:\\\"\t []/?="

    invoke-direct {v0, v2, v6}, Lkorex/mail/internet/HeaderTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1313
    .local v0, "h":Lkorex/mail/internet/HeaderTokenizer;
    new-instance v5, Ljava/util/Vector;

    invoke-direct {v5}, Ljava/util/Vector;-><init>()V

    .line 1319
    .local v5, "v":Ljava/util/Vector;
    :cond_16
    :goto_16
    invoke-virtual {v0}, Lkorex/mail/internet/HeaderTokenizer;->next()Lkorex/mail/internet/HeaderTokenizer$Token;

    move-result-object v3

    .line 1320
    .local v3, "tk":Lkorex/mail/internet/HeaderTokenizer$Token;
    invoke-virtual {v3}, Lkorex/mail/internet/HeaderTokenizer$Token;->getType()I

    move-result v4

    .line 1321
    .local v4, "tkType":I
    const/4 v6, -0x4

    if-ne v4, v6, :cond_31

    .line 1329
    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v6

    if-eqz v6, :cond_9

    .line 1332
    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v6

    new-array v1, v6, [Ljava/lang/String;

    .line 1333
    .local v1, "language":[Ljava/lang/String;
    invoke-virtual {v5, v1}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    goto :goto_9

    .line 1323
    .end local v1    # "language":[Ljava/lang/String;
    :cond_31
    const/4 v6, -0x1

    if-ne v4, v6, :cond_16

    .line 1324
    invoke-virtual {v3}, Lkorex/mail/internet/HeaderTokenizer$Token;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_16
.end method

.method static getDescription(Lkorex/mail/internet/MimePart;)Ljava/lang/String;
    .registers 5
    .param p0, "part"    # Lkorex/mail/internet/MimePart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1212
    const-string v3, "Content-Description"

    invoke-interface {p0, v3, v2}, Lkorex/mail/internet/MimePart;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1214
    .local v1, "rawvalue":Ljava/lang/String;
    if-nez v1, :cond_b

    move-object v1, v2

    .line 1220
    .end local v1    # "rawvalue":Ljava/lang/String;
    :goto_a
    return-object v1

    .line 1218
    .restart local v1    # "rawvalue":Ljava/lang/String;
    :cond_b
    :try_start_b
    invoke-static {v1}, Lkorex/mail/internet/MimeUtility;->unfold(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lkorex/mail/internet/MimeUtility;->decodeText(Ljava/lang/String;)Ljava/lang/String;
    :try_end_12
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_b .. :try_end_12} :catch_14

    move-result-object v1

    goto :goto_a

    .line 1219
    :catch_14
    move-exception v0

    .line 1220
    .local v0, "ex":Ljava/io/UnsupportedEncodingException;
    goto :goto_a
.end method

.method static getDisposition(Lkorex/mail/internet/MimePart;)Ljava/lang/String;
    .registers 5
    .param p0, "part"    # Lkorex/mail/internet/MimePart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1181
    const-string v3, "Content-Disposition"

    invoke-interface {p0, v3, v2}, Lkorex/mail/internet/MimePart;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1183
    .local v1, "s":Ljava/lang/String;
    if-nez v1, :cond_a

    .line 1187
    :goto_9
    return-object v2

    .line 1186
    :cond_a
    new-instance v0, Lkorex/mail/internet/ContentDisposition;

    invoke-direct {v0, v1}, Lkorex/mail/internet/ContentDisposition;-><init>(Ljava/lang/String;)V

    .line 1187
    .local v0, "cd":Lkorex/mail/internet/ContentDisposition;
    invoke-virtual {v0}, Lkorex/mail/internet/ContentDisposition;->getDisposition()Ljava/lang/String;

    move-result-object v2

    goto :goto_9
.end method

.method static getEncoding(Lkorex/mail/internet/MimePart;)Ljava/lang/String;
    .registers 7
    .param p0, "part"    # Lkorex/mail/internet/MimePart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 1355
    const-string v5, "Content-Transfer-Encoding"

    invoke-interface {p0, v5, v4}, Lkorex/mail/internet/MimePart;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1357
    .local v1, "s":Ljava/lang/String;
    if-nez v1, :cond_a

    .line 1385
    :goto_9
    return-object v4

    .line 1360
    :cond_a
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 1363
    const-string v4, "7bit"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_36

    const-string v4, "8bit"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_36

    const-string v4, "quoted-printable"

    .line 1364
    invoke-virtual {v1, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_36

    const-string v4, "binary"

    .line 1365
    invoke-virtual {v1, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_36

    const-string v4, "base64"

    .line 1366
    invoke-virtual {v1, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_38

    :cond_36
    move-object v4, v1

    .line 1367
    goto :goto_9

    .line 1370
    :cond_38
    new-instance v0, Lkorex/mail/internet/HeaderTokenizer;

    const-string v4, "()<>@,;:\\\"\t []/?="

    invoke-direct {v0, v1, v4}, Lkorex/mail/internet/HeaderTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1376
    .local v0, "h":Lkorex/mail/internet/HeaderTokenizer;
    :cond_3f
    invoke-virtual {v0}, Lkorex/mail/internet/HeaderTokenizer;->next()Lkorex/mail/internet/HeaderTokenizer$Token;

    move-result-object v2

    .line 1377
    .local v2, "tk":Lkorex/mail/internet/HeaderTokenizer$Token;
    invoke-virtual {v2}, Lkorex/mail/internet/HeaderTokenizer$Token;->getType()I

    move-result v3

    .line 1378
    .local v3, "tkType":I
    const/4 v4, -0x4

    if-ne v3, v4, :cond_4c

    move-object v4, v1

    .line 1385
    goto :goto_9

    .line 1380
    :cond_4c
    const/4 v4, -0x1

    if-ne v3, v4, :cond_3f

    .line 1381
    invoke-virtual {v2}, Lkorex/mail/internet/HeaderTokenizer$Token;->getValue()Ljava/lang/String;

    move-result-object v4

    goto :goto_9
.end method

.method static getFileName(Lkorex/mail/internet/MimePart;)Ljava/lang/String;
    .registers 8
    .param p0, "part"    # Lkorex/mail/internet/MimePart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 1241
    const/4 v3, 0x0

    .line 1242
    .local v3, "filename":Ljava/lang/String;
    const-string v5, "Content-Disposition"

    invoke-interface {p0, v5, v6}, Lkorex/mail/internet/MimePart;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1244
    .local v4, "s":Ljava/lang/String;
    if-eqz v4, :cond_15

    .line 1246
    new-instance v0, Lkorex/mail/internet/ContentDisposition;

    invoke-direct {v0, v4}, Lkorex/mail/internet/ContentDisposition;-><init>(Ljava/lang/String;)V

    .line 1247
    .local v0, "cd":Lkorex/mail/internet/ContentDisposition;
    const-string v5, "filename"

    invoke-virtual {v0, v5}, Lkorex/mail/internet/ContentDisposition;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1249
    .end local v0    # "cd":Lkorex/mail/internet/ContentDisposition;
    :cond_15
    if-nez v3, :cond_2e

    .line 1251
    const-string v5, "Content-Type"

    invoke-interface {p0, v5, v6}, Lkorex/mail/internet/MimePart;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1252
    invoke-static {p0, v4}, Lcom/sun/mail/util/MimeUtil;->cleanContentType(Lkorex/mail/internet/MimePart;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1253
    if-eqz v4, :cond_2e

    .line 1255
    :try_start_23
    new-instance v1, Lkorex/mail/internet/ContentType;

    invoke-direct {v1, v4}, Lkorex/mail/internet/ContentType;-><init>(Ljava/lang/String;)V

    .line 1256
    .local v1, "ct":Lkorex/mail/internet/ContentType;
    const-string v5, "name"

    invoke-virtual {v1, v5}, Lkorex/mail/internet/ContentType;->getParameter(Ljava/lang/String;)Ljava/lang/String;
    :try_end_2d
    .catch Lkorex/mail/internet/ParseException; {:try_start_23 .. :try_end_2d} :catch_42

    move-result-object v3

    .line 1260
    .end local v1    # "ct":Lkorex/mail/internet/ContentType;
    :cond_2e
    :goto_2e
    sget-boolean v5, Lkorex/mail/internet/MimeBodyPart;->decodeFileName:Z

    if-eqz v5, :cond_38

    if-eqz v3, :cond_38

    .line 1262
    :try_start_34
    invoke-static {v3}, Lkorex/mail/internet/MimeUtility;->decodeText(Ljava/lang/String;)Ljava/lang/String;
    :try_end_37
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_34 .. :try_end_37} :catch_39

    move-result-object v3

    .line 1267
    :cond_38
    return-object v3

    .line 1263
    :catch_39
    move-exception v2

    .line 1264
    .local v2, "ex":Ljava/io/UnsupportedEncodingException;
    new-instance v5, Lkorex/mail/MessagingException;

    const-string v6, "Can\'t decode filename"

    invoke-direct {v5, v6, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v5

    .line 1257
    .end local v2    # "ex":Ljava/io/UnsupportedEncodingException;
    :catch_42
    move-exception v5

    goto :goto_2e
.end method

.method static invalidateContentHeaders(Lkorex/mail/internet/MimePart;)V
    .registers 2
    .param p0, "part"    # Lkorex/mail/internet/MimePart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1557
    const-string v0, "Content-Type"

    invoke-interface {p0, v0}, Lkorex/mail/internet/MimePart;->removeHeader(Ljava/lang/String;)V

    .line 1558
    const-string v0, "Content-Transfer-Encoding"

    invoke-interface {p0, v0}, Lkorex/mail/internet/MimePart;->removeHeader(Ljava/lang/String;)V

    .line 1559
    return-void
.end method

.method static isMimeType(Lkorex/mail/internet/MimePart;Ljava/lang/String;)Z
    .registers 5
    .param p0, "part"    # Lkorex/mail/internet/MimePart;
    .param p1, "mimeType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1160
    :try_start_0
    new-instance v0, Lkorex/mail/internet/ContentType;

    invoke-interface {p0}, Lkorex/mail/internet/MimePart;->getContentType()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lkorex/mail/internet/ContentType;-><init>(Ljava/lang/String;)V

    .line 1161
    .local v0, "ct":Lkorex/mail/internet/ContentType;
    invoke-virtual {v0, p1}, Lkorex/mail/internet/ContentType;->match(Ljava/lang/String;)Z
    :try_end_c
    .catch Lkorex/mail/internet/ParseException; {:try_start_0 .. :try_end_c} :catch_e

    move-result v2

    .line 1163
    .end local v0    # "ct":Lkorex/mail/internet/ContentType;
    :goto_d
    return v2

    .line 1162
    :catch_e
    move-exception v1

    .line 1163
    .local v1, "ex":Lkorex/mail/internet/ParseException;
    invoke-interface {p0}, Lkorex/mail/internet/MimePart;->getContentType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    goto :goto_d
.end method

.method static restrictEncoding(Lkorex/mail/internet/MimePart;Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "part"    # Lkorex/mail/internet/MimePart;
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1400
    sget-boolean v3, Lkorex/mail/internet/MimeBodyPart;->ignoreMultipartEncoding:Z

    if-eqz v3, :cond_7

    if-nez p1, :cond_8

    .line 1428
    .end local p1    # "encoding":Ljava/lang/String;
    :cond_7
    :goto_7
    return-object p1

    .line 1403
    .restart local p1    # "encoding":Ljava/lang/String;
    :cond_8
    const-string v3, "7bit"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_7

    const-string v3, "8bit"

    .line 1404
    invoke-virtual {p1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_7

    const-string v3, "binary"

    .line 1405
    invoke-virtual {p1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_7

    .line 1408
    invoke-interface {p0}, Lkorex/mail/internet/MimePart;->getContentType()Ljava/lang/String;

    move-result-object v1

    .line 1409
    .local v1, "type":Ljava/lang/String;
    if-eqz v1, :cond_7

    .line 1418
    :try_start_26
    new-instance v0, Lkorex/mail/internet/ContentType;

    invoke-direct {v0, v1}, Lkorex/mail/internet/ContentType;-><init>(Ljava/lang/String;)V

    .line 1419
    .local v0, "cType":Lkorex/mail/internet/ContentType;
    const-string v3, "multipart/*"

    invoke-virtual {v0, v3}, Lkorex/mail/internet/ContentType;->match(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_35

    move-object p1, v2

    .line 1420
    goto :goto_7

    .line 1421
    :cond_35
    const-string v3, "message/*"

    invoke-virtual {v0, v3}, Lkorex/mail/internet/ContentType;->match(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    const-string v3, "mail.mime.allowencodedmessages"

    const/4 v4, 0x0

    .line 1422
    invoke-static {v3, v4}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z
    :try_end_43
    .catch Lkorex/mail/internet/ParseException; {:try_start_26 .. :try_end_43} :catch_48

    move-result v3

    if-nez v3, :cond_7

    move-object p1, v2

    .line 1424
    goto :goto_7

    .line 1425
    .end local v0    # "cType":Lkorex/mail/internet/ContentType;
    :catch_48
    move-exception v2

    goto :goto_7
.end method

.method static setContentLanguage(Lkorex/mail/internet/MimePart;[Ljava/lang/String;)V
    .registers 7
    .param p0, "part"    # Lkorex/mail/internet/MimePart;
    .param p1, "languages"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 1339
    new-instance v2, Ljava/lang/StringBuffer;

    aget-object v3, p1, v4

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 1340
    .local v2, "sb":Ljava/lang/StringBuffer;
    const-string v3, "Content-Language"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x2

    aget-object v4, p1, v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int v1, v3, v4

    .line 1341
    .local v1, "len":I
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_19
    array-length v3, p1

    if-ge v0, v3, :cond_3d

    .line 1342
    const/16 v3, 0x2c

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1343
    add-int/lit8 v1, v1, 0x1

    .line 1344
    const/16 v3, 0x4c

    if-le v1, v3, :cond_2e

    .line 1345
    const-string v3, "\r\n\t"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1346
    const/16 v1, 0x8

    .line 1348
    :cond_2e
    aget-object v3, p1, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1349
    aget-object v3, p1, v0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v1, v3

    .line 1341
    add-int/lit8 v0, v0, 0x1

    goto :goto_19

    .line 1351
    :cond_3d
    const-string v3, "Content-Language"

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p0, v3, v4}, Lkorex/mail/internet/MimePart;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 1352
    return-void
.end method

.method static setDescription(Lkorex/mail/internet/MimePart;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p0, "part"    # Lkorex/mail/internet/MimePart;
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1227
    if-nez p1, :cond_8

    .line 1228
    const-string v1, "Content-Description"

    invoke-interface {p0, v1}, Lkorex/mail/internet/MimePart;->removeHeader(Ljava/lang/String;)V

    .line 1238
    :goto_7
    return-void

    .line 1233
    :cond_8
    :try_start_8
    const-string v1, "Content-Description"

    const/16 v2, 0x15

    const/4 v3, 0x0

    .line 1234
    invoke-static {p1, p2, v3}, Lkorex/mail/internet/MimeUtility;->encodeText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1233
    invoke-static {v2, v3}, Lkorex/mail/internet/MimeUtility;->fold(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0, v1, v2}, Lkorex/mail/internet/MimePart;->setHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_18
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_8 .. :try_end_18} :catch_19

    goto :goto_7

    .line 1235
    :catch_19
    move-exception v0

    .line 1236
    .local v0, "uex":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Lkorex/mail/MessagingException;

    const-string v2, "Encoding error"

    invoke-direct {v1, v2, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method static setDisposition(Lkorex/mail/internet/MimePart;Ljava/lang/String;)V
    .registers 6
    .param p0, "part"    # Lkorex/mail/internet/MimePart;
    .param p1, "disposition"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1192
    if-nez p1, :cond_8

    .line 1193
    const-string v2, "Content-Disposition"

    invoke-interface {p0, v2}, Lkorex/mail/internet/MimePart;->removeHeader(Ljava/lang/String;)V

    .line 1208
    :goto_7
    return-void

    .line 1195
    :cond_8
    const-string v2, "Content-Disposition"

    const/4 v3, 0x0

    invoke-interface {p0, v2, v3}, Lkorex/mail/internet/MimePart;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1196
    .local v1, "s":Ljava/lang/String;
    if-eqz v1, :cond_1d

    .line 1202
    new-instance v0, Lkorex/mail/internet/ContentDisposition;

    invoke-direct {v0, v1}, Lkorex/mail/internet/ContentDisposition;-><init>(Ljava/lang/String;)V

    .line 1203
    .local v0, "cd":Lkorex/mail/internet/ContentDisposition;
    invoke-virtual {v0, p1}, Lkorex/mail/internet/ContentDisposition;->setDisposition(Ljava/lang/String;)V

    .line 1204
    invoke-virtual {v0}, Lkorex/mail/internet/ContentDisposition;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1206
    .end local v0    # "cd":Lkorex/mail/internet/ContentDisposition;
    :cond_1d
    const-string v2, "Content-Disposition"

    invoke-interface {p0, v2, p1}, Lkorex/mail/internet/MimePart;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7
.end method

.method static setEncoding(Lkorex/mail/internet/MimePart;Ljava/lang/String;)V
    .registers 3
    .param p0, "part"    # Lkorex/mail/internet/MimePart;
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1390
    const-string v0, "Content-Transfer-Encoding"

    invoke-interface {p0, v0, p1}, Lkorex/mail/internet/MimePart;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 1391
    return-void
.end method

.method static setFileName(Lkorex/mail/internet/MimePart;Ljava/lang/String;)V
    .registers 9
    .param p0, "part"    # Lkorex/mail/internet/MimePart;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 1272
    sget-boolean v4, Lkorex/mail/internet/MimeBodyPart;->encodeFileName:Z

    if-eqz v4, :cond_b

    if-eqz p1, :cond_b

    .line 1274
    :try_start_7
    invoke-static {p1}, Lkorex/mail/internet/MimeUtility;->encodeText(Ljava/lang/String;)Ljava/lang/String;
    :try_end_a
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_7 .. :try_end_a} :catch_4c

    move-result-object p1

    .line 1281
    :cond_b
    const-string v4, "Content-Disposition"

    invoke-interface {p0, v4, v6}, Lkorex/mail/internet/MimePart;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1282
    .local v3, "s":Ljava/lang/String;
    new-instance v1, Lkorex/mail/internet/ContentDisposition;

    if-nez v3, :cond_55

    const-string v4, "attachment"

    :goto_17
    invoke-direct {v1, v4}, Lkorex/mail/internet/ContentDisposition;-><init>(Ljava/lang/String;)V

    .line 1284
    .local v1, "cd":Lkorex/mail/internet/ContentDisposition;
    const-string v4, "filename"

    invoke-virtual {v1, v4, p1}, Lkorex/mail/internet/ContentDisposition;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 1285
    const-string v4, "Content-Disposition"

    invoke-virtual {v1}, Lkorex/mail/internet/ContentDisposition;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p0, v4, v5}, Lkorex/mail/internet/MimePart;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 1291
    sget-boolean v4, Lkorex/mail/internet/MimeBodyPart;->setContentTypeFileName:Z

    if-eqz v4, :cond_4b

    .line 1292
    const-string v4, "Content-Type"

    invoke-interface {p0, v4, v6}, Lkorex/mail/internet/MimePart;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1293
    invoke-static {p0, v3}, Lcom/sun/mail/util/MimeUtil;->cleanContentType(Lkorex/mail/internet/MimePart;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1294
    if-eqz v3, :cond_4b

    .line 1296
    :try_start_38
    new-instance v0, Lkorex/mail/internet/ContentType;

    invoke-direct {v0, v3}, Lkorex/mail/internet/ContentType;-><init>(Ljava/lang/String;)V

    .line 1297
    .local v0, "cType":Lkorex/mail/internet/ContentType;
    const-string v4, "name"

    invoke-virtual {v0, v4, p1}, Lkorex/mail/internet/ContentType;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 1298
    const-string v4, "Content-Type"

    invoke-virtual {v0}, Lkorex/mail/internet/ContentType;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p0, v4, v5}, Lkorex/mail/internet/MimePart;->setHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4b
    .catch Lkorex/mail/internet/ParseException; {:try_start_38 .. :try_end_4b} :catch_57

    .line 1302
    .end local v0    # "cType":Lkorex/mail/internet/ContentType;
    :cond_4b
    :goto_4b
    return-void

    .line 1275
    .end local v1    # "cd":Lkorex/mail/internet/ContentDisposition;
    .end local v3    # "s":Ljava/lang/String;
    :catch_4c
    move-exception v2

    .line 1276
    .local v2, "ex":Ljava/io/UnsupportedEncodingException;
    new-instance v4, Lkorex/mail/MessagingException;

    const-string v5, "Can\'t encode filename"

    invoke-direct {v4, v5, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v4

    .end local v2    # "ex":Ljava/io/UnsupportedEncodingException;
    .restart local v3    # "s":Ljava/lang/String;
    :cond_55
    move-object v4, v3

    .line 1282
    goto :goto_17

    .line 1299
    .restart local v1    # "cd":Lkorex/mail/internet/ContentDisposition;
    :catch_57
    move-exception v4

    goto :goto_4b
.end method

.method static setText(Lkorex/mail/internet/MimePart;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p0, "part"    # Lkorex/mail/internet/MimePart;
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/lang/String;
    .param p3, "subtype"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1169
    if-nez p2, :cond_d

    .line 1170
    invoke-static {p1}, Lkorex/mail/internet/MimeUtility;->checkAscii(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_34

    .line 1171
    invoke-static {}, Lkorex/mail/internet/MimeUtility;->getDefaultMIMECharset()Ljava/lang/String;

    move-result-object p2

    .line 1176
    :cond_d
    :goto_d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "text/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "; charset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "()<>@,;:\\\"\t []/?="

    .line 1177
    invoke-static {p2, v1}, Lkorex/mail/internet/MimeUtility;->quote(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1176
    invoke-interface {p0, p1, v0}, Lkorex/mail/internet/MimePart;->setContent(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1178
    return-void

    .line 1173
    :cond_34
    const-string p2, "us-ascii"

    goto :goto_d
.end method

.method static updateHeaders(Lkorex/mail/internet/MimePart;)V
    .registers 23
    .param p0, "part"    # Lkorex/mail/internet/MimePart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1432
    invoke-interface/range {p0 .. p0}, Lkorex/mail/internet/MimePart;->getDataHandler()Lkorex/activation/DataHandler;

    move-result-object v7

    .line 1433
    .local v7, "dh":Lkorex/activation/DataHandler;
    if-nez v7, :cond_7

    .line 1553
    :cond_6
    :goto_6
    return-void

    .line 1437
    :cond_7
    :try_start_7
    invoke-virtual {v7}, Lkorex/activation/DataHandler;->getContentType()Ljava/lang/String;

    move-result-object v18

    .line 1438
    .local v18, "type":Ljava/lang/String;
    const/4 v6, 0x0

    .line 1439
    .local v6, "composite":Z
    const-string v19, "Content-Type"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Lkorex/mail/internet/MimePart;->getHeader(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v19

    if-nez v19, :cond_8b

    const/4 v15, 0x1

    .line 1441
    .local v15, "needCTHeader":Z
    :goto_19
    new-instance v3, Lkorex/mail/internet/ContentType;

    move-object/from16 v0, v18

    invoke-direct {v3, v0}, Lkorex/mail/internet/ContentType;-><init>(Ljava/lang/String;)V

    .line 1449
    .local v3, "cType":Lkorex/mail/internet/ContentType;
    const-string v19, "multipart/*"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Lkorex/mail/internet/ContentType;->match(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_e9

    .line 1451
    const/4 v6, 0x1

    .line 1453
    move-object/from16 v0, p0

    instance-of v0, v0, Lkorex/mail/internet/MimeBodyPart;

    move/from16 v19, v0

    if-eqz v19, :cond_92

    .line 1454
    move-object/from16 v0, p0

    check-cast v0, Lkorex/mail/internet/MimeBodyPart;

    move-object v11, v0

    .line 1455
    .local v11, "mbp":Lkorex/mail/internet/MimeBodyPart;
    iget-object v0, v11, Lkorex/mail/internet/MimeBodyPart;->cachedContent:Ljava/lang/Object;

    move-object/from16 v19, v0

    if-eqz v19, :cond_8d

    iget-object v0, v11, Lkorex/mail/internet/MimeBodyPart;->cachedContent:Ljava/lang/Object;

    move-object/from16 v16, v0

    .line 1463
    .end local v11    # "mbp":Lkorex/mail/internet/MimeBodyPart;
    .local v16, "o":Ljava/lang/Object;
    :goto_42
    move-object/from16 v0, v16

    instance-of v0, v0, Lkorex/mail/internet/MimeMultipart;

    move/from16 v19, v0

    if-eqz v19, :cond_b4

    .line 1464
    check-cast v16, Lkorex/mail/internet/MimeMultipart;

    .end local v16    # "o":Ljava/lang/Object;
    invoke-virtual/range {v16 .. v16}, Lkorex/mail/internet/MimeMultipart;->updateHeaders()V

    .line 1483
    :cond_4f
    :goto_4f
    instance-of v0, v7, Lkorex/mail/internet/MimeBodyPart$MimePartDataHandler;

    move/from16 v19, v0

    if-eqz v19, :cond_f6

    .line 1484
    move-object v0, v7

    check-cast v0, Lkorex/mail/internet/MimeBodyPart$MimePartDataHandler;

    move-object v12, v0

    .line 1485
    .local v12, "mdh":Lkorex/mail/internet/MimeBodyPart$MimePartDataHandler;
    invoke-virtual {v12}, Lkorex/mail/internet/MimeBodyPart$MimePartDataHandler;->getPart()Lkorex/mail/internet/MimePart;

    move-result-object v13

    .line 1486
    .local v13, "mpart":Lkorex/mail/internet/MimePart;
    move-object/from16 v0, p0

    if-eq v13, v0, :cond_6

    .line 1490
    invoke-interface {v13}, Lkorex/mail/internet/MimePart;->getEncoding()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lkorex/mail/internet/MimeBodyPart;->setEncoding(Lkorex/mail/internet/MimePart;Ljava/lang/String;)V

    .line 1491
    if-eqz v15, :cond_6

    .line 1492
    const-string v19, "Content-Type"

    invoke-interface {v13}, Lkorex/mail/internet/MimePart;->getContentType()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2}, Lkorex/mail/internet/MimePart;->setHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_7d
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7d} :catch_7e

    goto :goto_6

    .line 1550
    .end local v3    # "cType":Lkorex/mail/internet/ContentType;
    .end local v6    # "composite":Z
    .end local v12    # "mdh":Lkorex/mail/internet/MimeBodyPart$MimePartDataHandler;
    .end local v13    # "mpart":Lkorex/mail/internet/MimePart;
    .end local v15    # "needCTHeader":Z
    .end local v18    # "type":Ljava/lang/String;
    :catch_7e
    move-exception v9

    .line 1551
    .local v9, "ex":Ljava/io/IOException;
    new-instance v19, Lkorex/mail/MessagingException;

    const-string v20, "IOException updating headers"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v0, v1, v9}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v19

    .line 1439
    .end local v9    # "ex":Ljava/io/IOException;
    .restart local v6    # "composite":Z
    .restart local v18    # "type":Ljava/lang/String;
    :cond_8b
    const/4 v15, 0x0

    goto :goto_19

    .line 1456
    .restart local v3    # "cType":Lkorex/mail/internet/ContentType;
    .restart local v11    # "mbp":Lkorex/mail/internet/MimeBodyPart;
    .restart local v15    # "needCTHeader":Z
    :cond_8d
    :try_start_8d
    invoke-virtual {v7}, Lkorex/activation/DataHandler;->getContent()Ljava/lang/Object;

    move-result-object v16

    goto :goto_42

    .line 1457
    .end local v11    # "mbp":Lkorex/mail/internet/MimeBodyPart;
    :cond_92
    move-object/from16 v0, p0

    instance-of v0, v0, Lkorex/mail/internet/MimeMessage;

    move/from16 v19, v0

    if-eqz v19, :cond_af

    .line 1458
    move-object/from16 v0, p0

    check-cast v0, Lkorex/mail/internet/MimeMessage;

    move-object v14, v0

    .line 1459
    .local v14, "msg":Lkorex/mail/internet/MimeMessage;
    iget-object v0, v14, Lkorex/mail/internet/MimeMessage;->cachedContent:Ljava/lang/Object;

    move-object/from16 v19, v0

    if-eqz v19, :cond_aa

    iget-object v0, v14, Lkorex/mail/internet/MimeMessage;->cachedContent:Ljava/lang/Object;

    move-object/from16 v16, v0

    .line 1461
    .restart local v16    # "o":Ljava/lang/Object;
    :goto_a9
    goto :goto_42

    .line 1460
    .end local v16    # "o":Ljava/lang/Object;
    :cond_aa
    invoke-virtual {v7}, Lkorex/activation/DataHandler;->getContent()Ljava/lang/Object;

    move-result-object v16

    goto :goto_a9

    .line 1462
    .end local v14    # "msg":Lkorex/mail/internet/MimeMessage;
    :cond_af
    invoke-virtual {v7}, Lkorex/activation/DataHandler;->getContent()Ljava/lang/Object;

    move-result-object v16

    .restart local v16    # "o":Ljava/lang/Object;
    goto :goto_42

    .line 1466
    :cond_b4
    new-instance v19, Lkorex/mail/MessagingException;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "MIME part of type \""

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "\" contains object of type "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    .line 1468
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " instead of MimeMultipart"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 1469
    .end local v16    # "o":Ljava/lang/Object;
    :cond_e9
    const-string v19, "message/rfc822"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Lkorex/mail/internet/ContentType;->match(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_4f

    .line 1470
    const/4 v6, 0x1

    goto/16 :goto_4f

    .line 1499
    :cond_f6
    if-nez v6, :cond_146

    .line 1500
    const-string v19, "Content-Transfer-Encoding"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Lkorex/mail/internet/MimePart;->getHeader(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v19

    if-nez v19, :cond_10f

    .line 1501
    invoke-static {v7}, Lkorex/mail/internet/MimeUtility;->getEncoding(Lkorex/activation/DataHandler;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lkorex/mail/internet/MimeBodyPart;->setEncoding(Lkorex/mail/internet/MimePart;Ljava/lang/String;)V

    .line 1503
    :cond_10f
    if-eqz v15, :cond_146

    sget-boolean v19, Lkorex/mail/internet/MimeBodyPart;->setDefaultTextCharset:Z

    if-eqz v19, :cond_146

    const-string v19, "text/*"

    .line 1504
    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Lkorex/mail/internet/ContentType;->match(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_146

    const-string v19, "charset"

    .line 1505
    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Lkorex/mail/internet/ContentType;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    if-nez v19, :cond_146

    .line 1517
    invoke-interface/range {p0 .. p0}, Lkorex/mail/internet/MimePart;->getEncoding()Ljava/lang/String;

    move-result-object v8

    .line 1518
    .local v8, "enc":Ljava/lang/String;
    if-eqz v8, :cond_181

    const-string v19, "7bit"

    move-object/from16 v0, v19

    invoke-virtual {v8, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_181

    .line 1519
    const-string v5, "us-ascii"

    .line 1522
    .local v5, "charset":Ljava/lang/String;
    :goto_13b
    const-string v19, "charset"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0, v5}, Lkorex/mail/internet/ContentType;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 1523
    invoke-virtual {v3}, Lkorex/mail/internet/ContentType;->toString()Ljava/lang/String;

    move-result-object v18

    .line 1530
    .end local v5    # "charset":Ljava/lang/String;
    .end local v8    # "enc":Ljava/lang/String;
    :cond_146
    if-eqz v15, :cond_6

    .line 1537
    const-string v19, "Content-Disposition"

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2}, Lkorex/mail/internet/MimePart;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 1538
    .local v17, "s":Ljava/lang/String;
    if-eqz v17, :cond_174

    .line 1540
    new-instance v4, Lkorex/mail/internet/ContentDisposition;

    move-object/from16 v0, v17

    invoke-direct {v4, v0}, Lkorex/mail/internet/ContentDisposition;-><init>(Ljava/lang/String;)V

    .line 1541
    .local v4, "cd":Lkorex/mail/internet/ContentDisposition;
    const-string v19, "filename"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Lkorex/mail/internet/ContentDisposition;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 1542
    .local v10, "filename":Ljava/lang/String;
    if-eqz v10, :cond_174

    .line 1543
    const-string v19, "name"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0, v10}, Lkorex/mail/internet/ContentType;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 1544
    invoke-virtual {v3}, Lkorex/mail/internet/ContentType;->toString()Ljava/lang/String;

    move-result-object v18

    .line 1548
    .end local v4    # "cd":Lkorex/mail/internet/ContentDisposition;
    .end local v10    # "filename":Ljava/lang/String;
    :cond_174
    const-string v19, "Content-Type"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lkorex/mail/internet/MimePart;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_6

    .line 1521
    .end local v17    # "s":Ljava/lang/String;
    .restart local v8    # "enc":Ljava/lang/String;
    :cond_181
    invoke-static {}, Lkorex/mail/internet/MimeUtility;->getDefaultMIMECharset()Ljava/lang/String;
    :try_end_184
    .catch Ljava/io/IOException; {:try_start_8d .. :try_end_184} :catch_7e

    move-result-object v5

    .restart local v5    # "charset":Ljava/lang/String;
    goto :goto_13b
.end method

.method static writeTo(Lkorex/mail/internet/MimePart;Ljava/io/OutputStream;[Ljava/lang/String;)V
    .registers 10
    .param p0, "part"    # Lkorex/mail/internet/MimePart;
    .param p1, "os"    # Ljava/io/OutputStream;
    .param p2, "ignoreList"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1565
    const/4 v5, 0x0

    .line 1566
    .local v5, "los":Lcom/sun/mail/util/LineOutputStream;
    instance-of v6, p1, Lcom/sun/mail/util/LineOutputStream;

    if-eqz v6, :cond_1c

    move-object v5, p1

    .line 1567
    check-cast v5, Lcom/sun/mail/util/LineOutputStream;

    .line 1573
    :goto_8
    invoke-interface {p0, p2}, Lkorex/mail/internet/MimePart;->getNonMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v2

    .line 1574
    .local v2, "hdrLines":Ljava/util/Enumeration;
    :goto_c
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_22

    .line 1575
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/LineOutputStream;->writeln(Ljava/lang/String;)V

    goto :goto_c

    .line 1569
    .end local v2    # "hdrLines":Ljava/util/Enumeration;
    :cond_1c
    new-instance v5, Lcom/sun/mail/util/LineOutputStream;

    .end local v5    # "los":Lcom/sun/mail/util/LineOutputStream;
    invoke-direct {v5, p1}, Lcom/sun/mail/util/LineOutputStream;-><init>(Ljava/io/OutputStream;)V

    .restart local v5    # "los":Lcom/sun/mail/util/LineOutputStream;
    goto :goto_8

    .line 1578
    .restart local v2    # "hdrLines":Ljava/util/Enumeration;
    :cond_22
    invoke-virtual {v5}, Lcom/sun/mail/util/LineOutputStream;->writeln()V

    .line 1582
    const/4 v3, 0x0

    .line 1583
    .local v3, "is":Ljava/io/InputStream;
    const/4 v0, 0x0

    .line 1590
    .local v0, "buf":[B
    :try_start_27
    invoke-interface {p0}, Lkorex/mail/internet/MimePart;->getDataHandler()Lkorex/activation/DataHandler;

    move-result-object v1

    .line 1591
    .local v1, "dh":Lkorex/activation/DataHandler;
    instance-of v6, v1, Lkorex/mail/internet/MimeBodyPart$MimePartDataHandler;

    if-eqz v6, :cond_35

    .line 1594
    check-cast v1, Lkorex/mail/internet/MimeBodyPart$MimePartDataHandler;

    .end local v1    # "dh":Lkorex/activation/DataHandler;
    invoke-virtual {v1}, Lkorex/mail/internet/MimeBodyPart$MimePartDataHandler;->getContentStream()Ljava/io/InputStream;

    move-result-object v3

    .line 1605
    :cond_35
    if-eqz v3, :cond_4e

    .line 1607
    const/16 v6, 0x2000

    new-array v0, v6, [B

    .line 1609
    :goto_3b
    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v4

    .local v4, "len":I
    if-lez v4, :cond_61

    .line 1610
    const/4 v6, 0x0

    invoke-virtual {p1, v0, v6, v4}, Ljava/io/OutputStream;->write([BII)V
    :try_end_45
    .catchall {:try_start_27 .. :try_end_45} :catchall_46

    goto :goto_3b

    .line 1617
    .end local v4    # "len":I
    :catchall_46
    move-exception v6

    if-eqz v3, :cond_4c

    .line 1618
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 1619
    :cond_4c
    const/4 v0, 0x0

    throw v6

    .line 1613
    :cond_4e
    :try_start_4e
    invoke-interface {p0}, Lkorex/mail/internet/MimePart;->getEncoding()Ljava/lang/String;

    move-result-object v6

    invoke-static {p0, v6}, Lkorex/mail/internet/MimeBodyPart;->restrictEncoding(Lkorex/mail/internet/MimePart;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1612
    invoke-static {p1, v6}, Lkorex/mail/internet/MimeUtility;->encode(Ljava/io/OutputStream;Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object p1

    .line 1614
    invoke-interface {p0}, Lkorex/mail/internet/MimePart;->getDataHandler()Lkorex/activation/DataHandler;

    move-result-object v6

    invoke-virtual {v6, p1}, Lkorex/activation/DataHandler;->writeTo(Ljava/io/OutputStream;)V
    :try_end_61
    .catchall {:try_start_4e .. :try_end_61} :catchall_46

    .line 1617
    :cond_61
    if-eqz v3, :cond_66

    .line 1618
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 1619
    :cond_66
    const/4 v0, 0x0

    .line 1621
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 1622
    return-void
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1028
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1, p2}, Lkorex/mail/internet/InternetHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 1029
    return-void
.end method

.method public addHeaderLine(Ljava/lang/String;)V
    .registers 3
    .param p1, "line"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1068
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1}, Lkorex/mail/internet/InternetHeaders;->addHeaderLine(Ljava/lang/String;)V

    .line 1069
    return-void
.end method

.method public attachFile(Ljava/io/File;)V
    .registers 4
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 813
    new-instance v0, Lkorex/activation/FileDataSource;

    invoke-direct {v0, p1}, Lkorex/activation/FileDataSource;-><init>(Ljava/io/File;)V

    .line 814
    .local v0, "fds":Lkorex/activation/FileDataSource;
    new-instance v1, Lkorex/activation/DataHandler;

    invoke-direct {v1, v0}, Lkorex/activation/DataHandler;-><init>(Lkorex/activation/DataSource;)V

    invoke-virtual {p0, v1}, Lkorex/mail/internet/MimeBodyPart;->setDataHandler(Lkorex/activation/DataHandler;)V

    .line 815
    invoke-virtual {v0}, Lkorex/activation/FileDataSource;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lkorex/mail/internet/MimeBodyPart;->setFileName(Ljava/lang/String;)V

    .line 816
    const-string v1, "attachment"

    invoke-virtual {p0, v1}, Lkorex/mail/internet/MimeBodyPart;->setDisposition(Ljava/lang/String;)V

    .line 817
    return-void
.end method

.method public attachFile(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "file"    # Ljava/io/File;
    .param p2, "contentType"    # Ljava/lang/String;
    .param p3, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 855
    new-instance v0, Lkorex/mail/internet/MimeBodyPart$EncodedFileDataSource;

    invoke-direct {v0, p1, p2, p3}, Lkorex/mail/internet/MimeBodyPart$EncodedFileDataSource;-><init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    .line 856
    .local v0, "fds":Lkorex/activation/DataSource;
    new-instance v1, Lkorex/activation/DataHandler;

    invoke-direct {v1, v0}, Lkorex/activation/DataHandler;-><init>(Lkorex/activation/DataSource;)V

    invoke-virtual {p0, v1}, Lkorex/mail/internet/MimeBodyPart;->setDataHandler(Lkorex/activation/DataHandler;)V

    .line 857
    invoke-interface {v0}, Lkorex/activation/DataSource;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lkorex/mail/internet/MimeBodyPart;->setFileName(Ljava/lang/String;)V

    .line 858
    const-string v1, "attachment"

    invoke-virtual {p0, v1}, Lkorex/mail/internet/MimeBodyPart;->setDisposition(Ljava/lang/String;)V

    .line 859
    return-void
.end method

.method public attachFile(Ljava/lang/String;)V
    .registers 3
    .param p1, "file"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 832
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 833
    .local v0, "f":Ljava/io/File;
    invoke-virtual {p0, v0}, Lkorex/mail/internet/MimeBodyPart;->attachFile(Ljava/io/File;)V

    .line 834
    return-void
.end method

.method public attachFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "file"    # Ljava/lang/String;
    .param p2, "contentType"    # Ljava/lang/String;
    .param p3, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 880
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, p2, p3}, Lkorex/mail/internet/MimeBodyPart;->attachFile(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    .line 881
    return-void
.end method

.method public getAllHeaderLines()Ljava/util/Enumeration;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1077
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0}, Lkorex/mail/internet/InternetHeaders;->getAllHeaderLines()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getAllHeaders()Ljava/util/Enumeration;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1043
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0}, Lkorex/mail/internet/InternetHeaders;->getAllHeaders()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getContent()Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 659
    iget-object v3, p0, Lkorex/mail/internet/MimeBodyPart;->cachedContent:Ljava/lang/Object;

    if-eqz v3, :cond_7

    .line 660
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->cachedContent:Ljava/lang/Object;

    .line 680
    :cond_6
    :goto_6
    return-object v0

    .line 663
    :cond_7
    :try_start_7
    invoke-virtual {p0}, Lkorex/mail/internet/MimeBodyPart;->getDataHandler()Lkorex/activation/DataHandler;

    move-result-object v3

    invoke-virtual {v3}, Lkorex/activation/DataHandler;->getContent()Ljava/lang/Object;
    :try_end_e
    .catch Lcom/sun/mail/util/FolderClosedIOException; {:try_start_7 .. :try_end_e} :catch_30
    .catch Lcom/sun/mail/util/MessageRemovedIOException; {:try_start_7 .. :try_end_e} :catch_3f

    move-result-object v0

    .line 669
    .local v0, "c":Ljava/lang/Object;
    sget-boolean v3, Lkorex/mail/internet/MimeBodyPart;->cacheMultipart:Z

    if-eqz v3, :cond_6

    instance-of v3, v0, Lkorex/mail/Multipart;

    if-nez v3, :cond_1b

    instance-of v3, v0, Lkorex/mail/Message;

    if-eqz v3, :cond_6

    :cond_1b
    iget-object v3, p0, Lkorex/mail/internet/MimeBodyPart;->content:[B

    if-nez v3, :cond_23

    iget-object v3, p0, Lkorex/mail/internet/MimeBodyPart;->contentStream:Ljava/io/InputStream;

    if-eqz v3, :cond_6

    .line 672
    :cond_23
    iput-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->cachedContent:Ljava/lang/Object;

    .line 677
    instance-of v3, v0, Lkorex/mail/internet/MimeMultipart;

    if-eqz v3, :cond_6

    move-object v3, v0

    .line 678
    check-cast v3, Lkorex/mail/internet/MimeMultipart;

    invoke-virtual {v3}, Lkorex/mail/internet/MimeMultipart;->parse()V

    goto :goto_6

    .line 664
    .end local v0    # "c":Ljava/lang/Object;
    :catch_30
    move-exception v1

    .line 665
    .local v1, "fex":Lcom/sun/mail/util/FolderClosedIOException;
    new-instance v3, Lkorex/mail/FolderClosedException;

    invoke-virtual {v1}, Lcom/sun/mail/util/FolderClosedIOException;->getFolder()Lkorex/mail/Folder;

    move-result-object v4

    invoke-virtual {v1}, Lcom/sun/mail/util/FolderClosedIOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v3

    .line 666
    .end local v1    # "fex":Lcom/sun/mail/util/FolderClosedIOException;
    :catch_3f
    move-exception v2

    .line 667
    .local v2, "mex":Lcom/sun/mail/util/MessageRemovedIOException;
    new-instance v3, Lkorex/mail/MessageRemovedException;

    invoke-virtual {v2}, Lcom/sun/mail/util/MessageRemovedIOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lkorex/mail/MessageRemovedException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public getContentID()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 363
    const-string v0, "Content-Id"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lkorex/mail/internet/MimeBodyPart;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContentLanguage()[Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 420
    invoke-static {p0}, Lkorex/mail/internet/MimeBodyPart;->getContentLanguage(Lkorex/mail/internet/MimePart;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContentMD5()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 395
    const-string v0, "Content-MD5"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lkorex/mail/internet/MimeBodyPart;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getContentStream()Ljava/io/InputStream;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 595
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->contentStream:Ljava/io/InputStream;

    if-eqz v0, :cond_11

    .line 596
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->contentStream:Ljava/io/InputStream;

    check-cast v0, Lkorex/mail/internet/SharedInputStream;

    const-wide/16 v1, 0x0

    const-wide/16 v3, -0x1

    invoke-interface {v0, v1, v2, v3, v4}, Lkorex/mail/internet/SharedInputStream;->newStream(JJ)Ljava/io/InputStream;

    move-result-object v0

    .line 598
    :goto_10
    return-object v0

    .line 597
    :cond_11
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->content:[B

    if-eqz v0, :cond_1d

    .line 598
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lkorex/mail/internet/MimeBodyPart;->content:[B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    goto :goto_10

    .line 600
    :cond_1d
    new-instance v0, Lkorex/mail/MessagingException;

    const-string v1, "No MimeBodyPart content"

    invoke-direct {v0, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getContentType()Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 279
    const-string v1, "Content-Type"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lkorex/mail/internet/MimeBodyPart;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 280
    .local v0, "s":Ljava/lang/String;
    invoke-static {p0, v0}, Lcom/sun/mail/util/MimeUtil;->cleanContentType(Lkorex/mail/internet/MimePart;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 281
    if-nez v0, :cond_f

    .line 282
    const-string v0, "text/plain"

    .line 283
    :cond_f
    return-object v0
.end method

.method public getDataHandler()Lkorex/activation/DataHandler;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 632
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->dh:Lkorex/activation/DataHandler;

    if-nez v0, :cond_b

    .line 633
    new-instance v0, Lkorex/mail/internet/MimeBodyPart$MimePartDataHandler;

    invoke-direct {v0, p0}, Lkorex/mail/internet/MimeBodyPart$MimePartDataHandler;-><init>(Lkorex/mail/internet/MimePart;)V

    iput-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->dh:Lkorex/activation/DataHandler;

    .line 634
    :cond_b
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->dh:Lkorex/activation/DataHandler;

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 450
    invoke-static {p0}, Lkorex/mail/internet/MimeBodyPart;->getDescription(Lkorex/mail/internet/MimePart;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDisposition()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 321
    invoke-static {p0}, Lkorex/mail/internet/MimeBodyPart;->getDisposition(Lkorex/mail/internet/MimePart;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEncoding()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 351
    invoke-static {p0}, Lkorex/mail/internet/MimeBodyPart;->getEncoding(Lkorex/mail/internet/MimePart;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFileName()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 533
    invoke-static {p0}, Lkorex/mail/internet/MimeBodyPart;->getFileName(Lkorex/mail/internet/MimePart;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "delimiter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 997
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1, p2}, Lkorex/mail/internet/InternetHeaders;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHeader(Ljava/lang/String;)[Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 980
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1}, Lkorex/mail/internet/InternetHeaders;->getHeader(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 580
    invoke-virtual {p0}, Lkorex/mail/internet/MimeBodyPart;->getDataHandler()Lkorex/activation/DataHandler;

    move-result-object v0

    invoke-virtual {v0}, Lkorex/activation/DataHandler;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getLineCount()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 264
    const/4 v0, -0x1

    return v0
.end method

.method public getMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;
    .registers 3
    .param p1, "names"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1087
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1}, Lkorex/mail/internet/InternetHeaders;->getMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getMatchingHeaders([Ljava/lang/String;)Ljava/util/Enumeration;
    .registers 3
    .param p1, "names"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1052
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1}, Lkorex/mail/internet/InternetHeaders;->getMatchingHeaders([Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getNonMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;
    .registers 3
    .param p1, "names"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1097
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1}, Lkorex/mail/internet/InternetHeaders;->getNonMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getNonMatchingHeaders([Ljava/lang/String;)Ljava/util/Enumeration;
    .registers 3
    .param p1, "names"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1061
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1}, Lkorex/mail/internet/InternetHeaders;->getNonMatchingHeaders([Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getRawInputStream()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 621
    invoke-virtual {p0}, Lkorex/mail/internet/MimeBodyPart;->getContentStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getSize()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 235
    iget-object v1, p0, Lkorex/mail/internet/MimeBodyPart;->content:[B

    if-eqz v1, :cond_8

    .line 236
    iget-object v1, p0, Lkorex/mail/internet/MimeBodyPart;->content:[B

    array-length v0, v1

    .line 248
    :cond_7
    :goto_7
    return v0

    .line 237
    :cond_8
    iget-object v1, p0, Lkorex/mail/internet/MimeBodyPart;->contentStream:Ljava/io/InputStream;

    if-eqz v1, :cond_14

    .line 239
    :try_start_c
    iget-object v1, p0, Lkorex/mail/internet/MimeBodyPart;->contentStream:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->available()I
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_11} :catch_16

    move-result v0

    .line 242
    .local v0, "size":I
    if-gtz v0, :cond_7

    .line 248
    .end local v0    # "size":I
    :cond_14
    :goto_14
    const/4 v0, -0x1

    goto :goto_7

    .line 244
    :catch_16
    move-exception v1

    goto :goto_14
.end method

.method public isMimeType(Ljava/lang/String;)Z
    .registers 3
    .param p1, "mimeType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 303
    invoke-static {p0, p1}, Lkorex/mail/internet/MimeBodyPart;->isMimeType(Lkorex/mail/internet/MimePart;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public removeHeader(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1035
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1}, Lkorex/mail/internet/InternetHeaders;->removeHeader(Ljava/lang/String;)V

    .line 1036
    return-void
.end method

.method public saveFile(Ljava/io/File;)V
    .registers 9
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 920
    const/4 v3, 0x0

    .line 921
    .local v3, "out":Ljava/io/OutputStream;
    const/4 v1, 0x0

    .line 923
    .local v1, "in":Ljava/io/InputStream;
    :try_start_2
    new-instance v4, Ljava/io/BufferedOutputStream;

    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_c
    .catchall {:try_start_2 .. :try_end_c} :catchall_3f

    .line 924
    .end local v3    # "out":Ljava/io/OutputStream;
    .local v4, "out":Ljava/io/OutputStream;
    :try_start_c
    invoke-virtual {p0}, Lkorex/mail/internet/MimeBodyPart;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 925
    const/16 v5, 0x2000

    new-array v0, v5, [B

    .line 927
    .local v0, "buf":[B
    :goto_14
    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "len":I
    if-lez v2, :cond_2c

    .line 928
    const/4 v5, 0x0

    invoke-virtual {v4, v0, v5, v2}, Ljava/io/OutputStream;->write([BII)V
    :try_end_1e
    .catchall {:try_start_c .. :try_end_1e} :catchall_1f

    goto :goto_14

    .line 931
    .end local v0    # "buf":[B
    .end local v2    # "len":I
    :catchall_1f
    move-exception v5

    move-object v3, v4

    .line 932
    .end local v4    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :goto_21
    if-eqz v1, :cond_26

    .line 933
    :try_start_23
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_26} :catch_3b

    .line 936
    :cond_26
    :goto_26
    if-eqz v3, :cond_2b

    .line 937
    :try_start_28
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_2b
    .catch Ljava/io/IOException; {:try_start_28 .. :try_end_2b} :catch_3d

    .line 938
    :cond_2b
    :goto_2b
    throw v5

    .line 932
    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v0    # "buf":[B
    .restart local v2    # "len":I
    .restart local v4    # "out":Ljava/io/OutputStream;
    :cond_2c
    if-eqz v1, :cond_31

    .line 933
    :try_start_2e
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_31} :catch_37

    .line 936
    :cond_31
    :goto_31
    if-eqz v4, :cond_36

    .line 937
    :try_start_33
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_36
    .catch Ljava/io/IOException; {:try_start_33 .. :try_end_36} :catch_39

    .line 940
    :cond_36
    :goto_36
    return-void

    .line 934
    :catch_37
    move-exception v5

    goto :goto_31

    .line 938
    :catch_39
    move-exception v5

    goto :goto_36

    .line 934
    .end local v0    # "buf":[B
    .end local v2    # "len":I
    .end local v4    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catch_3b
    move-exception v6

    goto :goto_26

    .line 938
    :catch_3d
    move-exception v6

    goto :goto_2b

    .line 931
    :catchall_3f
    move-exception v5

    goto :goto_21
.end method

.method public saveFile(Ljava/lang/String;)V
    .registers 3
    .param p1, "file"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 952
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 953
    .local v0, "f":Ljava/io/File;
    invoke-virtual {p0, v0}, Lkorex/mail/internet/MimeBodyPart;->saveFile(Ljava/io/File;)V

    .line 954
    return-void
.end method

.method public setContent(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 4
    .param p1, "o"    # Ljava/lang/Object;
    .param p2, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 720
    instance-of v0, p1, Lkorex/mail/Multipart;

    if-eqz v0, :cond_a

    .line 721
    check-cast p1, Lkorex/mail/Multipart;

    .end local p1    # "o":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lkorex/mail/internet/MimeBodyPart;->setContent(Lkorex/mail/Multipart;)V

    .line 725
    :goto_9
    return-void

    .line 723
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_a
    new-instance v0, Lkorex/activation/DataHandler;

    invoke-direct {v0, p1, p2}, Lkorex/activation/DataHandler;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lkorex/mail/internet/MimeBodyPart;->setDataHandler(Lkorex/activation/DataHandler;)V

    goto :goto_9
.end method

.method public setContent(Lkorex/mail/Multipart;)V
    .registers 4
    .param p1, "mp"    # Lkorex/mail/Multipart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 795
    new-instance v0, Lkorex/activation/DataHandler;

    invoke-virtual {p1}, Lkorex/mail/Multipart;->getContentType()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lkorex/activation/DataHandler;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lkorex/mail/internet/MimeBodyPart;->setDataHandler(Lkorex/activation/DataHandler;)V

    .line 796
    invoke-virtual {p1, p0}, Lkorex/mail/Multipart;->setParent(Lkorex/mail/Part;)V

    .line 797
    return-void
.end method

.method public setContentID(Ljava/lang/String;)V
    .registers 3
    .param p1, "cid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 380
    if-nez p1, :cond_8

    .line 381
    const-string v0, "Content-ID"

    invoke-virtual {p0, v0}, Lkorex/mail/internet/MimeBodyPart;->removeHeader(Ljava/lang/String;)V

    .line 384
    :goto_7
    return-void

    .line 383
    :cond_8
    const-string v0, "Content-ID"

    invoke-virtual {p0, v0, p1}, Lkorex/mail/internet/MimeBodyPart;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7
.end method

.method public setContentLanguage([Ljava/lang/String;)V
    .registers 2
    .param p1, "languages"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 431
    invoke-static {p0, p1}, Lkorex/mail/internet/MimeBodyPart;->setContentLanguage(Lkorex/mail/internet/MimePart;[Ljava/lang/String;)V

    .line 432
    return-void
.end method

.method public setContentMD5(Ljava/lang/String;)V
    .registers 3
    .param p1, "md5"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 407
    const-string v0, "Content-MD5"

    invoke-virtual {p0, v0, p1}, Lkorex/mail/internet/MimeBodyPart;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 408
    return-void
.end method

.method public setDataHandler(Lkorex/activation/DataHandler;)V
    .registers 3
    .param p1, "dh"    # Lkorex/activation/DataHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 695
    iput-object p1, p0, Lkorex/mail/internet/MimeBodyPart;->dh:Lkorex/activation/DataHandler;

    .line 696
    const/4 v0, 0x0

    iput-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->cachedContent:Ljava/lang/Object;

    .line 697
    invoke-static {p0}, Lkorex/mail/internet/MimeBodyPart;->invalidateContentHeaders(Lkorex/mail/internet/MimePart;)V

    .line 698
    return-void
.end method

.method public setDescription(Ljava/lang/String;)V
    .registers 3
    .param p1, "description"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 479
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lkorex/mail/internet/MimeBodyPart;->setDescription(Ljava/lang/String;Ljava/lang/String;)V

    .line 480
    return-void
.end method

.method public setDescription(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 510
    invoke-static {p0, p1, p2}, Lkorex/mail/internet/MimeBodyPart;->setDescription(Lkorex/mail/internet/MimePart;Ljava/lang/String;Ljava/lang/String;)V

    .line 511
    return-void
.end method

.method public setDisposition(Ljava/lang/String;)V
    .registers 2
    .param p1, "disposition"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 336
    invoke-static {p0, p1}, Lkorex/mail/internet/MimeBodyPart;->setDisposition(Lkorex/mail/internet/MimePart;Ljava/lang/String;)V

    .line 337
    return-void
.end method

.method public setFileName(Ljava/lang/String;)V
    .registers 2
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 560
    invoke-static {p0, p1}, Lkorex/mail/internet/MimeBodyPart;->setFileName(Lkorex/mail/internet/MimePart;Ljava/lang/String;)V

    .line 561
    return-void
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1013
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1, p2}, Lkorex/mail/internet/InternetHeaders;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 1014
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 747
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lkorex/mail/internet/MimeBodyPart;->setText(Ljava/lang/String;Ljava/lang/String;)V

    .line 748
    return-void
.end method

.method public setText(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 763
    const-string v0, "plain"

    invoke-static {p0, p1, p2, v0}, Lkorex/mail/internet/MimeBodyPart;->setText(Lkorex/mail/internet/MimePart;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 764
    return-void
.end method

.method public setText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/lang/String;
    .param p3, "subtype"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 781
    invoke-static {p0, p1, p2, p3}, Lkorex/mail/internet/MimeBodyPart;->setText(Lkorex/mail/internet/MimePart;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 782
    return-void
.end method

.method protected updateHeaders()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 1131
    invoke-static {p0}, Lkorex/mail/internet/MimeBodyPart;->updateHeaders(Lkorex/mail/internet/MimePart;)V

    .line 1138
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->cachedContent:Ljava/lang/Object;

    if-eqz v0, :cond_24

    .line 1139
    new-instance v0, Lkorex/activation/DataHandler;

    iget-object v1, p0, Lkorex/mail/internet/MimeBodyPart;->cachedContent:Ljava/lang/Object;

    invoke-virtual {p0}, Lkorex/mail/internet/MimeBodyPart;->getContentType()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lkorex/activation/DataHandler;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->dh:Lkorex/activation/DataHandler;

    .line 1140
    iput-object v3, p0, Lkorex/mail/internet/MimeBodyPart;->cachedContent:Ljava/lang/Object;

    .line 1141
    iput-object v3, p0, Lkorex/mail/internet/MimeBodyPart;->content:[B

    .line 1142
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->contentStream:Ljava/io/InputStream;

    if-eqz v0, :cond_22

    .line 1144
    :try_start_1d
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart;->contentStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_22
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_22} :catch_25

    .line 1147
    :cond_22
    :goto_22
    iput-object v3, p0, Lkorex/mail/internet/MimeBodyPart;->contentStream:Ljava/io/InputStream;

    .line 1149
    :cond_24
    return-void

    .line 1145
    :catch_25
    move-exception v0

    goto :goto_22
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 967
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lkorex/mail/internet/MimeBodyPart;->writeTo(Lkorex/mail/internet/MimePart;Ljava/io/OutputStream;[Ljava/lang/String;)V

    .line 968
    return-void
.end method
