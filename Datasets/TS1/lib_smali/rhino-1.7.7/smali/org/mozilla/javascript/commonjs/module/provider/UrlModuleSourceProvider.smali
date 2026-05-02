.class public Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;
.super Lorg/mozilla/javascript/commonjs/module/provider/ModuleSourceProviderBase;
.source "UrlModuleSourceProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final fallbackUris:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable",
            "<",
            "Ljava/net/URI;",
            ">;"
        }
    .end annotation
.end field

.field private final privilegedUris:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable",
            "<",
            "Ljava/net/URI;",
            ">;"
        }
    .end annotation
.end field

.field private final urlConnectionExpiryCalculator:Lorg/mozilla/javascript/commonjs/module/provider/UrlConnectionExpiryCalculator;

.field private final urlConnectionSecurityDomainProvider:Lorg/mozilla/javascript/commonjs/module/provider/UrlConnectionSecurityDomainProvider;


# direct methods
.method public constructor <init>(Ljava/lang/Iterable;Ljava/lang/Iterable;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/net/URI;",
            ">;",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/net/URI;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 56
    .local p1, "privilegedUris":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/net/URI;>;"
    .local p2, "fallbackUris":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/net/URI;>;"
    new-instance v0, Lorg/mozilla/javascript/commonjs/module/provider/DefaultUrlConnectionExpiryCalculator;

    invoke-direct {v0}, Lorg/mozilla/javascript/commonjs/module/provider/DefaultUrlConnectionExpiryCalculator;-><init>()V

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;-><init>(Ljava/lang/Iterable;Ljava/lang/Iterable;Lorg/mozilla/javascript/commonjs/module/provider/UrlConnectionExpiryCalculator;Lorg/mozilla/javascript/commonjs/module/provider/UrlConnectionSecurityDomainProvider;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/lang/Iterable;Ljava/lang/Iterable;Lorg/mozilla/javascript/commonjs/module/provider/UrlConnectionExpiryCalculator;Lorg/mozilla/javascript/commonjs/module/provider/UrlConnectionSecurityDomainProvider;)V
    .registers 5
    .param p3, "urlConnectionExpiryCalculator"    # Lorg/mozilla/javascript/commonjs/module/provider/UrlConnectionExpiryCalculator;
    .param p4, "urlConnectionSecurityDomainProvider"    # Lorg/mozilla/javascript/commonjs/module/provider/UrlConnectionSecurityDomainProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/net/URI;",
            ">;",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/net/URI;",
            ">;",
            "Lorg/mozilla/javascript/commonjs/module/provider/UrlConnectionExpiryCalculator;",
            "Lorg/mozilla/javascript/commonjs/module/provider/UrlConnectionSecurityDomainProvider;",
            ")V"
        }
    .end annotation

    .prologue
    .line 80
    .local p1, "privilegedUris":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/net/URI;>;"
    .local p2, "fallbackUris":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/net/URI;>;"
    invoke-direct {p0}, Lorg/mozilla/javascript/commonjs/module/provider/ModuleSourceProviderBase;-><init>()V

    .line 81
    iput-object p1, p0, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->privilegedUris:Ljava/lang/Iterable;

    .line 82
    iput-object p2, p0, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->fallbackUris:Ljava/lang/Iterable;

    .line 83
    iput-object p3, p0, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->urlConnectionExpiryCalculator:Lorg/mozilla/javascript/commonjs/module/provider/UrlConnectionExpiryCalculator;

    .line 84
    iput-object p4, p0, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->urlConnectionSecurityDomainProvider:Lorg/mozilla/javascript/commonjs/module/provider/UrlConnectionSecurityDomainProvider;

    .line 86
    return-void
.end method

.method private close(Ljava/net/URLConnection;)V
    .registers 4
    .param p1, "urlConnection"    # Ljava/net/URLConnection;

    .prologue
    .line 211
    :try_start_0
    invoke-virtual {p1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_7} :catch_8

    .line 216
    :goto_7
    return-void

    .line 213
    :catch_8
    move-exception v0

    .line 214
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {p0, p1, v0}, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->onFailedClosingUrlConnection(Ljava/net/URLConnection;Ljava/io/IOException;)V

    goto :goto_7
