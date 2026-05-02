.class public abstract Lfreemarker/cache/URLTemplateLoader;
.super Ljava/lang/Object;
.source "URLTemplateLoader.java"

# interfaces
.implements Lfreemarker/cache/TemplateLoader;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static canonicalizePrefix(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "prefix"    # Ljava/lang/String;

    .prologue
    .line 119
    const/16 v0, 0x5c

    const/16 v1, 0x2f

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    .line 121
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_29

    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_29

    .line 123
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 125
    :cond_29
    return-object p0
.end method


# virtual methods
.method public closeTemplateSource(Ljava/lang/Object;)V
    .registers 2
    .param p1, "templateSource"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    check-cast p1, Lfreemarker/cache/URLTemplateSource;

    .end local p1    # "templateSource":Ljava/lang/Object;
    invoke-virtual {p1}, Lfreemarker/cache/URLTemplateSource;->close()V

    .line 107
    return-void
.end method

.method public findTemplateSource(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-virtual {p0, p1}, Lfreemarker/cache/URLTemplateLoader;->getURL(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 75
    .local v0, "url":Ljava/net/URL;
    if-nez v0, :cond_8

    const/4 v1, 0x0

    :goto_7
    return-object v1

    :cond_8
    new-instance v1, Lfreemarker/cache/URLTemplateSource;

    invoke-direct {v1, v0}, Lfreemarker/cache/URLTemplateSource;-><init>(Ljava/net/URL;)V

    goto :goto_7
.end method

.method public getLastModified(Ljava/lang/Object;)J
    .registers 4
    .param p1, "templateSource"    # Ljava/lang/Object;

    .prologue
    .line 90
    check-cast p1, Lfreemarker/cache/URLTemplateSource;

    .end local p1    # "templateSource":Ljava/lang/Object;
    invoke-virtual {p1}, Lfreemarker/cache/URLTemplateSource;->lastModified()J

    move-result-wide v0

    return-wide v0
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
    .line 97
    new-instance v0, Ljava/io/InputStreamReader;

    check-cast p1, Lfreemarker/cache/URLTemplateSource;

    .end local p1    # "templateSource":Ljava/lang/Object;
    invoke-virtual {p1}, Lfreemarker/cache/URLTemplateSource;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    return-object v0
.end method

.method protected abstract getURL(Ljava/lang/String;)Ljava/net/URL;
.end method
