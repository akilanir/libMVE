.class public Lkorex/mail/internet/MimeUtility;
.super Ljava/lang/Object;
.source "MimeUtility.java"


# static fields
.field public static final ALL:I = -0x1

.field static final ALL_ASCII:I = 0x1

.field static final MOSTLY_ASCII:I = 0x2

.field static final MOSTLY_NONASCII:I = 0x3

.field private static final decodeStrict:Z

.field private static defaultJavaCharset:Ljava/lang/String;

.field private static defaultMIMECharset:Ljava/lang/String;

.field private static final encodeEolStrict:Z

.field private static final foldEncodedWords:Z

.field private static final foldText:Z

.field private static final ignoreUnknownEncoding:Z

.field private static java2mime:Ljava/util/Hashtable;

.field private static mime2java:Ljava/util/Hashtable;

.field private static final nonAsciiCharsetMap:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 174
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    sput-object v3, Lkorex/mail/internet/MimeUtility;->nonAsciiCharsetMap:Ljava/util/Map;

    .line 176
    const-string v3, "mail.mime.decodetext.strict"

    .line 177
    invoke-static {v3, v5}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v3

    sput-boolean v3, Lkorex/mail/internet/MimeUtility;->decodeStrict:Z

    .line 178
    const-string v3, "mail.mime.encodeeol.strict"

    .line 179
    invoke-static {v3, v4}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v3

    sput-boolean v3, Lkorex/mail/internet/MimeUtility;->encodeEolStrict:Z

    .line 180
    const-string v3, "mail.mime.ignoreunknownencoding"

    .line 181
    invoke-static {v3, v4}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v3

    sput-boolean v3, Lkorex/mail/internet/MimeUtility;->ignoreUnknownEncoding:Z

    .line 189
    const-string v3, "mail.mime.foldencodedwords"

    .line 190
    invoke-static {v3, v4}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v3

    sput-boolean v3, Lkorex/mail/internet/MimeUtility;->foldEncodedWords:Z

    .line 191
    const-string v3, "mail.mime.foldtext"

    .line 192
    invoke-static {v3, v5}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v3

    sput-boolean v3, Lkorex/mail/internet/MimeUtility;->foldText:Z

    .line 1320
    new-instance v3, Ljava/util/Hashtable;

    const/16 v4, 0x28

    invoke-direct {v3, v4}, Ljava/util/Hashtable;-><init>(I)V

    sput-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    .line 1321
    new-instance v3, Ljava/util/Hashtable;

    const/16 v4, 0xa

    invoke-direct {v3, v4}, Ljava/util/Hashtable;-><init>(I)V

    sput-object v3, Lkorex/mail/internet/MimeUtility;->mime2java:Ljava/util/Hashtable;

    .line 1326
    :try_start_43
    const-class v3, Lkorex/mail/internet/MimeUtility;

    const-string v4, "/META-INF/javamail.charset.map"

    .line 1327
    invoke-virtual {v3, v4}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_43 .. :try_end_4a} :catch_217

    move-result-object v1

    .line 1330
    .local v1, "is":Ljava/io/InputStream;
    if-eqz v1, :cond_68

    .line 1332
    :try_start_4d
    new-instance v2, Lcom/sun/mail/util/LineInputStream;

    invoke-direct {v2, v1}, Lcom/sun/mail/util/LineInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_52
    .catchall {:try_start_4d .. :try_end_52} :catchall_212

    .line 1335
    .end local v1    # "is":Ljava/io/InputStream;
    .local v2, "is":Ljava/io/InputStream;
    :try_start_52
    move-object v0, v2

    check-cast v0, Lcom/sun/mail/util/LineInputStream;

    move-object v3, v0

    sget-object v4, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    invoke-static {v3, v4}, Lkorex/mail/internet/MimeUtility;->loadMappings(Lcom/sun/mail/util/LineInputStream;Ljava/util/Hashtable;)V

    .line 1338
    move-object v0, v2

    check-cast v0, Lcom/sun/mail/util/LineInputStream;

    move-object v3, v0

    sget-object v4, Lkorex/mail/internet/MimeUtility;->mime2java:Ljava/util/Hashtable;

    invoke-static {v3, v4}, Lkorex/mail/internet/MimeUtility;->loadMappings(Lcom/sun/mail/util/LineInputStream;Ljava/util/Hashtable;)V
    :try_end_64
    .catchall {:try_start_52 .. :try_end_64} :catchall_21c

    .line 1341
    :try_start_64
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_67
    .catch Ljava/lang/Exception; {:try_start_64 .. :try_end_67} :catch_20e

    move-object v1, v2

    .line 1352
    .end local v2    # "is":Ljava/io/InputStream;
    .restart local v1    # "is":Ljava/io/InputStream;
    :cond_68
    :goto_68
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1ab

    .line 1353
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "8859_1"

    const-string v5, "ISO-8859-1"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1354
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "iso8859_1"

    const-string v5, "ISO-8859-1"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1355
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "iso8859-1"

    const-string v5, "ISO-8859-1"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1357
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "8859_2"

    const-string v5, "ISO-8859-2"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1358
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "iso8859_2"

    const-string v5, "ISO-8859-2"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1359
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "iso8859-2"

    const-string v5, "ISO-8859-2"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1361
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "8859_3"

    const-string v5, "ISO-8859-3"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1362
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "iso8859_3"

    const-string v5, "ISO-8859-3"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1363
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "iso8859-3"

    const-string v5, "ISO-8859-3"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1365
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "8859_4"

    const-string v5, "ISO-8859-4"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1366
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "iso8859_4"

    const-string v5, "ISO-8859-4"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1367
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "iso8859-4"

    const-string v5, "ISO-8859-4"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1369
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "8859_5"

    const-string v5, "ISO-8859-5"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1370
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "iso8859_5"

    const-string v5, "ISO-8859-5"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1371
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "iso8859-5"

    const-string v5, "ISO-8859-5"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1373
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "8859_6"

    const-string v5, "ISO-8859-6"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1374
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "iso8859_6"

    const-string v5, "ISO-8859-6"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1375
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "iso8859-6"

    const-string v5, "ISO-8859-6"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1377
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "8859_7"

    const-string v5, "ISO-8859-7"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1378
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "iso8859_7"

    const-string v5, "ISO-8859-7"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1379
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "iso8859-7"

    const-string v5, "ISO-8859-7"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1381
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "8859_8"

    const-string v5, "ISO-8859-8"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1382
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "iso8859_8"

    const-string v5, "ISO-8859-8"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1383
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "iso8859-8"

    const-string v5, "ISO-8859-8"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1385
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "8859_9"

    const-string v5, "ISO-8859-9"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1386
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "iso8859_9"

    const-string v5, "ISO-8859-9"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1387
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "iso8859-9"

    const-string v5, "ISO-8859-9"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1389
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "sjis"

    const-string v5, "Shift_JIS"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1390
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "jis"

    const-string v5, "ISO-2022-JP"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1391
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "iso2022jp"

    const-string v5, "ISO-2022-JP"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1392
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "euc_jp"

    const-string v5, "euc-jp"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1393
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "koi8_r"

    const-string v5, "koi8-r"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1394
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "euc_cn"

    const-string v5, "euc-cn"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1395
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "euc_tw"

    const-string v5, "euc-tw"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1396
    sget-object v3, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    const-string v4, "euc_kr"

    const-string v5, "euc-kr"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1398
    :cond_1ab
    sget-object v3, Lkorex/mail/internet/MimeUtility;->mime2java:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_20d

    .line 1399
    sget-object v3, Lkorex/mail/internet/MimeUtility;->mime2java:Ljava/util/Hashtable;

    const-string v4, "iso-2022-cn"

    const-string v5, "ISO2022CN"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1400
    sget-object v3, Lkorex/mail/internet/MimeUtility;->mime2java:Ljava/util/Hashtable;

    const-string v4, "iso-2022-kr"

    const-string v5, "ISO2022KR"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1401
    sget-object v3, Lkorex/mail/internet/MimeUtility;->mime2java:Ljava/util/Hashtable;

    const-string v4, "utf-8"

    const-string v5, "UTF8"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1402
    sget-object v3, Lkorex/mail/internet/MimeUtility;->mime2java:Ljava/util/Hashtable;

    const-string v4, "utf8"

    const-string v5, "UTF8"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1403
    sget-object v3, Lkorex/mail/internet/MimeUtility;->mime2java:Ljava/util/Hashtable;

    const-string v4, "ja_jp.iso2022-7"

    const-string v5, "ISO2022JP"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1404
    sget-object v3, Lkorex/mail/internet/MimeUtility;->mime2java:Ljava/util/Hashtable;

    const-string v4, "ja_jp.eucjp"

    const-string v5, "EUCJIS"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1405
    sget-object v3, Lkorex/mail/internet/MimeUtility;->mime2java:Ljava/util/Hashtable;

    const-string v4, "euc-kr"

    const-string v5, "KSC5601"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1406
    sget-object v3, Lkorex/mail/internet/MimeUtility;->mime2java:Ljava/util/Hashtable;

    const-string v4, "euckr"

    const-string v5, "KSC5601"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1407
    sget-object v3, Lkorex/mail/internet/MimeUtility;->mime2java:Ljava/util/Hashtable;

    const-string v4, "us-ascii"

    const-string v5, "ISO-8859-1"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1408
    sget-object v3, Lkorex/mail/internet/MimeUtility;->mime2java:Ljava/util/Hashtable;

    const-string v4, "x-us-ascii"

    const-string v5, "ISO-8859-1"

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1410
    :cond_20d
    return-void

    .line 1342
    .end local v1    # "is":Ljava/io/InputStream;
    .restart local v2    # "is":Ljava/io/InputStream;
    :catch_20e
    move-exception v3

    move-object v1, v2

    .line 1345
    .end local v2    # "is":Ljava/io/InputStream;
    .restart local v1    # "is":Ljava/io/InputStream;
    goto/16 :goto_68

    .line 1340
    :catchall_212
    move-exception v3

    .line 1341
    :goto_213
    :try_start_213
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_216
    .catch Ljava/lang/Exception; {:try_start_213 .. :try_end_216} :catch_21a

    .line 1344
    :goto_216
    :try_start_216
    throw v3
    :try_end_217
    .catch Ljava/lang/Exception; {:try_start_216 .. :try_end_217} :catch_217

    .line 1347
    :catch_217
    move-exception v3

    goto/16 :goto_68

    .line 1342
    :catch_21a
    move-exception v4

    goto :goto_216

    .line 1340
    .end local v1    # "is":Ljava/io/InputStream;
    .restart local v2    # "is":Ljava/io/InputStream;
    :catchall_21c
    move-exception v3

    move-object v1, v2

    .end local v2    # "is":Ljava/io/InputStream;
    .restart local v1    # "is":Ljava/io/InputStream;
    goto :goto_213
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 168
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static checkAscii(Ljava/io/InputStream;IZ)I
    .registers 17
    .param p0, "is"    # Ljava/io/InputStream;
    .param p1, "max"    # I
    .param p2, "breakOnNonAscii"    # Z

    .prologue
    .line 1527
    const/4 v0, 0x0

    .local v0, "ascii":I
    const/4 v12, 0x0

    .line 1529
    .local v12, "non_ascii":I
    const/16 v3, 0x1000

    .line 1530
    .local v3, "block":I
    const/4 v10, 0x0

    .line 1531
    .local v10, "linelen":I
    const/4 v11, 0x0

    .local v11, "longLine":Z
    const/4 v2, 0x0

    .line 1532
    .local v2, "badEOL":Z
    sget-boolean v13, Lkorex/mail/internet/MimeUtility;->encodeEolStrict:Z

    if-eqz v13, :cond_28

    if-eqz p2, :cond_28

    const/4 v5, 0x1

    .line 1533
    .local v5, "checkEOL":Z
    :goto_e
    const/4 v4, 0x0

    .line 1534
    .local v4, "buf":[B
    if-eqz p1, :cond_18

    .line 1535
    const/4 v13, -0x1

    if-ne p1, v13, :cond_2a

    const/16 v3, 0x1000

    .line 1536
    :goto_16
    new-array v4, v3, [B

    .line 1538
    :cond_18
    :goto_18
    if-eqz p1, :cond_22

    .line 1540
    const/4 v13, 0x0

    :try_start_1b
    invoke-virtual {p0, v4, v13, v3}, Ljava/io/InputStream;->read([BII)I
    :try_end_1e
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_1e} :catch_70

    move-result v9

    .local v9, "len":I
    const/4 v13, -0x1

    if-ne v9, v13, :cond_31

    .line 1576
    .end local v9    # "len":I
    :cond_22
    :goto_22
    if-nez p1, :cond_77

    if-eqz p2, :cond_77

    .line 1583
    const/4 v13, 0x3

    .line 1600
    :goto_27
    return v13

    .line 1532
    .end local v4    # "buf":[B
    .end local v5    # "checkEOL":Z
    :cond_28
    const/4 v5, 0x0

    goto :goto_e

    .line 1535
    .restart local v4    # "buf":[B
    .restart local v5    # "checkEOL":Z
    :cond_2a
    const/16 v13, 0x1000

    invoke-static {p1, v13}, Ljava/lang/Math;->min(II)I

    move-result v3

    goto :goto_16

    .line 1542
    .restart local v9    # "len":I
    :cond_31
    const/4 v8, 0x0

    .line 1543
    .local v8, "lastb":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_33
    if-ge v6, v9, :cond_72

    .line 1548
    :try_start_35
    aget-byte v13, v4, v6

    and-int/lit16 v1, v13, 0xff

    .line 1549
    .local v1, "b":I
    if-eqz v5, :cond_4c

    const/16 v13, 0xd

    if-ne v8, v13, :cond_43

    const/16 v13, 0xa

    if-ne v1, v13, :cond_4b

    :cond_43
    const/16 v13, 0xd

    if-eq v8, v13, :cond_4c

    const/16 v13, 0xa

    if-ne v1, v13, :cond_4c

    .line 1552
    :cond_4b
    const/4 v2, 0x1

    .line 1553
    :cond_4c
    const/16 v13, 0xd

    if-eq v1, v13, :cond_54

    const/16 v13, 0xa

    if-ne v1, v13, :cond_5f

    .line 1554
    :cond_54
    const/4 v10, 0x0

    .line 1560
    :cond_55
    :goto_55
    invoke-static {v1}, Lkorex/mail/internet/MimeUtility;->nonascii(I)Z
    :try_end_58
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_58} :catch_70

    move-result v13

    if-eqz v13, :cond_6d

    .line 1561
    if-eqz p2, :cond_67

    .line 1562
    const/4 v13, 0x3

    goto :goto_27

    .line 1556
    :cond_5f
    add-int/lit8 v10, v10, 0x1

    .line 1557
    const/16 v13, 0x3e6

    if-le v10, v13, :cond_55

    .line 1558
    const/4 v11, 0x1

    goto :goto_55

    .line 1564
    :cond_67
    add-int/lit8 v12, v12, 0x1

    .line 1567
    :goto_69
    move v8, v1

    .line 1543
    add-int/lit8 v6, v6, 0x1

    goto :goto_33

    .line 1566
    :cond_6d
    add-int/lit8 v0, v0, 0x1

    goto :goto_69

    .line 1569
    .end local v1    # "b":I
    .end local v6    # "i":I
    .end local v8    # "lastb":I
    .end local v9    # "len":I
    :catch_70
    move-exception v7

    .line 1570
    .local v7, "ioex":Ljava/io/IOException;
    goto :goto_22

    .line 1572
    .end local v7    # "ioex":Ljava/io/IOException;
    .restart local v6    # "i":I
    .restart local v8    # "lastb":I
    .restart local v9    # "len":I
    :cond_72
    const/4 v13, -0x1

    if-eq p1, v13, :cond_18

    .line 1573
    sub-int/2addr p1, v9

    goto :goto_18

    .line 1585
    .end local v6    # "i":I
    .end local v8    # "lastb":I
    .end local v9    # "len":I
    :cond_77
    if-nez v12, :cond_83

    .line 1590
    if-eqz v2, :cond_7d

    .line 1591
    const/4 v13, 0x3

    goto :goto_27

    .line 1593
    :cond_7d
    if-eqz v11, :cond_81

    .line 1594
    const/4 v13, 0x2

    goto :goto_27

    .line 1596
    :cond_81
    const/4 v13, 0x1

    goto :goto_27

    .line 1598
    :cond_83
    if-le v0, v12, :cond_87

    .line 1599
    const/4 v13, 0x2

    goto :goto_27

    .line 1600
    :cond_87
    const/4 v13, 0x3

    goto :goto_27
.end method

.method static checkAscii(Ljava/lang/String;)I
    .registers 6
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 1456
    const/4 v0, 0x0

    .local v0, "ascii":I
    const/4 v3, 0x0

    .line 1457
    .local v3, "non_ascii":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 1459
    .local v2, "l":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    if-ge v1, v2, :cond_1b

    .line 1460
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lkorex/mail/internet/MimeUtility;->nonascii(I)Z

    move-result v4

    if-eqz v4, :cond_18

    .line 1461
    add-int/lit8 v3, v3, 0x1

    .line 1459
    :goto_15
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 1463
    :cond_18
    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    .line 1466
    :cond_1b
    if-nez v3, :cond_1f

    .line 1467
    const/4 v4, 0x1

    .line 1471
    :goto_1e
    return v4

    .line 1468
    :cond_1f
    if-le v0, v3, :cond_23

    .line 1469
    const/4 v4, 0x2

    goto :goto_1e

    .line 1471
    :cond_23
    const/4 v4, 0x3

    goto :goto_1e
.end method

.method static checkAscii([B)I
    .registers 5
    .param p0, "b"    # [B

    .prologue
    .line 1485
    const/4 v0, 0x0

    .local v0, "ascii":I
    const/4 v2, 0x0

    .line 1487
    .local v2, "non_ascii":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3
    array-length v3, p0

    if-ge v1, v3, :cond_18

    .line 1491
    aget-byte v3, p0, v1

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Lkorex/mail/internet/MimeUtility;->nonascii(I)Z

    move-result v3

    if-eqz v3, :cond_15

    .line 1492
    add-int/lit8 v2, v2, 0x1

    .line 1487
    :goto_12
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 1494
    :cond_15
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 1497
    :cond_18
    if-nez v2, :cond_1c

    .line 1498
    const/4 v3, 0x1

    .line 1502
    :goto_1b
    return v3

    .line 1499
    :cond_1c
    if-le v0, v2, :cond_20

    .line 1500
    const/4 v3, 0x2

    goto :goto_1b

    .line 1502
    :cond_20
    const/4 v3, 0x3

    goto :goto_1b
.end method

.method public static decode(Ljava/io/InputStream;Ljava/lang/String;)Ljava/io/InputStream;
    .registers 5
    .param p0, "is"    # Ljava/io/InputStream;
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 397
    const-string v0, "base64"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 398
    new-instance v0, Lcom/sun/mail/util/BASE64DecoderStream;

    invoke-direct {v0, p0}, Lcom/sun/mail/util/BASE64DecoderStream;-><init>(Ljava/io/InputStream;)V

    move-object p0, v0

    .line 412
    .end local p0    # "is":Ljava/io/InputStream;
    :cond_e
    :goto_e
    return-object p0

    .line 399
    .restart local p0    # "is":Ljava/io/InputStream;
    :cond_f
    const-string v0, "quoted-printable"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 400
    new-instance v0, Lcom/sun/mail/util/QPDecoderStream;

    invoke-direct {v0, p0}, Lcom/sun/mail/util/QPDecoderStream;-><init>(Ljava/io/InputStream;)V

    move-object p0, v0

    goto :goto_e

    .line 401
    :cond_1e
    const-string v0, "uuencode"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_36

    const-string v0, "x-uuencode"

    .line 402
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_36

    const-string v0, "x-uue"

    .line 403
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3d

    .line 404
    :cond_36
    new-instance v0, Lcom/sun/mail/util/UUDecoderStream;

    invoke-direct {v0, p0}, Lcom/sun/mail/util/UUDecoderStream;-><init>(Ljava/io/InputStream;)V

    move-object p0, v0

    goto :goto_e

    .line 405
    :cond_3d
    const-string v0, "binary"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e

    const-string v0, "7bit"

    .line 406
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e

    const-string v0, "8bit"

    .line 407
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 410
    sget-boolean v0, Lkorex/mail/internet/MimeUtility;->ignoreUnknownEncoding:Z

    if-nez v0, :cond_e

    .line 411
    new-instance v0, Lkorex/mail/MessagingException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown encoding: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static decodeInnerWords(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p0, "word"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x3f

    .line 970
    const/4 v4, 0x0

    .line 971
    .local v4, "start":I
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 972
    .local v0, "buf":Ljava/lang/StringBuffer;
    :goto_8
    const-string v5, "=?"

    invoke-virtual {p0, v5, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    .local v2, "i":I
    if-ltz v2, :cond_1f

    .line 973
    invoke-virtual {p0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 975
    add-int/lit8 v5, v2, 0x2

    invoke-virtual {p0, v7, v5}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 976
    .local v1, "end":I
    if-gez v1, :cond_22

    .line 995
    .end local v1    # "end":I
    :cond_1f
    if-nez v4, :cond_44

    .line 999
    .end local p0    # "word":Ljava/lang/String;
    :goto_21
    return-object p0

    .line 979
    .restart local v1    # "end":I
    .restart local p0    # "word":Ljava/lang/String;
    :cond_22
    add-int/lit8 v5, v1, 0x1

    invoke-virtual {p0, v7, v5}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 980
    if-ltz v1, :cond_1f

    .line 983
    const-string v5, "?="

    add-int/lit8 v6, v1, 0x1

    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 984
    if-ltz v1, :cond_1f

    .line 986
    add-int/lit8 v5, v1, 0x2

    invoke-virtual {p0, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 988
    .local v3, "s":Ljava/lang/String;
    :try_start_3a
    invoke-static {v3}, Lkorex/mail/internet/MimeUtility;->decodeWord(Ljava/lang/String;)Ljava/lang/String;
    :try_end_3d
    .catch Lkorex/mail/internet/ParseException; {:try_start_3a .. :try_end_3d} :catch_56

    move-result-object v3

    .line 992
    :goto_3e
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 993
    add-int/lit8 v4, v1, 0x2

    .line 994
    goto :goto_8

    .line 997
    .end local v1    # "end":I
    .end local v3    # "s":Ljava/lang/String;
    :cond_44
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_51

    .line 998
    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 999
    :cond_51
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_21

    .line 989
    .restart local v1    # "end":I
    .restart local v3    # "s":Ljava/lang/String;
    :catch_56
    move-exception v5

    goto :goto_3e
.end method

.method public static decodeText(Ljava/lang/String;)Ljava/lang/String;
    .registers 14
    .param p0, "etext"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    .line 600
    const-string v2, " \t\n\r"

    .line 612
    .local v2, "lwsp":Ljava/lang/String;
    const-string v10, "=?"

    invoke-virtual {p0, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v10

    const/4 v11, -0x1

    if-ne v10, v11, :cond_d

    .line 680
    .end local p0    # "etext":Ljava/lang/String;
    :goto_c
    return-object p0

    .line 617
    .restart local p0    # "etext":Ljava/lang/String;
    :cond_d
    new-instance v7, Ljava/util/StringTokenizer;

    const/4 v10, 0x1

    invoke-direct {v7, p0, v2, v10}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 618
    .local v7, "st":Ljava/util/StringTokenizer;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    .line 619
    .local v6, "sb":Ljava/lang/StringBuffer;
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    .line 620
    .local v9, "wsb":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    .line 622
    .local v4, "prevWasEncoded":Z
    :goto_1e
    invoke-virtual {v7}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v10

    if-eqz v10, :cond_95

    .line 624
    invoke-virtual {v7}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v5

    .line 626
    .local v5, "s":Ljava/lang/String;
    invoke-virtual {v5, v12}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .local v0, "c":C
    const/16 v10, 0x20

    if-eq v0, v10, :cond_3c

    const/16 v10, 0x9

    if-eq v0, v10, :cond_3c

    const/16 v10, 0xd

    if-eq v0, v10, :cond_3c

    const/16 v10, 0xa

    if-ne v0, v10, :cond_40

    .line 628
    :cond_3c
    invoke-virtual {v9, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1e

    .line 633
    :cond_40
    :try_start_40
    invoke-static {v5}, Lkorex/mail/internet/MimeUtility;->decodeWord(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 635
    .local v8, "word":Ljava/lang/String;
    if-nez v4, :cond_4f

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->length()I

    move-result v10

    if-lez v10, :cond_4f

    .line 639
    invoke-virtual {v6, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;
    :try_end_4f
    .catch Lkorex/mail/internet/ParseException; {:try_start_40 .. :try_end_4f} :catch_57

    .line 641
    :cond_4f
    const/4 v4, 0x1

    .line 675
    :goto_50
    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 676
    invoke-virtual {v9, v12}, Ljava/lang/StringBuffer;->setLength(I)V

    goto :goto_1e

    .line 642
    .end local v8    # "word":Ljava/lang/String;
    :catch_57
    move-exception v3

    .line 644
    .local v3, "pex":Lkorex/mail/internet/ParseException;
    move-object v8, v5

    .line 646
    .restart local v8    # "word":Ljava/lang/String;
    sget-boolean v10, Lkorex/mail/internet/MimeUtility;->decodeStrict:Z

    if-nez v10, :cond_8a

    .line 647
    invoke-static {v8}, Lkorex/mail/internet/MimeUtility;->decodeInnerWords(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 648
    .local v1, "dword":Ljava/lang/String;
    if-eq v1, v8, :cond_7f

    .line 651
    if-eqz v4, :cond_75

    const-string v10, "=?"

    invoke-virtual {v8, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_75

    .line 660
    :cond_6d
    :goto_6d
    const-string v10, "?="

    invoke-virtual {v8, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    .line 661
    move-object v8, v1

    goto :goto_50

    .line 656
    :cond_75
    invoke-virtual {v9}, Ljava/lang/StringBuffer;->length()I

    move-result v10

    if-lez v10, :cond_6d

    .line 657
    invoke-virtual {v6, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    goto :goto_6d

    .line 664
    :cond_7f
    invoke-virtual {v9}, Ljava/lang/StringBuffer;->length()I

    move-result v10

    if-lez v10, :cond_88

    .line 665
    invoke-virtual {v6, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    .line 666
    :cond_88
    const/4 v4, 0x0

    goto :goto_50

    .line 670
    .end local v1    # "dword":Ljava/lang/String;
    :cond_8a
    invoke-virtual {v9}, Ljava/lang/StringBuffer;->length()I

    move-result v10

    if-lez v10, :cond_93

    .line 671
    invoke-virtual {v6, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    .line 672
    :cond_93
    const/4 v4, 0x0

    goto :goto_50

    .line 679
    .end local v0    # "c":C
    .end local v3    # "pex":Lkorex/mail/internet/ParseException;
    .end local v5    # "s":Ljava/lang/String;
    .end local v8    # "word":Ljava/lang/String;
    :cond_95
    invoke-virtual {v6, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    .line 680
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_c
.end method

.method public static decodeWord(Ljava/lang/String;)Ljava/lang/String;
    .registers 21
    .param p0, "eword"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/ParseException;,
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 865
    const-string v17, "=?"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v17

    if-nez v17, :cond_29

    .line 866
    new-instance v17, Lkorex/mail/internet/ParseException;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "encoded word does not start with \"=?\": "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 870
    :cond_29
    const/4 v14, 0x2

    .line 871
    .local v14, "start":I
    const/16 v17, 0x3f

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1, v14}, Ljava/lang/String;->indexOf(II)I

    move-result v12

    .local v12, "pos":I
    const/16 v17, -0x1

    move/from16 v0, v17

    if-ne v12, v0, :cond_57

    .line 872
    new-instance v17, Lkorex/mail/internet/ParseException;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "encoded word does not include charset: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 874
    :cond_57
    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 875
    .local v4, "charset":Ljava/lang/String;
    const/16 v17, 0x2a

    move/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v11

    .line 876
    .local v11, "lpos":I
    if-ltz v11, :cond_6f

    .line 877
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v4, v0, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 878
    :cond_6f
    invoke-static {v4}, Lkorex/mail/internet/MimeUtility;->javaCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 881
    add-int/lit8 v14, v12, 0x1

    .line 882
    const/16 v17, 0x3f

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1, v14}, Ljava/lang/String;->indexOf(II)I

    move-result v12

    const/16 v17, -0x1

    move/from16 v0, v17

    if-ne v12, v0, :cond_a2

    .line 883
    new-instance v17, Lkorex/mail/internet/ParseException;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "encoded word does not include encoding: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 885
    :cond_a2
    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 888
    .local v7, "encoding":Ljava/lang/String;
    add-int/lit8 v14, v12, 0x1

    .line 889
    const-string v17, "?="

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v14}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v12

    const/16 v17, -0x1

    move/from16 v0, v17

    if-ne v12, v0, :cond_d7

    .line 890
    new-instance v17, Lkorex/mail/internet/ParseException;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "encoded word does not end with \"?=\": "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 899
    :cond_d7
    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v16

    .line 903
    .local v16, "word":Ljava/lang/String;
    :try_start_dd
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v17

    if-lez v17, :cond_185

    .line 905
    new-instance v2, Ljava/io/ByteArrayInputStream;

    .line 906
    invoke-static/range {v16 .. v16}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v17

    move-object/from16 v0, v17

    invoke-direct {v2, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 910
    .local v2, "bis":Ljava/io/ByteArrayInputStream;
    const-string v17, "B"

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_143

    .line 911
    new-instance v10, Lcom/sun/mail/util/BASE64DecoderStream;

    invoke-direct {v10, v2}, Lcom/sun/mail/util/BASE64DecoderStream;-><init>(Ljava/io/InputStream;)V

    .line 923
    .local v10, "is":Ljava/io/InputStream;
    :goto_fd
    invoke-virtual {v2}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v5

    .line 924
    .local v5, "count":I
    new-array v3, v5, [B

    .line 926
    .local v3, "bytes":[B
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v10, v3, v0, v5}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    .line 930
    if-gtz v5, :cond_170

    const-string v6, ""

    .line 936
    .end local v2    # "bis":Ljava/io/ByteArrayInputStream;
    .end local v3    # "bytes":[B
    .end local v5    # "count":I
    .end local v10    # "is":Ljava/io/InputStream;
    .local v6, "decodedWord":Ljava/lang/String;
    :goto_10f
    add-int/lit8 v17, v12, 0x2

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v18

    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_142

    .line 938
    add-int/lit8 v17, v12, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v13

    .line 939
    .local v13, "rest":Ljava/lang/String;
    sget-boolean v17, Lkorex/mail/internet/MimeUtility;->decodeStrict:Z

    if-nez v17, :cond_12d

    .line 940
    invoke-static {v13}, Lkorex/mail/internet/MimeUtility;->decodeInnerWords(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 941
    :cond_12d
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 943
    .end local v13    # "rest":Ljava/lang/String;
    :cond_142
    return-object v6

    .line 912
    .end local v6    # "decodedWord":Ljava/lang/String;
    .restart local v2    # "bis":Ljava/io/ByteArrayInputStream;
    :cond_143
    const-string v17, "Q"

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_153

    .line 913
    new-instance v10, Lcom/sun/mail/util/QDecoderStream;

    invoke-direct {v10, v2}, Lcom/sun/mail/util/QDecoderStream;-><init>(Ljava/io/InputStream;)V

    .restart local v10    # "is":Ljava/io/InputStream;
    goto :goto_fd

    .line 915
    .end local v10    # "is":Ljava/io/InputStream;
    :cond_153
    new-instance v17, Ljava/io/UnsupportedEncodingException;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "unknown encoding: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/io/UnsupportedEncodingException;-><init>(Ljava/lang/String;)V

    throw v17
    :try_end_16e
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_dd .. :try_end_16e} :catch_16e
    .catch Ljava/io/IOException; {:try_start_dd .. :try_end_16e} :catch_17a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_dd .. :try_end_16e} :catch_188

    .line 944
    .end local v2    # "bis":Ljava/io/ByteArrayInputStream;
    :catch_16e
    move-exception v15

    .line 947
    .local v15, "uex":Ljava/io/UnsupportedEncodingException;
    throw v15

    .line 930
    .end local v15    # "uex":Ljava/io/UnsupportedEncodingException;
    .restart local v2    # "bis":Ljava/io/ByteArrayInputStream;
    .restart local v3    # "bytes":[B
    .restart local v5    # "count":I
    .restart local v10    # "is":Ljava/io/InputStream;
    :cond_170
    :try_start_170
    new-instance v6, Ljava/lang/String;

    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-direct {v6, v3, v0, v5, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_179
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_170 .. :try_end_179} :catch_16e
    .catch Ljava/io/IOException; {:try_start_170 .. :try_end_179} :catch_17a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_170 .. :try_end_179} :catch_188

    goto :goto_10f

    .line 948
    .end local v2    # "bis":Ljava/io/ByteArrayInputStream;
    .end local v3    # "bytes":[B
    .end local v5    # "count":I
    .end local v10    # "is":Ljava/io/InputStream;
    :catch_17a
    move-exception v9

    .line 950
    .local v9, "ioex":Ljava/io/IOException;
    new-instance v17, Lkorex/mail/internet/ParseException;

    invoke-virtual {v9}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 934
    .end local v9    # "ioex":Ljava/io/IOException;
    :cond_185
    :try_start_185
    const-string v6, ""
    :try_end_187
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_185 .. :try_end_187} :catch_16e
    .catch Ljava/io/IOException; {:try_start_185 .. :try_end_187} :catch_17a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_185 .. :try_end_187} :catch_188

    .restart local v6    # "decodedWord":Ljava/lang/String;
    goto :goto_10f

    .line 951
    .end local v6    # "decodedWord":Ljava/lang/String;
    :catch_188
    move-exception v8

    .line 959
    .local v8, "iex":Ljava/lang/IllegalArgumentException;
    new-instance v17, Ljava/io/UnsupportedEncodingException;

    move-object/from16 v0, v17

    invoke-direct {v0, v4}, Ljava/io/UnsupportedEncodingException;-><init>(Ljava/lang/String;)V

    throw v17
.end method

.method private static doEncode(Ljava/lang/String;ZLjava/lang/String;ILjava/lang/String;ZZLjava/lang/StringBuffer;)V
    .registers 27
    .param p0, "string"    # Ljava/lang/String;
    .param p1, "b64"    # Z
    .param p2, "jcharset"    # Ljava/lang/String;
    .param p3, "avail"    # I
    .param p4, "prefix"    # Ljava/lang/String;
    .param p5, "first"    # Z
    .param p6, "encodingWord"    # Z
    .param p7, "buf"    # Ljava/lang/StringBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 798
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v11

    .line 800
    .local v11, "bytes":[B
    if-eqz p1, :cond_64

    .line 801
    invoke-static {v11}, Lcom/sun/mail/util/BEncoderStream;->encodedLength([B)I

    move-result v15

    .line 806
    .local v15, "len":I
    :goto_e
    move/from16 v0, p3

    if-le v15, v0, :cond_6b

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v17

    .local v17, "size":I
    const/4 v3, 0x1

    move/from16 v0, v17

    if-le v0, v3, :cond_6b

    .line 810
    div-int/lit8 v18, v17, 0x2

    .line 811
    .local v18, "split":I
    add-int/lit8 v3, v18, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v3

    if-eqz v3, :cond_2d

    .line 812
    add-int/lit8 v18, v18, -0x1

    .line 813
    :cond_2d
    if-lez v18, :cond_49

    .line 814
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    move/from16 v4, p1

    move-object/from16 v5, p2

    move/from16 v6, p3

    move-object/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    move-object/from16 v10, p7

    invoke-static/range {v3 .. v10}, Lkorex/mail/internet/MimeUtility;->doEncode(Ljava/lang/String;ZLjava/lang/String;ILjava/lang/String;ZZLjava/lang/StringBuffer;)V

    .line 816
    :cond_49
    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    const/4 v8, 0x0

    move/from16 v4, p1

    move-object/from16 v5, p2

    move/from16 v6, p3

    move-object/from16 v7, p4

    move/from16 v9, p6

    move-object/from16 v10, p7

    invoke-static/range {v3 .. v10}, Lkorex/mail/internet/MimeUtility;->doEncode(Ljava/lang/String;ZLjava/lang/String;ILjava/lang/String;ZZLjava/lang/StringBuffer;)V

    .line 846
    .end local v17    # "size":I
    .end local v18    # "split":I
    :goto_63
    return-void

    .line 803
    .end local v15    # "len":I
    :cond_64
    move/from16 v0, p6

    invoke-static {v11, v0}, Lcom/sun/mail/util/QEncoderStream;->encodedLength([BZ)I

    move-result v15

    .restart local v15    # "len":I
    goto :goto_e

    .line 820
    :cond_6b
    new-instance v16, Ljava/io/ByteArrayOutputStream;

    invoke-direct/range {v16 .. v16}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 822
    .local v16, "os":Ljava/io/ByteArrayOutputStream;
    if-eqz p1, :cond_a6

    .line 823
    new-instance v13, Lcom/sun/mail/util/BEncoderStream;

    move-object/from16 v0, v16

    invoke-direct {v13, v0}, Lcom/sun/mail/util/BEncoderStream;-><init>(Ljava/io/OutputStream;)V

    .line 828
    .local v13, "eos":Ljava/io/OutputStream;
    :goto_79
    :try_start_79
    invoke-virtual {v13, v11}, Ljava/io/OutputStream;->write([B)V

    .line 829
    invoke-virtual {v13}, Ljava/io/OutputStream;->close()V
    :try_end_7f
    .catch Ljava/io/IOException; {:try_start_79 .. :try_end_7f} :catch_c0

    .line 832
    :goto_7f
    invoke-virtual/range {v16 .. v16}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v12

    .line 835
    .local v12, "encodedBytes":[B
    if-nez p5, :cond_90

    .line 836
    sget-boolean v3, Lkorex/mail/internet/MimeUtility;->foldEncodedWords:Z

    if-eqz v3, :cond_b0

    .line 837
    const-string v3, "\r\n "

    move-object/from16 v0, p7

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 841
    :cond_90
    :goto_90
    move-object/from16 v0, p7

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 842
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_98
    array-length v3, v12

    if-ge v14, v3, :cond_b8

    .line 843
    aget-byte v3, v12, v14

    int-to-char v3, v3

    move-object/from16 v0, p7

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 842
    add-int/lit8 v14, v14, 0x1

    goto :goto_98

    .line 825
    .end local v12    # "encodedBytes":[B
    .end local v13    # "eos":Ljava/io/OutputStream;
    .end local v14    # "i":I
    :cond_a6
    new-instance v13, Lcom/sun/mail/util/QEncoderStream;

    move-object/from16 v0, v16

    move/from16 v1, p6

    invoke-direct {v13, v0, v1}, Lcom/sun/mail/util/QEncoderStream;-><init>(Ljava/io/OutputStream;Z)V

    .restart local v13    # "eos":Ljava/io/OutputStream;
    goto :goto_79

    .line 839
    .restart local v12    # "encodedBytes":[B
    :cond_b0
    const-string v3, " "

    move-object/from16 v0, p7

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_90

    .line 844
    .restart local v14    # "i":I
    :cond_b8
    const-string v3, "?="

    move-object/from16 v0, p7

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_63

    .line 830
    .end local v12    # "encodedBytes":[B
    .end local v14    # "i":I
    :catch_c0
    move-exception v3

    goto :goto_7f
.end method

.method public static encode(Ljava/io/OutputStream;Ljava/lang/String;)Ljava/io/OutputStream;
    .registers 5
    .param p0, "os"    # Ljava/io/OutputStream;
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 430
    if-nez p1, :cond_3

    .line 443
    .end local p0    # "os":Ljava/io/OutputStream;
    :cond_2
    :goto_2
    return-object p0

    .line 432
    .restart local p0    # "os":Ljava/io/OutputStream;
    :cond_3
    const-string v0, "base64"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 433
    new-instance v0, Lcom/sun/mail/util/BASE64EncoderStream;

    invoke-direct {v0, p0}, Lcom/sun/mail/util/BASE64EncoderStream;-><init>(Ljava/io/OutputStream;)V

    move-object p0, v0

    goto :goto_2

    .line 434
    :cond_12
    const-string v0, "quoted-printable"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 435
    new-instance v0, Lcom/sun/mail/util/QPEncoderStream;

    invoke-direct {v0, p0}, Lcom/sun/mail/util/QPEncoderStream;-><init>(Ljava/io/OutputStream;)V

    move-object p0, v0

    goto :goto_2

    .line 436
    :cond_21
    const-string v0, "uuencode"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_39

    const-string v0, "x-uuencode"

    .line 437
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_39

    const-string v0, "x-uue"

    .line 438
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_40

    .line 439
    :cond_39
    new-instance v0, Lcom/sun/mail/util/UUEncoderStream;

    invoke-direct {v0, p0}, Lcom/sun/mail/util/UUEncoderStream;-><init>(Ljava/io/OutputStream;)V

    move-object p0, v0

    goto :goto_2

    .line 440
    :cond_40
    const-string v0, "binary"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "7bit"

    .line 441
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "8bit"

    .line 442
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 445
    new-instance v0, Lkorex/mail/MessagingException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown encoding: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static encode(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)Ljava/io/OutputStream;
    .registers 6
    .param p0, "os"    # Ljava/io/OutputStream;
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 468
    if-nez p1, :cond_3

    .line 481
    .end local p0    # "os":Ljava/io/OutputStream;
    :cond_2
    :goto_2
    return-object p0

    .line 470
    .restart local p0    # "os":Ljava/io/OutputStream;
    :cond_3
    const-string v0, "base64"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 471
    new-instance v0, Lcom/sun/mail/util/BASE64EncoderStream;

    invoke-direct {v0, p0}, Lcom/sun/mail/util/BASE64EncoderStream;-><init>(Ljava/io/OutputStream;)V

    move-object p0, v0

    goto :goto_2

    .line 472
    :cond_12
    const-string v0, "quoted-printable"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 473
    new-instance v0, Lcom/sun/mail/util/QPEncoderStream;

    invoke-direct {v0, p0}, Lcom/sun/mail/util/QPEncoderStream;-><init>(Ljava/io/OutputStream;)V

    move-object p0, v0

    goto :goto_2

    .line 474
    :cond_21
    const-string v0, "uuencode"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_39

    const-string v0, "x-uuencode"

    .line 475
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_39

    const-string v0, "x-uue"

    .line 476
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_40

    .line 477
    :cond_39
    new-instance v0, Lcom/sun/mail/util/UUEncoderStream;

    invoke-direct {v0, p0, p2}, Lcom/sun/mail/util/UUEncoderStream;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    move-object p0, v0

    goto :goto_2

    .line 478
    :cond_40
    const-string v0, "binary"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "7bit"

    .line 479
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "8bit"

    .line 480
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 483
    new-instance v0, Lkorex/mail/MessagingException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown encoding: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static encodeText(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 524
    invoke-static {p0, v0, v0}, Lkorex/mail/internet/MimeUtility;->encodeText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 557
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lkorex/mail/internet/MimeUtility;->encodeWord(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeWord(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "word"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 706
    invoke-static {p0, v0, v0}, Lkorex/mail/internet/MimeUtility;->encodeWord(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeWord(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "word"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 734
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lkorex/mail/internet/MimeUtility;->encodeWord(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static encodeWord(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .registers 13
    .param p0, "string"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "encodingWord"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 750
    invoke-static {p0}, Lkorex/mail/internet/MimeUtility;->checkAscii(Ljava/lang/String;)I

    move-result v8

    .line 751
    .local v8, "ascii":I
    if-ne v8, v5, :cond_8

    .line 788
    .end local p0    # "string":Ljava/lang/String;
    :goto_7
    return-object p0

    .line 756
    .restart local p0    # "string":Ljava/lang/String;
    :cond_8
    if-nez p1, :cond_5a

    .line 757
    invoke-static {}, Lkorex/mail/internet/MimeUtility;->getDefaultJavaCharset()Ljava/lang/String;

    move-result-object v2

    .line 758
    .local v2, "jcharset":Ljava/lang/String;
    invoke-static {}, Lkorex/mail/internet/MimeUtility;->getDefaultMIMECharset()Ljava/lang/String;

    move-result-object p1

    .line 763
    :goto_12
    if-nez p2, :cond_19

    .line 764
    const/4 v0, 0x3

    if-eq v8, v0, :cond_5f

    .line 765
    const-string p2, "Q"

    .line 771
    :cond_19
    :goto_19
    const-string v0, "B"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_62

    .line 772
    const/4 v1, 0x1

    .line 779
    .local v1, "b64":Z
    :goto_22
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    .line 784
    .local v7, "outb":Ljava/lang/StringBuffer;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    rsub-int/lit8 v3, v0, 0x44

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "=?"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "?"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "?"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v0, p0

    move v6, p3

    .line 780
    invoke-static/range {v0 .. v7}, Lkorex/mail/internet/MimeUtility;->doEncode(Ljava/lang/String;ZLjava/lang/String;ILjava/lang/String;ZZLjava/lang/StringBuffer;)V

    .line 788
    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_7

    .line 760
    .end local v1    # "b64":Z
    .end local v2    # "jcharset":Ljava/lang/String;
    .end local v7    # "outb":Ljava/lang/StringBuffer;
    :cond_5a
    invoke-static {p1}, Lkorex/mail/internet/MimeUtility;->javaCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "jcharset":Ljava/lang/String;
    goto :goto_12

    .line 767
    :cond_5f
    const-string p2, "B"

    goto :goto_19

    .line 773
    :cond_62
    const-string v0, "Q"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6c

    .line 774
    const/4 v1, 0x0

    .restart local v1    # "b64":Z
    goto :goto_22

    .line 776
    .end local v1    # "b64":Z
    :cond_6c
    new-instance v0, Ljava/io/UnsupportedEncodingException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown transfer encoding: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/UnsupportedEncodingException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static fold(ILjava/lang/String;)Ljava/lang/String;
    .registers 14
    .param p0, "used"    # I
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v11, 0x0

    const/4 v10, -0x1

    const/16 v9, 0x4c

    const/16 v8, 0x20

    const/16 v7, 0x9

    .line 1079
    sget-boolean v6, Lkorex/mail/internet/MimeUtility;->foldText:Z

    if-nez v6, :cond_e

    move-object v6, p1

    .line 1126
    :goto_d
    return-object v6

    .line 1085
    :cond_e
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v1, v6, -0x1

    .local v1, "end":I
    :goto_14
    if-ltz v1, :cond_26

    .line 1086
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1087
    .local v0, "c":C
    if-eq v0, v8, :cond_3d

    if-eq v0, v7, :cond_3d

    const/16 v6, 0xd

    if-eq v0, v6, :cond_3d

    const/16 v6, 0xa

    if-eq v0, v6, :cond_3d

    .line 1090
    .end local v0    # "c":C
    :cond_26
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-eq v1, v6, :cond_34

    .line 1091
    add-int/lit8 v6, v1, 0x1

    invoke-virtual {p1, v11, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 1094
    :cond_34
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v6, p0

    if-gt v6, v9, :cond_40

    move-object v6, p1

    .line 1095
    goto :goto_d

    .line 1085
    .restart local v0    # "c":C
    :cond_3d
    add-int/lit8 v1, v1, -0x1

    goto :goto_14

    .line 1098
    .end local v0    # "c":C
    :cond_40
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, 0x4

    invoke-direct {v5, v6}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 1099
    .local v5, "sb":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    .line 1100
    .local v3, "lastc":C
    :goto_4c
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v6, p0

    if-le v6, v9, :cond_69

    .line 1101
    const/4 v4, -0x1

    .line 1102
    .local v4, "lastspace":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_55
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v2, v6, :cond_61

    .line 1103
    if-eq v4, v10, :cond_71

    add-int v6, p0, v2

    if-le v6, v9, :cond_71

    .line 1111
    :cond_61
    if-ne v4, v10, :cond_82

    .line 1113
    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1114
    const-string p1, ""

    .line 1115
    const/4 p0, 0x0

    .line 1125
    .end local v2    # "i":I
    .end local v4    # "lastspace":I
    :cond_69
    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1126
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_d

    .line 1105
    .restart local v2    # "i":I
    .restart local v4    # "lastspace":I
    :cond_71
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1106
    .restart local v0    # "c":C
    if-eq v0, v8, :cond_79

    if-ne v0, v7, :cond_7e

    .line 1107
    :cond_79
    if-eq v3, v8, :cond_7e

    if-eq v3, v7, :cond_7e

    .line 1108
    move v4, v2

    .line 1109
    :cond_7e
    move v3, v0

    .line 1102
    add-int/lit8 v2, v2, 0x1

    goto :goto_55

    .line 1118
    .end local v0    # "c":C
    :cond_82
    invoke-virtual {p1, v11, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1119
    const-string v6, "\r\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1120
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 1121
    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1122
    add-int/lit8 v6, v4, 0x1

    invoke-virtual {p1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 1123
    const/4 p0, 0x1

    .line 1124
    goto :goto_4c
.end method

.method public static getDefaultJavaCharset()Ljava/lang/String;
    .registers 5

    .prologue
    .line 1265
    sget-object v3, Lkorex/mail/internet/MimeUtility;->defaultJavaCharset:Ljava/lang/String;

    if-nez v3, :cond_26

    .line 1270
    const/4 v0, 0x0

    .line 1272
    .local v0, "mimecs":Ljava/lang/String;
    :try_start_5
    const-string v3, "mail.mime.charset"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_a
    .catch Ljava/lang/SecurityException; {:try_start_5 .. :try_end_a} :catch_43

    move-result-object v0

    .line 1274
    :goto_b
    if-eqz v0, :cond_1c

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_1c

    .line 1275
    invoke-static {v0}, Lkorex/mail/internet/MimeUtility;->javaCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lkorex/mail/internet/MimeUtility;->defaultJavaCharset:Ljava/lang/String;

    .line 1276
    sget-object v3, Lkorex/mail/internet/MimeUtility;->defaultJavaCharset:Ljava/lang/String;

    .line 1297
    :goto_1b
    return-object v3

    .line 1280
    :cond_1c
    :try_start_1c
    const-string v3, "file.encoding"

    const-string v4, "8859_1"

    invoke-static {v3, v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lkorex/mail/internet/MimeUtility;->defaultJavaCharset:Ljava/lang/String;
    :try_end_26
    .catch Ljava/lang/SecurityException; {:try_start_1c .. :try_end_26} :catch_29

    .line 1297
    :cond_26
    :goto_26
    sget-object v3, Lkorex/mail/internet/MimeUtility;->defaultJavaCharset:Ljava/lang/String;

    goto :goto_1b

    .line 1282
    :catch_29
    move-exception v2

    .line 1289
    .local v2, "sex":Ljava/lang/SecurityException;
    new-instance v1, Ljava/io/InputStreamReader;

    new-instance v3, Lkorex/mail/internet/MimeUtility$1NullInputStream;

    invoke-direct {v3}, Lkorex/mail/internet/MimeUtility$1NullInputStream;-><init>()V

    invoke-direct {v1, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 1291
    .local v1, "reader":Ljava/io/InputStreamReader;
    invoke-virtual {v1}, Ljava/io/InputStreamReader;->getEncoding()Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lkorex/mail/internet/MimeUtility;->defaultJavaCharset:Ljava/lang/String;

    .line 1292
    sget-object v3, Lkorex/mail/internet/MimeUtility;->defaultJavaCharset:Ljava/lang/String;

    if-nez v3, :cond_26

    .line 1293
    const-string v3, "8859_1"

    sput-object v3, Lkorex/mail/internet/MimeUtility;->defaultJavaCharset:Ljava/lang/String;

    goto :goto_26

    .line 1273
    .end local v1    # "reader":Ljava/io/InputStreamReader;
    .end local v2    # "sex":Ljava/lang/SecurityException;
    :catch_43
    move-exception v3

    goto :goto_b
.end method

.method static getDefaultMIMECharset()Ljava/lang/String;
    .registers 1

    .prologue
    .line 1304
    sget-object v0, Lkorex/mail/internet/MimeUtility;->defaultMIMECharset:Ljava/lang/String;

    if-nez v0, :cond_c

    .line 1306
    :try_start_4
    const-string v0, "mail.mime.charset"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lkorex/mail/internet/MimeUtility;->defaultMIMECharset:Ljava/lang/String;
    :try_end_c
    .catch Ljava/lang/SecurityException; {:try_start_4 .. :try_end_c} :catch_1d

    .line 1309
    :cond_c
    :goto_c
    sget-object v0, Lkorex/mail/internet/MimeUtility;->defaultMIMECharset:Ljava/lang/String;

    if-nez v0, :cond_1a

    .line 1310
    invoke-static {}, Lkorex/mail/internet/MimeUtility;->getDefaultJavaCharset()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lkorex/mail/internet/MimeUtility;->mimeCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lkorex/mail/internet/MimeUtility;->defaultMIMECharset:Ljava/lang/String;

    .line 1311
    :cond_1a
    sget-object v0, Lkorex/mail/internet/MimeUtility;->defaultMIMECharset:Ljava/lang/String;

    return-object v0

    .line 1307
    :catch_1d
    move-exception v0

    goto :goto_c
.end method

.method public static getEncoding(Lkorex/activation/DataHandler;)Ljava/lang/String;
    .registers 9
    .param p0, "dh"    # Lkorex/activation/DataHandler;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 317
    const/4 v1, 0x0

    .line 318
    .local v1, "cType":Lkorex/mail/internet/ContentType;
    const/4 v3, 0x0

    .line 333
    .local v3, "encoding":Ljava/lang/String;
    invoke-virtual {p0}, Lkorex/activation/DataHandler;->getName()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_13

    .line 334
    invoke-virtual {p0}, Lkorex/activation/DataHandler;->getDataSource()Lkorex/activation/DataSource;

    move-result-object v5

    invoke-static {v5}, Lkorex/mail/internet/MimeUtility;->getEncoding(Lkorex/activation/DataSource;)Ljava/lang/String;

    move-result-object v5

    .line 375
    :goto_12
    return-object v5

    .line 337
    :cond_13
    :try_start_13
    new-instance v2, Lkorex/mail/internet/ContentType;

    invoke-virtual {p0}, Lkorex/activation/DataHandler;->getContentType()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Lkorex/mail/internet/ContentType;-><init>(Ljava/lang/String;)V
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_1c} :catch_38

    .line 342
    .end local v1    # "cType":Lkorex/mail/internet/ContentType;
    .local v2, "cType":Lkorex/mail/internet/ContentType;
    const-string v5, "text/*"

    invoke-virtual {v2, v5}, Lkorex/mail/internet/ContentType;->match(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_42

    .line 344
    new-instance v0, Lkorex/mail/internet/AsciiOutputStream;

    invoke-direct {v0, v6, v6}, Lkorex/mail/internet/AsciiOutputStream;-><init>(ZZ)V

    .line 346
    .local v0, "aos":Lkorex/mail/internet/AsciiOutputStream;
    :try_start_29
    invoke-virtual {p0, v0}, Lkorex/activation/DataHandler;->writeTo(Ljava/io/OutputStream;)V
    :try_end_2c
    .catch Ljava/io/IOException; {:try_start_29 .. :try_end_2c} :catch_58

    .line 350
    :goto_2c
    invoke-virtual {v0}, Lkorex/mail/internet/AsciiOutputStream;->getAscii()I

    move-result v5

    packed-switch v5, :pswitch_data_5c

    .line 358
    const-string v3, "base64"

    :goto_35
    move-object v1, v2

    .end local v2    # "cType":Lkorex/mail/internet/ContentType;
    .restart local v1    # "cType":Lkorex/mail/internet/ContentType;
    move-object v5, v3

    .line 375
    goto :goto_12

    .line 338
    .end local v0    # "aos":Lkorex/mail/internet/AsciiOutputStream;
    :catch_38
    move-exception v4

    .line 339
    .local v4, "ex":Ljava/lang/Exception;
    const-string v5, "base64"

    goto :goto_12

    .line 352
    .end local v1    # "cType":Lkorex/mail/internet/ContentType;
    .end local v4    # "ex":Ljava/lang/Exception;
    .restart local v0    # "aos":Lkorex/mail/internet/AsciiOutputStream;
    .restart local v2    # "cType":Lkorex/mail/internet/ContentType;
    :pswitch_3c
    const-string v3, "7bit"

    .line 353
    goto :goto_35

    .line 355
    :pswitch_3f
    const-string v3, "quoted-printable"

    .line 356
    goto :goto_35

    .line 364
    .end local v0    # "aos":Lkorex/mail/internet/AsciiOutputStream;
    :cond_42
    new-instance v0, Lkorex/mail/internet/AsciiOutputStream;

    sget-boolean v5, Lkorex/mail/internet/MimeUtility;->encodeEolStrict:Z

    invoke-direct {v0, v7, v5}, Lkorex/mail/internet/AsciiOutputStream;-><init>(ZZ)V

    .line 367
    .restart local v0    # "aos":Lkorex/mail/internet/AsciiOutputStream;
    :try_start_49
    invoke-virtual {p0, v0}, Lkorex/activation/DataHandler;->writeTo(Ljava/io/OutputStream;)V
    :try_end_4c
    .catch Ljava/io/IOException; {:try_start_49 .. :try_end_4c} :catch_5a

    .line 369
    :goto_4c
    invoke-virtual {v0}, Lkorex/mail/internet/AsciiOutputStream;->getAscii()I

    move-result v5

    if-ne v5, v7, :cond_55

    .line 370
    const-string v3, "7bit"

    goto :goto_35

    .line 372
    :cond_55
    const-string v3, "base64"

    goto :goto_35

    .line 347
    :catch_58
    move-exception v5

    goto :goto_2c

    .line 368
    :catch_5a
    move-exception v5

    goto :goto_4c

    .line 350
    :pswitch_data_5c
    .packed-switch 0x1
        :pswitch_3c
        :pswitch_3f
    .end packed-switch
.end method

.method public static getEncoding(Lkorex/activation/DataSource;)Ljava/lang/String;
    .registers 10
    .param p0, "ds"    # Lkorex/activation/DataSource;

    .prologue
    .line 222
    const/4 v0, 0x0

    .line 223
    .local v0, "cType":Lkorex/mail/internet/ContentType;
    const/4 v5, 0x0

    .line 224
    .local v5, "is":Ljava/io/InputStream;
    const/4 v2, 0x0

    .line 226
    .local v2, "encoding":Ljava/lang/String;
    instance-of v7, p0, Lkorex/mail/EncodingAware;

    if-eqz v7, :cond_12

    move-object v7, p0

    .line 227
    check-cast v7, Lkorex/mail/EncodingAware;

    invoke-interface {v7}, Lkorex/mail/EncodingAware;->getEncoding()Ljava/lang/String;

    move-result-object v2

    .line 228
    if-eqz v2, :cond_12

    move-object v7, v2

    .line 263
    :cond_11
    :goto_11
    return-object v7

    .line 232
    :cond_12
    :try_start_12
    new-instance v1, Lkorex/mail/internet/ContentType;

    invoke-interface {p0}, Lkorex/activation/DataSource;->getContentType()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v1, v7}, Lkorex/mail/internet/ContentType;-><init>(Ljava/lang/String;)V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_1b} :catch_4d
    .catchall {:try_start_12 .. :try_end_1b} :catchall_58

    .line 233
    .end local v0    # "cType":Lkorex/mail/internet/ContentType;
    .local v1, "cType":Lkorex/mail/internet/ContentType;
    :try_start_1b
    invoke-interface {p0}, Lkorex/activation/DataSource;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    .line 235
    const-string v7, "text/*"

    invoke-virtual {v1, v7}, Lkorex/mail/internet/ContentType;->match(Ljava/lang/String;)Z

    move-result v6

    .line 237
    .local v6, "isText":Z
    const/4 v8, -0x1

    if-nez v6, :cond_3a

    const/4 v7, 0x1

    :goto_29
    invoke-static {v5, v8, v7}, Lkorex/mail/internet/MimeUtility;->checkAscii(Ljava/io/InputStream;IZ)I

    move-result v4

    .line 238
    .local v4, "i":I
    packed-switch v4, :pswitch_data_6a

    .line 249
    const-string v2, "base64"
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_32} :catch_66
    .catchall {:try_start_1b .. :try_end_32} :catchall_63

    .line 258
    :goto_32
    if-eqz v5, :cond_37

    .line 259
    :try_start_34
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_37
    .catch Ljava/io/IOException; {:try_start_34 .. :try_end_37} :catch_5f

    :cond_37
    :goto_37
    move-object v0, v1

    .end local v1    # "cType":Lkorex/mail/internet/ContentType;
    .restart local v0    # "cType":Lkorex/mail/internet/ContentType;
    move-object v7, v2

    .line 263
    goto :goto_11

    .line 237
    .end local v0    # "cType":Lkorex/mail/internet/ContentType;
    .end local v4    # "i":I
    .restart local v1    # "cType":Lkorex/mail/internet/ContentType;
    :cond_3a
    const/4 v7, 0x0

    goto :goto_29

    .line 240
    .restart local v4    # "i":I
    :pswitch_3c
    :try_start_3c
    const-string v2, "7bit"

    .line 241
    goto :goto_32

    .line 243
    :pswitch_3f
    if-eqz v6, :cond_4a

    invoke-static {v1}, Lkorex/mail/internet/MimeUtility;->nonAsciiCharset(Lkorex/mail/internet/ContentType;)Z

    move-result v7

    if-eqz v7, :cond_4a

    .line 244
    const-string v2, "base64"

    goto :goto_32

    .line 246
    :cond_4a
    const-string v2, "quoted-printable"
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_3c .. :try_end_4c} :catch_66
    .catchall {:try_start_3c .. :try_end_4c} :catchall_63

    .line 247
    goto :goto_32

    .line 253
    .end local v1    # "cType":Lkorex/mail/internet/ContentType;
    .end local v4    # "i":I
    .end local v6    # "isText":Z
    .restart local v0    # "cType":Lkorex/mail/internet/ContentType;
    :catch_4d
    move-exception v3

    .line 254
    .local v3, "ex":Ljava/lang/Exception;
    :goto_4e
    :try_start_4e
    const-string v7, "base64"
    :try_end_50
    .catchall {:try_start_4e .. :try_end_50} :catchall_58

    .line 258
    if-eqz v5, :cond_11

    .line 259
    :try_start_52
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_55
    .catch Ljava/io/IOException; {:try_start_52 .. :try_end_55} :catch_56

    goto :goto_11

    .line 260
    :catch_56
    move-exception v8

    goto :goto_11

    .line 257
    .end local v3    # "ex":Ljava/lang/Exception;
    :catchall_58
    move-exception v7

    .line 258
    :goto_59
    if-eqz v5, :cond_5e

    .line 259
    :try_start_5b
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_5e
    .catch Ljava/io/IOException; {:try_start_5b .. :try_end_5e} :catch_61

    .line 260
    :cond_5e
    :goto_5e
    throw v7

    .end local v0    # "cType":Lkorex/mail/internet/ContentType;
    .restart local v1    # "cType":Lkorex/mail/internet/ContentType;
    .restart local v4    # "i":I
    .restart local v6    # "isText":Z
    :catch_5f
    move-exception v7

    goto :goto_37

    .end local v1    # "cType":Lkorex/mail/internet/ContentType;
    .end local v4    # "i":I
    .end local v6    # "isText":Z
    .restart local v0    # "cType":Lkorex/mail/internet/ContentType;
    :catch_61
    move-exception v8

    goto :goto_5e

    .line 257
    .end local v0    # "cType":Lkorex/mail/internet/ContentType;
    .restart local v1    # "cType":Lkorex/mail/internet/ContentType;
    :catchall_63
    move-exception v7

    move-object v0, v1

    .end local v1    # "cType":Lkorex/mail/internet/ContentType;
    .restart local v0    # "cType":Lkorex/mail/internet/ContentType;
    goto :goto_59

    .line 253
    .end local v0    # "cType":Lkorex/mail/internet/ContentType;
    .restart local v1    # "cType":Lkorex/mail/internet/ContentType;
    :catch_66
    move-exception v3

    move-object v0, v1

    .end local v1    # "cType":Lkorex/mail/internet/ContentType;
    .restart local v0    # "cType":Lkorex/mail/internet/ContentType;
    goto :goto_4e

    .line 238
    nop

    :pswitch_data_6a
    .packed-switch 0x1
        :pswitch_3c
        :pswitch_3f
    .end packed-switch
.end method

.method private static indexOfAny(Ljava/lang/String;Ljava/lang/String;)I
    .registers 3
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "any"    # Ljava/lang/String;

    .prologue
    .line 1195
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lkorex/mail/internet/MimeUtility;->indexOfAny(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private static indexOfAny(Ljava/lang/String;Ljava/lang/String;I)I
    .registers 8
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "any"    # Ljava/lang/String;
    .param p2, "start"    # I

    .prologue
    const/4 v3, -0x1

    .line 1200
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 1201
    .local v2, "len":I
    move v1, p2

    .local v1, "i":I
    :goto_6
    if-ge v1, v2, :cond_16

    .line 1202
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(I)I
    :try_end_f
    .catch Ljava/lang/StringIndexOutOfBoundsException; {:try_start_1 .. :try_end_f} :catch_18

    move-result v4

    if-ltz v4, :cond_13

    .line 1207
    .end local v1    # "i":I
    .end local v2    # "len":I
    :goto_12
    return v1

    .line 1201
    .restart local v1    # "i":I
    .restart local v2    # "len":I
    :cond_13
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_16
    move v1, v3

    .line 1205
    goto :goto_12

    .line 1206
    .end local v1    # "i":I
    .end local v2    # "len":I
    :catch_18
    move-exception v0

    .local v0, "e":Ljava/lang/StringIndexOutOfBoundsException;
    move v1, v3

    .line 1207
    goto :goto_12
.end method

.method public static javaCharset(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "charset"    # Ljava/lang/String;

    .prologue
    .line 1219
    sget-object v1, Lkorex/mail/internet/MimeUtility;->mime2java:Ljava/util/Hashtable;

    if-eqz v1, :cond_6

    if-nez p0, :cond_7

    .line 1225
    .end local p0    # "charset":Ljava/lang/String;
    :cond_6
    :goto_6
    return-object p0

    .line 1223
    .restart local p0    # "charset":Ljava/lang/String;
    :cond_7
    sget-object v1, Lkorex/mail/internet/MimeUtility;->mime2java:Ljava/util/Hashtable;

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 1224
    invoke-virtual {p0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1225
    .local v0, "alias":Ljava/lang/String;
    if-eqz v0, :cond_6

    move-object p0, v0

    goto :goto_6
.end method

.method private static loadMappings(Lcom/sun/mail/util/LineInputStream;Ljava/util/Hashtable;)V
    .registers 8
    .param p0, "is"    # Lcom/sun/mail/util/LineInputStream;
    .param p1, "table"    # Ljava/util/Hashtable;

    .prologue
    .line 1417
    :cond_0
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lcom/sun/mail/util/LineInputStream;->readLine()Ljava/lang/String;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_7

    move-result-object v0

    .line 1422
    .local v0, "currLine":Ljava/lang/String;
    if-nez v0, :cond_9

    .line 1441
    .end local v0    # "currLine":Ljava/lang/String;
    :cond_6
    :goto_6
    return-void

    .line 1418
    :catch_7
    move-exception v1

    .line 1419
    .local v1, "ioex":Ljava/io/IOException;
    goto :goto_6

    .line 1424
    .end local v1    # "ioex":Ljava/io/IOException;
    .restart local v0    # "currLine":Ljava/lang/String;
    :cond_9
    const-string v5, "--"

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_19

    const-string v5, "--"

    invoke-virtual {v0, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_6

    .line 1429
    :cond_19
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_0

    const-string v5, "#"

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 1434
    new-instance v3, Ljava/util/StringTokenizer;

    const-string v5, " \t"

    invoke-direct {v3, v0, v5}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1436
    .local v3, "tk":Ljava/util/StringTokenizer;
    :try_start_32
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    .line 1437
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    .line 1438
    .local v4, "value":Ljava/lang/String;
    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v2, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_43
    .catch Ljava/util/NoSuchElementException; {:try_start_32 .. :try_end_43} :catch_44

    goto :goto_0

    .line 1439
    .end local v2    # "key":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/String;
    :catch_44
    move-exception v5

    goto :goto_0
.end method

.method public static mimeCharset(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "charset"    # Ljava/lang/String;

    .prologue
    .line 1242
    sget-object v1, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    if-eqz v1, :cond_6

    if-nez p0, :cond_7

    .line 1248
    .end local p0    # "charset":Ljava/lang/String;
    :cond_6
    :goto_6
    return-object p0

    .line 1246
    .restart local p0    # "charset":Ljava/lang/String;
    :cond_7
    sget-object v1, Lkorex/mail/internet/MimeUtility;->java2mime:Ljava/util/Hashtable;

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 1247
    invoke-virtual {p0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1248
    .local v0, "alias":Ljava/lang/String;
    if-eqz v0, :cond_6

    move-object p0, v0

    goto :goto_6
.end method

.method private static nonAsciiCharset(Lkorex/mail/internet/ContentType;)Z
    .registers 10
    .param p0, "ct"    # Lkorex/mail/internet/ContentType;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 276
    const-string v7, "charset"

    invoke-virtual {p0, v7}, Lkorex/mail/internet/ContentType;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 277
    .local v2, "charset":Ljava/lang/String;
    if-nez v2, :cond_b

    .line 298
    :goto_a
    return v5

    .line 279
    :cond_b
    sget-object v7, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v2, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    .line 281
    sget-object v7, Lkorex/mail/internet/MimeUtility;->nonAsciiCharsetMap:Ljava/util/Map;

    monitor-enter v7

    .line 282
    :try_start_14
    sget-object v8, Lkorex/mail/internet/MimeUtility;->nonAsciiCharsetMap:Ljava/util/Map;

    invoke-interface {v8, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    .line 283
    .local v1, "bool":Ljava/lang/Boolean;
    monitor-exit v7
    :try_end_1d
    .catchall {:try_start_14 .. :try_end_1d} :catchall_4a

    .line 284
    if-nez v1, :cond_45

    .line 286
    :try_start_1f
    const-string v7, "\r\n"

    invoke-virtual {v7, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 287
    .local v0, "b":[B
    array-length v7, v0

    const/4 v8, 0x2

    if-ne v7, v8, :cond_37

    const/4 v7, 0x0

    aget-byte v7, v0, v7

    const/16 v8, 0xd

    if-ne v7, v8, :cond_37

    const/4 v7, 0x1

    aget-byte v7, v0, v7

    const/16 v8, 0xa

    if-eq v7, v8, :cond_38

    :cond_37
    move v5, v6

    :cond_38
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_3b
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1f .. :try_end_3b} :catch_4d
    .catch Ljava/lang/RuntimeException; {:try_start_1f .. :try_end_3b} :catch_51

    move-result-object v1

    .line 294
    .end local v0    # "b":[B
    :goto_3c
    sget-object v6, Lkorex/mail/internet/MimeUtility;->nonAsciiCharsetMap:Ljava/util/Map;

    monitor-enter v6

    .line 295
    :try_start_3f
    sget-object v5, Lkorex/mail/internet/MimeUtility;->nonAsciiCharsetMap:Ljava/util/Map;

    invoke-interface {v5, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    monitor-exit v6
    :try_end_45
    .catchall {:try_start_3f .. :try_end_45} :catchall_55

    .line 298
    :cond_45
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    goto :goto_a

    .line 283
    .end local v1    # "bool":Ljava/lang/Boolean;
    :catchall_4a
    move-exception v5

    :try_start_4b
    monitor-exit v7
    :try_end_4c
    .catchall {:try_start_4b .. :try_end_4c} :catchall_4a

    throw v5

    .line 289
    .restart local v1    # "bool":Ljava/lang/Boolean;
    :catch_4d
    move-exception v4

    .line 290
    .local v4, "uex":Ljava/io/UnsupportedEncodingException;
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 293
    goto :goto_3c

    .line 291
    .end local v4    # "uex":Ljava/io/UnsupportedEncodingException;
    :catch_51
    move-exception v3

    .line 292
    .local v3, "ex":Ljava/lang/RuntimeException;
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_3c

    .line 296
    .end local v3    # "ex":Ljava/lang/RuntimeException;
    :catchall_55
    move-exception v5

    :try_start_56
    monitor-exit v6
    :try_end_57
    .catchall {:try_start_56 .. :try_end_57} :catchall_55

    throw v5
.end method

.method static final nonascii(I)Z
    .registers 2
    .param p0, "b"    # I

    .prologue
    .line 1604
    const/16 v0, 0x7f

    if-ge p0, v0, :cond_14

    const/16 v0, 0x20

    if-ge p0, v0, :cond_16

    const/16 v0, 0xd

    if-eq p0, v0, :cond_16

    const/16 v0, 0xa

    if-eq p0, v0, :cond_16

    const/16 v0, 0x9

    if-eq p0, v0, :cond_16

    :cond_14
    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public static quote(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 16
    .param p0, "word"    # Ljava/lang/String;
    .param p1, "specials"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    const/16 v13, 0x5c

    const/16 v12, 0xd

    const/16 v11, 0xa

    const/16 v10, 0x22

    .line 1019
    if-nez p0, :cond_11

    move v5, v8

    .line 1020
    .local v5, "len":I
    :goto_c
    if-nez v5, :cond_16

    .line 1021
    const-string p0, "\"\""

    .line 1059
    .end local p0    # "word":Ljava/lang/String;
    :cond_10
    :goto_10
    return-object p0

    .line 1019
    .end local v5    # "len":I
    .restart local p0    # "word":Ljava/lang/String;
    :cond_11
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    goto :goto_c

    .line 1027
    .restart local v5    # "len":I
    :cond_16
    const/4 v6, 0x0

    .line 1028
    .local v6, "needQuoting":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_18
    if-ge v2, v5, :cond_70

    .line 1029
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1030
    .local v0, "c":C
    if-eq v0, v10, :cond_26

    if-eq v0, v13, :cond_26

    if-eq v0, v12, :cond_26

    if-ne v0, v11, :cond_5e

    .line 1032
    :cond_26
    new-instance v7, Ljava/lang/StringBuffer;

    add-int/lit8 v9, v5, 0x3

    invoke-direct {v7, v9}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 1033
    .local v7, "sb":Ljava/lang/StringBuffer;
    invoke-virtual {v7, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1034
    invoke-virtual {p0, v8, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1035
    const/4 v4, 0x0

    .line 1036
    .local v4, "lastc":I
    move v3, v2

    .local v3, "j":I
    :goto_39
    if-ge v3, v5, :cond_56

    .line 1037
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1038
    .local v1, "cc":C
    if-eq v1, v10, :cond_47

    if-eq v1, v13, :cond_47

    if-eq v1, v12, :cond_47

    if-ne v1, v11, :cond_4b

    .line 1040
    :cond_47
    if-ne v1, v11, :cond_52

    if-ne v4, v12, :cond_52

    .line 1044
    :cond_4b
    :goto_4b
    invoke-virtual {v7, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1045
    move v4, v1

    .line 1036
    add-int/lit8 v3, v3, 0x1

    goto :goto_39

    .line 1043
    :cond_52
    invoke-virtual {v7, v13}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_4b

    .line 1047
    .end local v1    # "cc":C
    :cond_56
    invoke-virtual {v7, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1048
    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_10

    .line 1049
    .end local v3    # "j":I
    .end local v4    # "lastc":I
    .end local v7    # "sb":Ljava/lang/StringBuffer;
    :cond_5e
    const/16 v9, 0x20

    if-lt v0, v9, :cond_6c

    const/16 v9, 0x7f

    if-ge v0, v9, :cond_6c

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v9

    if-ltz v9, :cond_6d

    .line 1051
    :cond_6c
    const/4 v6, 0x1

    .line 1028
    :cond_6d
    add-int/lit8 v2, v2, 0x1

    goto :goto_18

    .line 1054
    .end local v0    # "c":C
    :cond_70
    if-eqz v6, :cond_10

    .line 1055
    new-instance v7, Ljava/lang/StringBuffer;

    add-int/lit8 v8, v5, 0x2

    invoke-direct {v7, v8}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 1056
    .restart local v7    # "sb":Ljava/lang/StringBuffer;
    invoke-virtual {v7, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1057
    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_10
.end method

.method public static unfold(Ljava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/16 v9, 0x9

    const/16 v8, 0x20

    const/4 v7, 0x0

    .line 1138
    sget-boolean v5, Lkorex/mail/internet/MimeUtility;->foldText:Z

    if-nez v5, :cond_a

    .line 1185
    .end local p0    # "s":Ljava/lang/String;
    :cond_9
    :goto_9
    return-object p0

    .line 1141
    .restart local p0    # "s":Ljava/lang/String;
    :cond_a
    const/4 v3, 0x0

    .line 1143
    .local v3, "sb":Ljava/lang/StringBuffer;
    :goto_b
    const-string v5, "\r\n"

    invoke-static {p0, v5}, Lkorex/mail/internet/MimeUtility;->indexOfAny(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .local v1, "i":I
    if-ltz v1, :cond_a9

    .line 1144
    move v4, v1

    .line 1145
    .local v4, "start":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 1146
    .local v2, "l":I
    add-int/lit8 v1, v1, 0x1

    .line 1147
    if-ge v1, v2, :cond_30

    add-int/lit8 v5, v1, -0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0xd

    if-ne v5, v6, :cond_30

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0xa

    if-ne v5, v6, :cond_30

    .line 1148
    add-int/lit8 v1, v1, 0x1

    .line 1149
    :cond_30
    if-eqz v4, :cond_3c

    add-int/lit8 v5, v4, -0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x5c

    if-eq v5, v6, :cond_88

    .line 1153
    :cond_3c
    if-ge v1, v2, :cond_71

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .local v0, "c":C
    if-eq v0, v8, :cond_46

    if-ne v0, v9, :cond_71

    .line 1154
    :cond_46
    add-int/lit8 v1, v1, 0x1

    .line 1155
    :goto_48
    if-ge v1, v2, :cond_55

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-eq v0, v8, :cond_52

    if-ne v0, v9, :cond_55

    .line 1156
    :cond_52
    add-int/lit8 v1, v1, 0x1

    goto :goto_48

    .line 1157
    :cond_55
    if-nez v3, :cond_60

    .line 1158
    new-instance v3, Ljava/lang/StringBuffer;

    .end local v3    # "sb":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-direct {v3, v5}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 1159
    .restart local v3    # "sb":Ljava/lang/StringBuffer;
    :cond_60
    if-eqz v4, :cond_6c

    .line 1160
    invoke-virtual {p0, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1161
    invoke-virtual {v3, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1163
    :cond_6c
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 1164
    goto :goto_b

    .line 1167
    .end local v0    # "c":C
    :cond_71
    if-nez v3, :cond_7c

    .line 1168
    new-instance v3, Ljava/lang/StringBuffer;

    .end local v3    # "sb":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-direct {v3, v5}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 1169
    .restart local v3    # "sb":Ljava/lang/StringBuffer;
    :cond_7c
    invoke-virtual {p0, v7, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1170
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_b

    .line 1174
    :cond_88
    if-nez v3, :cond_93

    .line 1175
    new-instance v3, Ljava/lang/StringBuffer;

    .end local v3    # "sb":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-direct {v3, v5}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 1176
    .restart local v3    # "sb":Ljava/lang/StringBuffer;
    :cond_93
    add-int/lit8 v5, v4, -0x1

    invoke-virtual {p0, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1177
    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1178
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_b

    .line 1181
    .end local v2    # "l":I
    .end local v4    # "start":I
    :cond_a9
    if-eqz v3, :cond_9

    .line 1182
    invoke-virtual {v3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1183
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_9
.end method