.end method

.method private static getCharacterEncoding(Ljava/net/URLConnection;)Ljava/lang/String;
    .registers 5
    .param p0, "urlConnection"    # Ljava/net/URLConnection;

    .prologue
    .line 188
    new-instance v2, Lorg/mozilla/javascript/commonjs/module/provider/ParsedContentType;

    invoke-virtual {p0}, Ljava/net/URLConnection;->getContentType()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/mozilla/javascript/commonjs/module/provider/ParsedContentType;-><init>(Ljava/lang/String;)V

    .line 190
    .local v2, "pct":Lorg/mozilla/javascript/commonjs/module/provider/ParsedContentType;
    invoke-virtual {v2}, Lorg/mozilla/javascript/commonjs/module/provider/ParsedContentType;->getEncoding()Ljava/lang/String;

    move-result-object v1

    .line 191
    .local v1, "encoding":Ljava/lang/String;
    if-eqz v1, :cond_10

    .line 199
    .end local v1    # "encoding":Ljava/lang/String;
    :goto_f
    return-object v1

    .line 194
    .restart local v1    # "encoding":Ljava/lang/String;
    :cond_10
    invoke-virtual {v2}, Lorg/mozilla/javascript/commonjs/module/provider/ParsedContentType;->getContentType()Ljava/lang/String;

    move-result-object v0

    .line 195
    .local v0, "contentType":Ljava/lang/String;
    if-eqz v0, :cond_21

    const-string v3, "text/"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_21

    .line 196
    const-string v1, "8859_1"

    goto :goto_f

    .line 199
    :cond_21
    const-string v1, "utf-8"

    goto :goto_f
.end method

