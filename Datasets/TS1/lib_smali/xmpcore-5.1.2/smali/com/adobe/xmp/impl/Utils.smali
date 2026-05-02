.class public Lcom/adobe/xmp/impl/Utils;
.super Ljava/lang/Object;
.source "Utils.java"

# interfaces
.implements Lcom/adobe/xmp/XMPConst;


# static fields
.field public static final UUID_LENGTH:I = 0x24

.field public static final UUID_SEGMENT_COUNT:I = 0x4

.field private static xmlNameChars:[Z

.field private static xmlNameStartChars:[Z


# direct methods
.method static constructor <clinit>()V
    .registers 0

    .prologue
    .line 34
    invoke-static {}, Lcom/adobe/xmp/impl/Utils;->initCharTables()V

    .line 35
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    return-void
.end method

.method static checkUUIDFormat(Ljava/lang/String;)Z
    .registers 8
    .param p0, "uuid"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 274
    const/4 v2, 0x1

    .line 275
    .local v2, "result":Z
    const/4 v0, 0x0

    .line 276
    .local v0, "delimCnt":I
    const/4 v1, 0x0

    .line 278
    .local v1, "delimPos":I
    if-nez p0, :cond_8

    .line 293
    :goto_7
    return v4

    .line 283
    :cond_8
    const/4 v1, 0x0

    :goto_9
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v1, v5, :cond_31

    .line 285
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x2d

    if-ne v5, v6, :cond_2c

    .line 287
    add-int/lit8 v0, v0, 0x1

    .line 288
    if-eqz v2, :cond_2f

    const/16 v5, 0x8

    if-eq v1, v5, :cond_2b

    const/16 v5, 0xd

    if-eq v1, v5, :cond_2b

    const/16 v5, 0x12

    if-eq v1, v5, :cond_2b

    const/16 v5, 0x17

    if-ne v1, v5, :cond_2f

    :cond_2b
    move v2, v3

    .line 283
    :cond_2c
    :goto_2c
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    :cond_2f
    move v2, v4

    .line 288
    goto :goto_2c

    .line 293
    :cond_31
    if-eqz v2, :cond_3c

    const/4 v5, 0x4

    if-ne v5, v0, :cond_3c

    const/16 v5, 0x24

    if-ne v5, v1, :cond_3c

    :goto_3a
    move v4, v3

    goto :goto_7

    :cond_3c
    move v3, v4

    goto :goto_3a
.end method

.method public static escapeXML(Ljava/lang/String;ZZ)Ljava/lang/String;
    .registers 11
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "forAttribute"    # Z
    .param p2, "escapeWhitespaces"    # Z

    .prologue
    const/16 v7, 0xd

    const/16 v6, 0xa

    const/16 v5, 0x9

    .line 373
    const/4 v3, 0x0

    .line 374
    .local v3, "needsEscaping":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_8
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v2, v4, :cond_2d

    .line 376
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 377
    .local v1, "c":C
    const/16 v4, 0x3c

    if-eq v1, v4, :cond_2c

    const/16 v4, 0x3e

    if-eq v1, v4, :cond_2c

    const/16 v4, 0x26

    if-eq v1, v4, :cond_2c

    if-eqz p2, :cond_26

    if-eq v1, v5, :cond_2c

    if-eq v1, v6, :cond_2c

    if-eq v1, v7, :cond_2c

    :cond_26
    if-eqz p1, :cond_30

    const/16 v4, 0x22

    if-ne v1, v4, :cond_30

    .line 382
    :cond_2c
    const/4 v3, 0x1

    .line 387
    .end local v1    # "c":C
    :cond_2d
    if-nez v3, :cond_33

    .line 421
    .end local p0    # "value":Ljava/lang/String;
    :goto_2f
    return-object p0

    .line 374
    .restart local v1    # "c":C
    .restart local p0    # "value":Ljava/lang/String;
    :cond_30
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 395
    .end local v1    # "c":C
    :cond_33
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    mul-int/lit8 v4, v4, 0x4

    div-int/lit8 v4, v4, 0x3

    invoke-direct {v0, v4}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 396
    .local v0, "buffer":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    :goto_41
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v2, v4, :cond_8f

    .line 398
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 399
    .restart local v1    # "c":C
    if-eqz p2, :cond_53

    if-eq v1, v5, :cond_79

    if-eq v1, v6, :cond_79

    if-eq v1, v7, :cond_79

    .line 401
    :cond_53
    sparse-switch v1, :sswitch_data_94

    .line 409
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 396
    :goto_59
    add-int/lit8 v2, v2, 0x1

    goto :goto_41

    .line 405
    :sswitch_5c
    const-string v4, "&lt;"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_59

    .line 406
    :sswitch_62
    const-string v4, "&gt;"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_59

    .line 407
    :sswitch_68
    const-string v4, "&amp;"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_59

    .line 408
    :sswitch_6e
    if-eqz p1, :cond_76

    const-string v4, "&quot;"

    :goto_72
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_59

    :cond_76
    const-string v4, "\""

    goto :goto_72

    .line 416
    :cond_79
    const-string v4, "&#x"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 417
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 418
    const/16 v4, 0x3b

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_59

    .line 421
    .end local v1    # "c":C
    :cond_8f
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_2f

    .line 401
    :sswitch_data_94
    .sparse-switch
        0x22 -> :sswitch_6e
        0x26 -> :sswitch_68
        0x3c -> :sswitch_5c
        0x3e -> :sswitch_62
    .end sparse-switch
.end method

.method private static initCharTables()V
    .registers 5

    .prologue
    const/16 v4, 0x100

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 497
    new-array v1, v4, [Z

    sput-object v1, Lcom/adobe/xmp/impl/Utils;->xmlNameChars:[Z

    .line 498
    new-array v1, v4, [Z

    sput-object v1, Lcom/adobe/xmp/impl/Utils;->xmlNameStartChars:[Z

    .line 500
    const/4 v0, 0x0

    .local v0, "ch":C
    :goto_d
    sget-object v1, Lcom/adobe/xmp/impl/Utils;->xmlNameChars:[Z

    array-length v1, v1

    if-ge v0, v1, :cond_6e

    .line 502
    sget-object v4, Lcom/adobe/xmp/impl/Utils;->xmlNameStartChars:[Z

    const/16 v1, 0x3a

    if-eq v0, v1, :cond_44

    const/16 v1, 0x41

    if-gt v1, v0, :cond_20

    const/16 v1, 0x5a

    if-le v0, v1, :cond_44

    :cond_20
    const/16 v1, 0x5f

    if-eq v0, v1, :cond_44

    const/16 v1, 0x61

    if-gt v1, v0, :cond_2c

    const/16 v1, 0x7a

    if-le v0, v1, :cond_44

    :cond_2c
    const/16 v1, 0xc0

    if-gt v1, v0, :cond_34

    const/16 v1, 0xd6

    if-le v0, v1, :cond_44

    :cond_34
    const/16 v1, 0xd8

    if-gt v1, v0, :cond_3c

    const/16 v1, 0xf6

    if-le v0, v1, :cond_44

    :cond_3c
    const/16 v1, 0xf8

    if-gt v1, v0, :cond_6a

    const/16 v1, 0xff

    if-gt v0, v1, :cond_6a

    :cond_44
    move v1, v3

    :goto_45
    aput-boolean v1, v4, v0

    .line 511
    sget-object v4, Lcom/adobe/xmp/impl/Utils;->xmlNameChars:[Z

    sget-object v1, Lcom/adobe/xmp/impl/Utils;->xmlNameStartChars:[Z

    aget-boolean v1, v1, v0

    if-nez v1, :cond_63

    const/16 v1, 0x2d

    if-eq v0, v1, :cond_63

    const/16 v1, 0x2e

    if-eq v0, v1, :cond_63

    const/16 v1, 0x30

    if-gt v1, v0, :cond_5f

    const/16 v1, 0x39

    if-le v0, v1, :cond_63

    :cond_5f
    const/16 v1, 0xb7

    if-ne v0, v1, :cond_6c

    :cond_63
    move v1, v3

    :goto_64
    aput-boolean v1, v4, v0

    .line 500
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_d

    :cond_6a
    move v1, v2

    .line 502
    goto :goto_45

    :cond_6c
    move v1, v2

    .line 511
    goto :goto_64

    .line 518
    :cond_6e
    return-void
.end method

.method static isControlChar(C)Z
    .registers 2
    .param p0, "c"    # C

    .prologue
    .line 353
    const/16 v0, 0x1f

    if-le p0, v0, :cond_8

    const/16 v0, 0x7f

    if-ne p0, v0, :cond_16

    :cond_8
    const/16 v0, 0x9

    if-eq p0, v0, :cond_16

    const/16 v0, 0xa

    if-eq p0, v0, :cond_16

    const/16 v0, 0xd

    if-eq p0, v0, :cond_16

    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method static isInternalProperty(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4
    .param p0, "schema"    # Ljava/lang/String;
    .param p1, "prop"    # Ljava/lang/String;

    .prologue
    .line 163
    const/4 v0, 0x0

    .line 165
    .local v0, "isInternal":Z
    const-string v1, "http://purl.org/dc/elements/1.1/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 167
    const-string v1, "dc:format"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_19

    const-string v1, "dc:language"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 169
    :cond_19
    const/4 v0, 0x1

    .line 255
    :cond_1a
    :goto_1a
    return v0

    .line 172
    :cond_1b
    const-string v1, "http://ns.adobe.com/xap/1.0/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_55

    .line 174
    const-string v1, "xmp:BaseURL"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_53

    const-string v1, "xmp:CreatorTool"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_53

    const-string v1, "xmp:Format"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_53

    const-string v1, "xmp:Locale"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_53

    const-string v1, "xmp:MetadataDate"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_53

    const-string v1, "xmp:ModifyDate"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 178
    :cond_53
    const/4 v0, 0x1

    goto :goto_1a

    .line 181
    :cond_55
    const-string v1, "http://ns.adobe.com/pdf/1.3/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_87

    .line 183
    const-string v1, "pdf:BaseURL"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_85

    const-string v1, "pdf:Creator"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_85

    const-string v1, "pdf:ModDate"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_85

    const-string v1, "pdf:PDFVersion"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_85

    const-string v1, "pdf:Producer"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 187
    :cond_85
    const/4 v0, 0x1

    goto :goto_1a

    .line 190
    :cond_87
    const-string v1, "http://ns.adobe.com/tiff/1.0/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_ab

    .line 192
    const/4 v0, 0x1

    .line 193
    const-string v1, "tiff:ImageDescription"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a8

    const-string v1, "tiff:Artist"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a8

    const-string v1, "tiff:Copyright"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 196
    :cond_a8
    const/4 v0, 0x0

    goto/16 :goto_1a

    .line 199
    :cond_ab
    const-string v1, "http://ns.adobe.com/exif/1.0/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_bf

    .line 201
    const/4 v0, 0x1

    .line 202
    const-string v1, "exif:UserComment"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 204
    const/4 v0, 0x0

    goto/16 :goto_1a

    .line 207
    :cond_bf
    const-string v1, "http://ns.adobe.com/exif/1.0/aux/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_ca

    .line 209
    const/4 v0, 0x1

    goto/16 :goto_1a

    .line 211
    :cond_ca
    const-string v1, "http://ns.adobe.com/photoshop/1.0/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_dd

    .line 213
    const-string v1, "photoshop:ICCProfile"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 215
    const/4 v0, 0x1

    goto/16 :goto_1a

    .line 218
    :cond_dd
    const-string v1, "http://ns.adobe.com/camera-raw-settings/1.0/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_100

    .line 220
    const-string v1, "crs:Version"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_fd

    const-string v1, "crs:RawFileName"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_fd

    const-string v1, "crs:ToneCurveName"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 223
    :cond_fd
    const/4 v0, 0x1

    goto/16 :goto_1a

    .line 226
    :cond_100
    const-string v1, "http://ns.adobe.com/StockPhoto/1.0/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10b

    .line 228
    const/4 v0, 0x1

    goto/16 :goto_1a

    .line 230
    :cond_10b
    const-string v1, "http://ns.adobe.com/xap/1.0/mm/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_116

    .line 232
    const/4 v0, 0x1

    goto/16 :goto_1a

    .line 234
    :cond_116
    const-string v1, "http://ns.adobe.com/xap/1.0/t/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_121

    .line 236
    const/4 v0, 0x1

    goto/16 :goto_1a

    .line 238
    :cond_121
    const-string v1, "http://ns.adobe.com/xap/1.0/t/pg/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_12c

    .line 240
    const/4 v0, 0x1

    goto/16 :goto_1a

    .line 242
    :cond_12c
    const-string v1, "http://ns.adobe.com/xap/1.0/g/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_137

    .line 244
    const/4 v0, 0x1

    goto/16 :goto_1a

    .line 246
    :cond_137
    const-string v1, "http://ns.adobe.com/xap/1.0/g/img/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_142

    .line 248
    const/4 v0, 0x1

    goto/16 :goto_1a

    .line 250
    :cond_142
    const-string v1, "http://ns.adobe.com/xap/1.0/sType/Font#"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 252
    const/4 v0, 0x1

    goto/16 :goto_1a
.end method

.method private static isNameChar(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 482
    const/16 v0, 0xff

    if-gt p0, v0, :cond_a

    sget-object v0, Lcom/adobe/xmp/impl/Utils;->xmlNameChars:[Z

    aget-boolean v0, v0, p0

    if-nez v0, :cond_20

    :cond_a
    invoke-static {p0}, Lcom/adobe/xmp/impl/Utils;->isNameStartChar(C)Z

    move-result v0

    if-nez v0, :cond_20

    const/16 v0, 0x300

    if-lt p0, v0, :cond_18

    const/16 v0, 0x36f

    if-le p0, v0, :cond_20

    :cond_18
    const/16 v0, 0x203f

    if-lt p0, v0, :cond_22

    const/16 v0, 0x2040

    if-gt p0, v0, :cond_22

    :cond_20
    const/4 v0, 0x1

    :goto_21
    return v0

    :cond_22
    const/4 v0, 0x0

    goto :goto_21
.end method

.method private static isNameStartChar(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 457
    const/16 v0, 0xff

    if-gt p0, v0, :cond_a

    sget-object v0, Lcom/adobe/xmp/impl/Utils;->xmlNameStartChars:[Z

    aget-boolean v0, v0, p0

    if-nez v0, :cond_60

    :cond_a
    const/16 v0, 0x100

    if-lt p0, v0, :cond_12

    const/16 v0, 0x2ff

    if-le p0, v0, :cond_60

    :cond_12
    const/16 v0, 0x370

    if-lt p0, v0, :cond_1a

    const/16 v0, 0x37d

    if-le p0, v0, :cond_60

    :cond_1a
    const/16 v0, 0x37f

    if-lt p0, v0, :cond_22

    const/16 v0, 0x1fff

    if-le p0, v0, :cond_60

    :cond_22
    const/16 v0, 0x200c

    if-lt p0, v0, :cond_2a

    const/16 v0, 0x200d

    if-le p0, v0, :cond_60

    :cond_2a
    const/16 v0, 0x2070

    if-lt p0, v0, :cond_32

    const/16 v0, 0x218f

    if-le p0, v0, :cond_60

    :cond_32
    const/16 v0, 0x2c00

    if-lt p0, v0, :cond_3a

    const/16 v0, 0x2fef

    if-le p0, v0, :cond_60

    :cond_3a
    const/16 v0, 0x3001

    if-lt p0, v0, :cond_43

    const v0, 0xd7ff

    if-le p0, v0, :cond_60

    :cond_43
    const v0, 0xf900

    if-lt p0, v0, :cond_4d

    const v0, 0xfdcf

    if-le p0, v0, :cond_60

    :cond_4d
    const v0, 0xfdf0

    if-lt p0, v0, :cond_57

    const v0, 0xfffd

    if-le p0, v0, :cond_60

    :cond_57
    const/high16 v0, 0x10000

    if-lt p0, v0, :cond_62

    const v0, 0xeffff

    if-gt p0, v0, :cond_62

    :cond_60
    const/4 v0, 0x1

    :goto_61
    return v0

    :cond_62
    const/4 v0, 0x0

    goto :goto_61
.end method

.method public static isXMLName(Ljava/lang/String;)Z
    .registers 4
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 308
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_12

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lcom/adobe/xmp/impl/Utils;->isNameStartChar(C)Z

    move-result v2

    if-nez v2, :cond_12

    .line 319
    :cond_11
    :goto_11
    return v1

    .line 312
    :cond_12
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_13
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_26

    .line 314
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lcom/adobe/xmp/impl/Utils;->isNameChar(C)Z

    move-result v2

    if-eqz v2, :cond_11

    .line 312
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 319
    :cond_26
    const/4 v1, 0x1

    goto :goto_11
.end method

.method public static isXMLNameNS(Ljava/lang/String;)Z
    .registers 5
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const/16 v3, 0x3a

    const/4 v1, 0x0

    .line 332
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1a

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lcom/adobe/xmp/impl/Utils;->isNameStartChar(C)Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v3, :cond_1a

    .line 343
    :cond_19
    :goto_19
    return v1

    .line 336
    :cond_1a
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_1b
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_34

    .line 338
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lcom/adobe/xmp/impl/Utils;->isNameChar(C)Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v2, v3, :cond_19

    .line 336
    add-int/lit8 v0, v0, 0x1

    goto :goto_1b

    .line 343
    :cond_34
    const/4 v1, 0x1

    goto :goto_19
.end method

.method public static normalizeLangValue(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 65
    const-string v3, "x-default"

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 99
    .end local p0    # "value":Ljava/lang/String;
    :goto_8
    return-object p0

    .line 70
    .restart local p0    # "value":Ljava/lang/String;
    :cond_9
    const/4 v2, 0x1

    .line 71
    .local v2, "subTag":I
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 73
    .local v0, "buffer":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_10
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_42

    .line 75
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_48

    .line 88
    const/4 v3, 0x2

    if-eq v2, v3, :cond_36

    .line 90
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 73
    :goto_2b
    :sswitch_2b
    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    .line 80
    :sswitch_2e
    const/16 v3, 0x2d

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 81
    add-int/lit8 v2, v2, 0x1

    .line 82
    goto :goto_2b

    .line 94
    :cond_36
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2b

    .line 99
    :cond_42
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_8

    .line 75
    nop

    :sswitch_data_48
    .sparse-switch
        0x20 -> :sswitch_2b
        0x2d -> :sswitch_2e
        0x5f -> :sswitch_2e
    .end sparse-switch
.end method

.method static removeControlChars(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 435
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, p0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 436
    .local v0, "buffer":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    if-ge v1, v2, :cond_1e

    .line 438
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lcom/adobe/xmp/impl/Utils;->isControlChar(C)Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 440
    const/16 v2, 0x20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    .line 436
    :cond_1b
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 443
    :cond_1e
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method static splitNameAndValue(Ljava/lang/String;)[Ljava/lang/String;
    .registers 10
    .param p0, "selector"    # Ljava/lang/String;

    .prologue
    .line 124
    const/16 v6, 0x3d

    invoke-virtual {p0, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 125
    .local v1, "eq":I
    const/4 v3, 0x1

    .line 126
    .local v3, "pos":I
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x3f

    if-ne v6, v7, :cond_11

    .line 128
    add-int/lit8 v3, v3, 0x1

    .line 130
    :cond_11
    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 133
    .local v2, "name":Ljava/lang/String;
    add-int/lit8 v3, v1, 0x1

    .line 134
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 135
    .local v4, "quote":C
    add-int/lit8 v3, v3, 0x1

    .line 136
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v0, v6, -0x2

    .line 137
    .local v0, "end":I
    new-instance v5, Ljava/lang/StringBuffer;

    sub-int v6, v0, v1

    invoke-direct {v5, v6}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 138
    .local v5, "value":Ljava/lang/StringBuffer;
    :cond_2a
    :goto_2a
    if-ge v3, v0, :cond_3e

    .line 140
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 141
    add-int/lit8 v3, v3, 0x1

    .line 142
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v4, :cond_2a

    .line 145
    add-int/lit8 v3, v3, 0x1

    goto :goto_2a

    .line 148
    :cond_3e
    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v2, v6, v7

    const/4 v7, 0x1

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    return-object v6
.end method
