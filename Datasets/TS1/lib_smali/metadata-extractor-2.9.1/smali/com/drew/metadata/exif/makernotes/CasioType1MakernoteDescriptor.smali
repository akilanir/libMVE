.class public Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "CasioType1MakernoteDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDirectory;
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
.method public getCcdSensitivityDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 79
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDirectory;

    const/16 v2, 0x14

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 81
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 82
    const/4 v1, 0x0

    .line 94
    :goto_d
    return-object v1

    .line 84
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_42

    .line 94
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

    .line 86
    :sswitch_2f
    const-string v1, "Normal"

    goto :goto_d

    .line 87
    :sswitch_32
    const-string v1, "+1.0"

    goto :goto_d

    .line 88
    :sswitch_35
    const-string v1, "+2.0"

    goto :goto_d

    .line 89
    :sswitch_38
    const-string v1, "+3.0"

    goto :goto_d

    .line 91
    :sswitch_3b
    const-string v1, "Normal (ISO 80 equivalent)"

    goto :goto_d

    .line 92
    :sswitch_3e
    const-string v1, "High"

    goto :goto_d

    .line 84
    nop

    :sswitch_data_42
    .sparse-switch
        0x40 -> :sswitch_2f
        0x50 -> :sswitch_3b
        0x64 -> :sswitch_3e
        0x7d -> :sswitch_32
        0xf4 -> :sswitch_38
        0xfa -> :sswitch_35
    .end sparse-switch
.end method

.method public getContrastDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 107
    const/16 v0, 0xc

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Normal"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Low"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "High"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 46
    packed-switch p1, :pswitch_data_44

    .line 72
    :pswitch_3
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 48
    :pswitch_8
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->getRecordingModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 50
    :pswitch_d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->getQualityDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 52
    :pswitch_12
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->getFocusingModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 54
    :pswitch_17
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->getFlashModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 56
    :pswitch_1c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->getFlashIntensityDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 58
    :pswitch_21
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->getObjectDistanceDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 60
    :pswitch_26
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->getWhiteBalanceDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 62
    :pswitch_2b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->getDigitalZoomDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 64
    :pswitch_30
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->getSharpnessDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 66
    :pswitch_35
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->getContrastDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 68
    :pswitch_3a
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->getSaturationDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 70
    :pswitch_3f
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->getCcdSensitivityDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 46
    :pswitch_data_44
    .packed-switch 0x1
        :pswitch_8
        :pswitch_d
        :pswitch_12
        :pswitch_17
        :pswitch_1c
        :pswitch_21
        :pswitch_26
        :pswitch_3
        :pswitch_3
        :pswitch_2b
        :pswitch_30
        :pswitch_35
        :pswitch_3a
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3f
    .end packed-switch
.end method

.method public getDigitalZoomDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 119
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDirectory;

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 121
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 122
    const/4 v1, 0x0

    .line 130
    :goto_d
    return-object v1

    .line 124
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_3c

    .line 130
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

    .line 125
    :sswitch_2f
    const-string v1, "No digital zoom"

    goto :goto_d

    .line 126
    :sswitch_32
    const-string v1, "2x digital zoom"

    goto :goto_d

    .line 127
    :sswitch_35
    const-string v1, "2x digital zoom"

    goto :goto_d

    .line 128
    :sswitch_38
    const-string v1, "4x digital zoom"

    goto :goto_d

    .line 124
    nop

    :sswitch_data_3c
    .sparse-switch
        0x10000 -> :sswitch_2f
        0x10001 -> :sswitch_32
        0x20000 -> :sswitch_35
        0x40000 -> :sswitch_38
    .end sparse-switch
.end method

.method public getFlashIntensityDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 164
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDirectory;

    const/4 v2, 0x5

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 166
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_d

    .line 167
    const/4 v1, 0x0

    .line 174
    :goto_c
    return-object v1

    .line 169
    :cond_d
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_38

    .line 174
    :pswitch_14
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

    goto :goto_c

    .line 170
    :pswitch_2e
    const-string v1, "Weak"

    goto :goto_c

    .line 171
    :pswitch_31
    const-string v1, "Normal"

    goto :goto_c

    .line 172
    :pswitch_34
    const-string v1, "Strong"

    goto :goto_c

    .line 169
    nop

    :pswitch_data_38
    .packed-switch 0xb
        :pswitch_2e
        :pswitch_14
        :pswitch_31
        :pswitch_14
        :pswitch_34
    .end packed-switch
.end method

.method public getFlashModeDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x4

    const/4 v3, 0x1

    .line 181
    new-array v0, v4, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "Auto"

    aput-object v2, v0, v1

    const-string v1, "On"

    aput-object v1, v0, v3

    const/4 v1, 0x2

    const-string v2, "Off"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "Red eye reduction"

    aput-object v2, v0, v1

    invoke-virtual {p0, v4, v3, v0}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFocusingModeDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x3

    const/4 v3, 0x2

    .line 187
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "Macro"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Auto focus"

    aput-object v2, v0, v1

    const-string v1, "Manual focus"

    aput-object v1, v0, v3

    const-string v1, "Infinity"

    aput-object v1, v0, v4

    invoke-virtual {p0, v4, v3, v0}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getObjectDistanceDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 157
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDirectory;

    const/4 v2, 0x6

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 158
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_d

    const/4 v1, 0x0

    :goto_c
    return-object v1

    :cond_d
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    int-to-double v1, v1

    invoke-static {v1, v2}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->getFocalLengthDescription(D)Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method public getQualityDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 193
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "Economy"

    aput-object v2, v0, v1

    const-string v1, "Normal"

    aput-object v1, v0, v3

    const-string v1, "Fine"

    aput-object v1, v0, v4

    invoke-virtual {p0, v4, v3, v0}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRecordingModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 199
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "Single shutter"

    aput-object v2, v0, v1

    const-string v1, "Panorama"

    aput-object v1, v0, v3

    const/4 v1, 0x2

    const-string v2, "Night scene"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "Portrait"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "Landscape"

    aput-object v2, v0, v1

    invoke-virtual {p0, v3, v3, v0}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSaturationDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 101
    const/16 v0, 0xd

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Normal"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Low"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "High"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSharpnessDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 113
    const/16 v0, 0xb

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Normal"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Soft"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Hard"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWhiteBalanceDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 137
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDirectory;

    const/4 v2, 0x7

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/CasioType1MakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 139
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_d

    .line 140
    const/4 v1, 0x0

    .line 150
    :goto_c
    return-object v1

    .line 142
    :cond_d
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_40

    .line 150
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

    goto :goto_c

    .line 143
    :sswitch_2e
    const-string v1, "Auto"

    goto :goto_c

    .line 144
    :sswitch_31
    const-string v1, "Tungsten"

    goto :goto_c

    .line 145
    :sswitch_34
    const-string v1, "Daylight"

    goto :goto_c

    .line 146
    :sswitch_37
    const-string v1, "Florescent"

    goto :goto_c

    .line 147
    :sswitch_3a
    const-string v1, "Shade"

    goto :goto_c

    .line 148
    :sswitch_3d
    const-string v1, "Manual"

    goto :goto_c

    .line 142
    :sswitch_data_40
    .sparse-switch
        0x1 -> :sswitch_2e
        0x2 -> :sswitch_31
        0x3 -> :sswitch_34
        0x4 -> :sswitch_37
        0x5 -> :sswitch_3a
        0x81 -> :sswitch_3d
    .end sparse-switch
.end method
