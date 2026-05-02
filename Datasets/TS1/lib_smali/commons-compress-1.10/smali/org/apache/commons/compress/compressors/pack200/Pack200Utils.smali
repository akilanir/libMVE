.class public Lorg/apache/commons/compress/compressors/pack200/Pack200Utils;
.super Ljava/lang/Object;
.source "Pack200Utils.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static normalize(Ljava/io/File;)V
    .registers 2
    .param p0, "jar"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    const/4 v0, 0x0

    invoke-static {p0, p0, v0}, Lorg/apache/commons/compress/compressors/pack200/Pack200Utils;->normalize(Ljava/io/File;Ljava/io/File;Ljava/util/Map;)V

    .line 60
    return-void
.end method

.method public static normalize(Ljava/io/File;Ljava/io/File;)V
    .registers 3
    .param p0, "from"    # Ljava/io/File;
    .param p1, "to"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/compress/compressors/pack200/Pack200Utils;->normalize(Ljava/io/File;Ljava/io/File;Ljava/util/Map;)V

    .line 104
    return-void
.end method

.method public static normalize(Ljava/io/File;Ljava/io/File;Ljava/util/Map;)V
    .registers 13
    .param p0, "from"    # Ljava/io/File;
    .param p1, "to"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/io/File;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 126
    .local p2, "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p2, :cond_7

    .line 127
    new-instance p2, Ljava/util/HashMap;

    .end local p2    # "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 129
    .restart local p2    # "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_7
    const-string v8, "pack.segment.limit"

    const-string v9, "-1"

    invoke-interface {p2, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    const-string v8, "commons-compress"

    const-string v9, "pack200normalize"

    invoke-static {v8, v9}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 131
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->deleteOnExit()V

    .line 133
    :try_start_19
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1e
    .catchall {:try_start_19 .. :try_end_1e} :catchall_66

    .line 134
    .local v4, "os":Ljava/io/OutputStream;
    const/4 v2, 0x0

    .line 136
    .local v2, "j":Ljava/util/jar/JarFile;
    :try_start_1f
    invoke-static {}, Ljava/util/jar/Pack200;->newPacker()Ljava/util/jar/Pack200$Packer;

    move-result-object v6

    .line 137
    .local v6, "p":Ljava/util/jar/Pack200$Packer;
    invoke-interface {v6}, Ljava/util/jar/Pack200$Packer;->properties()Ljava/util/SortedMap;

    move-result-object v8

    invoke-interface {v8, p2}, Ljava/util/SortedMap;->putAll(Ljava/util/Map;)V

    .line 138
    new-instance v3, Ljava/util/jar/JarFile;

    invoke-direct {v3, p0}, Ljava/util/jar/JarFile;-><init>(Ljava/io/File;)V
    :try_end_2f
    .catchall {:try_start_1f .. :try_end_2f} :catchall_5a

    .end local v2    # "j":Ljava/util/jar/JarFile;
    .local v3, "j":Ljava/util/jar/JarFile;
    :try_start_2f
    invoke-interface {v6, v3, v4}, Ljava/util/jar/Pack200$Packer;->pack(Ljava/util/jar/JarFile;Ljava/io/OutputStream;)V
    :try_end_32
    .catchall {:try_start_2f .. :try_end_32} :catchall_6b

    .line 139
    const/4 v2, 0x0

    .line 140
    .end local v3    # "j":Ljava/util/jar/JarFile;
    .restart local v2    # "j":Ljava/util/jar/JarFile;
    :try_start_33
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    .line 141
    const/4 v4, 0x0

    .line 143
    invoke-static {}, Ljava/util/jar/Pack200;->newUnpacker()Ljava/util/jar/Pack200$Unpacker;

    move-result-object v7

    .line 144
    .local v7, "u":Ljava/util/jar/Pack200$Unpacker;
    new-instance v5, Ljava/util/jar/JarOutputStream;

    new-instance v8, Ljava/io/FileOutputStream;

    invoke-direct {v8, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v5, v8}, Ljava/util/jar/JarOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_45
    .catchall {:try_start_33 .. :try_end_45} :catchall_5a

    .line 145
    .end local v4    # "os":Ljava/io/OutputStream;
    .local v5, "os":Ljava/io/OutputStream;
    :try_start_45
    move-object v0, v5

    check-cast v0, Ljava/util/jar/JarOutputStream;

    move-object v8, v0

    invoke-interface {v7, v1, v8}, Ljava/util/jar/Pack200$Unpacker;->unpack(Ljava/io/File;Ljava/util/jar/JarOutputStream;)V
    :try_end_4c
    .catchall {:try_start_45 .. :try_end_4c} :catchall_6e

    .line 147
    if-eqz v2, :cond_51

    .line 148
    :try_start_4e
    invoke-virtual {v2}, Ljava/util/jar/JarFile;->close()V

    .line 150
    :cond_51
    if-eqz v5, :cond_56

    .line 151
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_56
    .catchall {:try_start_4e .. :try_end_56} :catchall_66

    .line 155
    :cond_56
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 157
    return-void

    .line 147
    .end local v5    # "os":Ljava/io/OutputStream;
    .end local v6    # "p":Ljava/util/jar/Pack200$Packer;
    .end local v7    # "u":Ljava/util/jar/Pack200$Unpacker;
    .restart local v4    # "os":Ljava/io/OutputStream;
    :catchall_5a
    move-exception v8

    :goto_5b
    if-eqz v2, :cond_60

    .line 148
    :try_start_5d
    invoke-virtual {v2}, Ljava/util/jar/JarFile;->close()V

    .line 150
    :cond_60
    if-eqz v4, :cond_65

    .line 151
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    :cond_65
    throw v8
    :try_end_66
    .catchall {:try_start_5d .. :try_end_66} :catchall_66

    .line 155
    .end local v2    # "j":Ljava/util/jar/JarFile;
    .end local v4    # "os":Ljava/io/OutputStream;
    :catchall_66
    move-exception v8

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    throw v8

    .line 147
    .restart local v3    # "j":Ljava/util/jar/JarFile;
    .restart local v4    # "os":Ljava/io/OutputStream;
    .restart local v6    # "p":Ljava/util/jar/Pack200$Packer;
    :catchall_6b
    move-exception v8

    move-object v2, v3

    .end local v3    # "j":Ljava/util/jar/JarFile;
    .restart local v2    # "j":Ljava/util/jar/JarFile;
    goto :goto_5b

    .end local v4    # "os":Ljava/io/OutputStream;
    .restart local v5    # "os":Ljava/io/OutputStream;
    .restart local v7    # "u":Ljava/util/jar/Pack200$Unpacker;
    :catchall_6e
    move-exception v8

    move-object v4, v5

    .end local v5    # "os":Ljava/io/OutputStream;
    .restart local v4    # "os":Ljava/io/OutputStream;
    goto :goto_5b
.end method

.method public static normalize(Ljava/io/File;Ljava/util/Map;)V
    .registers 2
    .param p0, "jar"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    .local p1, "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {p0, p0, p1}, Lorg/apache/commons/compress/compressors/pack200/Pack200Utils;->normalize(Ljava/io/File;Ljava/io/File;Ljava/util/Map;)V

    .line 80
    return-void
.end method
