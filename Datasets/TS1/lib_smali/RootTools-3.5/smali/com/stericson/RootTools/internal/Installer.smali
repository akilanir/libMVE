.class Lcom/stericson/RootTools/internal/Installer;
.super Ljava/lang/Object;
.source "Installer.java"


# static fields
.field static final BOGUS_FILE_NAME:Ljava/lang/String; = "bogus"

.field static final LOG_TAG:Ljava/lang/String; = "RootTools::Installer"


# instance fields
.field context:Landroid/content/Context;

.field filesPath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Lcom/stericson/RootTools/internal/Installer;->context:Landroid/content/Context;

    .line 63
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/stericson/RootTools/internal/Installer;->filesPath:Ljava/lang/String;

    .line 64
    return-void
.end method

.method private commandWait(Lcom/stericson/RootTools/execution/Command;)V
    .registers 5
    .param p1, "cmd"    # Lcom/stericson/RootTools/execution/Command;

    .prologue
    .line 218
    monitor-enter p1

    .line 220
    :try_start_1
    invoke-virtual {p1}, Lcom/stericson/RootTools/execution/Command;->isFinished()Z

    move-result v1

    if-nez v1, :cond_c

    .line 221
    const-wide/16 v1, 0x7d0

    invoke-virtual {p1, v1, v2}, Ljava/lang/Object;->wait(J)V
    :try_end_c
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_c} :catch_e
    .catchall {:try_start_1 .. :try_end_c} :catchall_19

    .line 226
    :cond_c
    :goto_c
    :try_start_c
    monitor-exit p1

    .line 227
    return-void

    .line 223
    :catch_e
    move-exception v0

    .line 224
    .local v0, "ex":Ljava/lang/InterruptedException;
    const-string v1, "RootTools::Installer"

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_c

    .line 226
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :catchall_19
    move-exception v1

    monitor-exit p1
    :try_end_1b
    .catchall {:try_start_c .. :try_end_1b} :catchall_19

    throw v1
.end method


# virtual methods
.method protected getFileSignature(Ljava/io/File;)Ljava/lang/String;
    .registers 6
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 180
    const-string v1, ""

    .line 182
    .local v1, "signature":Ljava/lang/String;
    :try_start_2
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {p0, v2}, Lcom/stericson/RootTools/internal/Installer;->getStreamSignature(Ljava/io/InputStream;)Ljava/lang/String;
    :try_end_a
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_a} :catch_c

    move-result-object v1

    .line 186
    :goto_b
    return-object v1

    .line 183
    :catch_c
    move-exception v0

    .line 184
    .local v0, "ex":Ljava/io/FileNotFoundException;
    const-string v2, "RootTools::Installer"

    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_b
.end method

