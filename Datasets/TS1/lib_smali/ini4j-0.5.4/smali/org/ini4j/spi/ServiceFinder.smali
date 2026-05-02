.class final Lorg/ini4j/spi/ServiceFinder;
.super Ljava/lang/Object;
.source "ServiceFinder.java"


# static fields
.field private static final SERVICES_PATH:Ljava/lang/String; = "META-INF/services/"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method static findService(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 61
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    :try_start_0
    invoke-static {p0}, Lorg/ini4j/spi/ServiceFinder;->findServiceClass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_b} :catch_d

    move-result-object v1

    return-object v1

    .line 63
    :catch_d
    move-exception v0

    .line 65
    .local v0, "x":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Provider "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " could not be instantiated: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/IllegalArgumentException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    check-cast v1, Ljava/lang/IllegalArgumentException;

    throw v1
.end method

.method static findServiceClass(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/lang/Class",
            "<+TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 73
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 74
    .local v0, "classLoader":Ljava/lang/ClassLoader;
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/ini4j/spi/ServiceFinder;->findServiceClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 75
    .local v2, "serviceClassName":Ljava/lang/String;
    move-object v1, p0

    .line 77
    .local v1, "ret":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    if-eqz v2, :cond_19

    .line 81
    if-nez v0, :cond_1a

    :try_start_15
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 89
    :cond_19
    :goto_19
    return-object v1

    .line 81
    :cond_1a
    invoke-virtual {v0, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_1d
    .catch Ljava/lang/ClassNotFoundException; {:try_start_15 .. :try_end_1d} :catch_1f

    move-result-object v1

    goto :goto_19

    .line 83
    :catch_1f
    move-exception v3

    .line 85
    .local v3, "x":Ljava/lang/ClassNotFoundException;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Provider "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " not found"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/IllegalArgumentException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v4

    check-cast v4, Ljava/lang/IllegalArgumentException;

    throw v4
.end method

.method static findServiceClassName(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "serviceId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 94
    const/4 v0, 0x0

    .line 99
    .local v0, "serviceClassName":Ljava/lang/String;
    :try_start_1
    invoke-static {p0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_4} :catch_22

    move-result-object v1

    .line 101
    .local v1, "systemProp":Ljava/lang/String;
    if-eqz v1, :cond_8

    .line 103
    move-object v0, v1

    .line 111
    .end local v1    # "systemProp":Ljava/lang/String;
    :cond_8
    :goto_8
    if-nez v0, :cond_21

    .line 113
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "META-INF/services/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/ini4j/spi/ServiceFinder;->loadLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 116
    :cond_21
    return-object v0

    .line 106
    :catch_22
    move-exception v2

    goto :goto_8
.end method

.method private static loadLine(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "servicePath"    # Ljava/lang/String;

    .prologue
    .line 121
    const/4 v4, 0x0

    .line 126
    .local v4, "ret":Ljava/lang/String;
    const/4 v1, 0x0

    .line 127
    .local v1, "is":Ljava/io/InputStream;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 129
    .local v0, "classLoader":Ljava/lang/ClassLoader;
    if-nez v0, :cond_3b

    .line 131
    invoke-static {p0}, Ljava/lang/ClassLoader;->getSystemResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 138
    :goto_10
    if-eqz v1, :cond_3a

    .line 140
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    const-string v6, "UTF-8"

    invoke-direct {v5, v1, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v3, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 141
    .local v3, "rd":Ljava/io/BufferedReader;
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .line 143
    .local v2, "line":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    .line 144
    if-eqz v2, :cond_3a

    .line 146
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 147
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_3a

    .line 149
    const-string v5, "\\s|#"

    invoke-virtual {v2, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    aget-object v4, v5, v6

    .line 159
    .end local v0    # "classLoader":Ljava/lang/ClassLoader;
    .end local v2    # "line":Ljava/lang/String;
    .end local v3    # "rd":Ljava/io/BufferedReader;
    :cond_3a
    :goto_3a
    return-object v4

    .line 135
    .restart local v0    # "classLoader":Ljava/lang/ClassLoader;
    :cond_3b
    invoke-virtual {v0, p0}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_3e} :catch_40

    move-result-object v1

    goto :goto_10

    .line 154
    .end local v0    # "classLoader":Ljava/lang/ClassLoader;
    :catch_40
    move-exception v5

    goto :goto_3a
.end method
