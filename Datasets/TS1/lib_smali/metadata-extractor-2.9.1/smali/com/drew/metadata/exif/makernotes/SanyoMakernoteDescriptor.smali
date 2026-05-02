.class public Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "SanyoMakernoteDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 41
    return-void
.end method

.method private getColorAdjustmentModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 152
    const/16 v0, 0x210

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getDigitalZoomDescription()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 134
    const/16 v0, 0x204

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getDecimalRational(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getDigitalZoomOnDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 194
    const/16 v0, 0x21b

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getFlashModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 226
    const/16 v0, 0x225

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Auto"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Force"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Disabled"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Red eye"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getFlickerReduceDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 182
    const/16 v0, 0x218

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getLightSourceSpecialDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 200
    const/16 v0, 0x21d

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getMacroDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 128
    const/16 v0, 0x202

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Normal"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Macro"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "View"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Manual"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getOptimalZoomOnDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 188
    const/16 v0, 0x219

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getQuickShotDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 158
    const/16 v0, 0x213

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getRecordShutterDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 176
    const/16 v0, 0x217

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Record while down"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Press start, press stop"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getResavedDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 206
    const/16 v0, 0x21e

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "No"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Yes"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getSceneSelectDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 212
    const/16 v0, 0x21f

    const/4 v1, 0x7

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Sport"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "TV"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Night"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "User 1"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "User 2"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "Lamp"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getSelfTimerDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 164
    const/16 v0, 0x214

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getSequenceShotIntervalDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 219
    const/16 v0, 0x224

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "5 frames/sec"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "10 frames/sec"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "15 frames/sec"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "20 frames/sec"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getSequentialShotDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 140
    const/16 v0, 0x20e

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "None"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Standard"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Best"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Adjust Exposure"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getVoiceMemoDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 170
    const/16 v0, 0x216

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getWideRangeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 146
    const/16 v0, 0x20f

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 47
    packed-switch p1, :pswitch_data_62

    .line 85
    :pswitch_3
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 49
    :pswitch_8
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getSanyoQualityDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 51
    :pswitch_d
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getMacroDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 53
    :pswitch_12
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getDigitalZoomDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 55
    :pswitch_17
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getSequentialShotDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 57
    :pswitch_1c
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getWideRangeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 59
    :pswitch_21
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getColorAdjustmentModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 61
    :pswitch_26
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getQuickShotDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 63
    :pswitch_2b
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getSelfTimerDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 65
    :pswitch_30
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getVoiceMemoDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 67
    :pswitch_35
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getRecordShutterDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 69
    :pswitch_3a
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getFlickerReduceDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 71
    :pswitch_3f
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getOptimalZoomOnDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 73
    :pswitch_44
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getDigitalZoomOnDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 75
    :pswitch_49
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getLightSourceSpecialDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 77
    :pswitch_4e
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getResavedDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 79
    :pswitch_53
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getSceneSelectDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 81
    :pswitch_58
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getSequenceShotIntervalDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 83
    :pswitch_5d
    invoke-direct {p0}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->getFlashModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 47
    :pswitch_data_62
    .packed-switch 0x201
        :pswitch_8
        :pswitch_d
        :pswitch_3
        :pswitch_12
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_17
        :pswitch_1c
        :pswitch_21
        :pswitch_3
        :pswitch_3
        :pswitch_26
        :pswitch_2b
        :pswitch_3
        :pswitch_30
        :pswitch_35
        :pswitch_3a
        :pswitch_3f
        :pswitch_3
        :pswitch_44
        :pswitch_3
        :pswitch_49
        :pswitch_4e
        :pswitch_53
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_58
        :pswitch_5d
    .end packed-switch
.end method

.method public getSanyoQualityDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 92
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;

    const/16 v2, 0x201

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/SanyoMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 93
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 94
    const/4 v1, 0x0

    .line 121
    :goto_d
    return-object v1

    .line 95
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_78

    .line 121
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

    .line 96
    :sswitch_2f
    const-string v1, "Normal/Very Low"

    goto :goto_d

    .line 97
    :sswitch_32
    const-string v1, "Normal/Low"

    goto :goto_d

    .line 98
    :sswitch_35
    const-string v1, "Normal/Medium Low"

    goto :goto_d

    .line 99
    :sswitch_38
    const-string v1, "Normal/Medium"

    goto :goto_d

    .line 100
    :sswitch_3b
    const-string v1, "Normal/Medium High"

    goto :goto_d

    .line 101
    :sswitch_3e
    const-string v1, "Normal/High"

    goto :goto_d

    .line 102
    :sswitch_41
    const-string v1, "Normal/Very High"

    goto :goto_d

    .line 103
    :sswitch_44
    const-string v1, "Normal/Super High"

    goto :goto_d

    .line 104
    :sswitch_47
    const-string v1, "Fine/Very Low"

    goto :goto_d

    .line 105
    :sswitch_4a
    const-string v1, "Fine/Low"

    goto :goto_d

    .line 106
    :sswitch_4d
    const-string v1, "Fine/Medium Low"

    goto :goto_d

    .line 107
    :sswitch_50
    const-string v1, "Fine/Medium"

    goto :goto_d

    .line 108
    :sswitch_53
    const-string v1, "Fine/Medium High"

    goto :goto_d

    .line 109
    :sswitch_56
    const-string v1, "Fine/High"

    goto :goto_d

    .line 110
    :sswitch_59
    const-string v1, "Fine/Very High"

    goto :goto_d

    .line 111
    :sswitch_5c
    const-string v1, "Fine/Super High"

    goto :goto_d

    .line 112
    :sswitch_5f
    const-string v1, "Super Fine/Very Low"

    goto :goto_d

    .line 113
    :sswitch_62
    const-string v1, "Super Fine/Low"

    goto :goto_d

    .line 114
    :sswitch_65
    const-string v1, "Super Fine/Medium Low"

    goto :goto_d

    .line 115
    :sswitch_68
    const-string v1, "Super Fine/Medium"

    goto :goto_d

    .line 116
    :sswitch_6b
    const-string v1, "Super Fine/Medium High"

    goto :goto_d

    .line 117
    :sswitch_6e
    const-string v1, "Super Fine/High"

    goto :goto_d

    .line 118
    :sswitch_71
    const-string v1, "Super Fine/Very High"

    goto :goto_d

    .line 119
    :sswitch_74
    const-string v1, "Super Fine/Super High"

    goto :goto_d

    .line 95
    nop

    :sswitch_data_78
    .sparse-switch
        0x0 -> :sswitch_2f
        0x1 -> :sswitch_32
        0x2 -> :sswitch_35
        0x3 -> :sswitch_38
        0x4 -> :sswitch_3b
        0x5 -> :sswitch_3e
        0x6 -> :sswitch_41
        0x7 -> :sswitch_44
        0x100 -> :sswitch_47
        0x101 -> :sswitch_4a
        0x102 -> :sswitch_4d
        0x103 -> :sswitch_50
        0x104 -> :sswitch_53
        0x105 -> :sswitch_56
        0x106 -> :sswitch_59
        0x107 -> :sswitch_5c
        0x200 -> :sswitch_5f
        0x201 -> :sswitch_62
        0x202 -> :sswitch_65
        0x203 -> :sswitch_68
        0x204 -> :sswitch_6b
        0x205 -> :sswitch_6e
        0x206 -> :sswitch_71
        0x207 -> :sswitch_74
    .end sparse-switch
.end method
