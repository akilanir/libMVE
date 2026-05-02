.class public Lcom/yalantis/ucrop/util/ImageHeaderParser;
.super Ljava/lang/Object;
.source "ImageHeaderParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yalantis/ucrop/util/ImageHeaderParser$StreamReader;,
        Lcom/yalantis/ucrop/util/ImageHeaderParser$Reader;,
        Lcom/yalantis/ucrop/util/ImageHeaderParser$RandomAccessReader;
    }
.end annotation


# static fields
.field private static final BYTES_PER_FORMAT:[I

.field private static final EXIF_MAGIC_NUMBER:I = 0xffd8

.field private static final EXIF_SEGMENT_TYPE:I = 0xe1

.field private static final INTEL_TIFF_MAGIC_NUMBER:I = 0x4949

.field private static final JPEG_EXIF_SEGMENT_PREAMBLE:Ljava/lang/String; = "Exif\u0000\u0000"

.field private static final JPEG_EXIF_SEGMENT_PREAMBLE_BYTES:[B

.field private static final MARKER_EOI:I = 0xd9

.field private static final MOTOROLA_TIFF_MAGIC_NUMBER:I = 0x4d4d

.field private static final ORIENTATION_TAG_TYPE:I = 0x112

.field private static final SEGMENT_SOS:I = 0xda

.field private static final SEGMENT_START_ID:I = 0xff

.field private static final TAG:Ljava/lang/String; = "ImageHeaderParser"

.field public static final UNKNOWN_ORIENTATION:I = -0x1


# instance fields
.field private final reader:Lcom/yalantis/ucrop/util/ImageHeaderParser$Reader;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 59
    const-string v0, "Exif\u0000\u0000"

    const-string v1, "UTF-8"

    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lcom/yalantis/ucrop/util/ImageHeaderParser;->JPEG_EXIF_SEGMENT_PREAMBLE_BYTES:[B

    .line 66
    const/16 v0, 0xd

    new-array v0, v0, [I

    fill-array-data v0, :array_18

    sput-object v0, Lcom/yalantis/ucrop/util/ImageHeaderParser;->BYTES_PER_FORMAT:[I

    return-void

    :array_18
    .array-data 4
        0x0
        0x1
        0x1
        0x2
        0x4
        0x8
        0x1
        0x1
        0x2
        0x4
        0x8
        0x4
        0x8
    .end array-data
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    new-instance v0, Lcom/yalantis/ucrop/util/ImageHeaderParser$StreamReader;

    invoke-direct {v0, p1}, Lcom/yalantis/ucrop/util/ImageHeaderParser$StreamReader;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lcom/yalantis/ucrop/util/ImageHeaderParser;->reader:Lcom/yalantis/ucrop/util/ImageHeaderParser$Reader;

    .line 72
    return-void
.end method

.method private static calcTagOffset(II)I
    .registers 4
    .param p0, "ifdOffset"    # I
    .param p1, "tagIndex"    # I

    .prologue
    .line 275
    add-int/lit8 v0, p0, 0x2

    mul-int/lit8 v1, p1, 0xc

    add-int/2addr v0, v1

    return v0
.end method

.method private static handles(I)Z
    .registers 3
    .param p0, "imageMagicNumber"    # I

    .prologue
    const v1, 0xffd8

    .line 279
    and-int v0, p0, v1

    if-eq v0, v1, :cond_f

    const/16 v0, 0x4d4d

    if-eq p0, v0, :cond_f

    const/16 v0, 0x4949

    if-ne p0, v0, :cond_11

    :cond_f
    const/4 v0, 0x1

    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method private hasJpegExifPreamble([BI)Z
    .registers 7
    .param p1, "exifData"    # [B
    .param p2, "exifSegmentLength"    # I

    .prologue
    .line 127
    if-eqz p1, :cond_1a

    sget-object v2, Lcom/yalantis/ucrop/util/ImageHeaderParser;->JPEG_EXIF_SEGMENT_PREAMBLE_BYTES:[B

    array-length v2, v2

    if-le p2, v2, :cond_1a

    const/4 v1, 0x1

    .line 129
    .local v1, "result":Z
    :goto_8
    if-eqz v1, :cond_19

    .line 130
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    sget-object v2, Lcom/yalantis/ucrop/util/ImageHeaderParser;->JPEG_EXIF_SEGMENT_PREAMBLE_BYTES:[B

    array-length v2, v2

    if-ge v0, v2, :cond_19

    .line 131
    aget-byte v2, p1, v0

    sget-object v3, Lcom/yalantis/ucrop/util/ImageHeaderParser;->JPEG_EXIF_SEGMENT_PREAMBLE_BYTES:[B

    aget-byte v3, v3, v0

    if-eq v2, v3, :cond_1c

    .line 132
    const/4 v1, 0x0

    .line 137
    .end local v0    # "i":I
    :cond_19
    return v1

    .line 127
    .end local v1    # "result":Z
    :cond_1a
    const/4 v1, 0x0

    goto :goto_8

    .line 130
    .restart local v0    # "i":I
    .restart local v1    # "result":Z
    :cond_1c
    add-int/lit8 v0, v0, 0x1

    goto :goto_b
.end method

.method private moveToExifSegmentAndGetLength()I
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x3

    const/4 v5, -0x1

    .line 148
    :cond_2
    iget-object v6, p0, Lcom/yalantis/ucrop/util/ImageHeaderParser;->reader:Lcom/yalantis/ucrop/util/ImageHeaderParser$Reader;

    invoke-interface {v6}, Lcom/yalantis/ucrop/util/ImageHeaderParser$Reader;->getUInt8()S

    move-result v0

    .line 149
    .local v0, "segmentId":S
    const/16 v6, 0xff

    if-eq v0, v6, :cond_2e

    .line 150
    const-string v6, "ImageHeaderParser"

    invoke-static {v6, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_2c

    .line 151
    const-string v6, "ImageHeaderParser"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unknown segmentId="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2c
    move v1, v5

    .line 182
    :cond_2d
    :goto_2d
    return v1

    .line 156
    :cond_2e
    iget-object v6, p0, Lcom/yalantis/ucrop/util/ImageHeaderParser;->reader:Lcom/yalantis/ucrop/util/ImageHeaderParser$Reader;

    invoke-interface {v6}, Lcom/yalantis/ucrop/util/ImageHeaderParser$Reader;->getUInt8()S

    move-result v2

    .line 158
    .local v2, "segmentType":S
    const/16 v6, 0xda

    if-ne v2, v6, :cond_3a

    move v1, v5

    .line 159
    goto :goto_2d

    .line 160
    :cond_3a
    const/16 v6, 0xd9

    if-ne v2, v6, :cond_4f

    .line 161
    const-string v6, "ImageHeaderParser"

    invoke-static {v6, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_4d

    .line 162
    const-string v6, "ImageHeaderParser"

    const-string v7, "Found MARKER_EOI in exif segment"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4d
    move v1, v5

    .line 164
    goto :goto_2d

    .line 168
    :cond_4f
    iget-object v6, p0, Lcom/yalantis/ucrop/util/ImageHeaderParser;->reader:Lcom/yalantis/ucrop/util/ImageHeaderParser$Reader;

    invoke-interface {v6}, Lcom/yalantis/ucrop/util/ImageHeaderParser$Reader;->getUInt16()I

    move-result v6

    add-int/lit8 v1, v6, -0x2

    .line 170
    .local v1, "segmentLength":I
    const/16 v6, 0xe1

    if-eq v2, v6, :cond_2d

    .line 171
    iget-object v6, p0, Lcom/yalantis/ucrop/util/ImageHeaderParser;->reader:Lcom/yalantis/ucrop/util/ImageHeaderParser$Reader;

    int-to-long v7, v1

    invoke-interface {v6, v7, v8}, Lcom/yalantis/ucrop/util/ImageHeaderParser$Reader;->skip(J)J

    move-result-wide v3

    .line 172
    .local v3, "skipped":J
    int-to-long v6, v1

    cmp-long v6, v3, v6

    if-eqz v6, :cond_2

    .line 173
    const-string v6, "ImageHeaderParser"

    invoke-static {v6, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_9b

    .line 174
    const-string v6, "ImageHeaderParser"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unable to skip enough data, type: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", wanted to skip: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", but actually skipped: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_9b
    move v1, v5

    .line 179
    goto :goto_2d
.end method

.method private static parseExifSegment(Lcom/yalantis/ucrop/util/ImageHeaderParser$RandomAccessReader;)I
    .registers 16
    .param p0, "segmentData"    # Lcom/yalantis/ucrop/util/ImageHeaderParser$RandomAccessReader;

    .prologue
    .line 188
    const-string v12, "Exif\u0000\u0000"

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v6

    .line 190
    .local v6, "headerOffsetSize":I
    invoke-virtual {p0, v6}, Lcom/yalantis/ucrop/util/ImageHeaderParser$RandomAccessReader;->getInt16(I)S

    move-result v2

    .line 192
    .local v2, "byteOrderIdentifier":S
    const/16 v12, 0x4d4d

    if-ne v2, v12, :cond_31

    .line 193
    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 203
    .local v1, "byteOrder":Ljava/nio/ByteOrder;
    :goto_10
    invoke-virtual {p0, v1}, Lcom/yalantis/ucrop/util/ImageHeaderParser$RandomAccessReader;->order(Ljava/nio/ByteOrder;)V

    .line 205
    add-int/lit8 v12, v6, 0x4

    invoke-virtual {p0, v12}, Lcom/yalantis/ucrop/util/ImageHeaderParser$RandomAccessReader;->getInt32(I)I

    move-result v12

    add-int v4, v12, v6

    .line 206
    .local v4, "firstIfdOffset":I
    invoke-virtual {p0, v4}, Lcom/yalantis/ucrop/util/ImageHeaderParser$RandomAccessReader;->getInt16(I)S

    move-result v8

    .line 209
    .local v8, "tagCount":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_20
    if-ge v7, v8, :cond_178

    .line 210
    invoke-static {v4, v7}, Lcom/yalantis/ucrop/util/ImageHeaderParser;->calcTagOffset(II)I

    move-result v9

    .line 211
    .local v9, "tagOffset":I
    invoke-virtual {p0, v9}, Lcom/yalantis/ucrop/util/ImageHeaderParser$RandomAccessReader;->getInt16(I)S

    move-result v10

    .line 214
    .local v10, "tagType":I
    const/16 v12, 0x112

    if-eq v10, v12, :cond_5c

    .line 209
    :cond_2e
    :goto_2e
    add-int/lit8 v7, v7, 0x1

    goto :goto_20

    .line 194
    .end local v1    # "byteOrder":Ljava/nio/ByteOrder;
    .end local v4    # "firstIfdOffset":I
    .end local v7    # "i":I
    .end local v8    # "tagCount":I
    .end local v9    # "tagOffset":I
    .end local v10    # "tagType":I
    :cond_31
    const/16 v12, 0x4949

    if-ne v2, v12, :cond_38

    .line 195
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .restart local v1    # "byteOrder":Ljava/nio/ByteOrder;
    goto :goto_10

    .line 197
    .end local v1    # "byteOrder":Ljava/nio/ByteOrder;
    :cond_38
    const-string v12, "ImageHeaderParser"

    const/4 v13, 0x3

    invoke-static {v12, v13}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v12

    if-eqz v12, :cond_59

    .line 198
    const-string v12, "ImageHeaderParser"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Unknown endianness = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    :cond_59
    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .restart local v1    # "byteOrder":Ljava/nio/ByteOrder;
    goto :goto_10

    .line 218
    .restart local v4    # "firstIfdOffset":I
    .restart local v7    # "i":I
    .restart local v8    # "tagCount":I
    .restart local v9    # "tagOffset":I
    .restart local v10    # "tagType":I
    :cond_5c
    add-int/lit8 v12, v9, 0x2

    invoke-virtual {p0, v12}, Lcom/yalantis/ucrop/util/ImageHeaderParser$RandomAccessReader;->getInt16(I)S

    move-result v5

    .line 221
    .local v5, "formatCode":I
    const/4 v12, 0x1

    if-lt v5, v12, :cond_69

    const/16 v12, 0xc

    if-le v5, v12, :cond_8b

    .line 222
    :cond_69
    const-string v12, "ImageHeaderParser"

    const/4 v13, 0x3

    invoke-static {v12, v13}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v12

    if-eqz v12, :cond_2e

    .line 223
    const-string v12, "ImageHeaderParser"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Got invalid format code = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2e

    .line 228
    :cond_8b
    add-int/lit8 v12, v9, 0x4

    invoke-virtual {p0, v12}, Lcom/yalantis/ucrop/util/ImageHeaderParser$RandomAccessReader;->getInt32(I)I

    move-result v3

    .line 230
    .local v3, "componentCount":I
    if-gez v3, :cond_a4

    .line 231
    const-string v12, "ImageHeaderParser"

    const/4 v13, 0x3

    invoke-static {v12, v13}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v12

    if-eqz v12, :cond_2e

    .line 232
    const-string v12, "ImageHeaderParser"

    const-string v13, "Negative tiff component count"

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2e

    .line 237
    :cond_a4
    const-string v12, "ImageHeaderParser"

    const/4 v13, 0x3

    invoke-static {v12, v13}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v12

    if-eqz v12, :cond_e3

    .line 238
    const-string v12, "ImageHeaderParser"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Got tagIndex="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " tagType="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " formatCode="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " componentCount="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 242
    :cond_e3
    sget-object v12, Lcom/yalantis/ucrop/util/ImageHeaderParser;->BYTES_PER_FORMAT:[I

    aget v12, v12, v5

    add-int v0, v3, v12

    .line 244
    .local v0, "byteCount":I
    const/4 v12, 0x4

    if-le v0, v12, :cond_10f

    .line 245
    const-string v12, "ImageHeaderParser"

    const/4 v13, 0x3

    invoke-static {v12, v13}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v12

    if-eqz v12, :cond_2e

    .line 246
    const-string v12, "ImageHeaderParser"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Got byte count > 4, not orientation, continuing, formatCode="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2e

    .line 251
    :cond_10f
    add-int/lit8 v11, v9, 0x8

    .line 253
    .local v11, "tagValueOffset":I
    if-ltz v11, :cond_119

    invoke-virtual {p0}, Lcom/yalantis/ucrop/util/ImageHeaderParser$RandomAccessReader;->length()I

    move-result v12

    if-le v11, v12, :cond_146

    .line 254
    :cond_119
    const-string v12, "ImageHeaderParser"

    const/4 v13, 0x3

    invoke-static {v12, v13}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v12

    if-eqz v12, :cond_2e

    .line 255
    const-string v12, "ImageHeaderParser"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Illegal tagValueOffset="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " tagType="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2e

    .line 260
    :cond_146
    if-ltz v0, :cond_150

    add-int v12, v11, v0

    invoke-virtual {p0}, Lcom/yalantis/ucrop/util/ImageHeaderParser$RandomAccessReader;->length()I

    move-result v13

    if-le v12, v13, :cond_173

    .line 261
    :cond_150
    const-string v12, "ImageHeaderParser"

    const/4 v13, 0x3

    invoke-static {v12, v13}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v12

    if-eqz v12, :cond_2e

    .line 262
    const-string v12, "ImageHeaderParser"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Illegal number of bytes for TI tag data tagType="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2e

    .line 268
    :cond_173
    invoke-virtual {p0, v11}, Lcom/yalantis/ucrop/util/ImageHeaderParser$RandomAccessReader;->getInt16(I)S

    move-result v12

    .line 271
    .end local v0    # "byteCount":I
    .end local v3    # "componentCount":I
    .end local v5    # "formatCode":I
    .end local v9    # "tagOffset":I
    .end local v10    # "tagType":I
    .end local v11    # "tagValueOffset":I
    :goto_177
    return v12

    :cond_178
    const/4 v12, -0x1

    goto :goto_177
.end method

.method private parseExifSegment([BI)I
    .registers 9
    .param p1, "tempArray"    # [B
    .param p2, "exifSegmentLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x3

    const/4 v2, -0x1

    .line 105
    iget-object v3, p0, Lcom/yalantis/ucrop/util/ImageHeaderParser;->reader:Lcom/yalantis/ucrop/util/ImageHeaderParser$Reader;

    invoke-interface {v3, p1, p2}, Lcom/yalantis/ucrop/util/ImageHeaderParser$Reader;->read([BI)I

    move-result v1

    .line 106
    .local v1, "read":I
    if-eq v1, p2, :cond_35

    .line 107
    const-string v3, "ImageHeaderParser"

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_34

    .line 108
    const-string v3, "ImageHeaderParser"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to read exif segment data, length: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", actually read: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    :cond_34
    :goto_34
    return v2

    .line 115
    :cond_35
    invoke-direct {p0, p1, p2}, Lcom/yalantis/ucrop/util/ImageHeaderParser;->hasJpegExifPreamble([BI)Z

    move-result v0

    .line 116
    .local v0, "hasJpegExifPreamble":Z
    if-eqz v0, :cond_45

    .line 117
    new-instance v2, Lcom/yalantis/ucrop/util/ImageHeaderParser$RandomAccessReader;

    invoke-direct {v2, p1, p2}, Lcom/yalantis/ucrop/util/ImageHeaderParser$RandomAccessReader;-><init>([BI)V

    invoke-static {v2}, Lcom/yalantis/ucrop/util/ImageHeaderParser;->parseExifSegment(Lcom/yalantis/ucrop/util/ImageHeaderParser$RandomAccessReader;)I

    move-result v2

    goto :goto_34

    .line 119
    :cond_45
    const-string v3, "ImageHeaderParser"

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_34

    .line 120
    const-string v3, "ImageHeaderParser"

    const-string v4, "Missing jpeg exif preamble"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_34
.end method


# virtual methods
.method public getOrientation()I
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x3

    const/4 v3, -0x1

    .line 83
    iget-object v4, p0, Lcom/yalantis/ucrop/util/ImageHeaderParser;->reader:Lcom/yalantis/ucrop/util/ImageHeaderParser$Reader;

    invoke-interface {v4}, Lcom/yalantis/ucrop/util/ImageHeaderParser$Reader;->getUInt16()I

    move-result v2

    .line 85
    .local v2, "magicNumber":I
    invoke-static {v2}, Lcom/yalantis/ucrop/util/ImageHeaderParser;->handles(I)Z

    move-result v4

    if-nez v4, :cond_2f

    .line 86
    const-string v4, "ImageHeaderParser"

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_2e

    .line 87
    const-string v4, "ImageHeaderParser"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Parser doesn\'t handle magic number: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    :cond_2e
    :goto_2e
    return v3

    .line 91
    :cond_2f
    invoke-direct {p0}, Lcom/yalantis/ucrop/util/ImageHeaderParser;->moveToExifSegmentAndGetLength()I

    move-result v1

    .line 92
    .local v1, "exifSegmentLength":I
    if-ne v1, v3, :cond_45

    .line 93
    const-string v4, "ImageHeaderParser"

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_2e

    .line 94
    const-string v4, "ImageHeaderParser"

    const-string v5, "Failed to parse exif segment length, or exif segment not found"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2e

    .line 99
    :cond_45
    new-array v0, v1, [B

    .line 100
    .local v0, "exifData":[B
    invoke-direct {p0, v0, v1}, Lcom/yalantis/ucrop/util/ImageHeaderParser;->parseExifSegment([BI)I

    move-result v3

    goto :goto_2e
.end method