.method protected getStreamSignature(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 12
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    .line 193
    const-string v7, ""

    .line 195
    .local v7, "signature":Ljava/lang/String;
    :try_start_2
    const-string v8, "MD5"

    invoke-static {v8}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v5

    .line 196
    .local v5, "md":Ljava/security/MessageDigest;
    new-instance v2, Ljava/security/DigestInputStream;

    invoke-direct {v2, p1, v5}, Ljava/security/DigestInputStream;-><init>(Ljava/io/InputStream;Ljava/security/MessageDigest;)V

    .line 197
    .local v2, "dis":Ljava/security/DigestInputStream;
    const/16 v8, 0x1000

    new-array v0, v8, [B

    .line 198
    .local v0, "buffer":[B
    :cond_11
    const/4 v8, -0x1

    invoke-virtual {v2, v0}, Ljava/security/DigestInputStream;->read([B)I

    move-result v9

    if-ne v8, v9, :cond_11

    .line 199
    invoke-virtual {v5}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    .line 200
    .local v1, "digest":[B
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    .line 202
    .local v6, "sb":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_22
    array-length v8, v1

    if-ge v4, v8, :cond_33

    .line 203
    aget-byte v8, v1, v4

    and-int/lit16 v8, v8, 0xff

    invoke-static {v8}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 202
    add-int/lit8 v4, v4, 0x1

    goto :goto_22

    .line 205
    :cond_33
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_36
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_36} :catch_3b
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2 .. :try_end_36} :catch_4b
    .catchall {:try_start_2 .. :try_end_36} :catchall_5b

    move-result-object v7

    .line 212
    :try_start_37
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_3a
    .catch Ljava/io/IOException; {:try_start_37 .. :try_end_3a} :catch_60

    .line 214
    .end local v0    # "buffer":[B
    .end local v1    # "digest":[B
    .end local v2    # "dis":Ljava/security/DigestInputStream;
    .end local v4    # "i":I
    .end local v5    # "md":Ljava/security/MessageDigest;
    .end local v6    # "sb":Ljava/lang/StringBuffer;
    :goto_3a
    return-object v7

    .line 206
    :catch_3b
    move-exception v3

    .line 207
    .local v3, "ex":Ljava/io/IOException;
    :try_start_3c
    const-string v8, "RootTools::Installer"

    invoke-virtual {v3}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_45
    .catchall {:try_start_3c .. :try_end_45} :catchall_5b

    .line 212
    :try_start_45
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_48
    .catch Ljava/io/IOException; {:try_start_45 .. :try_end_48} :catch_49

    goto :goto_3a

    :catch_49
    move-exception v8

    goto :goto_3a

    .line 208
    .end local v3    # "ex":Ljava/io/IOException;
    :catch_4b
    move-exception v3

    .line 209
    .local v3, "ex":Ljava/security/NoSuchAlgorithmException;
    :try_start_4c
    const-string v8, "RootTools::Installer"

    invoke-virtual {v3}, Ljava/security/NoSuchAlgorithmException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_55
    .catchall {:try_start_4c .. :try_end_55} :catchall_5b

    .line 212
    :try_start_55
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_58
    .catch Ljava/io/IOException; {:try_start_55 .. :try_end_58} :catch_59

    goto :goto_3a

    :catch_59
    move-exception v8

    goto :goto_3a

    .end local v3    # "ex":Ljava/security/NoSuchAlgorithmException;
    :catchall_5b
    move-exception v8

    :try_start_5c
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_5f
    .catch Ljava/io/IOException; {:try_start_5c .. :try_end_5f} :catch_62

    :goto_5f
    throw v8

    .restart local v0    # "buffer":[B
    .restart local v1    # "digest":[B
    .restart local v2    # "dis":Ljava/security/DigestInputStream;
    .restart local v4    # "i":I
    .restart local v5    # "md":Ljava/security/MessageDigest;
    .restart local v6    # "sb":Ljava/lang/StringBuffer;
    :catch_60
    move-exception v8

    goto :goto_3a

    .end local v0    # "buffer":[B
    .end local v1    # "digest":[B
    .end local v2    # "dis":Ljava/security/DigestInputStream;
    .end local v4    # "i":I
    .end local v5    # "md":Ljava/security/MessageDigest;
    .end local v6    # "sb":Ljava/lang/StringBuffer;
    :catch_62
    move-exception v9

    goto :goto_5f
.end method

.method protected installBinary(ILjava/lang/String;Ljava/lang/String;)Z
    .registers 27
    .param p1, "sourceId"    # I
    .param p2, "destName"    # Ljava/lang/String;
    .param p3, "mode"    # Ljava/lang/String;

    .prologue
    .line 79
    new-instance v14, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/stericson/RootTools/internal/Installer;->filesPath:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p2

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v14, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 80
    .local v14, "mf":Ljava/io/File;
    invoke-virtual {v14}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_48

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/stericson/RootTools/internal/Installer;->getFileSignature(Ljava/io/File;)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/stericson/RootTools/internal/Installer;->context:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    move/from16 v0, p1

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/stericson/RootTools/internal/Installer;->getStreamSignature(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_10b

    .line 85
    :cond_48
    const-string v6, "RootTools::Installer"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Installing a new version of binary: "

    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p2

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    :try_start_64
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/stericson/RootTools/internal/Installer;->context:Landroid/content/Context;

    const-string v7, "bogus"

    invoke-virtual {v6, v7}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v11

    .line 91
    .local v11, "fis":Ljava/io/FileInputStream;
    invoke-virtual {v11}, Ljava/io/FileInputStream;->close()V
    :try_end_71
    .catch Ljava/io/FileNotFoundException; {:try_start_64 .. :try_end_71} :catch_10d
    .catch Ljava/io/IOException; {:try_start_64 .. :try_end_71} :catch_16d

    .line 118
    .end local v11    # "fis":Ljava/io/FileInputStream;
    :cond_71
    :goto_71
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/stericson/RootTools/internal/Installer;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    move/from16 v0, p1

    invoke-virtual {v6, v0}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v13

    .line 119
    .local v13, "iss":Ljava/io/InputStream;
    invoke-static {v13}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/InputStream;)Ljava/nio/channels/ReadableByteChannel;

    move-result-object v3

    .line 120
    .local v3, "rfc":Ljava/nio/channels/ReadableByteChannel;
    const/4 v15, 0x0

    .line 122
    .local v15, "oss":Ljava/io/FileOutputStream;
    :try_start_84
    new-instance v16, Ljava/io/FileOutputStream;

    move-object/from16 v0, v16

    invoke-direct {v0, v14}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_8b
    .catch Ljava/io/FileNotFoundException; {:try_start_84 .. :try_end_8b} :catch_1a0
    .catchall {:try_start_84 .. :try_end_8b} :catchall_1c3

    .line 123
    .end local v15    # "oss":Ljava/io/FileOutputStream;
    .local v16, "oss":Ljava/io/FileOutputStream;
    :try_start_8b
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;
    :try_end_8e
    .catch Ljava/io/FileNotFoundException; {:try_start_8b .. :try_end_8e} :catch_1ee
    .catchall {:try_start_8b .. :try_end_8e} :catchall_1ea

    move-result-object v2

    .line 124
    .local v2, "ofc":Ljava/nio/channels/FileChannel;
    const-wide/16 v4, 0x0

    .line 126
    .local v4, "pos":J
    :try_start_91
    invoke-virtual {v13}, Ljava/io/InputStream;->available()I

    move-result v6

    int-to-long v0, v6

    move-wide/from16 v17, v0

    .line 127
    .local v17, "size":J
    :cond_98
    sub-long v6, v17, v4

    invoke-virtual/range {v2 .. v7}, Ljava/nio/channels/FileChannel;->transferFrom(Ljava/nio/channels/ReadableByteChannel;JJ)J
    :try_end_9d
    .catch Ljava/io/IOException; {:try_start_91 .. :try_end_9d} :catch_17d
    .catch Ljava/io/FileNotFoundException; {:try_start_91 .. :try_end_9d} :catch_1ee
    .catchall {:try_start_91 .. :try_end_9d} :catchall_1ea

    move-result-wide v6

    add-long/2addr v4, v6

    cmp-long v6, v4, v17

    if-ltz v6, :cond_98

    .line 141
    if-eqz v16, :cond_b2

    .line 143
    :try_start_a5
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileOutputStream;->flush()V

    .line 144
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/FileDescriptor;->sync()V

    .line 145
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileOutputStream;->close()V
    :try_end_b2
    .catch Ljava/lang/Exception; {:try_start_a5 .. :try_end_b2} :catch_1f2

    .line 151
    :cond_b2
    :goto_b2
    :try_start_b2
    invoke-virtual {v13}, Ljava/io/InputStream;->close()V
    :try_end_b5
    .catch Ljava/io/IOException; {:try_start_b2 .. :try_end_b5} :catch_1d4

    .line 160
    :try_start_b5
    new-instance v8, Lcom/stericson/RootTools/execution/CommandCapture;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "chmod "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, " "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/stericson/RootTools/internal/Installer;->filesPath:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    sget-object v22, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    aput-object v21, v19, v20

    move-object/from16 v0, v19

    invoke-direct {v8, v6, v7, v0}, Lcom/stericson/RootTools/execution/CommandCapture;-><init>(IZ[Ljava/lang/String;)V

    .line 161
    .local v8, "command":Lcom/stericson/RootTools/execution/CommandCapture;
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v6

    invoke-virtual {v6, v8}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 162
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcom/stericson/RootTools/internal/Installer;->commandWait(Lcom/stericson/RootTools/execution/Command;)V
    :try_end_10b
    .catch Ljava/lang/Exception; {:try_start_b5 .. :try_end_10b} :catch_1e5

    .line 166
    .end local v2    # "ofc":Ljava/nio/channels/FileChannel;
    .end local v3    # "rfc":Ljava/nio/channels/ReadableByteChannel;
    .end local v4    # "pos":J
    .end local v8    # "command":Lcom/stericson/RootTools/execution/CommandCapture;
    .end local v13    # "iss":Ljava/io/InputStream;
    .end local v16    # "oss":Ljava/io/FileOutputStream;
    .end local v17    # "size":J
    :cond_10b
    :goto_10b
    const/4 v6, 0x1

    :cond_10c
    :goto_10c
    return v6

    .line 92
    :catch_10d
    move-exception v9

    .line 93
    .local v9, "e":Ljava/io/FileNotFoundException;
    const/4 v12, 0x0

    .line 95
    .local v12, "fos":Ljava/io/FileOutputStream;
    :try_start_10f
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/stericson/RootTools/internal/Installer;->context:Landroid/content/Context;

    const-string v7, "bogus"

    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v6, v7, v0}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v12

    .line 96
    const-string v6, "justcreatedfilesdirectory"

    invoke-virtual {v6}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-virtual {v12, v6}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_126
    .catch Ljava/lang/Exception; {:try_start_10f .. :try_end_126} :catch_139
    .catchall {:try_start_10f .. :try_end_126} :catchall_15b

    .line 103
    if-eqz v12, :cond_71

    .line 105
    :try_start_128
    invoke-virtual {v12}, Ljava/io/FileOutputStream;->close()V

    .line 106
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/stericson/RootTools/internal/Installer;->context:Landroid/content/Context;

    const-string v7, "bogus"

    invoke-virtual {v6, v7}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z
    :try_end_134
    .catch Ljava/io/IOException; {:try_start_128 .. :try_end_134} :catch_136

    goto/16 :goto_71

    .line 107
    :catch_136
    move-exception v6

    goto/16 :goto_71

    .line 97
    :catch_139
    move-exception v10

    .line 98
    .local v10, "ex":Ljava/lang/Exception;
    :try_start_13a
    sget-boolean v6, Lcom/stericson/RootTools/RootTools;->debugMode:Z

    if-eqz v6, :cond_147

    .line 99
    const-string v6, "RootTools::Installer"

    invoke-virtual {v10}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_147
    .catchall {:try_start_13a .. :try_end_147} :catchall_15b

    .line 101
    :cond_147
    const/4 v6, 0x0

    .line 103
    if-eqz v12, :cond_10c

    .line 105
    :try_start_14a
    invoke-virtual {v12}, Ljava/io/FileOutputStream;->close()V

    .line 106
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/stericson/RootTools/internal/Installer;->context:Landroid/content/Context;

    const-string v19, "bogus"

    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z
    :try_end_158
    .catch Ljava/io/IOException; {:try_start_14a .. :try_end_158} :catch_159

    goto :goto_10c

    .line 107
    :catch_159
    move-exception v7

    goto :goto_10c

    .line 103
    .end local v10    # "ex":Ljava/lang/Exception;
    :catchall_15b
    move-exception v6

    if-eqz v12, :cond_16c

    .line 105
    :try_start_15e
    invoke-virtual {v12}, Ljava/io/FileOutputStream;->close()V

    .line 106
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/stericson/RootTools/internal/Installer;->context:Landroid/content/Context;

    const-string v19, "bogus"

    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z
    :try_end_16c
    .catch Ljava/io/IOException; {:try_start_15e .. :try_end_16c} :catch_1f5

    .line 107
    :cond_16c
    :goto_16c
    throw v6

    .line 110
    .end local v9    # "e":Ljava/io/FileNotFoundException;
    .end local v12    # "fos":Ljava/io/FileOutputStream;
    :catch_16d
    move-exception v10

    .line 111
    .local v10, "ex":Ljava/io/IOException;
    sget-boolean v6, Lcom/stericson/RootTools/RootTools;->debugMode:Z

    if-eqz v6, :cond_17b

    .line 112
    const-string v6, "RootTools::Installer"

    invoke-virtual {v10}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    :cond_17b
    const/4 v6, 0x0

    goto :goto_10c

    .line 129
    .end local v10    # "ex":Ljava/io/IOException;
    .restart local v2    # "ofc":Ljava/nio/channels/FileChannel;
    .restart local v3    # "rfc":Ljava/nio/channels/ReadableByteChannel;
    .restart local v4    # "pos":J
    .restart local v13    # "iss":Ljava/io/InputStream;
    .restart local v16    # "oss":Ljava/io/FileOutputStream;
    :catch_17d
    move-exception v10

    .line 130
    .restart local v10    # "ex":Ljava/io/IOException;
    :try_start_17e
    sget-boolean v6, Lcom/stericson/RootTools/RootTools;->debugMode:Z

    if-eqz v6, :cond_18b

    .line 131
    const-string v6, "RootTools::Installer"

    invoke-virtual {v10}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_18b
    .catch Ljava/io/FileNotFoundException; {:try_start_17e .. :try_end_18b} :catch_1ee
    .catchall {:try_start_17e .. :try_end_18b} :catchall_1ea

    .line 133
    :cond_18b
    const/4 v6, 0x0

    .line 141
    if-eqz v16, :cond_10c

    .line 143
    :try_start_18e
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileOutputStream;->flush()V

    .line 144
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/FileDescriptor;->sync()V

    .line 145
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileOutputStream;->close()V
    :try_end_19b
    .catch Ljava/lang/Exception; {:try_start_18e .. :try_end_19b} :catch_19d

    goto/16 :goto_10c

    .line 146
    :catch_19d
    move-exception v7

    goto/16 :goto_10c

    .line 135
    .end local v2    # "ofc":Ljava/nio/channels/FileChannel;
    .end local v4    # "pos":J
    .end local v10    # "ex":Ljava/io/IOException;
    .end local v16    # "oss":Ljava/io/FileOutputStream;
    .restart local v15    # "oss":Ljava/io/FileOutputStream;
    :catch_1a0
    move-exception v10

    .line 136
    .local v10, "ex":Ljava/io/FileNotFoundException;
    :goto_1a1
    :try_start_1a1
    sget-boolean v6, Lcom/stericson/RootTools/RootTools;->debugMode:Z

    if-eqz v6, :cond_1ae

    .line 137
    const-string v6, "RootTools::Installer"

    invoke-virtual {v10}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1ae
    .catchall {:try_start_1a1 .. :try_end_1ae} :catchall_1c3

    .line 139
    :cond_1ae
    const/4 v6, 0x0

    .line 141
    if-eqz v15, :cond_10c

    .line 143
    :try_start_1b1
    invoke-virtual {v15}, Ljava/io/FileOutputStream;->flush()V

    .line 144
    invoke-virtual {v15}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/FileDescriptor;->sync()V

    .line 145
    invoke-virtual {v15}, Ljava/io/FileOutputStream;->close()V
    :try_end_1be
    .catch Ljava/lang/Exception; {:try_start_1b1 .. :try_end_1be} :catch_1c0

    goto/16 :goto_10c

    .line 146
    :catch_1c0
    move-exception v7

    goto/16 :goto_10c

    .line 141
    .end local v10    # "ex":Ljava/io/FileNotFoundException;
    :catchall_1c3
    move-exception v6

    :goto_1c4
    if-eqz v15, :cond_1d3

    .line 143
    :try_start_1c6
    invoke-virtual {v15}, Ljava/io/FileOutputStream;->flush()V

    .line 144
    invoke-virtual {v15}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/FileDescriptor;->sync()V

    .line 145
    invoke-virtual {v15}, Ljava/io/FileOutputStream;->close()V
    :try_end_1d3
    .catch Ljava/lang/Exception; {:try_start_1c6 .. :try_end_1d3} :catch_1e8

    .line 147
    :cond_1d3
    :goto_1d3
    throw v6

    .line 152
    .end local v15    # "oss":Ljava/io/FileOutputStream;
    .restart local v2    # "ofc":Ljava/nio/channels/FileChannel;
    .restart local v4    # "pos":J
    .restart local v16    # "oss":Ljava/io/FileOutputStream;
    .restart local v17    # "size":J
    :catch_1d4
    move-exception v10

    .line 153
    .local v10, "ex":Ljava/io/IOException;
    sget-boolean v6, Lcom/stericson/RootTools/RootTools;->debugMode:Z

    if-eqz v6, :cond_1e2

    .line 154
    const-string v6, "RootTools::Installer"

    invoke-virtual {v10}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    :cond_1e2
    const/4 v6, 0x0

    goto/16 :goto_10c

    .line 164
    .end local v10    # "ex":Ljava/io/IOException;
    :catch_1e5
    move-exception v6

    goto/16 :goto_10b

    .line 146
    .end local v2    # "ofc":Ljava/nio/channels/FileChannel;
    .end local v4    # "pos":J
    .end local v16    # "oss":Ljava/io/FileOutputStream;
    .end local v17    # "size":J
    .restart local v15    # "oss":Ljava/io/FileOutputStream;
    :catch_1e8
    move-exception v7

    goto :goto_1d3

    .line 141
    .end local v15    # "oss":Ljava/io/FileOutputStream;
    .restart local v16    # "oss":Ljava/io/FileOutputStream;
    :catchall_1ea
    move-exception v6

    move-object/from16 v15, v16

    .end local v16    # "oss":Ljava/io/FileOutputStream;
    .restart local v15    # "oss":Ljava/io/FileOutputStream;
    goto :goto_1c4

    .line 135
    .end local v15    # "oss":Ljava/io/FileOutputStream;
    .restart local v16    # "oss":Ljava/io/FileOutputStream;
    :catch_1ee
    move-exception v10

    move-object/from16 v15, v16

    .end local v16    # "oss":Ljava/io/FileOutputStream;
    .restart local v15    # "oss":Ljava/io/FileOutputStream;
    goto :goto_1a1

    .line 146
    .end local v15    # "oss":Ljava/io/FileOutputStream;
    .restart local v2    # "ofc":Ljava/nio/channels/FileChannel;
    .restart local v4    # "pos":J
    .restart local v16    # "oss":Ljava/io/FileOutputStream;
    .restart local v17    # "size":J
    :catch_1f2
    move-exception v6

    goto/16 :goto_b2

    .line 107
    .end local v2    # "ofc":Ljava/nio/channels/FileChannel;
    .end local v3    # "rfc":Ljava/nio/channels/ReadableByteChannel;
    .end local v4    # "pos":J
    .end local v13    # "iss":Ljava/io/InputStream;
    .end local v16    # "oss":Ljava/io/FileOutputStream;
    .end local v17    # "size":J
    .restart local v9    # "e":Ljava/io/FileNotFoundException;
    .restart local v12    # "fos":Ljava/io/FileOutputStream;
    :catch_1f5
    move-exception v7

    goto/16 :goto_16c
.end method

.method protected isBinaryInstalled(Ljava/lang/String;)Z
    .registers 6
    .param p1, "destName"    # Ljava/lang/String;

    .prologue
    .line 170
    const/4 v0, 0x0

    .line 171
    .local v0, "installed":Z
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/stericson/RootTools/internal/Installer;->filesPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 172
    .local v1, "mf":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_26

    .line 173
    const/4 v0, 0x1

    .line 176
    :cond_26
    return v0
.end method
