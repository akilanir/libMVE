.class public Lkorex/activation/MimetypesFileTypeMap;
.super Lkorex/activation/FileTypeMap;
.source "MimetypesFileTypeMap.java"


# static fields
.field private static final PROG:I

.field private static defDB:Lcom/sun/activation/registries/MimeTypeFile;

.field private static defaultType:Ljava/lang/String;


# instance fields
.field private DB:[Lcom/sun/activation/registries/MimeTypeFile;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 79
    const/4 v0, 0x0

    sput-object v0, Lkorex/activation/MimetypesFileTypeMap;->defDB:Lcom/sun/activation/registries/MimeTypeFile;

    .line 83
    const-string v0, "application/octet-stream"

    sput-object v0, Lkorex/activation/MimetypesFileTypeMap;->defaultType:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 8

    .prologue
    .line 88
    invoke-direct {p0}, Lkorex/activation/FileTypeMap;-><init>()V

    .line 89
    new-instance v0, Ljava/util/Vector;

    const/4 v5, 0x5

    invoke-direct {v0, v5}, Ljava/util/Vector;-><init>(I)V

    .line 90
    .local v0, "dbv":Ljava/util/Vector;
    const/4 v1, 0x0

    .line 91
    .local v1, "mf":Lcom/sun/activation/registries/MimeTypeFile;
    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 93
    const-string v5, "MimetypesFileTypeMap: load HOME"

    invoke-static {v5}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 95
    :try_start_13
    const-string v5, "user.home"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 97
    .local v4, "user_home":Ljava/lang/String;
    if-eqz v4, :cond_3d

    .line 98
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".mime.types"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 99
    .local v2, "path":Ljava/lang/String;
    invoke-direct {p0, v2}, Lkorex/activation/MimetypesFileTypeMap;->loadFile(Ljava/lang/String;)Lcom/sun/activation/registries/MimeTypeFile;

    move-result-object v1

    .line 100
    if-eqz v1, :cond_3d

    .line 101
    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_3d
    .catch Ljava/lang/SecurityException; {:try_start_13 .. :try_end_3d} :catch_b1

    .line 105
    .end local v2    # "path":Ljava/lang/String;
    .end local v4    # "user_home":Ljava/lang/String;
    :cond_3d
    :goto_3d
    const-string v5, "MimetypesFileTypeMap: load SYS"

    invoke-static {v5}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 108
    :try_start_42
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "java.home"

    invoke-static {v6}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "lib"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "mime.types"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 110
    .local v3, "system_mimetypes":Ljava/lang/String;
    invoke-direct {p0, v3}, Lkorex/activation/MimetypesFileTypeMap;->loadFile(Ljava/lang/String;)Lcom/sun/activation/registries/MimeTypeFile;

    move-result-object v1

    .line 111
    if-eqz v1, :cond_76

    .line 112
    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_76
    .catch Ljava/lang/SecurityException; {:try_start_42 .. :try_end_76} :catch_af

    .line 115
    .end local v3    # "system_mimetypes":Ljava/lang/String;
    :cond_76
    :goto_76
    const-string v5, "MimetypesFileTypeMap: load JAR"

    invoke-static {v5}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 117
    const-string v5, "META-INF/mime.types"

    invoke-direct {p0, v0, v5}, Lkorex/activation/MimetypesFileTypeMap;->loadAllResources(Ljava/util/Vector;Ljava/lang/String;)V

    .line 119
    const-string v5, "MimetypesFileTypeMap: load DEF"

    invoke-static {v5}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 120
    const-class v6, Lkorex/activation/MimetypesFileTypeMap;

    monitor-enter v6

    .line 122
    :try_start_88
    sget-object v5, Lkorex/activation/MimetypesFileTypeMap;->defDB:Lcom/sun/activation/registries/MimeTypeFile;

    if-nez v5, :cond_94

    .line 123
    const-string v5, "/META-INF/mimetypes.default"

    invoke-direct {p0, v5}, Lkorex/activation/MimetypesFileTypeMap;->loadResource(Ljava/lang/String;)Lcom/sun/activation/registries/MimeTypeFile;

    move-result-object v5

    sput-object v5, Lkorex/activation/MimetypesFileTypeMap;->defDB:Lcom/sun/activation/registries/MimeTypeFile;

    .line 124
    :cond_94
    monitor-exit v6
    :try_end_95
    .catchall {:try_start_88 .. :try_end_95} :catchall_ac

    .line 126
    sget-object v5, Lkorex/activation/MimetypesFileTypeMap;->defDB:Lcom/sun/activation/registries/MimeTypeFile;

    if-eqz v5, :cond_9e

    .line 127
    sget-object v5, Lkorex/activation/MimetypesFileTypeMap;->defDB:Lcom/sun/activation/registries/MimeTypeFile;

    invoke-virtual {v0, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 129
    :cond_9e
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v5

    new-array v5, v5, [Lcom/sun/activation/registries/MimeTypeFile;

    iput-object v5, p0, Lkorex/activation/MimetypesFileTypeMap;->DB:[Lcom/sun/activation/registries/MimeTypeFile;

    .line 130
    iget-object v5, p0, Lkorex/activation/MimetypesFileTypeMap;->DB:[Lcom/sun/activation/registries/MimeTypeFile;

    invoke-virtual {v0, v5}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 131
    return-void

    .line 124
    :catchall_ac
    move-exception v5

    :try_start_ad
    monitor-exit v6
    :try_end_ae
    .catchall {:try_start_ad .. :try_end_ae} :catchall_ac

    throw v5

    .line 113
    :catch_af
    move-exception v5

    goto :goto_76

    .line 103
    :catch_b1
    move-exception v5

    goto :goto_3d
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 5
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    .line 267
    invoke-direct {p0}, Lkorex/activation/MimetypesFileTypeMap;-><init>()V

    .line 269
    :try_start_3
    iget-object v0, p0, Lkorex/activation/MimetypesFileTypeMap;->DB:[Lcom/sun/activation/registries/MimeTypeFile;

    const/4 v1, 0x0

    new-instance v2, Lcom/sun/activation/registries/MimeTypeFile;

    invoke-direct {v2, p1}, Lcom/sun/activation/registries/MimeTypeFile;-><init>(Ljava/io/InputStream;)V

    aput-object v2, v0, v1
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_d} :catch_e

    .line 273
    :goto_d
    return-void

    .line 270
    :catch_e
    move-exception v0

    goto :goto_d
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 5
    .param p1, "mimeTypeFileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 256
    invoke-direct {p0}, Lkorex/activation/MimetypesFileTypeMap;-><init>()V

    .line 257
    iget-object v0, p0, Lkorex/activation/MimetypesFileTypeMap;->DB:[Lcom/sun/activation/registries/MimeTypeFile;

    const/4 v1, 0x0

    new-instance v2, Lcom/sun/activation/registries/MimeTypeFile;

    invoke-direct {v2, p1}, Lcom/sun/activation/registries/MimeTypeFile;-><init>(Ljava/lang/String;)V

    aput-object v2, v0, v1

    .line 258
    return-void
.end method

.method private loadAllResources(Ljava/util/Vector;Ljava/lang/String;)V
    .registers 15
    .param p1, "v"    # Ljava/util/Vector;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 170
    const/4 v0, 0x0

    .line 173
    .local v0, "anyLoaded":Z
    const/4 v1, 0x0

    .line 175
    .local v1, "cld":Ljava/lang/ClassLoader;
    :try_start_2
    invoke-static {}, Lkorex/activation/SecuritySupport;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 176
    if-nez v1, :cond_10

    .line 177
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 178
    :cond_10
    if-eqz v1, :cond_79

    .line 179
    invoke-static {v1, p2}, Lkorex/activation/SecuritySupport;->getResources(Ljava/lang/ClassLoader;Ljava/lang/String;)[Ljava/net/URL;

    move-result-object v9

    .line 182
    .local v9, "urls":[Ljava/net/URL;
    :goto_16
    if-eqz v9, :cond_109

    .line 183
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v10

    if-eqz v10, :cond_23

    .line 184
    const-string v10, "MimetypesFileTypeMap: getResources"

    invoke-static {v10}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 185
    :cond_23
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_24
    array-length v10, v9

    if-ge v4, v10, :cond_109

    .line 186
    aget-object v8, v9, v4

    .line 187
    .local v8, "url":Ljava/net/URL;
    const/4 v2, 0x0

    .line 188
    .local v2, "clis":Ljava/io/InputStream;
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v10

    if-eqz v10, :cond_46

    .line 189
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "MimetypesFileTypeMap: URL "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_46} :catch_ec

    .line 191
    :cond_46
    :try_start_46
    invoke-static {v8}, Lkorex/activation/SecuritySupport;->openStream(Ljava/net/URL;)Ljava/io/InputStream;

    move-result-object v2

    .line 192
    if-eqz v2, :cond_7e

    .line 193
    new-instance v10, Lcom/sun/activation/registries/MimeTypeFile;

    invoke-direct {v10, v2}, Lcom/sun/activation/registries/MimeTypeFile;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {p1, v10}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 194
    const/4 v0, 0x1

    .line 195
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v10

    if-eqz v10, :cond_71

    .line 196
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "MimetypesFileTypeMap: successfully loaded mime types from URL: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V
    :try_end_71
    .catch Ljava/io/IOException; {:try_start_46 .. :try_end_71} :catch_9b
    .catch Ljava/lang/SecurityException; {:try_start_46 .. :try_end_71} :catch_c0
    .catchall {:try_start_46 .. :try_end_71} :catchall_e5

    .line 215
    :cond_71
    :goto_71
    if-eqz v2, :cond_76

    .line 216
    :try_start_73
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_76
    .catch Ljava/io/IOException; {:try_start_73 .. :try_end_76} :catch_12d
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_76} :catch_ec

    .line 185
    :cond_76
    :goto_76
    add-int/lit8 v4, v4, 0x1

    goto :goto_24

    .line 181
    .end local v2    # "clis":Ljava/io/InputStream;
    .end local v4    # "i":I
    .end local v8    # "url":Ljava/net/URL;
    .end local v9    # "urls":[Ljava/net/URL;
    :cond_79
    :try_start_79
    invoke-static {p2}, Lkorex/activation/SecuritySupport;->getSystemResources(Ljava/lang/String;)[Ljava/net/URL;
    :try_end_7c
    .catch Ljava/lang/Exception; {:try_start_79 .. :try_end_7c} :catch_ec

    move-result-object v9

    .restart local v9    # "urls":[Ljava/net/URL;
    goto :goto_16

    .line 200
    .restart local v2    # "clis":Ljava/io/InputStream;
    .restart local v4    # "i":I
    .restart local v8    # "url":Ljava/net/URL;
    :cond_7e
    :try_start_7e
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v10

    if-eqz v10, :cond_71

    .line 201
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "MimetypesFileTypeMap: not loading mime types from URL: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V
    :try_end_9a
    .catch Ljava/io/IOException; {:try_start_7e .. :try_end_9a} :catch_9b
    .catch Ljava/lang/SecurityException; {:try_start_7e .. :try_end_9a} :catch_c0
    .catchall {:try_start_7e .. :try_end_9a} :catchall_e5

    goto :goto_71

    .line 205
    :catch_9b
    move-exception v5

    .line 206
    .local v5, "ioex":Ljava/io/IOException;
    :try_start_9c
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v10

    if-eqz v10, :cond_b8

    .line 207
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "MimetypesFileTypeMap: can\'t load "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10, v5}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_b8
    .catchall {:try_start_9c .. :try_end_b8} :catchall_e5

    .line 215
    :cond_b8
    if-eqz v2, :cond_76

    .line 216
    :try_start_ba
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_bd
    .catch Ljava/io/IOException; {:try_start_ba .. :try_end_bd} :catch_be
    .catch Ljava/lang/Exception; {:try_start_ba .. :try_end_bd} :catch_ec

    goto :goto_76

    .line 217
    :catch_be
    move-exception v10

    goto :goto_76

    .line 209
    .end local v5    # "ioex":Ljava/io/IOException;
    :catch_c0
    move-exception v7

    .line 210
    .local v7, "sex":Ljava/lang/SecurityException;
    :try_start_c1
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v10

    if-eqz v10, :cond_dd

    .line 211
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "MimetypesFileTypeMap: can\'t load "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10, v7}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_dd
    .catchall {:try_start_c1 .. :try_end_dd} :catchall_e5

    .line 215
    :cond_dd
    if-eqz v2, :cond_76

    .line 216
    :try_start_df
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_e2
    .catch Ljava/io/IOException; {:try_start_df .. :try_end_e2} :catch_e3
    .catch Ljava/lang/Exception; {:try_start_df .. :try_end_e2} :catch_ec

    goto :goto_76

    .line 217
    :catch_e3
    move-exception v10

    goto :goto_76

    .line 214
    .end local v7    # "sex":Ljava/lang/SecurityException;
    :catchall_e5
    move-exception v10

    .line 215
    if-eqz v2, :cond_eb

    .line 216
    :try_start_e8
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_eb
    .catch Ljava/io/IOException; {:try_start_e8 .. :try_end_eb} :catch_130
    .catch Ljava/lang/Exception; {:try_start_e8 .. :try_end_eb} :catch_ec

    .line 217
    :cond_eb
    :goto_eb
    :try_start_eb
    throw v10
    :try_end_ec
    .catch Ljava/lang/Exception; {:try_start_eb .. :try_end_ec} :catch_ec

    .line 221
    .end local v2    # "clis":Ljava/io/InputStream;
    .end local v4    # "i":I
    .end local v8    # "url":Ljava/net/URL;
    .end local v9    # "urls":[Ljava/net/URL;
    :catch_ec
    move-exception v3

    .line 222
    .local v3, "ex":Ljava/lang/Exception;
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v10

    if-eqz v10, :cond_109

    .line 223
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "MimetypesFileTypeMap: can\'t load "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10, v3}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 227
    .end local v3    # "ex":Ljava/lang/Exception;
    :cond_109
    if-nez v0, :cond_12c

    .line 228
    const-string v10, "MimetypesFileTypeMap: !anyLoaded"

    invoke-static {v10}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 229
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v10}, Lkorex/activation/MimetypesFileTypeMap;->loadResource(Ljava/lang/String;)Lcom/sun/activation/registries/MimeTypeFile;

    move-result-object v6

    .line 230
    .local v6, "mf":Lcom/sun/activation/registries/MimeTypeFile;
    if-eqz v6, :cond_12c

    .line 231
    invoke-virtual {p1, v6}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 233
    .end local v6    # "mf":Lcom/sun/activation/registries/MimeTypeFile;
    :cond_12c
    return-void

    .line 217
    .restart local v2    # "clis":Ljava/io/InputStream;
    .restart local v4    # "i":I
    .restart local v8    # "url":Ljava/net/URL;
    .restart local v9    # "urls":[Ljava/net/URL;
    :catch_12d
    move-exception v10

    goto/16 :goto_76

    :catch_130
    move-exception v11

    goto :goto_eb
.end method

.method private loadFile(Ljava/lang/String;)Lcom/sun/activation/registries/MimeTypeFile;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 239
    const/4 v0, 0x0

    .line 242
    .local v0, "mtf":Lcom/sun/activation/registries/MimeTypeFile;
    :try_start_1
    new-instance v1, Lcom/sun/activation/registries/MimeTypeFile;

    invoke-direct {v1, p1}, Lcom/sun/activation/registries/MimeTypeFile;-><init>(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_6} :catch_8

    .end local v0    # "mtf":Lcom/sun/activation/registries/MimeTypeFile;
    .local v1, "mtf":Lcom/sun/activation/registries/MimeTypeFile;
    move-object v0, v1

    .line 246
    .end local v1    # "mtf":Lcom/sun/activation/registries/MimeTypeFile;
    .restart local v0    # "mtf":Lcom/sun/activation/registries/MimeTypeFile;
    :goto_7
    return-object v0

    .line 243
    :catch_8
    move-exception v2

    goto :goto_7
.end method

.method private loadResource(Ljava/lang/String;)Lcom/sun/activation/registries/MimeTypeFile;
    .registers 8
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 137
    const/4 v0, 0x0

    .line 139
    .local v0, "clis":Ljava/io/InputStream;
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-static {v4, p1}, Lkorex/activation/SecuritySupport;->getResourceAsStream(Ljava/lang/Class;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 140
    if-eqz v0, :cond_32

    .line 141
    new-instance v2, Lcom/sun/activation/registries/MimeTypeFile;

    invoke-direct {v2, v0}, Lcom/sun/activation/registries/MimeTypeFile;-><init>(Ljava/io/InputStream;)V

    .line 142
    .local v2, "mf":Lcom/sun/activation/registries/MimeTypeFile;
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v4

    if-eqz v4, :cond_2c

    .line 143
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "MimetypesFileTypeMap: successfully loaded mime types file: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V
    :try_end_2c
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_2c} :catch_55
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_2c} :catch_7a
    .catchall {:try_start_1 .. :try_end_2c} :catchall_9f

    .line 159
    :cond_2c
    if-eqz v0, :cond_31

    .line 160
    :try_start_2e
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_31} :catch_a6

    .line 163
    .end local v2    # "mf":Lcom/sun/activation/registries/MimeTypeFile;
    :cond_31
    :goto_31
    return-object v2

    .line 147
    :cond_32
    :try_start_32
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v4

    if-eqz v4, :cond_4e

    .line 148
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "MimetypesFileTypeMap: not loading mime types file: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V
    :try_end_4e
    .catch Ljava/io/IOException; {:try_start_32 .. :try_end_4e} :catch_55
    .catch Ljava/lang/SecurityException; {:try_start_32 .. :try_end_4e} :catch_7a
    .catchall {:try_start_32 .. :try_end_4e} :catchall_9f

    .line 159
    :cond_4e
    if-eqz v0, :cond_53

    .line 160
    :try_start_50
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_53
    .catch Ljava/io/IOException; {:try_start_50 .. :try_end_53} :catch_a8

    .line 163
    :cond_53
    :goto_53
    const/4 v2, 0x0

    goto :goto_31

    .line 151
    :catch_55
    move-exception v1

    .line 152
    .local v1, "e":Ljava/io/IOException;
    :try_start_56
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v4

    if-eqz v4, :cond_72

    .line 153
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "MimetypesFileTypeMap: can\'t load "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v1}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_72
    .catchall {:try_start_56 .. :try_end_72} :catchall_9f

    .line 159
    :cond_72
    if-eqz v0, :cond_53

    .line 160
    :try_start_74
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_77
    .catch Ljava/io/IOException; {:try_start_74 .. :try_end_77} :catch_78

    goto :goto_53

    .line 161
    :catch_78
    move-exception v4

    goto :goto_53

    .line 154
    .end local v1    # "e":Ljava/io/IOException;
    :catch_7a
    move-exception v3

    .line 155
    .local v3, "sex":Ljava/lang/SecurityException;
    :try_start_7b
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v4

    if-eqz v4, :cond_97

    .line 156
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "MimetypesFileTypeMap: can\'t load "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v3}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_97
    .catchall {:try_start_7b .. :try_end_97} :catchall_9f

    .line 159
    :cond_97
    if-eqz v0, :cond_53

    .line 160
    :try_start_99
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_9c
    .catch Ljava/io/IOException; {:try_start_99 .. :try_end_9c} :catch_9d

    goto :goto_53

    .line 161
    :catch_9d
    move-exception v4

    goto :goto_53

    .line 158
    .end local v3    # "sex":Ljava/lang/SecurityException;
    :catchall_9f
    move-exception v4

    .line 159
    if-eqz v0, :cond_a5

    .line 160
    :try_start_a2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_a5
    .catch Ljava/io/IOException; {:try_start_a2 .. :try_end_a5} :catch_aa

    .line 161
    :cond_a5
    :goto_a5
    throw v4

    .restart local v2    # "mf":Lcom/sun/activation/registries/MimeTypeFile;
    :catch_a6
    move-exception v4

    goto :goto_31

    .end local v2    # "mf":Lcom/sun/activation/registries/MimeTypeFile;
    :catch_a8
    move-exception v4

    goto :goto_53

    :catch_aa
    move-exception v5

    goto :goto_a5
