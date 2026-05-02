.class public Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "PanasonicMakernoteDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;",
        ">;"
    }
.end annotation


# static fields
.field private static final _sceneModes:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x0

    .line 507
    const/16 v0, 0x33

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "Normal"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Portrait"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "Scenery"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "Sports"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "Night Portrait"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "Program"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "Aperture Priority"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "Shutter Priority"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "Macro"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "Spot"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "Manual"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "Movie Preview"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "Panning"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "Simple"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "Color Effects"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "Self Portrait"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "Economy"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "Fireworks"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "Party"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "Snow"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string v2, "Night Scenery"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string v2, "Food"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string v2, "Baby"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string v2, "Soft Skin"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    const-string v2, "Candlelight"

    aput-object v2, v0, v1

    const/16 v1, 0x19

    const-string v2, "Starry Night"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string v2, "High Sensitivity"

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string v2, "Panorama Assist"

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    const-string v2, "Underwater"

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    const-string v2, "Beach"

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    const-string v2, "Aerial Photo"

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    const-string v2, "Sunset"

    aput-object v2, v0, v1

    const/16 v1, 0x20

    const-string v2, "Pet"

    aput-object v2, v0, v1

    const/16 v1, 0x21

    const-string v2, "Intelligent ISO"

    aput-object v2, v0, v1

    const/16 v1, 0x22

    const-string v2, "Clipboard"

    aput-object v2, v0, v1

    const/16 v1, 0x23

    const-string v2, "High Speed Continuous Shooting"

    aput-object v2, v0, v1

    const/16 v1, 0x24

    const-string v2, "Intelligent Auto"

    aput-object v2, v0, v1

    const/16 v1, 0x25

    aput-object v3, v0, v1

    const/16 v1, 0x26

    const-string v2, "Multi-aspect"

    aput-object v2, v0, v1

    const/16 v1, 0x27

    aput-object v3, v0, v1

    const/16 v1, 0x28

    const-string v2, "Transform"

    aput-object v2, v0, v1

    const/16 v1, 0x29

    const-string v2, "Flash Burst"

    aput-object v2, v0, v1

    const/16 v1, 0x2a

    const-string v2, "Pin Hole"

    aput-object v2, v0, v1

    const/16 v1, 0x2b

    const-string v2, "Film Grain"

    aput-object v2, v0, v1

    const/16 v1, 0x2c

    const-string v2, "My Color"

    aput-object v2, v0, v1

    const/16 v1, 0x2d

    const-string v2, "Photo Frame"

    aput-object v2, v0, v1

    const/16 v1, 0x2e

    aput-object v3, v0, v1

    const/16 v1, 0x2f

    aput-object v3, v0, v1

    const/16 v1, 0x30

    aput-object v3, v0, v1

    const/16 v1, 0x31

    aput-object v3, v0, v1

    const/16 v1, 0x32

    const-string v2, "HDR"

    aput-object v2, v0, v1

    sput-object v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->_sceneModes:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 53
    return-void
.end method

