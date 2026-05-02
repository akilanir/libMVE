.class public Lcom/drew/metadata/exif/makernotes/SigmaMakernoteDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "SigmaMakernoteDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/exif/makernotes/SigmaMakernoteDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/exif/makernotes/SigmaMakernoteDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/exif/makernotes/SigmaMakernoteDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 41
    return-void
.end method

.method private getExposureModeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 73
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/SigmaMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/SigmaMakernoteDirectory;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/SigmaMakernoteDirectory;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 74
    .local v0, "value":Ljava/lang/String;
    if-eqz v0, :cond_12

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_14

    .line 75
    :cond_12
    const/4 v0, 0x0

    .line 82
    .end local v0    # "value":Ljava/lang/String;
    :goto_13
    return-object v0

    .line 76
    .restart local v0    # "value":Ljava/lang/String;
    :cond_14
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    sparse-switch v1, :sswitch_data_2a

    goto :goto_13

    .line 77
    :sswitch_1d
    const-string v0, "Aperture Priority AE"

    goto :goto_13

    .line 78
    :sswitch_20
    const-string v0, "Manual"

    goto :goto_13

    .line 79
    :sswitch_23
    const-string v0, "Program AE"

    goto :goto_13

    .line 80
    :sswitch_26
    const-string v0, "Shutter Speed Priority AE"

    goto :goto_13

    .line 76
    nop

    :sswitch_data_2a
    .sparse-switch
        0x41 -> :sswitch_1d
        0x4d -> :sswitch_20
        0x50 -> :sswitch_23
        0x53 -> :sswitch_26
    .end sparse-switch
.end method

.method private getMeteringModeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 58
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/SigmaMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/SigmaMakernoteDirectory;

    const/16 v2, 0x9

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/SigmaMakernoteDirectory;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 59
    .local v0, "value":Ljava/lang/String;
    if-eqz v0, :cond_12

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_14

    .line 60
    :cond_12
    const/4 v0, 0x0

    .line 66
    .end local v0    # "value":Ljava/lang/String;
    :goto_13
    return-object v0

    .line 61
    .restart local v0    # "value":Ljava/lang/String;
    :cond_14
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    sparse-switch v1, :sswitch_data_26

    goto :goto_13

    .line 62
    :sswitch_1d
    const-string v0, "Multi Segment"

    goto :goto_13

    .line 63
    :sswitch_20
    const-string v0, "Average"

    goto :goto_13

    .line 64
    :sswitch_23
    const-string v0, "Center Weighted Average"

    goto :goto_13

    .line 61
    :sswitch_data_26
    .sparse-switch
        0x38 -> :sswitch_1d
        0x41 -> :sswitch_20
        0x43 -> :sswitch_23
    .end sparse-switch
.end method


# virtual methods
.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I

    .prologue
    .line 46
    packed-switch p1, :pswitch_data_12

    .line 52
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 48
    :pswitch_8
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/SigmaMakernoteDescriptor;->getExposureModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 50
    :pswitch_d
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/SigmaMakernoteDescriptor;->getMeteringModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 46
    :pswitch_data_12
    .packed-switch 0x8
        :pswitch_8
        :pswitch_d
    .end packed-switch
.end method