.end method


# virtual methods
.method public declared-synchronized addMimeTypes(Ljava/lang/String;)V
    .registers 5
    .param p1, "mime_types"    # Ljava/lang/String;

    .prologue
    .line 282
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/activation/MimetypesFileTypeMap;->DB:[Lcom/sun/activation/registries/MimeTypeFile;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    if-nez v0, :cond_12

    .line 283
    iget-object v0, p0, Lkorex/activation/MimetypesFileTypeMap;->DB:[Lcom/sun/activation/registries/MimeTypeFile;

    const/4 v1, 0x0

    new-instance v2, Lcom/sun/activation/registries/MimeTypeFile;

    invoke-direct {v2}, Lcom/sun/activation/registries/MimeTypeFile;-><init>()V

    aput-object v2, v0, v1

    .line 285
    :cond_12
    iget-object v0, p0, Lkorex/activation/MimetypesFileTypeMap;->DB:[Lcom/sun/activation/registries/MimeTypeFile;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0, p1}, Lcom/sun/activation/registries/MimeTypeFile;->appendToRegistry(Ljava/lang/String;)V
    :try_end_1a
    .catchall {:try_start_1 .. :try_end_1a} :catchall_1c

    .line 286
    monitor-exit p0

    return-void

    .line 282
    :catchall_1c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getContentType(Ljava/io/File;)Ljava/lang/String;
    .registers 3
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 297
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lkorex/activation/MimetypesFileTypeMap;->getContentType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getContentType(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 310
    monitor-enter p0

    :try_start_1
    const-string v4, "."

    invoke-virtual {p1, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 312
    .local v0, "dot_pos":I
    if-gez v0, :cond_d

    .line 313
    sget-object v3, Lkorex/activation/MimetypesFileTypeMap;->defaultType:Ljava/lang/String;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_39

    .line 326
    :goto_b
    monitor-exit p0

    return-object v3

    .line 315
    :cond_d
    add-int/lit8 v4, v0, 0x1

    :try_start_f
    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 316
    .local v1, "file_ext":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_1c

    .line 317
    sget-object v3, Lkorex/activation/MimetypesFileTypeMap;->defaultType:Ljava/lang/String;

    goto :goto_b

    .line 319
    :cond_1c
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1d
    iget-object v4, p0, Lkorex/activation/MimetypesFileTypeMap;->DB:[Lcom/sun/activation/registries/MimeTypeFile;

    array-length v4, v4

    if-ge v2, v4, :cond_36

    .line 320
    iget-object v4, p0, Lkorex/activation/MimetypesFileTypeMap;->DB:[Lcom/sun/activation/registries/MimeTypeFile;

    aget-object v4, v4, v2

    if-nez v4, :cond_2b

    .line 319
    :cond_28
    add-int/lit8 v2, v2, 0x1

    goto :goto_1d

    .line 322
    :cond_2b
    iget-object v4, p0, Lkorex/activation/MimetypesFileTypeMap;->DB:[Lcom/sun/activation/registries/MimeTypeFile;

    aget-object v4, v4, v2

    invoke-virtual {v4, v1}, Lcom/sun/activation/registries/MimeTypeFile;->getMIMETypeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 323
    .local v3, "result":Ljava/lang/String;
    if-eqz v3, :cond_28

    goto :goto_b

    .line 326
    .end local v3    # "result":Ljava/lang/String;
    :cond_36
    sget-object v3, Lkorex/activation/MimetypesFileTypeMap;->defaultType:Ljava/lang/String;
    :try_end_38
    .catchall {:try_start_f .. :try_end_38} :catchall_39

    goto :goto_b

    .line 310
    .end local v0    # "dot_pos":I
    .end local v1    # "file_ext":Ljava/lang/String;
    .end local v2    # "i":I
    :catchall_39
    move-exception v4

    monitor-exit p0

    throw v4
.end method