.method private buildFacesDescription([Lcom/drew/metadata/Face;)Ljava/lang/String;
    .registers 7
    .param p1, "faces"    # [Lcom/drew/metadata/Face;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 495
    if-nez p1, :cond_4

    .line 503
    :cond_3
    :goto_3
    return-object v2

    .line 498
    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 500
    .local v1, "result":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    array-length v3, p1

    if-ge v0, v3, :cond_31

    .line 501
    const-string v3, "Face "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, p1, v0

    invoke-virtual {v4}, Lcom/drew/metadata/Face;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 500
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 503
    :cond_31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_3

    const/4 v2, 0x0

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_3
.end method

.method private getTransformDescription(I)Ljava/lang/String;
    .registers 11
    .param p1, "tag"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v8, 0x2

    const/4 v7, 0x1

    .line 239
    iget-object v5, p0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v5, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;

    invoke-virtual {v5, p1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->getByteArray(I)[B

    move-result-object v4

    .line 240
    .local v4, "values":[B
    if-nez v4, :cond_f

    move-object v5, v6

    .line 263
    :goto_e
    return-object v5

    .line 243
    :cond_f
    new-instance v1, Lcom/drew/lang/ByteArrayReader;

    invoke-direct {v1, v4}, Lcom/drew/lang/ByteArrayReader;-><init>([B)V

    .line 247
    .local v1, "reader":Lcom/drew/lang/RandomAccessReader;
    const/4 v5, 0x0

    :try_start_15
    invoke-virtual {v1, v5}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v2

    .line 248
    .local v2, "val1":I
    const/4 v5, 0x2

    invoke-virtual {v1, v5}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v3

    .line 250
    .local v3, "val2":I
    const/4 v5, -0x1

    if-ne v2, v5, :cond_26

    if-ne v3, v7, :cond_26

    .line 251
    const-string v5, "Slim Low"

    goto :goto_e

    .line 252
    :cond_26
    const/4 v5, -0x3

    if-ne v2, v5, :cond_2e

    if-ne v3, v8, :cond_2e

    .line 253
    const-string v5, "Slim High"

    goto :goto_e

    .line 254
    :cond_2e
    if-nez v2, :cond_35

    if-nez v3, :cond_35

    .line 255
    const-string v5, "Off"

    goto :goto_e

    .line 256
    :cond_35
    if-ne v2, v7, :cond_3c

    if-ne v3, v7, :cond_3c

    .line 257
    const-string v5, "Stretch Low"

    goto :goto_e

    .line 258
    :cond_3c
    const/4 v5, 0x3

    if-ne v2, v5, :cond_44

    if-ne v3, v8, :cond_44

    .line 259
    const-string v5, "Stretch High"

    goto :goto_e

    .line 261
    :cond_44
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unknown ("

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, ")"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_66
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_66} :catch_68

    move-result-object v5

    goto :goto_e

    .line 262
    .end local v2    # "val1":I
    .end local v3    # "val2":I
    :catch_68
    move-exception v0

    .local v0, "e":Ljava/io/IOException;
    move-object v5, v6

    .line 263
    goto :goto_e
.end method


# virtual methods
.method public getAdvancedSceneModeDescription()Ljava/lang/String;
    .registers 7
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 346
    const/16 v0, 0x3d

    const/16 v1, 0xe

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Normal"

    aput-object v3, v1, v2

    const-string v2, "Outdoor/Illuminations/Flower/HDR Art"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "Indoor/Architecture/Objects/HDR B&W"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Creative"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Auto"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    aput-object v5, v1, v2

    const/4 v2, 0x6

    const-string v3, "Expressive"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "Retro"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string v3, "Pure"

    aput-object v3, v1, v2

    const/16 v2, 0x9

    const-string v3, "Elegant"

    aput-object v3, v1, v2

    const/16 v2, 0xa

    aput-object v5, v1, v2

    const/16 v2, 0xb

    const-string v3, "Monochrome"

    aput-object v3, v1, v2

    const/16 v2, 0xc

    const-string v3, "Dynamic Art"

    aput-object v3, v1, v2

    const/16 v2, 0xd

    const-string v3, "Silhouette"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAfAreaModeDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 583
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;

    const/16 v2, 0xf

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->getIntArray(I)[I

    move-result-object v0

    .line 584
    .local v0, "value":[I
    if-eqz v0, :cond_12

    array-length v1, v0

    const/4 v2, 0x2

    if-ge v1, v2, :cond_14

    .line 585
    :cond_12
    const/4 v1, 0x0

    .line 614
    :goto_13
    return-object v1

    .line 586
    :cond_14
    aget v1, v0, v4

    sparse-switch v1, :sswitch_data_122

    .line 614
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget v2, v0, v4

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget v2, v0, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_13

    .line 588
    :sswitch_41
    aget v1, v0, v3

    sparse-switch v1, :sswitch_data_138

    .line 591
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget v2, v0, v4

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget v2, v0, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_13

    .line 589
    :sswitch_6e
    const-string v1, "Spot Mode On"

    goto :goto_13

    .line 590
    :sswitch_71
    const-string v1, "Spot Mode Off"

    goto :goto_13

    .line 594
    :sswitch_74
    aget v1, v0, v3

    packed-switch v1, :pswitch_data_142

    .line 597
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget v2, v0, v4

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget v2, v0, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_13

    .line 595
    :pswitch_a2
    const-string v1, "Spot Focusing"

    goto/16 :goto_13

    .line 596
    :pswitch_a6
    const-string v1, "5-area"

    goto/16 :goto_13

    .line 600
    :sswitch_aa
    aget v1, v0, v3

    sparse-switch v1, :sswitch_data_14a

    .line 603
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget v2, v0, v4

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget v2, v0, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_13

    .line 601
    :sswitch_d8
    const-string v1, "1-area"

    goto/16 :goto_13

    .line 602
    :sswitch_dc
    const-string v1, "1-area (high speed)"

    goto/16 :goto_13

    .line 606
    :sswitch_e0
    aget v1, v0, v3

    packed-switch v1, :pswitch_data_154

    .line 611
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget v2, v0, v4

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget v2, v0, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_13

    .line 607
    :pswitch_10e
    const-string v1, "Auto or Face Detect"

    goto/16 :goto_13

    .line 608
    :pswitch_112
    const-string v1, "3-area (left)"

    goto/16 :goto_13

    .line 609
    :pswitch_116
    const-string v1, "3-area (center)"

    goto/16 :goto_13

    .line 610
    :pswitch_11a
    const-string v1, "3-area (right)"

    goto/16 :goto_13

    .line 613
    :sswitch_11e
    const-string v1, "Face Detect"

    goto/16 :goto_13

    .line 586
    :sswitch_data_122
    .sparse-switch
        0x0 -> :sswitch_41
        0x1 -> :sswitch_74
        0x10 -> :sswitch_aa
        0x20 -> :sswitch_e0
        0x40 -> :sswitch_11e
    .end sparse-switch

    .line 588
    :sswitch_data_138
    .sparse-switch
        0x1 -> :sswitch_6e
        0x10 -> :sswitch_71
    .end sparse-switch

    .line 594
    :pswitch_data_142
    .packed-switch 0x0
        :pswitch_a2
        :pswitch_a6
    .end packed-switch

    .line 600
    :sswitch_data_14a
    .sparse-switch
        0x0 -> :sswitch_d8
        0x10 -> :sswitch_dc
    .end sparse-switch

    .line 606
    :pswitch_data_154
    .packed-switch 0x0
        :pswitch_10e
        :pswitch_112
        :pswitch_116
        :pswitch_11a
    .end packed-switch
.end method

.method public getAfAssistLampDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 451
    const/16 v0, 0x31

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Fired"

    aput-object v3, v1, v2

    const-string v2, "Enabled but not used"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "Disabled but required"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Disabled and not required"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAudioDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 221
    const/16 v0, 0x20

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const-string v2, "On"

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getBabyAge1Description()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 688
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;

    const v2, 0x8010

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->getAge(I)Lcom/drew/metadata/Age;

    move-result-object v0

    .line 689
    .local v0, "age":Lcom/drew/metadata/Age;
    if-nez v0, :cond_f

    const/4 v1, 0x0

    :goto_e
    return-object v1

    :cond_f
    invoke-virtual {v0}, Lcom/drew/metadata/Age;->toFriendlyString()Ljava/lang/String;

    move-result-object v1

    goto :goto_e
.end method

.method public getBabyAgeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 681
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;

    const/16 v2, 0x33

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->getAge(I)Lcom/drew/metadata/Age;

    move-result-object v0

    .line 682
    .local v0, "age":Lcom/drew/metadata/Age;
    if-nez v0, :cond_e

    const/4 v1, 0x0

    :goto_d
    return-object v1

    :cond_e
    invoke-virtual {v0}, Lcom/drew/metadata/Age;->toFriendlyString()Ljava/lang/String;

    move-result-object v1

    goto :goto_d
.end method

.method public getBabyNameDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 314
    const/16 v0, 0x66

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getAsciiStringFromBytes(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getBurstModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 391
    const/16 v0, 0x2a

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const/4 v3, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "On"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Indefinite"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Unlimited"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCityDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 296
    const/16 v0, 0x6d

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getAsciiStringFromBytes(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getColorEffectDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 374
    const/16 v0, 0x28

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const-string v2, "Warm"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "Cool"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Black & White"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Sepia"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getColorModeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 459
    const/16 v0, 0x32

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Normal"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Natural"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Vivid"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContrastDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 333
    const/16 v0, 0x39

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Normal"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContrastModeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 399
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;

    const/16 v2, 0x2c

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 400
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 401
    const/4 v1, 0x0

    .line 412
    :goto_d
    return-object v1

    .line 402
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sparse-switch v1, :sswitch_data_48

    .line 412
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

    .line 403
    :sswitch_2f
    const-string v1, "Normal"

    goto :goto_d

    .line 404
    :sswitch_32
    const-string v1, "Low"

    goto :goto_d

    .line 405
    :sswitch_35
    const-string v1, "High"

    goto :goto_d

    .line 406
    :sswitch_38
    const-string v1, "Medium Low"

    goto :goto_d

    .line 407
    :sswitch_3b
    const-string v1, "Medium High"

    goto :goto_d

    .line 408
    :sswitch_3e
    const-string v1, "Low"

    goto :goto_d

    .line 409
    :sswitch_41
    const-string v1, "Normal"

    goto :goto_d

    .line 410
    :sswitch_44
    const-string v1, "High"

    goto :goto_d

    .line 402
    nop

    :sswitch_data_48
    .sparse-switch
        0x0 -> :sswitch_2f
        0x1 -> :sswitch_32
        0x2 -> :sswitch_35
        0x6 -> :sswitch_38
        0x7 -> :sswitch_3b
        0x100 -> :sswitch_3e
        0x110 -> :sswitch_41
        0x120 -> :sswitch_44
    .end sparse-switch
.end method

.method public getConversionLensDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 475
    const/16 v0, 0x35

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const-string v2, "Wide"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "Telephoto"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Macro"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCountryDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 284
    const/16 v0, 0x69

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getAsciiStringFromBytes(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 59
    sparse-switch p1, :sswitch_data_11c

    .line 161
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 61
    :sswitch_8
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getQualityModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 63
    :sswitch_d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getVersionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 65
    :sswitch_12
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getWhiteBalanceDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 67
    :sswitch_17
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getFocusModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 69
    :sswitch_1c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getAfAreaModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 71
    :sswitch_21
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getImageStabilizationDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 73
    :sswitch_26
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getMacroModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 75
    :sswitch_2b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getRecordModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 77
    :sswitch_30
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getAudioDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 79
    :sswitch_35
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getUnknownDataDumpDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 81
    :sswitch_3a
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getColorEffectDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 83
    :sswitch_3f
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getUptimeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 85
    :sswitch_44
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getBurstModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 87
    :sswitch_49
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getContrastModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 89
    :sswitch_4e
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getNoiseReductionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 91
    :sswitch_53
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getSelfTimerDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 93
    :sswitch_58
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getRotationDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 95
    :sswitch_5d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getAfAssistLampDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 97
    :sswitch_62
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getColorModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 99
    :sswitch_67
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getOpticalZoomModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 101
    :sswitch_6c
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getConversionLensDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 103
    :sswitch_71
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getContrastDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 105
    :sswitch_76
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getWorldTimeLocationDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 107
    :sswitch_7b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getAdvancedSceneModeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 109
    :sswitch_80
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getDetectedFacesDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 111
    :sswitch_85
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getTransformDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 113
    :sswitch_8b
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getTransform1Description()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 115
    :sswitch_91
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIntelligentExposureDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 117
    :sswitch_97
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getFlashWarningDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 119
    :sswitch_9d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getCountryDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 121
    :sswitch_a3
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getStateDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 123
    :sswitch_a9
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getCityDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 125
    :sswitch_af
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getLandmarkDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 127
    :sswitch_b5
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIntelligentResolutionDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 129
    :sswitch_bb
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getRecognizedFacesDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 131
    :sswitch_c1
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getPrintImageMatchingInfoDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 133
    :sswitch_c7
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getSceneModeDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 135
    :sswitch_cd
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getFlashFiredDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 137
    :sswitch_d3
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getTextStampDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 139
    :sswitch_d9
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getTextStamp1Description()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 141
    :sswitch_df
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getTextStamp2Description()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 143
    :sswitch_e5
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getTextStamp3Description()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 145
    :sswitch_eb
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getMakernoteVersionDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 147
    :sswitch_f1
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getExifVersionDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 149
    :sswitch_f7
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getInternalSerialNumberDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 151
    :sswitch_fd
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getTitleDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 153
    :sswitch_103
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getBabyNameDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 155
    :sswitch_109
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getLocationDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 157
    :sswitch_10f
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getBabyAgeDescription()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 159
    :sswitch_115
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getBabyAge1Description()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_7

    .line 59
    nop

    :sswitch_data_11c
    .sparse-switch
        0x1 -> :sswitch_8
        0x2 -> :sswitch_d
        0x3 -> :sswitch_12
        0x7 -> :sswitch_17
        0xf -> :sswitch_1c
        0x1a -> :sswitch_21
        0x1c -> :sswitch_26
        0x1f -> :sswitch_2b
        0x20 -> :sswitch_30
        0x21 -> :sswitch_35
        0x25 -> :sswitch_f7
        0x26 -> :sswitch_f1
        0x28 -> :sswitch_3a
        0x29 -> :sswitch_3f
        0x2a -> :sswitch_44
        0x2c -> :sswitch_49
        0x2d -> :sswitch_4e
        0x2e -> :sswitch_53
        0x30 -> :sswitch_58
        0x31 -> :sswitch_5d
        0x32 -> :sswitch_62
        0x33 -> :sswitch_10f
        0x34 -> :sswitch_67
        0x35 -> :sswitch_6c
        0x39 -> :sswitch_71
        0x3a -> :sswitch_76
        0x3b -> :sswitch_d3
        0x3d -> :sswitch_7b
        0x3e -> :sswitch_d9
        0x4e -> :sswitch_80
        0x59 -> :sswitch_85
        0x5d -> :sswitch_91
        0x61 -> :sswitch_bb
        0x62 -> :sswitch_97
        0x65 -> :sswitch_fd
        0x66 -> :sswitch_103
        0x67 -> :sswitch_109
        0x69 -> :sswitch_9d
        0x6b -> :sswitch_a3
        0x6d -> :sswitch_a9
        0x6f -> :sswitch_af
        0x70 -> :sswitch_b5
        0xe00 -> :sswitch_c1
        0x8000 -> :sswitch_eb
        0x8001 -> :sswitch_c7
        0x8007 -> :sswitch_cd
        0x8008 -> :sswitch_df
        0x8009 -> :sswitch_e5
        0x8010 -> :sswitch_115
        0x8012 -> :sswitch_8b
    .end sparse-switch
.end method

.method public getDetectedFacesDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 483
    iget-object v0, p0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;

    invoke-virtual {v0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->getDetectedFaces()[Lcom/drew/metadata/Face;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->buildFacesDescription([Lcom/drew/metadata/Face;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExifVersionDescription()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 649
    const/16 v0, 0x26

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getVersionBytesDescription(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFlashFiredDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 204
    const v0, 0x8007

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const-string v2, "On"

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFlashWarningDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 277
    const/16 v0, 0x62

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "No"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Yes (Flash required but disabled)"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFocusModeDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 576
    const/4 v0, 0x7

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Auto"

    aput-object v3, v1, v2

    const-string v2, "Manual"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const/4 v3, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Auto, Focus Button"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Auto, Continuous"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getImageStabilizationDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x2

    .line 210
    const/16 v0, 0x1a

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "On, Mode 1"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Off"

    aput-object v3, v1, v2

    const-string v2, "On, Mode 2"

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIntelligentExposureDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 270
    const/16 v0, 0x5d

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Low"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Standard"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "High"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIntelligentResolutionDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 326
    const/16 v0, 0x70

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const/4 v3, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Auto"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "On"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getInternalSerialNumberDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 655
    const/16 v0, 0x25

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->get7BitStringFromBytes(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLandmarkDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 302
    const/16 v0, 0x6f

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getAsciiStringFromBytes(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLocationDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 320
    const/16 v0, 0x67

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getAsciiStringFromBytes(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMacroModeDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 198
    const/16 v0, 0x1c

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const-string v2, "On"

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMakernoteVersionDescription()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 643
    const v0, 0x8000

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getVersionBytesDescription(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNoiseReductionDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 419
    const/16 v0, 0x2d

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Standard (0)"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Low (-1)"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "High (+1)"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Lowest (-2)"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Highest (+2)"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOpticalZoomModeDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 467
    const/16 v0, 0x34

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Standard"

    aput-object v3, v1, v2

    const-string v2, "Extended"

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPrintImageMatchingInfoDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 168
    const/16 v0, 0xe00

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getByteLengthDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getQualityModeDescription()Ljava/lang/String;
    .registers 7
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 621
    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "High"

    aput-object v2, v0, v1

    const-string v1, "Normal"

    aput-object v1, v0, v4

    aput-object v3, v0, v5

    const/4 v1, 0x3

    aput-object v3, v0, v1

    const/4 v1, 0x4

    const-string v2, "Very High"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "Raw"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    aput-object v3, v0, v1

    const/4 v1, 0x7

    const-string v2, "Motion Picture"

    aput-object v2, v0, v1

    invoke-virtual {p0, v4, v5, v0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRecognizedFacesDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 489
    iget-object v0, p0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;

    invoke-virtual {v0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->getRecognizedFaces()[Lcom/drew/metadata/Face;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->buildFacesDescription([Lcom/drew/metadata/Face;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRecordModeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 564
    const/16 v0, 0x1f

    const/4 v1, 0x1

    sget-object v2, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->_sceneModes:[Ljava/lang/String;

    invoke-virtual {p0, v0, v1, v2}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRotationDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 435
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;

    const/16 v2, 0x30

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 436
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 437
    const/4 v1, 0x0

    .line 444
    :goto_d
    return-object v1

    .line 438
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_3c

    .line 444
    :pswitch_15
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

    .line 439
    :pswitch_2f
    const-string v1, "Horizontal"

    goto :goto_d

    .line 440
    :pswitch_32
    const-string v1, "Rotate 180"

    goto :goto_d

    .line 441
    :pswitch_35
    const-string v1, "Rotate 90 CW"

    goto :goto_d

    .line 442
    :pswitch_38
    const-string v1, "Rotate 270 CW"

    goto :goto_d

    .line 438
    nop

    :pswitch_data_3c
    .packed-switch 0x1
        :pswitch_2f
        :pswitch_15
        :pswitch_32
        :pswitch_15
        :pswitch_15
        :pswitch_35
        :pswitch_15
        :pswitch_38
    .end packed-switch
.end method

.method public getSceneModeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 570
    const v0, 0x8001

    const/4 v1, 0x1

    sget-object v2, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->_sceneModes:[Ljava/lang/String;

    invoke-virtual {p0, v0, v1, v2}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSelfTimerDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 427
    const/16 v0, 0x2e

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const-string v2, "10 s"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "2 s"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStateDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 290
    const/16 v0, 0x6b

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getAsciiStringFromBytes(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTextStamp1Description()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 180
    const/16 v0, 0x3e

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const-string v2, "On"

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTextStamp2Description()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 186
    const v0, 0x8008

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const-string v2, "On"

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTextStamp3Description()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 192
    const v0, 0x8009

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const-string v2, "On"

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTextStampDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 174
    const/16 v0, 0x3b

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Off"

    aput-object v3, v1, v2

    const-string v2, "On"

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTitleDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 308
    const/16 v0, 0x65

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getAsciiStringFromBytes(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTransform1Description()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 233
    const v0, 0x8012

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getTransformDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTransformDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 227
    const/16 v0, 0x59

    invoke-direct {p0, v0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getTransformDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUnknownDataDumpDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 368
    const/16 v0, 0x21

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getByteLengthDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUptimeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 382
    iget-object v1, p0, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;

    const/16 v2, 0x29

    invoke-virtual {v1, v2}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 383
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_e

    .line 384
    const/4 v1, 0x0

    .line 385
    :goto_d
    return-object v1

    :cond_e
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x42c80000    # 100.0f

    div-float/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " s"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_d
.end method

.method public getVersionDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v0, 0x2

    .line 637
    invoke-virtual {p0, v0, v0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getVersionBytesDescription(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWhiteBalanceDescription()Ljava/lang/String;
    .registers 7
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 661
    const/16 v0, 0xc

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "Auto"

    aput-object v2, v0, v1

    const-string v1, "Daylight"

    aput-object v1, v0, v4

    const/4 v1, 0x2

    const-string v2, "Cloudy"

    aput-object v2, v0, v1

    const-string v1, "Incandescent"

    aput-object v1, v0, v5

    const/4 v1, 0x4

    const-string v2, "Manual"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    aput-object v3, v0, v1

    const/4 v1, 0x6

    aput-object v3, v0, v1

    const/4 v1, 0x7

    const-string v2, "Flash"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    aput-object v3, v0, v1

    const/16 v1, 0x9

    const-string v2, "Black & White"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "Manual"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "Shade"

    aput-object v2, v0, v1

    invoke-virtual {p0, v5, v4, v0}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWorldTimeLocationDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 339
    const/16 v0, 0x3a

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Home"

    aput-object v3, v1, v2

    const-string v2, "Destination"

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