.method private static getReader(Ljava/net/URLConnection;)Ljava/io/Reader;
    .registers 4
    .param p0, "urlConnection"    # Ljava/net/URLConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 183
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-static {p0}, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->getCharacterEncoding(Ljava/net/URLConnection;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    return-object v0
.end method

.method private getSecurityDomain(Ljava/net/URLConnection;)Ljava/lang/Object;
    .registers 3
    .param p1, "urlConnection"    # Ljava/net/URLConnection;

    .prologue
    .line 204
    iget-object v0, p0, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->urlConnectionSecurityDomainProvider:Lorg/mozilla/javascript/commonjs/module/provider/UrlConnectionSecurityDomainProvider;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->urlConnectionSecurityDomainProvider:Lorg/mozilla/javascript/commonjs/module/provider/UrlConnectionSecurityDomainProvider;

    invoke-interface {v0, p1}, Lorg/mozilla/javascript/commonjs/module/provider/UrlConnectionSecurityDomainProvider;->getSecurityDomain(Ljava/net/URLConnection;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_5
.end method

.method private loadFromPathList(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Iterable;)Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;
    .registers 9
    .param p1, "moduleId"    # Ljava/lang/String;
    .param p2, "validator"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/net/URI;",
            ">;)",
            "Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .local p3, "paths":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/net/URI;>;"
    const/4 v3, 0x0

    .line 108
    if-nez p3, :cond_5

    move-object v1, v3

    .line 118
    :goto_4
    return-object v1

    .line 111
    :cond_5
    invoke-interface {p3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_20

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/URI;

    .line 112
    .local v2, "path":Ljava/net/URI;
    invoke-virtual {v2, p1}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v4

    invoke-virtual {p0, v4, v2, p2}, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->loadFromUri(Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;)Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;

    move-result-object v1

    .line 114
    .local v1, "moduleSource":Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;
    if-eqz v1, :cond_9

    goto :goto_4

    .end local v1    # "moduleSource":Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;
    .end local v2    # "path":Ljava/net/URI;
    :cond_20
    move-object v1, v3

    .line 118
    goto :goto_4
.end method


# virtual methods
.method protected entityNeedsRevalidation(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "validator"    # Ljava/lang/Object;

    .prologue
    .line 241
    instance-of v0, p1, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;

    if-eqz v0, :cond_c

    check-cast p1, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;

    .end local p1    # "validator":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->entityNeedsRevalidation()Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method protected loadFromActualUri(Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;)Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;
    .registers 21
    .param p1, "uri"    # Ljava/net/URI;
    .param p2, "base"    # Ljava/net/URI;
    .param p3, "validator"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 137
    new-instance v15, Ljava/net/URL;

    if-nez p2, :cond_45

    const/4 v1, 0x0

    :goto_5
    invoke-virtual/range {p1 .. p1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v15, v1, v2}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    .line 138
    .local v15, "url":Ljava/net/URL;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 139
    .local v4, "request_time":J
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->openUrlConnection(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object v3

    .line 141
    .local v3, "urlConnection":Ljava/net/URLConnection;
    move-object/from16 v0, p3

    instance-of v1, v0, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;

    if-eqz v1, :cond_4c

    move-object/from16 v14, p3

    .line 142
    check-cast v14, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;

    .line 143
    .local v14, "uriValidator":Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;
    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->appliesTo(Ljava/net/URI;)Z

    move-result v1

    if-eqz v1, :cond_4a

    move-object v12, v14

    .line 149
    .end local v14    # "uriValidator":Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;
    .local v12, "applicableValidator":Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;
    :goto_29
    if-eqz v12, :cond_2e

    .line 150
    invoke-virtual {v12, v3}, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->applyConditionals(Ljava/net/URLConnection;)V

    .line 153
    :cond_2e
    :try_start_2e
    invoke-virtual {v3}, Ljava/net/URLConnection;->connect()V

    .line 154
    if-eqz v12, :cond_4e

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->urlConnectionExpiryCalculator:Lorg/mozilla/javascript/commonjs/module/provider/UrlConnectionExpiryCalculator;

    invoke-virtual {v12, v3, v4, v5, v1}, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->updateValidator(Ljava/net/URLConnection;JLorg/mozilla/javascript/commonjs/module/provider/UrlConnectionExpiryCalculator;)Z

    move-result v1

    if-eqz v1, :cond_4e

    .line 158
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->close(Ljava/net/URLConnection;)V

    .line 159
    sget-object v1, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->NOT_MODIFIED:Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;
    :try_end_44
    .catch Ljava/io/FileNotFoundException; {:try_start_2e .. :try_end_44} :catch_72
    .catch Ljava/lang/RuntimeException; {:try_start_2e .. :try_end_44} :catch_75
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_44} :catch_7c

    .line 168
    :goto_44
    return-object v1

    .line 137
    .end local v3    # "urlConnection":Ljava/net/URLConnection;
    .end local v4    # "request_time":J
    .end local v12    # "applicableValidator":Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;
    .end local v15    # "url":Ljava/net/URL;
    :cond_45
    invoke-virtual/range {p2 .. p2}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v1

    goto :goto_5

    .line 143
    .restart local v3    # "urlConnection":Ljava/net/URLConnection;
    .restart local v4    # "request_time":J
    .restart local v14    # "uriValidator":Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;
    .restart local v15    # "url":Ljava/net/URL;
    :cond_4a
    const/4 v12, 0x0

    goto :goto_29

    .line 147
    .end local v14    # "uriValidator":Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;
    :cond_4c
    const/4 v12, 0x0

    .restart local v12    # "applicableValidator":Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;
    goto :goto_29

    .line 162
    :cond_4e
    :try_start_4e
    new-instance v16, Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;

    invoke-static {v3}, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->getReader(Ljava/net/URLConnection;)Ljava/io/Reader;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->getSecurityDomain(Ljava/net/URLConnection;)Ljava/lang/Object;

    move-result-object v8

    new-instance v1, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->urlConnectionExpiryCalculator:Lorg/mozilla/javascript/commonjs/module/provider/UrlConnectionExpiryCalculator;

    move-object/from16 v2, p1

    invoke-direct/range {v1 .. v6}, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;-><init>(Ljava/net/URI;Ljava/net/URLConnection;JLorg/mozilla/javascript/commonjs/module/provider/UrlConnectionExpiryCalculator;)V

    move-object/from16 v6, v16

    move-object/from16 v9, p1

    move-object/from16 v10, p2

    move-object v11, v1

    invoke-direct/range {v6 .. v11}, Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;-><init>(Ljava/io/Reader;Ljava/lang/Object;Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;)V
    :try_end_6f
    .catch Ljava/io/FileNotFoundException; {:try_start_4e .. :try_end_6f} :catch_72
    .catch Ljava/lang/RuntimeException; {:try_start_4e .. :try_end_6f} :catch_75
    .catch Ljava/io/IOException; {:try_start_4e .. :try_end_6f} :catch_7c

    move-object/from16 v1, v16

    goto :goto_44

    .line 167
    :catch_72
    move-exception v13

    .line 168
    .local v13, "e":Ljava/io/FileNotFoundException;
    const/4 v1, 0x0

    goto :goto_44

    .line 170
    .end local v13    # "e":Ljava/io/FileNotFoundException;
    :catch_75
    move-exception v13

    .line 171
    .local v13, "e":Ljava/lang/RuntimeException;
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->close(Ljava/net/URLConnection;)V

    .line 172
    throw v13

    .line 174
    .end local v13    # "e":Ljava/lang/RuntimeException;
    :catch_7c
    move-exception v13

    .line 175
    .local v13, "e":Ljava/io/IOException;
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->close(Ljava/net/URLConnection;)V

    .line 176
    throw v13
.end method

.method protected loadFromFallbackLocations(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;
    .registers 4
    .param p1, "moduleId"    # Ljava/lang/String;
    .param p2, "validator"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 101
    iget-object v0, p0, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->fallbackUris:Ljava/lang/Iterable;

    invoke-direct {p0, p1, p2, v0}, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->loadFromPathList(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Iterable;)Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;

    move-result-object v0

    return-object v0
.end method

.method protected loadFromPrivilegedLocations(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;
    .registers 4
    .param p1, "moduleId"    # Ljava/lang/String;
    .param p2, "validator"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 93
    iget-object v0, p0, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->privilegedUris:Ljava/lang/Iterable;

    invoke-direct {p0, p1, p2, v0}, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->loadFromPathList(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Iterable;)Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;

    move-result-object v0

    return-object v0
.end method

.method protected loadFromUri(Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;)Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;
    .registers 8
    .param p1, "uri"    # Ljava/net/URI;
    .param p2, "base"    # Ljava/net/URI;
    .param p3, "validator"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 126
    new-instance v0, Ljava/net/URI;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".js"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 127
    .local v0, "fullUri":Ljava/net/URI;
    invoke-virtual {p0, v0, p2, p3}, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->loadFromActualUri(Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;)Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;

    move-result-object v1

    .line 130
    .local v1, "source":Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;
    if-eqz v1, :cond_1f

    .end local v1    # "source":Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;
    :goto_1e
    return-object v1

    .restart local v1    # "source":Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;
    :cond_1f
    invoke-virtual {p0, p1, p2, p3}, Lorg/mozilla/javascript/commonjs/module/provider/UrlModuleSourceProvider;->loadFromActualUri(Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;)Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;

    move-result-object v1

    goto :goto_1e
.end method

.method protected onFailedClosingUrlConnection(Ljava/net/URLConnection;Ljava/io/IOException;)V
    .registers 3
    .param p1, "urlConnection"    # Ljava/net/URLConnection;
    .param p2, "cause"    # Ljava/io/IOException;

    .prologue
    .line 226
    return-void
.end method

.method protected openUrlConnection(Ljava/net/URL;)Ljava/net/URLConnection;
    .registers 3
    .param p1, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 236
    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    return-object v0
.end method
