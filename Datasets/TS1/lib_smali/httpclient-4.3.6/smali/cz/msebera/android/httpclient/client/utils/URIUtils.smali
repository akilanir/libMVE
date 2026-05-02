.class public Lcz/msebera/android/httpclient/client/utils/URIUtils;
.super Ljava/lang/Object;
.source "URIUtils.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 425
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 426
    return-void
.end method

.method public static createURI(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/net/URI;
    .registers 9
    .param p0, "scheme"    # Ljava/lang/String;
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "path"    # Ljava/lang/String;
    .param p4, "query"    # Ljava/lang/String;
    .param p5, "fragment"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 85
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .local v0, "buffer":Ljava/lang/StringBuilder;
    if-eqz p1, :cond_1e

    .line 87
    if-eqz p0, :cond_11

    .line 88
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    const-string v1, "://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    :cond_11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    if-lez p2, :cond_1e

    .line 93
    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 94
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    :cond_1e
    if-eqz p3, :cond_28

    const-string v1, "/"

    invoke-virtual {p3, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2d

    .line 98
    :cond_28
    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 100
    :cond_2d
    if-eqz p3, :cond_32

    .line 101
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    :cond_32
    if-eqz p4, :cond_3c

    .line 104
    const/16 v1, 0x3f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 105
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    :cond_3c
    if-eqz p5, :cond_46

    .line 108
    const/16 v1, 0x23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 109
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    :cond_46
    new-instance v1, Ljava/net/URI;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    return-object v1
.end method

.method public static extractHost(Ljava/net/URI;)Lcz/msebera/android/httpclient/HttpHost;
    .registers 12
    .param p0, "uri"    # Ljava/net/URI;

    .prologue
    .line 324
    if-nez p0, :cond_4

    .line 325
    const/4 v8, 0x0

    .line 373
    :cond_3
    :goto_3
    return-object v8

    .line 327
    :cond_4
    const/4 v8, 0x0

    .line 328
    .local v8, "target":Lcz/msebera/android/httpclient/HttpHost;
    invoke-virtual {p0}, Ljava/net/URI;->isAbsolute()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 329
    invoke-virtual {p0}, Ljava/net/URI;->getPort()I

    move-result v5

    .line 330
    .local v5, "port":I
    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 331
    .local v2, "host":Ljava/lang/String;
    if-nez v2, :cond_67

    .line 333
    invoke-virtual {p0}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v2

    .line 334
    if-eqz v2, :cond_67

    .line 336
    const/16 v9, 0x40

    invoke-virtual {v2, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 337
    .local v0, "at":I
    if-ltz v0, :cond_31

    .line 338
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v10, v0, 0x1

    if-le v9, v10, :cond_54

    .line 339
    add-int/lit8 v9, v0, 0x1

    invoke-virtual {v2, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 345
    :cond_31
    :goto_31
    if-eqz v2, :cond_67

    .line 346
    const/16 v9, 0x3a

    invoke-virtual {v2, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 347
    .local v1, "colon":I
    if-ltz v1, :cond_67

    .line 348
    add-int/lit8 v6, v1, 0x1

    .line 349
    .local v6, "pos":I
    const/4 v4, 0x0

    .line 350
    .local v4, "len":I
    move v3, v6

    .local v3, "i":I
    :goto_3f
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v9

    if-ge v3, v9, :cond_56

    .line 351
    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-static {v9}, Ljava/lang/Character;->isDigit(C)Z

    move-result v9

    if-eqz v9, :cond_56

    .line 352
    add-int/lit8 v4, v4, 0x1

    .line 350
    add-int/lit8 v3, v3, 0x1

    goto :goto_3f

    .line 341
    .end local v1    # "colon":I
    .end local v3    # "i":I
    .end local v4    # "len":I
    .end local v6    # "pos":I
    :cond_54
    const/4 v2, 0x0

    goto :goto_31

    .line 357
    .restart local v1    # "colon":I
    .restart local v3    # "i":I
    .restart local v4    # "len":I
    .restart local v6    # "pos":I
    :cond_56
    if-lez v4, :cond_62

    .line 359
    add-int v9, v6, v4

    :try_start_5a
    invoke-virtual {v2, v6, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_61
    .catch Ljava/lang/NumberFormatException; {:try_start_5a .. :try_end_61} :catch_77

    move-result v5

    .line 363
    :cond_62
    :goto_62
    const/4 v9, 0x0

    invoke-virtual {v2, v9, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 368
    .end local v0    # "at":I
    .end local v1    # "colon":I
    .end local v3    # "i":I
    .end local v4    # "len":I
    .end local v6    # "pos":I
    :cond_67
    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v7

    .line 369
    .local v7, "scheme":Ljava/lang/String;
    invoke-static {v2}, Lcz/msebera/android/httpclient/util/TextUtils;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_3

    .line 370
    new-instance v8, Lcz/msebera/android/httpclient/HttpHost;

    .end local v8    # "target":Lcz/msebera/android/httpclient/HttpHost;
    invoke-direct {v8, v2, v5, v7}, Lcz/msebera/android/httpclient/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .restart local v8    # "target":Lcz/msebera/android/httpclient/HttpHost;
    goto :goto_3

    .line 360
    .end local v7    # "scheme":Ljava/lang/String;
    .restart local v0    # "at":I
    .restart local v1    # "colon":I
    .restart local v3    # "i":I
    .restart local v4    # "len":I
    .restart local v6    # "pos":I
    :catch_77
    move-exception v9

    goto :goto_62
.end method

.method private static normalizeSyntax(Ljava/net/URI;)Ljava/net/URI;
    .registers 16
    .param p0, "uri"    # Ljava/net/URI;

    .prologue
    const/16 v14, 0x2f

    .line 262
    invoke-virtual {p0}, Ljava/net/URI;->isOpaque()Z

    move-result v3

    if-nez v3, :cond_e

    invoke-virtual {p0}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_10

    :cond_e
    move-object v0, p0

    .line 308
    :cond_f
    :goto_f
    return-object v0

    .line 266
    :cond_10
    invoke-virtual {p0}, Ljava/net/URI;->isAbsolute()Z

    move-result v3

    const-string v4, "Base URI must be absolute"

    invoke-static {v3, v4}, Lcz/msebera/android/httpclient/util/Args;->check(ZLjava/lang/String;)V

    .line 267
    invoke-virtual {p0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_43

    const-string v13, ""

    .line 268
    .local v13, "path":Ljava/lang/String;
    :goto_21
    const-string v3, "/"

    invoke-virtual {v13, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 269
    .local v8, "inputSegments":[Ljava/lang/String;
    new-instance v12, Ljava/util/Stack;

    invoke-direct {v12}, Ljava/util/Stack;-><init>()V

    .line 270
    .local v12, "outputSegments":Ljava/util/Stack;, "Ljava/util/Stack<Ljava/lang/String;>;"
    array-length v4, v8

    const/4 v3, 0x0

    :goto_2e
    if-ge v3, v4, :cond_5e

    aget-object v7, v8, v3

    .line 271
    .local v7, "inputSegment":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_40

    const-string v5, "."

    .line 272
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_48

    .line 270
    :cond_40
    :goto_40
    add-int/lit8 v3, v3, 0x1

    goto :goto_2e

    .line 267
    .end local v7    # "inputSegment":Ljava/lang/String;
    .end local v8    # "inputSegments":[Ljava/lang/String;
    .end local v12    # "outputSegments":Ljava/util/Stack;, "Ljava/util/Stack<Ljava/lang/String;>;"
    .end local v13    # "path":Ljava/lang/String;
    :cond_43
    invoke-virtual {p0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v13

    goto :goto_21

    .line 274
    .restart local v7    # "inputSegment":Ljava/lang/String;
    .restart local v8    # "inputSegments":[Ljava/lang/String;
    .restart local v12    # "outputSegments":Ljava/util/Stack;, "Ljava/util/Stack<Ljava/lang/String;>;"
    .restart local v13    # "path":Ljava/lang/String;
    :cond_48
    const-string v5, ".."

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5a

    .line 275
    invoke-virtual {v12}, Ljava/util/Stack;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_40

    .line 276
    invoke-virtual {v12}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    goto :goto_40

    .line 279
    :cond_5a
    invoke-virtual {v12, v7}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_40

    .line 282
    .end local v7    # "inputSegment":Ljava/lang/String;
    :cond_5e
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 283
    .local v10, "outputBuffer":Ljava/lang/StringBuilder;
    invoke-virtual {v12}, Ljava/util/Stack;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_67
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 284
    .local v11, "outputSegment":Ljava/lang/String;
    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_67

    .line 286
    .end local v11    # "outputSegment":Ljava/lang/String;
    :cond_7b
    invoke-virtual {v13, v14}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v3

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ne v3, v4, :cond_8a

    .line 288
    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 291
    :cond_8a
    :try_start_8a
    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 292
    .local v1, "scheme":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    .line 293
    .local v2, "auth":Ljava/lang/String;
    new-instance v0, Ljava/net/URI;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Ljava/net/URI;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    .local v0, "ref":Ljava/net/URI;
    invoke-virtual {p0}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_b5

    invoke-virtual {p0}, Ljava/net/URI;->getFragment()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_f

    .line 298
    :cond_b5
    new-instance v9, Ljava/lang/StringBuilder;

    .line 299
    invoke-virtual {v0}, Ljava/net/URI;->toASCIIString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v9, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 300
    .local v9, "normalized":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_d1

    .line 302
    const/16 v3, 0x3f

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    :cond_d1
    invoke-virtual {p0}, Ljava/net/URI;->getFragment()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_e4

    .line 306
    const/16 v3, 0x23

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Ljava/net/URI;->getRawFragment()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 308
    :cond_e4
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;
    :try_end_eb
    .catch Ljava/net/URISyntaxException; {:try_start_8a .. :try_end_eb} :catch_ee

    move-result-object v0

    goto/16 :goto_f

    .line 309
    .end local v0    # "ref":Ljava/net/URI;
    .end local v1    # "scheme":Ljava/lang/String;
    .end local v2    # "auth":Ljava/lang/String;
    .end local v9    # "normalized":Ljava/lang/StringBuilder;
    :catch_ee
    move-exception v6

    .line 310
    .local v6, "e":Ljava/net/URISyntaxException;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public static resolve(Ljava/net/URI;Lcz/msebera/android/httpclient/HttpHost;Ljava/util/List;)Ljava/net/URI;
    .registers 7
    .param p0, "originalURI"    # Ljava/net/URI;
    .param p1, "target"    # Lcz/msebera/android/httpclient/HttpHost;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URI;",
            "Lcz/msebera/android/httpclient/HttpHost;",
            "Ljava/util/List",
            "<",
            "Ljava/net/URI;",
            ">;)",
            "Ljava/net/URI;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 396
    .local p2, "redirects":Ljava/util/List;, "Ljava/util/List<Ljava/net/URI;>;"
    const-string v3, "Request URI"

    invoke-static {p0, v3}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 398
    if-eqz p2, :cond_d

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_41

    .line 399
    :cond_d
    new-instance v2, Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    invoke-direct {v2, p0}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;-><init>(Ljava/net/URI;)V

    .line 410
    .local v2, "uribuilder":Lcz/msebera/android/httpclient/client/utils/URIBuilder;
    :goto_12
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->getFragment()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1f

    .line 411
    invoke-virtual {p0}, Ljava/net/URI;->getFragment()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->setFragment(Ljava/lang/String;)Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    .line 414
    :cond_1f
    if-eqz p1, :cond_3c

    invoke-virtual {v2}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->isAbsolute()Z

    move-result v3

    if-nez v3, :cond_3c

    .line 415
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->setScheme(Ljava/lang/String;)Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    .line 416
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->setHost(Ljava/lang/String;)Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    .line 417
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/HttpHost;->getPort()I

    move-result v3

    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->setPort(I)Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    .line 419
    :cond_3c
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->build()Ljava/net/URI;

    move-result-object v3

    return-object v3

    .line 401
    .end local v2    # "uribuilder":Lcz/msebera/android/httpclient/client/utils/URIBuilder;
    :cond_41
    new-instance v2, Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/URI;

    invoke-direct {v2, v3}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;-><init>(Ljava/net/URI;)V

    .line 402
    .restart local v2    # "uribuilder":Lcz/msebera/android/httpclient/client/utils/URIBuilder;
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->getFragment()Ljava/lang/String;

    move-result-object v0

    .line 404
    .local v0, "frag":Ljava/lang/String;
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .local v1, "i":I
    :goto_5c
    if-nez v0, :cond_6d

    if-ltz v1, :cond_6d

    .line 405
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/URI;

    invoke-virtual {v3}, Ljava/net/URI;->getFragment()Ljava/lang/String;

    move-result-object v0

    .line 404
    add-int/lit8 v1, v1, -0x1

    goto :goto_5c

    .line 407
    :cond_6d
    invoke-virtual {v2, v0}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->setFragment(Ljava/lang/String;)Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    goto :goto_12
.end method

.method public static resolve(Ljava/net/URI;Ljava/lang/String;)Ljava/net/URI;
    .registers 3
    .param p0, "baseURI"    # Ljava/net/URI;
    .param p1, "reference"    # Ljava/lang/String;

    .prologue
    .line 207
    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-static {p0, v0}, Lcz/msebera/android/httpclient/client/utils/URIUtils;->resolve(Ljava/net/URI;Ljava/net/URI;)Ljava/net/URI;

    move-result-object v0

    return-object v0
.end method

.method public static resolve(Ljava/net/URI;Ljava/net/URI;)Ljava/net/URI;
    .registers 9
    .param p0, "baseURI"    # Ljava/net/URI;
    .param p1, "reference"    # Ljava/net/URI;

    .prologue
    const/4 v5, 0x0

    .line 219
    const-string v6, "Base URI"

    invoke-static {p0, v6}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 220
    const-string v6, "Reference URI"

    invoke-static {p1, v6}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 221
    move-object v1, p1

    .line 222
    .local v1, "ref":Ljava/net/URI;
    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v4

    .line 223
    .local v4, "s":Ljava/lang/String;
    const-string v6, "?"

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1d

    .line 224
    invoke-static {p0, v1}, Lcz/msebera/android/httpclient/client/utils/URIUtils;->resolveReferenceStartingWithQueryString(Ljava/net/URI;Ljava/net/URI;)Ljava/net/URI;

    move-result-object v5

    .line 236
    :goto_1c
    return-object v5

    .line 226
    :cond_1d
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_49

    const/4 v0, 0x1

    .line 227
    .local v0, "emptyReference":Z
    :goto_24
    if-eqz v0, :cond_2c

    .line 228
    const-string v6, "#"

    invoke-static {v6}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    .line 230
    :cond_2c
    invoke-virtual {p0, v1}, Ljava/net/URI;->resolve(Ljava/net/URI;)Ljava/net/URI;

    move-result-object v2

    .line 231
    .local v2, "resolved":Ljava/net/URI;
    if-eqz v0, :cond_44

    .line 232
    invoke-virtual {v2}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v3

    .line 233
    .local v3, "resolvedString":Ljava/lang/String;
    const/16 v6, 0x23

    .line 234
    invoke-virtual {v3, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    .line 233
    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v2

    .line 236
    .end local v3    # "resolvedString":Ljava/lang/String;
    :cond_44
    invoke-static {v2}, Lcz/msebera/android/httpclient/client/utils/URIUtils;->normalizeSyntax(Ljava/net/URI;)Ljava/net/URI;

    move-result-object v5

    goto :goto_1c

    .end local v0    # "emptyReference":Z
    .end local v2    # "resolved":Ljava/net/URI;
    :cond_49
    move v0, v5

    .line 226
    goto :goto_24
.end method

.method private static resolveReferenceStartingWithQueryString(Ljava/net/URI;Ljava/net/URI;)Ljava/net/URI;
    .registers 6
    .param p0, "baseURI"    # Ljava/net/URI;
    .param p1, "reference"    # Ljava/net/URI;

    .prologue
    const/16 v3, 0x3f

    .line 248
    invoke-virtual {p0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    .line 249
    .local v0, "baseUri":Ljava/lang/String;
    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v2, -0x1

    if-le v1, v2, :cond_16

    const/4 v1, 0x0

    .line 250
    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 251
    :cond_16
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    return-object v1
.end method

.method public static rewriteURI(Ljava/net/URI;)Ljava/net/URI;
    .registers 5
    .param p0, "uri"    # Ljava/net/URI;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 180
    const-string v1, "URI"

    invoke-static {p0, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 181
    invoke-virtual {p0}, Ljava/net/URI;->isOpaque()Z

    move-result v1

    if-eqz v1, :cond_d

    .line 195
    .end local p0    # "uri":Ljava/net/URI;
    :goto_c
    return-object p0

    .line 184
    .restart local p0    # "uri":Ljava/net/URI;
    :cond_d
    new-instance v0, Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    invoke-direct {v0, p0}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;-><init>(Ljava/net/URI;)V

    .line 185
    .local v0, "uribuilder":Lcz/msebera/android/httpclient/client/utils/URIBuilder;
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->getUserInfo()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1b

    .line 186
    invoke-virtual {v0, v3}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->setUserInfo(Ljava/lang/String;)Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    .line 188
    :cond_1b
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcz/msebera/android/httpclient/util/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2a

    .line 189
    const-string v1, "/"

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->setPath(Ljava/lang/String;)Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    .line 191
    :cond_2a
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->getHost()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3d

    .line 192
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->getHost()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->setHost(Ljava/lang/String;)Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    .line 194
    :cond_3d
    invoke-virtual {v0, v3}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->setFragment(Ljava/lang/String;)Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    .line 195
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->build()Ljava/net/URI;

    move-result-object p0

    goto :goto_c
.end method

.method public static rewriteURI(Ljava/net/URI;Lcz/msebera/android/httpclient/HttpHost;)Ljava/net/URI;
    .registers 3
    .param p0, "uri"    # Ljava/net/URI;
    .param p1, "target"    # Lcz/msebera/android/httpclient/HttpHost;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 165
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcz/msebera/android/httpclient/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;Lcz/msebera/android/httpclient/HttpHost;Z)Ljava/net/URI;

    move-result-object v0

    return-object v0
.end method

.method public static rewriteURI(Ljava/net/URI;Lcz/msebera/android/httpclient/HttpHost;Z)Ljava/net/URI;
    .registers 6
    .param p0, "uri"    # Ljava/net/URI;
    .param p1, "target"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "dropFragment"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 134
    const-string v1, "URI"

    invoke-static {p0, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 135
    invoke-virtual {p0}, Ljava/net/URI;->isOpaque()Z

    move-result v1

    if-eqz v1, :cond_d

    .line 154
    .end local p0    # "uri":Ljava/net/URI;
    :goto_c
    return-object p0

    .line 138
    .restart local p0    # "uri":Ljava/net/URI;
    :cond_d
    new-instance v0, Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    invoke-direct {v0, p0}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;-><init>(Ljava/net/URI;)V

    .line 139
    .local v0, "uribuilder":Lcz/msebera/android/httpclient/client/utils/URIBuilder;
    if-eqz p1, :cond_42

    .line 140
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->setScheme(Ljava/lang/String;)Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    .line 141
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->setHost(Ljava/lang/String;)Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    .line 142
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/HttpHost;->getPort()I

    move-result v1

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->setPort(I)Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    .line 148
    :goto_29
    if-eqz p2, :cond_2e

    .line 149
    invoke-virtual {v0, v2}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->setFragment(Ljava/lang/String;)Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    .line 151
    :cond_2e
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcz/msebera/android/httpclient/util/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3d

    .line 152
    const-string v1, "/"

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->setPath(Ljava/lang/String;)Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    .line 154
    :cond_3d
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->build()Ljava/net/URI;

    move-result-object p0

    goto :goto_c

    .line 144
    :cond_42
    invoke-virtual {v0, v2}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->setScheme(Ljava/lang/String;)Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    .line 145
    invoke-virtual {v0, v2}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->setHost(Ljava/lang/String;)Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    .line 146
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/client/utils/URIBuilder;->setPort(I)Lcz/msebera/android/httpclient/client/utils/URIBuilder;

    goto :goto_29
.end method
