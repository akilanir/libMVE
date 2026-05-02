.class public Lcom/drew/metadata/photoshop/PsdReader;
.super Ljava/lang/Object;
.source "PsdReader.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 35
    const-class v0, Lcom/drew/metadata/photoshop/PsdReader;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/drew/metadata/photoshop/PsdReader;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public extract(Lcom/drew/lang/SequentialReader;Lcom/drew/metadata/Metadata;)V
    .registers 16
    .param p1, "reader"    # Lcom/drew/lang/SequentialReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 39
    new-instance v3, Lcom/drew/metadata/photoshop/PsdHeaderDirectory;

    invoke-direct {v3}, Lcom/drew/metadata/photoshop/PsdHeaderDirectory;-><init>()V

    .line 40
    .local v3, "directory":Lcom/drew/metadata/photoshop/PsdHeaderDirectory;
    invoke-virtual {p2, v3}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    .line 45
    :try_start_8
    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getInt32()I

    move-result v9

    .line 46
    .local v9, "signature":I
    const v11, 0x38425053

    if-eq v9, v11, :cond_17

    .line 48
    const-string v11, "Invalid PSD file signature"

    invoke-virtual {v3, v11}, Lcom/drew/metadata/photoshop/PsdHeaderDirectory;->addError(Ljava/lang/String;)V

    .line 120
    .end local v9    # "signature":I
    :goto_16
    return-void

    .line 52
    .restart local v9    # "signature":I
    :cond_17
    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getUInt16()I

    move-result v10

    .line 53
    .local v10, "version":I
    const/4 v11, 0x1

    if-eq v10, v11, :cond_2e

    const/4 v11, 0x2

    if-eq v10, v11, :cond_2e

    .line 55
    const-string v11, "Invalid PSD file version (must be 1 or 2)"

    invoke-virtual {v3, v11}, Lcom/drew/metadata/photoshop/PsdHeaderDirectory;->addError(Ljava/lang/String;)V
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_26} :catch_27

    goto :goto_16

    .line 78
    .end local v9    # "signature":I
    .end local v10    # "version":I
    :catch_27
    move-exception v4

    .line 79
    .local v4, "e":Ljava/io/IOException;
    const-string v11, "Unable to read PSD header"

    invoke-virtual {v3, v11}, Lcom/drew/metadata/photoshop/PsdHeaderDirectory;->addError(Ljava/lang/String;)V

    goto :goto_16

    .line 60
    .end local v4    # "e":Ljava/io/IOException;
    .restart local v9    # "signature":I
    .restart local v10    # "version":I
    :cond_2e
    const-wide/16 v11, 0x6

    :try_start_30
    invoke-virtual {p1, v11, v12}, Lcom/drew/lang/SequentialReader;->skip(J)V

    .line 62
    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getUInt16()I

    move-result v1

    .line 63
    .local v1, "channelCount":I
    const/4 v11, 0x1

    invoke-virtual {v3, v11, v1}, Lcom/drew/metadata/photoshop/PsdHeaderDirectory;->setInt(II)V

    .line 66
    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getInt32()I

    move-result v5

    .line 67
    .local v5, "imageHeight":I
    const/4 v11, 0x2

    invoke-virtual {v3, v11, v5}, Lcom/drew/metadata/photoshop/PsdHeaderDirectory;->setInt(II)V

    .line 70
    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getInt32()I

    move-result v6

    .line 71
    .local v6, "imageWidth":I
    const/4 v11, 0x3

    invoke-virtual {v3, v11, v6}, Lcom/drew/metadata/photoshop/PsdHeaderDirectory;->setInt(II)V

    .line 73
    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getUInt16()I

    move-result v0

    .line 74
    .local v0, "bitsPerChannel":I
    const/4 v11, 0x4

    invoke-virtual {v3, v11, v0}, Lcom/drew/metadata/photoshop/PsdHeaderDirectory;->setInt(II)V

    .line 76
    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getUInt16()I

    move-result v2

    .line 77
    .local v2, "colorMode":I
    const/4 v11, 0x5

    invoke-virtual {v3, v11, v2}, Lcom/drew/metadata/photoshop/PsdHeaderDirectory;->setInt(II)V
    :try_end_5b
    .catch Ljava/io/IOException; {:try_start_30 .. :try_end_5b} :catch_27

    .line 86
    :try_start_5b
    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getUInt32()J

    move-result-wide v7

    .line 100
    .local v7, "sectionLength":J
    invoke-virtual {p1, v7, v8}, Lcom/drew/lang/SequentialReader;->skip(J)V
    :try_end_62
    .catch Ljava/io/IOException; {:try_start_5b .. :try_end_62} :catch_79

    .line 108
    :try_start_62
    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getUInt32()J

    move-result-wide v7

    .line 110
    sget-boolean v11, Lcom/drew/metadata/photoshop/PsdReader;->$assertionsDisabled:Z

    if-nez v11, :cond_7b

    const-wide/32 v11, 0x7fffffff

    cmp-long v11, v7, v11

    if-lez v11, :cond_7b

    new-instance v11, Ljava/lang/AssertionError;

    invoke-direct {v11}, Ljava/lang/AssertionError;-><init>()V

    throw v11

    .line 113
    :catch_77
    move-exception v11

    goto :goto_16

    .line 101
    .end local v7    # "sectionLength":J
    :catch_79
    move-exception v4

    .line 102
    .restart local v4    # "e":Ljava/io/IOException;
    goto :goto_16

    .line 112
    .end local v4    # "e":Ljava/io/IOException;
    .restart local v7    # "sectionLength":J
    :cond_7b
    new-instance v11, Lcom/drew/metadata/photoshop/PhotoshopReader;

    invoke-direct {v11}, Lcom/drew/metadata/photoshop/PhotoshopReader;-><init>()V

    long-to-int v12, v7

    invoke-virtual {v11, p1, v12, p2}, Lcom/drew/metadata/photoshop/PhotoshopReader;->extract(Lcom/drew/lang/SequentialReader;ILcom/drew/metadata/Metadata;)V
    :try_end_84
    .catch Ljava/io/IOException; {:try_start_62 .. :try_end_84} :catch_77

    goto :goto_16
.end method
