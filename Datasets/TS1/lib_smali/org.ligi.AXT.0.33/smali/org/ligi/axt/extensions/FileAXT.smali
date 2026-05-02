.class public Lorg/ligi/axt/extensions/FileAXT;
.super Ljava/lang/Object;
.source "FileAXT.java"


# instance fields
.field private final file:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 2
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lorg/ligi/axt/extensions/FileAXT;->file:Ljava/io/File;

    .line 21
    return-void
.end method

.method private readToStringFromFileInputStream(Ljava/nio/charset/Charset;Ljava/io/FileInputStream;)Ljava/lang/String;
    .registers 10
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .param p2, "stream"    # Ljava/io/FileInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-virtual {p2}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    .line 45
    .local v0, "fc":Ljava/nio/channels/FileChannel;
    :try_start_4
    sget-object v1, Ljava/nio/channels/FileChannel$MapMode;->READ_ONLY:Ljava/nio/channels/FileChannel$MapMode;

    const-wide/16 v2, 0x0

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Ljava/nio/channels/FileChannel;->map(Ljava/nio/channels/FileChannel$MapMode;JJ)Ljava/nio/MappedByteBuffer;

    move-result-object v6

    .line 46
    .local v6, "bb":Ljava/nio/MappedByteBuffer;
    invoke-virtual {p1, v6}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;
    :try_end_17
    .catchall {:try_start_4 .. :try_end_17} :catchall_1c

    move-result-object v1

    .line 48
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V

    return-object v1

    .end local v6    # "bb":Ljava/nio/MappedByteBuffer;
    :catchall_1c
    move-exception v1

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V

    throw v1
.end method

.method private writeObjectToFile(Ljava/io/Serializable;)V
    .registers 4
    .param p1, "object"    # Ljava/io/Serializable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v1, p0, Lorg/ligi/axt/extensions/FileAXT;->file:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 130
    .local v0, "fos":Ljava/io/FileOutputStream;
    :try_start_7
    invoke-direct {p0, p1, v0}, Lorg/ligi/axt/extensions/FileAXT;->writeObjectToFileOutputStream(Ljava/io/Serializable;Ljava/io/FileOutputStream;)V
    :try_end_a
    .catchall {:try_start_7 .. :try_end_a} :catchall_e

    .line 132
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 134
    return-void

    .line 132
    :catchall_e
    move-exception v1

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    throw v1
.end method

.method private writeObjectToFileOutputStream(Ljava/io/Serializable;Ljava/io/FileOutputStream;)V
    .registers 5
    .param p1, "object"    # Ljava/io/Serializable;
    .param p2, "fos"    # Ljava/io/FileOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 137
    new-instance v0, Ljava/io/ObjectOutputStream;

    invoke-direct {v0, p2}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 139
    .local v0, "os":Ljava/io/ObjectOutputStream;
    :try_start_5
    invoke-virtual {v0, p1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_8
    .catchall {:try_start_5 .. :try_end_8} :catchall_c

    .line 141
    invoke-virtual {v0}, Ljava/io/ObjectOutputStream;->close()V

    .line 143
    return-void

    .line 141
    :catchall_c
    move-exception v1

    invoke-virtual {v0}, Ljava/io/ObjectOutputStream;->close()V

    throw v1
.end method

.method private writeStringToFile(Ljava/lang/String;)V
    .registers 4
    .param p1, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    new-instance v0, Ljava/io/FileWriter;

    iget-object v1, p0, Lorg/ligi/axt/extensions/FileAXT;->file:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    .line 64
    .local v0, "fileWriter":Ljava/io/FileWriter;
    :try_start_7
    invoke-virtual {v0, p1}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V
    :try_end_a
    .catchall {:try_start_7 .. :try_end_a} :catchall_e

    .line 66
    invoke-virtual {v0}, Ljava/io/FileWriter;->close()V

    .line 68
    return-void

    .line 66
    :catchall_e
    move-exception v1

    invoke-virtual {v0}, Ljava/io/FileWriter;->close()V

    throw v1
.end method


# virtual methods
.method public deleteRecursive()Z
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lorg/ligi/axt/extensions/FileAXT;->file:Ljava/io/File;

    invoke-virtual {p0, v0}, Lorg/ligi/axt/extensions/FileAXT;->deleteRecursive(Ljava/io/File;)Z

    move-result v0

    return v0
.end method

.method public deleteRecursive(Ljava/io/File;)Z
    .registers 8
    .param p1, "file2delete"    # Ljava/io/File;

    .prologue
    const/4 v2, 0x0

    .line 75
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_8

    .line 88
    :goto_7
    return v2

    .line 79
    :cond_8
    invoke-virtual {p1}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v3

    array-length v4, v3

    :goto_d
    if-ge v2, v4, :cond_26

    aget-object v0, v3, v2

    .line 80
    .local v0, "child":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 81
    .local v1, "temp":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_22

    .line 82
    invoke-virtual {p0, v1}, Lorg/ligi/axt/extensions/FileAXT;->deleteRecursive(Ljava/io/File;)Z

    .line 79
    :goto_1f
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 84
    :cond_22
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    goto :goto_1f

    .line 88
    .end local v0    # "child":Ljava/lang/String;
    .end local v1    # "temp":Ljava/io/File;
    :cond_26
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v2

    goto :goto_7
.end method

.method public loadToObject()Ljava/io/Serializable;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/io/Serializable;",
            ">()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;,
            Ljava/lang/ClassCastException;
        }
    .end annotation

    .prologue
    .line 92
    new-instance v0, Ljava/io/ObjectInputStream;

    new-instance v1, Ljava/io/FileInputStream;

    iget-object v2, p0, Lorg/ligi/axt/extensions/FileAXT;->file:Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 94
    .local v0, "is":Ljava/io/ObjectInputStream;
    :try_start_c
    invoke-virtual {v0}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/Serializable;
    :try_end_12
    .catchall {:try_start_c .. :try_end_12} :catchall_16

    .line 96
    invoke-virtual {v0}, Ljava/io/ObjectInputStream;->close()V

    return-object v1

    :catchall_16
    move-exception v1

    invoke-virtual {v0}, Ljava/io/ObjectInputStream;->close()V

    throw v1
