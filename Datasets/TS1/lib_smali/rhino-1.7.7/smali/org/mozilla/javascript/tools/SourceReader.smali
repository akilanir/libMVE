.class public Lorg/mozilla/javascript/tools/SourceReader;
.super Ljava/lang/Object;
.source "SourceReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static readFileOrUrl(Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/Object;
    .registers 17
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "convertToString"    # Z
    .param p2, "defaultEncoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 41
    invoke-static {p0}, Lorg/mozilla/javascript/tools/SourceReader;->toUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v11

    .line 42
    .local v11, "url":Ljava/net/URL;
    const/4 v5, 0x0

    .line 43
    .local v5, "is":Ljava/io/InputStream;
    const/4 v0, 0x0

    .line 48
    .local v0, "capacityHint":I
    if-nez v11, :cond_2b

    .line 49
    :try_start_8
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 50
    .local v4, "file":Ljava/io/File;
    const/4 v3, 0x0

    .local v3, "encoding":Ljava/lang/String;
    move-object v1, v3

    .line 51
    .local v1, "contentType":Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v12

    long-to-int v0, v12

    .line 52
    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .end local v5    # "is":Ljava/io/InputStream;
    .local v6, "is":Ljava/io/InputStream;
    move-object v5, v6

    .line 70
    .end local v1    # "contentType":Ljava/lang/Object;
    .end local v4    # "file":Ljava/io/File;
    .end local v6    # "is":Ljava/io/InputStream;
    .restart local v5    # "is":Ljava/io/InputStream;
    :cond_1a
    :goto_1a
    if-gtz v0, :cond_1e

    .line 71
    const/16 v0, 0x1000

    .line 74
    :cond_1e
    invoke-static {v5, v0}, Lorg/mozilla/javascript/Kit;->readStream(Ljava/io/InputStream;I)[B
    :try_end_21
    .catchall {:try_start_8 .. :try_end_21} :catchall_53

    move-result-object v2

    .line 76
    .local v2, "data":[B
    if-eqz v5, :cond_27

    .line 77
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 82
    :cond_27
    if-nez p1, :cond_5a

    .line 83
    move-object v8, v2

    .line 131
    :goto_2a
    return-object v8

    .line 54
    .end local v2    # "data":[B
    .end local v3    # "encoding":Ljava/lang/String;
    :cond_2b
    :try_start_2b
    invoke-virtual {v11}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v10

    .line 55
    .local v10, "uc":Ljava/net/URLConnection;
    invoke-virtual {v10}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    .line 56
    if-eqz p1, :cond_50

    .line 57
    new-instance v7, Lorg/mozilla/javascript/commonjs/module/provider/ParsedContentType;

    invoke-virtual {v10}, Ljava/net/URLConnection;->getContentType()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v7, v12}, Lorg/mozilla/javascript/commonjs/module/provider/ParsedContentType;-><init>(Ljava/lang/String;)V

    .line 58
    .local v7, "pct":Lorg/mozilla/javascript/commonjs/module/provider/ParsedContentType;
    invoke-virtual {v7}, Lorg/mozilla/javascript/commonjs/module/provider/ParsedContentType;->getContentType()Ljava/lang/String;

    move-result-object v1

    .line 59
    .local v1, "contentType":Ljava/lang/String;
    invoke-virtual {v7}, Lorg/mozilla/javascript/commonjs/module/provider/ParsedContentType;->getEncoding()Ljava/lang/String;

    move-result-object v3

    .line 64
    .end local v1    # "contentType":Ljava/lang/String;
    .end local v7    # "pct":Lorg/mozilla/javascript/commonjs/module/provider/ParsedContentType;
    .restart local v3    # "encoding":Ljava/lang/String;
    :goto_46
    invoke-virtual {v10}, Ljava/net/URLConnection;->getContentLength()I
    :try_end_49
    .catchall {:try_start_2b .. :try_end_49} :catchall_53

    move-result v0

    .line 66
    const/high16 v12, 0x100000

    if-le v0, v12, :cond_1a

    .line 67
    const/4 v0, -0x1

    goto :goto_1a

    .line 62
    .end local v3    # "encoding":Ljava/lang/String;
    :cond_50
    const/4 v3, 0x0

    .restart local v3    # "encoding":Ljava/lang/String;
    move-object v1, v3

    .local v1, "contentType":Ljava/lang/Object;
    goto :goto_46

    .line 76
    .end local v1    # "contentType":Ljava/lang/Object;
    .end local v3    # "encoding":Ljava/lang/String;
    .end local v10    # "uc":Ljava/net/URLConnection;
    :catchall_53
    move-exception v12

    if-eqz v5, :cond_59

    .line 77
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    :cond_59
    throw v12

    .line 85
    .restart local v2    # "data":[B
    .restart local v3    # "encoding":Ljava/lang/String;
    :cond_5a
    if-nez v3, :cond_78

    .line 88
    array-length v12, v2

    const/4 v13, 0x3

    if-le v12, v13, :cond_94

    const/4 v12, 0x0

    aget-byte v12, v2, v12

    const/4 v13, -0x1

    if-ne v12, v13, :cond_94

    const/4 v12, 0x1

    aget-byte v12, v2, v12

    const/4 v13, -0x2

    if-ne v12, v13, :cond_94

    const/4 v12, 0x2

    aget-byte v12, v2, v12

    if-nez v12, :cond_94

    const/4 v12, 0x3

    aget-byte v12, v2, v12

    if-nez v12, :cond_94

    .line 89
    const-string v3, "UTF-32LE"

    .line 123
    :cond_78
    :goto_78
    new-instance v9, Ljava/lang/String;

    invoke-direct {v9, v2, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 125
    .local v9, "strResult":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v12

    if-lez v12, :cond_92

    const/4 v12, 0x0

    invoke-virtual {v9, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    const v13, 0xfeff

    if-ne v12, v13, :cond_92

    .line 127
    const/4 v12, 0x1

    invoke-virtual {v9, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    .line 129
    :cond_92
    move-object v8, v9

    .local v8, "result":Ljava/lang/String;
    goto :goto_2a

    .line 91
    .end local v8    # "result":Ljava/lang/String;
    .end local v9    # "strResult":Ljava/lang/String;
    :cond_94
    array-length v12, v2

    const/4 v13, 0x3

    if-le v12, v13, :cond_b1

    const/4 v12, 0x0

    aget-byte v12, v2, v12

    if-nez v12, :cond_b1

    const/4 v12, 0x1

    aget-byte v12, v2, v12

    if-nez v12, :cond_b1

    const/4 v12, 0x2

    aget-byte v12, v2, v12

    const/4 v13, -0x2

    if-ne v12, v13, :cond_b1

    const/4 v12, 0x3

    aget-byte v12, v2, v12

    const/4 v13, -0x1

    if-ne v12, v13, :cond_b1

    .line 92
    const-string v3, "UTF-32BE"

    goto :goto_78

    .line 94
    :cond_b1
    array-length v12, v2

    const/4 v13, 0x2

    if-le v12, v13, :cond_cd

    const/4 v12, 0x0

    aget-byte v12, v2, v12

    const/16 v13, -0x11

    if-ne v12, v13, :cond_cd

    const/4 v12, 0x1

    aget-byte v12, v2, v12

    const/16 v13, -0x45

    if-ne v12, v13, :cond_cd

    const/4 v12, 0x2

    aget-byte v12, v2, v12

    const/16 v13, -0x41

    if-ne v12, v13, :cond_cd

    .line 95
    const-string v3, "UTF-8"

    goto :goto_78

    .line 97
    :cond_cd
    array-length v12, v2

    const/4 v13, 0x1

    if-le v12, v13, :cond_e0

    const/4 v12, 0x0

    aget-byte v12, v2, v12

    const/4 v13, -0x1

    if-ne v12, v13, :cond_e0

    const/4 v12, 0x1

    aget-byte v12, v2, v12

    const/4 v13, -0x2

    if-ne v12, v13, :cond_e0

    .line 98
    const-string v3, "UTF-16LE"

    goto :goto_78

    .line 100
    :cond_e0
    array-length v12, v2

    const/4 v13, 0x1

    if-le v12, v13, :cond_f3

    const/4 v12, 0x0

    aget-byte v12, v2, v12

    const/4 v13, -0x2

    if-ne v12, v13, :cond_f3

    const/4 v12, 0x1

    aget-byte v12, v2, v12

    const/4 v13, -0x1

    if-ne v12, v13, :cond_f3

    .line 101
    const-string v3, "UTF-16BE"

    goto :goto_78

    .line 105
    :cond_f3
    move-object/from16 v3, p2

    .line 106
    if-nez v3, :cond_78

    .line 108
    if-nez v11, :cond_101

    .line 110
    const-string v12, "file.encoding"

    invoke-static {v12}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_78

    .line 112
    :cond_101
    if-eqz v1, :cond_10f

    const-string v12, "application/"

    invoke-virtual {v1, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_10f

    .line 114
    const-string v3, "UTF-8"

    goto/16 :goto_78

    .line 118
    :cond_10f
    const-string v3, "US-ASCII"

    goto/16 :goto_78
.end method

.method public static toUrl(Ljava/lang/String;)Ljava/net/URL;
    .registers 3
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 28
    const/16 v0, 0x3a

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_10

    .line 30
    :try_start_9
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_e
    .catch Ljava/net/MalformedURLException; {:try_start_9 .. :try_end_e} :catch_f

    .line 35
    :goto_e
    return-object v0

    .line 31
    :catch_f
    move-exception v0

    .line 35
    :cond_10
    const/4 v0, 0x0

    goto :goto_e
.end method
