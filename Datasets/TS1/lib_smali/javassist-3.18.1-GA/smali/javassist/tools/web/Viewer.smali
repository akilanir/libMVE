.class public Ljavassist/tools/web/Viewer;
.super Ljava/lang/ClassLoader;
.source "Viewer.java"


# instance fields
.field private port:I

.field private server:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "p"    # I

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/ClassLoader;-><init>()V

    .line 77
    iput-object p1, p0, Ljavassist/tools/web/Viewer;->server:Ljava/lang/String;

    .line 78
    iput p2, p0, Ljavassist/tools/web/Viewer;->port:I

    .line 79
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 7
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x0

    .line 59
    array-length v2, p0

    if-lt v2, v5, :cond_25

    .line 60
    new-instance v1, Ljavassist/tools/web/Viewer;

    aget-object v2, p0, v4

    const/4 v3, 0x1

    aget-object v3, p0, v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-direct {v1, v2, v3}, Ljavassist/tools/web/Viewer;-><init>(Ljava/lang/String;I)V

    .line 61
    .local v1, "cl":Ljavassist/tools/web/Viewer;
    array-length v2, p0

    add-int/lit8 v2, v2, -0x3

    new-array v0, v2, [Ljava/lang/String;

    .line 62
    .local v0, "args2":[Ljava/lang/String;
    array-length v2, p0

    add-int/lit8 v2, v2, -0x3

    invoke-static {p0, v5, v0, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 63
    const/4 v2, 0x2

    aget-object v2, p0, v2

    invoke-virtual {v1, v2, v0}, Ljavassist/tools/web/Viewer;->run(Ljava/lang/String;[Ljava/lang/String;)V

    .line 68
    .end local v0    # "args2":[Ljava/lang/String;
    .end local v1    # "cl":Ljavassist/tools/web/Viewer;
    :goto_24
    return-void

    .line 66
    :cond_25
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v3, "Usage: java javassist.tools.web.Viewer <host> <port> class [args ...]"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_24
.end method

.method private readStream(Ljava/io/InputStream;)[B
    .registers 9
    .param p1, "fin"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 191
    const/16 v5, 0x1000

    new-array v0, v5, [B

    .line 192
    .local v0, "buf":[B
    const/4 v4, 0x0

    .line 193
    .local v4, "size":I
    const/4 v1, 0x0

    .line 195
    .local v1, "len":I
    :cond_7
    add-int/2addr v4, v1

    .line 196
    array-length v5, v0

    sub-int/2addr v5, v4

    if-gtz v5, :cond_15

    .line 197
    array-length v5, v0

    mul-int/lit8 v5, v5, 0x2

    new-array v2, v5, [B

    .line 198
    .local v2, "newbuf":[B
    invoke-static {v0, v6, v2, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 199
    move-object v0, v2

    .line 202
    .end local v2    # "newbuf":[B
    :cond_15
    array-length v5, v0

    sub-int/2addr v5, v4

    invoke-virtual {p1, v0, v4, v5}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 203
    if-gez v1, :cond_7

    .line 205
    new-array v3, v4, [B

    .line 206
    .local v3, "result":[B
    invoke-static {v0, v6, v3, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 207
    return-object v3
.end method


# virtual methods
.method protected fetchClass(Ljava/lang/String;)[B
    .registers 15
    .param p1, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 164
    new-instance v6, Ljava/net/URL;

    const-string v7, "http"

    iget-object v8, p0, Ljavassist/tools/web/Viewer;->server:Ljava/lang/String;

    iget v9, p0, Ljavassist/tools/web/Viewer;->port:I

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const/16 v11, 0x2e

    const/16 v12, 0x2f

    invoke-virtual {p1, v11, v12}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ".class"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v6, v7, v8, v9, v10}, Ljava/net/URL;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 166
    .local v6, "url":Ljava/net/URL;
    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    .line 167
    .local v1, "con":Ljava/net/URLConnection;
    invoke-virtual {v1}, Ljava/net/URLConnection;->connect()V

    .line 168
    invoke-virtual {v1}, Ljava/net/URLConnection;->getContentLength()I

    move-result v5

    .line 169
    .local v5, "size":I
    invoke-virtual {v1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    .line 170
    .local v4, "s":Ljava/io/InputStream;
    if-gtz v5, :cond_45

    .line 171
    invoke-direct {p0, v4}, Ljavassist/tools/web/Viewer;->readStream(Ljava/io/InputStream;)[B

    move-result-object v0

    .line 186
    .local v0, "b":[B
    :goto_41
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 187
    return-object v0

    .line 173
    .end local v0    # "b":[B
    :cond_45
    new-array v0, v5, [B

    .line 174
    .restart local v0    # "b":[B
    const/4 v2, 0x0

    .line 176
    .local v2, "len":I
    :cond_48
    sub-int v7, v5, v2

    invoke-virtual {v4, v0, v2, v7}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    .line 177
    .local v3, "n":I
    if-gez v3, :cond_6c

    .line 178
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 179
    new-instance v7, Ljava/io/IOException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "the stream was closed: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 182
    :cond_6c
    add-int/2addr v2, v3

    .line 183
    if-lt v2, v5, :cond_48

    goto :goto_41
.end method

.method protected findClass(Ljava/lang/String;)Ljava/lang/Class;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 140
    const/4 v1, 0x0

    .line 141
    .local v1, "c":Ljava/lang/Class;
    const-string v2, "java."

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_19

    const-string v2, "javax."

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_19

    const-string v2, "javassist.tools.web.Viewer"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 143
    :cond_19
    invoke-virtual {p0, p1}, Ljavassist/tools/web/Viewer;->findSystemClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 145
    :cond_1d
    if-nez v1, :cond_2b

    .line 147
    :try_start_1f
    invoke-virtual {p0, p1}, Ljavassist/tools/web/Viewer;->fetchClass(Ljava/lang/String;)[B

    move-result-object v0

    .line 148
    .local v0, "b":[B
    if-eqz v0, :cond_2b

    .line 149
    const/4 v2, 0x0

    array-length v3, v0

    invoke-virtual {p0, p1, v0, v2, v3}, Ljavassist/tools/web/Viewer;->defineClass(Ljava/lang/String;[BII)Ljava/lang/Class;
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_2a} :catch_2c

    move-result-object v1

    .line 154
    .end local v0    # "b":[B
    :cond_2b
    :goto_2b
    return-object v1

    .line 151
    :catch_2c
    move-exception v2

    goto :goto_2b
.end method

.method public getPort()I
    .registers 2

    .prologue
    .line 89
    iget v0, p0, Ljavassist/tools/web/Viewer;->port:I

    return v0
.end method

.method public getServer()Ljava/lang/String;
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Ljavassist/tools/web/Viewer;->server:Ljava/lang/String;

    return-object v0
.end method

.method protected declared-synchronized loadClass(Ljava/lang/String;Z)Ljava/lang/Class;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "resolve"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 116
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0, p1}, Ljavassist/tools/web/Viewer;->findLoadedClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 117
    .local v0, "c":Ljava/lang/Class;
    if-nez v0, :cond_b

    .line 118
    invoke-virtual {p0, p1}, Ljavassist/tools/web/Viewer;->findClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 120
    :cond_b
    if-nez v0, :cond_16

    .line 121
    new-instance v1, Ljava/lang/ClassNotFoundException;

    invoke-direct {v1, p1}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_13
    .catchall {:try_start_1 .. :try_end_13} :catchall_13

    .line 116
    .end local v0    # "c":Ljava/lang/Class;
    :catchall_13
    move-exception v1

    monitor-exit p0

    throw v1

    .line 123
    .restart local v0    # "c":Ljava/lang/Class;
    :cond_16
    if-eqz p2, :cond_1b

    .line 124
    :try_start_18
    invoke-virtual {p0, v0}, Ljavassist/tools/web/Viewer;->resolveClass(Ljava/lang/Class;)V
    :try_end_1b
    .catchall {:try_start_18 .. :try_end_1b} :catchall_13

    .line 126
    :cond_1b
    monitor-exit p0

    return-object v0
.end method

.method public run(Ljava/lang/String;[Ljava/lang/String;)V
    .registers 9
    .param p1, "classname"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 100
    invoke-virtual {p0, p1}, Ljavassist/tools/web/Viewer;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 102
    .local v0, "c":Ljava/lang/Class;
    :try_start_4
    const-string v2, "main"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, [Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p2, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1c
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_4 .. :try_end_1c} :catch_1d

    .line 108
    return-void

    .line 105
    :catch_1d
    move-exception v1

    .line 106
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v2

    throw v2
.end method