.end method

.method public loadToObjectOrNull()Ljava/io/Serializable;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/io/Serializable;",
            ">()TT;"
        }
    .end annotation

    .prologue
    .line 102
    :try_start_0
    invoke-virtual {p0}, Lorg/ligi/axt/extensions/FileAXT;->loadToObject()Ljava/io/Serializable;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_5
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_8
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_3} :catch_a

    move-result-object v0

    .line 111
    :goto_4
    return-object v0

    .line 103
    :catch_5
    move-exception v0

    .line 111
    :goto_6
    const/4 v0, 0x0

    goto :goto_4

    .line 105
    :catch_8
    move-exception v0

    goto :goto_6

    .line 107
    :catch_a
    move-exception v0

    goto :goto_6
.end method

.method public readToString()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 30
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/ligi/axt/extensions/FileAXT;->readToString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readToString(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .registers 4
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 34
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lorg/ligi/axt/extensions/FileAXT;->file:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 36
    .local v0, "stream":Ljava/io/FileInputStream;
    :try_start_7
    invoke-direct {p0, p1, v0}, Lorg/ligi/axt/extensions/FileAXT;->readToStringFromFileInputStream(Ljava/nio/charset/Charset;Ljava/io/FileInputStream;)Ljava/lang/String;
    :try_end_a
    .catchall {:try_start_7 .. :try_end_a} :catchall_f

    move-result-object v1

    .line 38
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    return-object v1

    :catchall_f
    move-exception v1

    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    throw v1
.end method

.method public writeObject(Ljava/io/Serializable;)Z
    .registers 3
    .param p1, "object"    # Ljava/io/Serializable;

    .prologue
    .line 116
    :try_start_0
    invoke-direct {p0, p1}, Lorg/ligi/axt/extensions/FileAXT;->writeObjectToFile(Ljava/io/Serializable;)V
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_3} :catch_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_8

    .line 117
    const/4 v0, 0x1

    .line 124
    :goto_4
    return v0

    .line 118
    :catch_5
    move-exception v0

    .line 124
    :goto_6
    const/4 v0, 0x0

    goto :goto_4

    .line 120
    :catch_8
    move-exception v0

    goto :goto_6
.end method

.method public writeString(Ljava/lang/String;)Z
    .registers 4
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 54
    :try_start_0
    invoke-direct {p0, p1}, Lorg/ligi/axt/extensions/FileAXT;->writeStringToFile(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_5

    .line 55
    const/4 v1, 0x1

    .line 57
    :goto_4
    return v1

    .line 56
    :catch_5
    move-exception v0

    .line 57
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_4
.end method
