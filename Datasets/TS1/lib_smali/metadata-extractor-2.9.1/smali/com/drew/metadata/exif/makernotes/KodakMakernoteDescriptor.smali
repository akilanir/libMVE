.class public Lcom/drew/metadata/exif/makernotes/KodakMakernoteDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "KodakMakernoteDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 40
    return-void
.end method


# virtual methods
.method public getBurstModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 144
    const/16 v0, 0xa

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getColorModeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 79
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;

    const/16 v2, 0x66

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 80
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 81
    const/4 v1, 0x0

    .line 90
    :goto_d
    return-object v1

    .line 82
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_44

    .line 90
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_d

    .line 83
    :sswitch_2f
    const-string v1, "B&W"

    goto :goto_d

    .line 84
    :sswitch_32
    const-string v1, "Sepia"

    goto :goto_d

    .line 85
    :sswitch_35
    const-string v1, "B&W Yellow Filter"

    goto :goto_d

    .line 86
    :sswitch_38
    const-string v1, "B&W Red Filter"

    goto :goto_d

    .line 87
    :sswitch_3b
    const-string v1, "Saturated Color"

    goto :goto_d

    .line 88
    :sswitch_3e
    const-string v1, "Neutral Color"

    goto :goto_d

    .line 89
    :sswitch_41
    const-string v1, "Saturated Color"

    goto :goto_d

    .line 82
    :sswitch_data_44
    .sparse-switch
        0x1 -> :sswitch_2f
        0x2 -> :sswitch_32
        0x3 -> :sswitch_35
        0x4 -> :sswitch_38
        0x20 -> :sswitch_3b
        0x40 -> :sswitch_3e
        0x100 -> :sswitch_41
        0x200 -> :sswitch_3e
        0x2000 -> :sswitch_2f
        0x4000 -> :sswitch_32
    .end sparse-switch
.end method

.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 46
    sparse-switch p1, :sswitch_data_36

    .line 66
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 48
    :sswitch_8
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDescriptor;->getQualityDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 50
    :sswitch_d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDescriptor;->getBurstModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 52
    :sswitch_12
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDescriptor;->getShutterModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 54
    :sswitch_17
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDescriptor;->getFocusModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 56
    :sswitch_1c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDescriptor;->getWhiteBalanceDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 58
    :sswitch_21
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDescriptor;->getFlashModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 60
    :sswitch_26
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDescriptor;->getFlashFiredDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 62
    :sswitch_2b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDescriptor;->getColorModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 64
    :sswitch_30
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDescriptor;->getSharpnessDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 46
    nop

    :sswitch_data_36
    .sparse-switch
        0x9 -> :sswitch_8
        0xa -> :sswitch_d
        0x1b -> :sswitch_12
        0x38 -> :sswitch_17
        0x40 -> :sswitch_1c
        0x5c -> :sswitch_21
        0x5d -> :sswitch_26
        0x66 -> :sswitch_2b
        0x6b -> :sswitch_30
    .end sparse-switch
.end method

.method public getFlashFiredDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 97
    const/16 v0, 0x5d

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "No"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Yes"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFlashModeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 103
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;

    const/16 v2, 0x5c

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 104
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 105
    const/4 v1, 0x0

    .line 111
    :goto_d
    return-object v1

    .line 106
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_3c

    .line 111
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_d

    .line 107
    :sswitch_2f
    const-string v1, "Auto"

    goto :goto_d

    .line 108
    :sswitch_32
    const-string v1, "Fill Flash"

    goto :goto_d

    .line 109
    :sswitch_35
    const-string v1, "Off"

    goto :goto_d

    .line 110
    :sswitch_38
    const-string v1, "Red Eye"

    goto :goto_d

    .line 106
    nop

    :sswitch_data_3c
    .sparse-switch
        0x0 -> :sswitch_2f
        0x1 -> :sswitch_32
        0x2 -> :sswitch_35
        0x3 -> :sswitch_38
        0x10 -> :sswitch_32
        0x20 -> :sswitch_35
        0x40 -> :sswitch_38
    .end sparse-switch
.end method

.method public getFocusModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 124
    const/16 v0, 0x38

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Normal"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const/4 v3, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Macro"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getQualityDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 150
    const/16 v0, 0x9

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Fine"

    aput-object v3, v1, v2

    const-string v2, "Normal"

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSharpnessDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 73
    const/16 v0, 0x6b

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Normal"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getShutterModeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 130
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;

    const/16 v2, 0x1b

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 131
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 132
    const/4 v1, 0x0

    .line 137
    :goto_d
    return-object v1

    .line 133
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_38

    .line 137
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_d

    .line 134
    :sswitch_2f
    const-string v1, "Auto"

    goto :goto_d

    .line 135
    :sswitch_32
    const-string v1, "Aperture Priority"

    goto :goto_d

    .line 136
    :sswitch_35
    const-string v1, "Manual"

    goto :goto_d

    .line 133
    :sswitch_data_38
    .sparse-switch
        0x0 -> :sswitch_2f
        0x8 -> :sswitch_32
        0x20 -> :sswitch_35
    .end sparse-switch
.end method

.method public getWhiteBalanceDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 118
    const/16 v0, 0x40

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Auto"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Flash"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Tungsten"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Daylight"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/KodakMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
