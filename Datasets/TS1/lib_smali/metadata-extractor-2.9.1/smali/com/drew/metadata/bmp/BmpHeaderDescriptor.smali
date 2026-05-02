.class public Lcom/drew/metadata/bmp/BmpHeaderDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "BmpHeaderDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/bmp/BmpHeaderDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/bmp/BmpHeaderDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/bmp/BmpHeaderDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 38
    return-void
.end method


# virtual methods
.method public getCompressionDescription()Ljava/lang/String;
    .registers 8
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/16 v6, 0x40

    const/4 v4, 0x0

    .line 62
    :try_start_3
    iget-object v3, p0, Lcom/drew/metadata/bmp/BmpHeaderDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v3, Lcom/drew/metadata/bmp/BmpHeaderDirectory;

    const/4 v5, 0x5

    invoke-virtual {v3, v5}, Lcom/drew/metadata/bmp/BmpHeaderDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v2

    .line 63
    .local v2, "value":Ljava/lang/Integer;
    if-nez v2, :cond_10

    move-object v3, v4

    .line 81
    .end local v2    # "value":Ljava/lang/Integer;
    :goto_f
    return-object v3

    .line 65
    .restart local v2    # "value":Ljava/lang/Integer;
    :cond_10
    iget-object v3, p0, Lcom/drew/metadata/bmp/BmpHeaderDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v3, Lcom/drew/metadata/bmp/BmpHeaderDirectory;

    const/4 v5, -0x1

    invoke-virtual {v3, v5}, Lcom/drew/metadata/bmp/BmpHeaderDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v1

    .line 66
    .local v1, "headerSize":Ljava/lang/Integer;
    if-nez v1, :cond_1d

    move-object v3, v4

    .line 67
    goto :goto_f

    .line 69
    :cond_1d
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    packed-switch v3, :pswitch_data_54

    .line 78
    const/4 v3, 0x5

    invoke-super {p0, v3}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_f

    .line 70
    :pswitch_2a
    const-string v3, "None"

    goto :goto_f

    .line 71
    :pswitch_2d
    const-string v3, "RLE 8-bit/pixel"

    goto :goto_f

    .line 72
    :pswitch_30
    const-string v3, "RLE 4-bit/pixel"

    goto :goto_f

    .line 73
    :pswitch_33
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, v6, :cond_3c

    const-string v3, "Bit field"

    goto :goto_f

    :cond_3c
    const-string v3, "Huffman 1D"

    goto :goto_f

    .line 74
    :pswitch_3f
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, v6, :cond_48

    const-string v3, "JPEG"

    goto :goto_f

    :cond_48
    const-string v3, "RLE-24"

    goto :goto_f

    .line 75
    :pswitch_4b
    const-string v3, "PNG"

    goto :goto_f

    .line 76
    :pswitch_4e
    const-string v3, "Bit field"
    :try_end_50
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_50} :catch_51

    goto :goto_f

    .line 80
    .end local v1    # "headerSize":Ljava/lang/Integer;
    .end local v2    # "value":Ljava/lang/Integer;
    :catch_51
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    move-object v3, v4

    .line 81
    goto :goto_f

    .line 69
    :pswitch_data_54
    .packed-switch 0x0
        :pswitch_2a
        :pswitch_2d
        :pswitch_30
        :pswitch_33
        :pswitch_3f
        :pswitch_4b
        :pswitch_4e
    .end packed-switch
.end method

.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I

    .prologue
    .line 43
    packed-switch p1, :pswitch_data_e

    .line 47
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 45
    :pswitch_8
    invoke-virtual {p0}, Lcom/drew/metadata/bmp/BmpHeaderDescriptor;->getCompressionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 43
    nop

    :pswitch_data_e
    .packed-switch 0x5
        :pswitch_8
    .end packed-switch
.end method
