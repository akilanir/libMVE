.class public Lfreemarker/cache/WebappTemplateLoader;
.super Ljava/lang/Object;
.source "WebappTemplateLoader.java"

# interfaces
.implements Lfreemarker/cache/TemplateLoader;


# static fields
.field private static final logger:Lfreemarker/log/Logger;


# instance fields
.field private final path:Ljava/lang/String;

.field private final servletContext:Ljavax/servlet/ServletContext;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 75
    const-string v0, "freemarker.cache"

    invoke-static {v0}, Lfreemarker/log/Logger;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v0

    sput-object v0, Lfreemarker/cache/WebappTemplateLoader;->logger:Lfreemarker/log/Logger;

    return-void
.end method

.method public constructor <init>(Ljavax/servlet/ServletContext;)V
    .registers 3
    .param p1, "servletContext"    # Ljavax/servlet/ServletContext;

    .prologue
    .line 90
    const-string v0, "/"

    invoke-direct {p0, p1, v0}, Lfreemarker/cache/WebappTemplateLoader;-><init>(Ljavax/servlet/ServletContext;Ljava/lang/String;)V

    .line 91
    return-void
.end method

.method public constructor <init>(Ljavax/servlet/ServletContext;Ljava/lang/String;)V
    .registers 5
    .param p1, "servletContext"    # Ljavax/servlet/ServletContext;
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    if-nez p1, :cond_d

    .line 107
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "servletContext == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 109
    :cond_d
    if-nez p2, :cond_17

    .line 110
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "path == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 113
    :cond_17
    const/16 v0, 0x5c

    const/16 v1, 0x2f

    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p2

    .line 114
    const-string v0, "/"

    invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3a

    .line 115
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    .line 117
    :cond_3a
    const-string v0, "/"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_55

    .line 118
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    .line 120
    :cond_55
    iput-object p2, p0, Lfreemarker/cache/WebappTemplateLoader;->path:Ljava/lang/String;

    .line 121
    iput-object p1, p0, Lfreemarker/cache/WebappTemplateLoader;->servletContext:Ljavax/servlet/ServletContext;

    .line 122
    return-void
.end method


# virtual methods
.method public closeTemplateSource(Ljava/lang/Object;)V
    .registers 3
    .param p1, "templateSource"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 176
    instance-of v0, p1, Ljava/io/File;

    if-eqz v0, :cond_5

    .line 181
    .end local p1    # "templateSource":Ljava/lang/Object;
    :goto_4
    return-void

    .line 179
    .restart local p1    # "templateSource":Ljava/lang/Object;
    :cond_5
    check-cast p1, Lfreemarker/cache/URLTemplateSource;

    .end local p1    # "templateSource":Ljava/lang/Object;
    invoke-virtual {p1}, Lfreemarker/cache/URLTemplateSource;->close()V

    goto :goto_4
.end method

.method public findTemplateSource(Ljava/lang/String;)Ljava/lang/Object;
    .registers 11
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 125
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v7, p0, Lfreemarker/cache/WebappTemplateLoader;->path:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 128
    .local v2, "fullPath":Ljava/lang/String;
    :try_start_14
    iget-object v6, p0, Lfreemarker/cache/WebappTemplateLoader;->servletContext:Ljavax/servlet/ServletContext;

    invoke-interface {v6, v2}, Ljavax/servlet/ServletContext;->getRealPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 129
    .local v3, "realPath":Ljava/lang/String;
    if-eqz v3, :cond_31

    .line 130
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 131
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v6

    if-nez v6, :cond_28

    .line 151
    .end local v1    # "file":Ljava/io/File;
    .end local v3    # "realPath":Ljava/lang/String;
    :cond_27
    :goto_27
    return-object v5

    .line 134
    .restart local v1    # "file":Ljava/io/File;
    .restart local v3    # "realPath":Ljava/lang/String;
    :cond_28
    invoke-virtual {v1}, Ljava/io/File;->canRead()Z
    :try_end_2b
    .catch Ljava/lang/SecurityException; {:try_start_14 .. :try_end_2b} :catch_30

    move-result v6

    if-eqz v6, :cond_31

    move-object v5, v1

    .line 135
    goto :goto_27

    .line 138
    .end local v1    # "file":Ljava/io/File;
    .end local v3    # "realPath":Ljava/lang/String;
    :catch_30
    move-exception v6

    .line 143
    :cond_31
    const/4 v4, 0x0

    .line 145
    .local v4, "url":Ljava/net/URL;
    :try_start_32
    iget-object v6, p0, Lfreemarker/cache/WebappTemplateLoader;->servletContext:Ljavax/servlet/ServletContext;

    invoke-interface {v6, v2}, Ljavax/servlet/ServletContext;->getResource(Ljava/lang/String;)Ljava/net/URL;
    :try_end_37
    .catch Ljava/net/MalformedURLException; {:try_start_32 .. :try_end_37} :catch_40

    move-result-object v4

    .line 151
    if-eqz v4, :cond_27

    new-instance v5, Lfreemarker/cache/URLTemplateSource;

    invoke-direct {v5, v4}, Lfreemarker/cache/URLTemplateSource;-><init>(Ljava/net/URL;)V

    goto :goto_27

    .line 146
    :catch_40
    move-exception v0

    .line 147
    .local v0, "e":Ljava/net/MalformedURLException;
    sget-object v6, Lfreemarker/cache/WebappTemplateLoader;->logger:Lfreemarker/log/Logger;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "Could not retrieve resource "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-static {v2}, Lfreemarker/template/utility/StringUtil;->jQuoteNoXSS(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v0}, Lfreemarker/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_27
.end method

.method public getLastModified(Ljava/lang/Object;)J
    .registers 4
    .param p1, "templateSource"    # Ljava/lang/Object;

    .prologue
    .line 155
    instance-of v0, p1, Ljava/io/File;

    if-eqz v0, :cond_b

    .line 156
    check-cast p1, Ljava/io/File;

    .end local p1    # "templateSource":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    .line 158
    :goto_a
    return-wide v0

    .restart local p1    # "templateSource":Ljava/lang/Object;
    :cond_b
    check-cast p1, Lfreemarker/cache/URLTemplateSource;

    .end local p1    # "templateSource":Ljava/lang/Object;
    invoke-virtual {p1}, Lfreemarker/cache/URLTemplateSource;->lastModified()J

    move-result-wide v0

    goto :goto_a
.end method

.method public getReader(Ljava/lang/Object;Ljava/lang/String;)Ljava/io/Reader;
    .registers 5
    .param p1, "templateSource"    # Ljava/lang/Object;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 164
    instance-of v0, p1, Ljava/io/File;

    if-eqz v0, :cond_11

    .line 165
    new-instance v0, Ljava/io/InputStreamReader;

    new-instance v1, Ljava/io/FileInputStream;

    check-cast p1, Ljava/io/File;

    .end local p1    # "templateSource":Ljava/lang/Object;
    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v1, p2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 169
    :goto_10
    return-object v0

    .restart local p1    # "templateSource":Ljava/lang/Object;
    :cond_11
    new-instance v0, Ljava/io/InputStreamReader;

    check-cast p1, Lfreemarker/cache/URLTemplateSource;

    .end local p1    # "templateSource":Ljava/lang/Object;
    invoke-virtual {p1}, Lfreemarker/cache/URLTemplateSource;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    goto :goto_10
.end method
