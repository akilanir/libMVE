.class public Lcom/drew/metadata/bmp/BmpReader;
.super Ljava/lang/Object;
.source "BmpReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public extract(Lcom/drew/lang/SequentialReader;Lcom/drew/metadata/Metadata;)V
    .registers 9
    .param p1, "reader"    # Lcom/drew/lang/SequentialReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 36
    new-instance v0, Lcom/drew/metadata/bmp/BmpHeaderDirectory;

    invoke-direct {v0}, Lcom/drew/metadata/bmp/BmpHeaderDirectory;-><init>()V

    .line 37
    .local v0, "directory":Lcom/drew/metadata/bmp/BmpHeaderDirectory;
    invoke-virtual {p2, v0}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    .line 84
    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Lcom/drew/lang/SequentialReader;->setMotorolaByteOrder(Z)V

    .line 87
    :try_start_c
    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getUInt16()I

    move-result v3

    .line 89
    .local v3, "magicNumber":I
    const/16 v4, 0x4d42

    if-eq v3, v4, :cond_1a

    .line 91
    const-string v4, "Invalid BMP magic number"

    invoke-virtual {v0, v4}, Lcom/drew/metadata/bmp/BmpHeaderDirectory;->addError(Ljava/lang/String;)V

    .line 127
    .end local v3    # "magicNumber":I
    :goto_19
    return-void

    .line 96
    .restart local v3    # "magicNumber":I
    :cond_1a
    const-wide/16 v4, 0xc

    invoke-virtual {p1, v4, v5}, Lcom/drew/lang/SequentialReader;->skip(J)V

    .line 98
    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getInt32()I

    move-result v2

    .line 100
    .local v2, "headerSize":I
    const/4 v4, -0x1

    invoke-virtual {v0, v4, v2}, Lcom/drew/metadata/bmp/BmpHeaderDirectory;->setInt(II)V

    .line 103
    const/16 v4, 0x28

    if-ne v2, v4, :cond_82

    .line 105
    const/4 v4, 0x2

    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getInt32()I

    move-result v5

    invoke-virtual {v0, v4, v5}, Lcom/drew/metadata/bmp/BmpHeaderDirectory;->setInt(II)V

    .line 106
    const/4 v4, 0x1

    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getInt32()I

    move-result v5

    invoke-virtual {v0, v4, v5}, Lcom/drew/metadata/bmp/BmpHeaderDirectory;->setInt(II)V

    .line 107
    const/4 v4, 0x3

    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getInt16()S

    move-result v5

    invoke-virtual {v0, v4, v5}, Lcom/drew/metadata/bmp/BmpHeaderDirectory;->setInt(II)V

    .line 108
    const/4 v4, 0x4

    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getInt16()S

    move-result v5

    invoke-virtual {v0, v4, v5}, Lcom/drew/metadata/bmp/BmpHeaderDirectory;->setInt(II)V

    .line 109
    const/4 v4, 0x5

    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getInt32()I

    move-result v5

    invoke-virtual {v0, v4, v5}, Lcom/drew/metadata/bmp/BmpHeaderDirectory;->setInt(II)V

    .line 111
    const-wide/16 v4, 0x4

    invoke-virtual {p1, v4, v5}, Lcom/drew/lang/SequentialReader;->skip(J)V

    .line 112
    const/4 v4, 0x6

    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getInt32()I

    move-result v5

    invoke-virtual {v0, v4, v5}, Lcom/drew/metadata/bmp/BmpHeaderDirectory;->setInt(II)V

    .line 113
    const/4 v4, 0x7

    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getInt32()I

    move-result v5

    invoke-virtual {v0, v4, v5}, Lcom/drew/metadata/bmp/BmpHeaderDirectory;->setInt(II)V

    .line 114
    const/16 v4, 0x8

    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getInt32()I

    move-result v5

    invoke-virtual {v0, v4, v5}, Lcom/drew/metadata/bmp/BmpHeaderDirectory;->setInt(II)V

    .line 115
    const/16 v4, 0x9

    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getInt32()I

    move-result v5

    invoke-virtual {v0, v4, v5}, Lcom/drew/metadata/bmp/BmpHeaderDirectory;->setInt(II)V
    :try_end_7a
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_7a} :catch_7b

    goto :goto_19

    .line 124
    .end local v2    # "headerSize":I
    .end local v3    # "magicNumber":I
    :catch_7b
    move-exception v1

    .line 125
    .local v1, "e":Ljava/io/IOException;
    const-string v4, "Unable to read BMP header"

    invoke-virtual {v0, v4}, Lcom/drew/metadata/bmp/BmpHeaderDirectory;->addError(Ljava/lang/String;)V

    goto :goto_19

    .line 116
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v2    # "headerSize":I
    .restart local v3    # "magicNumber":I
    :cond_82
    const/16 v4, 0xc

    if-ne v2, v4, :cond_a8

    .line 117
    const/4 v4, 0x2

    :try_start_87
    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getInt16()S

    move-result v5

    invoke-virtual {v0, v4, v5}, Lcom/drew/metadata/bmp/BmpHeaderDirectory;->setInt(II)V

    .line 118
    const/4 v4, 0x1

    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getInt16()S

    move-result v5

    invoke-virtual {v0, v4, v5}, Lcom/drew/metadata/bmp/BmpHeaderDirectory;->setInt(II)V

    .line 119
    const/4 v4, 0x3

    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getInt16()S

    move-result v5

    invoke-virtual {v0, v4, v5}, Lcom/drew/metadata/bmp/BmpHeaderDirectory;->setInt(II)V

    .line 120
    const/4 v4, 0x4

    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getInt16()S

    move-result v5

    invoke-virtual {v0, v4, v5}, Lcom/drew/metadata/bmp/BmpHeaderDirectory;->setInt(II)V

    goto/16 :goto_19

    .line 122
    :cond_a8
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unexpected DIB header size: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/drew/metadata/bmp/BmpHeaderDirectory;->addError(Ljava/lang/String;)V
    :try_end_be
    .catch Ljava/io/IOException; {:try_start_87 .. :try_end_be} :catch_7b

    goto/16 :goto_19
.end method
