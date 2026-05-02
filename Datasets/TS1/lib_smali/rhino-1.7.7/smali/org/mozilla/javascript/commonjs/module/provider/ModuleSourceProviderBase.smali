.class public abstract Lorg/mozilla/javascript/commonjs/module/provider/ModuleSourceProviderBase;
.super Ljava/lang/Object;
.source "ModuleSourceProviderBase.java"

# interfaces
.implements Lorg/mozilla/javascript/commonjs/module/provider/ModuleSourceProvider;
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static ensureTrailingSlash(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 92
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    .end local p0    # "path":Ljava/lang/String;
    :goto_8
    return-object p0

    .restart local p0    # "path":Ljava/lang/String;
    :cond_9
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_8
.end method

.method private loadFromPathArray(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;
    .registers 14
    .param p1, "moduleId"    # Ljava/lang/String;
    .param p2, "paths"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "validator"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    const-string v8, "length"

    invoke-static {p2, v8}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    invoke-static {v8}, Lorg/mozilla/javascript/ScriptRuntime;->toUint32(Ljava/lang/Object;)J

    move-result-wide v3

    .line 67
    .local v3, "llength":J
    const-wide/32 v8, 0x7fffffff

    cmp-long v8, v3, v8

    if-lez v8, :cond_48

    const v2, 0x7fffffff

    .line 70
    .local v2, "ilength":I
    :goto_14
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_15
    if-ge v1, v2, :cond_58

    .line 71
    const-class v8, Ljava/lang/String;

    invoke-static {p2, v1, v8}, Lorg/mozilla/javascript/ScriptableObject;->getTypedProperty(Lorg/mozilla/javascript/Scriptable;ILjava/lang/Class;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Lorg/mozilla/javascript/commonjs/module/provider/ModuleSourceProviderBase;->ensureTrailingSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 74
    .local v6, "path":Ljava/lang/String;
    :try_start_23
    new-instance v7, Ljava/net/URI;

    invoke-direct {v7, v6}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 75
    .local v7, "uri":Ljava/net/URI;
    invoke-virtual {v7}, Ljava/net/URI;->isAbsolute()Z

    move-result v8

    if-nez v8, :cond_3d

    .line 76
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v8

    const-string v9, ""

    invoke-virtual {v8, v9}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v7

    .line 78
    :cond_3d
    invoke-virtual {v7, p1}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v8

    invoke-virtual {p0, v8, v7, p3}, Lorg/mozilla/javascript/commonjs/module/provider/ModuleSourceProviderBase;->loadFromUri(Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;)Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;
    :try_end_44
    .catch Ljava/net/URISyntaxException; {:try_start_23 .. :try_end_44} :catch_4a

    move-result-object v5

    .line 80
    .local v5, "moduleSource":Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;
    if-eqz v5, :cond_55

    .line 88
    .end local v5    # "moduleSource":Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;
    .end local v6    # "path":Ljava/lang/String;
    .end local v7    # "uri":Ljava/net/URI;
    :goto_47
    return-object v5

    .line 67
    .end local v1    # "i":I
    .end local v2    # "ilength":I
    :cond_48
    long-to-int v2, v3

    goto :goto_14

    .line 84
    .restart local v1    # "i":I
    .restart local v2    # "ilength":I
    .restart local v6    # "path":Ljava/lang/String;
    :catch_4a
    move-exception v0

    .line 85
    .local v0, "e":Ljava/net/URISyntaxException;
    new-instance v8, Ljava/net/MalformedURLException;

    invoke-virtual {v0}, Ljava/net/URISyntaxException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 70
    .end local v0    # "e":Ljava/net/URISyntaxException;
    .restart local v5    # "moduleSource":Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;
    .restart local v7    # "uri":Ljava/net/URI;
    :cond_55
    add-int/lit8 v1, v1, 0x1

    goto :goto_15

    .line 88
    .end local v5    # "moduleSource":Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;
    .end local v6    # "path":Ljava/lang/String;
    .end local v7    # "uri":Ljava/net/URI;
    :cond_58
    const/4 v5, 0x0

    goto :goto_47
.end method


# virtual methods
.method protected entityNeedsRevalidation(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "validator"    # Ljava/lang/Object;

    .prologue
    .line 108
    const/4 v0, 0x1

    return v0
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
    .line 170
    const/4 v0, 0x0

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
    .line 149
    const/4 v0, 0x0

    return-object v0
.end method

.method protected abstract loadFromUri(Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;)Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/URISyntaxException;
        }
    .end annotation
.end method

.method public loadSource(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;
    .registers 6
    .param p1, "moduleId"    # Ljava/lang/String;
    .param p2, "paths"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "validator"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 37
    invoke-virtual {p0, p3}, Lorg/mozilla/javascript/commonjs/module/provider/ModuleSourceProviderBase;->entityNeedsRevalidation(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 38
    sget-object v0, Lorg/mozilla/javascript/commonjs/module/provider/ModuleSourceProviderBase;->NOT_MODIFIED:Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;

    .line 53
    :cond_8
    :goto_8
    return-object v0

    .line 41
    :cond_9
    invoke-virtual {p0, p1, p3}, Lorg/mozilla/javascript/commonjs/module/provider/ModuleSourceProviderBase;->loadFromPrivilegedLocations(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;

    move-result-object v0

    .line 43
    .local v0, "moduleSource":Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;
    if-nez v0, :cond_8

    .line 46
    if-eqz p2, :cond_17

    .line 47
    invoke-direct {p0, p1, p2, p3}, Lorg/mozilla/javascript/commonjs/module/provider/ModuleSourceProviderBase;->loadFromPathArray(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;

    move-result-object v0

    .line 49
    if-nez v0, :cond_8

    .line 53
    :cond_17
    invoke-virtual {p0, p1, p3}, Lorg/mozilla/javascript/commonjs/module/provider/ModuleSourceProviderBase;->loadFromFallbackLocations(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;

    move-result-object v0

    goto :goto_8
.end method

.method public loadSource(Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;)Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;
    .registers 5
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
    .line 58
    invoke-virtual {p0, p1, p2, p3}, Lorg/mozilla/javascript/commonjs/module/provider/ModuleSourceProviderBase;->loadFromUri(Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;)Lorg/mozilla/javascript/commonjs/module/provider/ModuleSource;

    move-result-object v0

    return-object v0
.end method
