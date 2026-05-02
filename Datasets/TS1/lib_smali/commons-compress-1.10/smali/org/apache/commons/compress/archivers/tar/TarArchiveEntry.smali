.class public Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;
.super Ljava/lang/Object;
.source "TarArchiveEntry.java"

# interfaces
.implements Lorg/apache/commons/compress/archivers/tar/TarConstants;
.implements Lorg/apache/commons/compress/archivers/ArchiveEntry;


# static fields
.field public static final DEFAULT_DIR_MODE:I = 0x41ed

.field public static final DEFAULT_FILE_MODE:I = 0x81a4

.field public static final MAX_NAMELEN:I = 0x1f

.field public static final MILLIS_PER_SECOND:I = 0x3e8


# instance fields
.field private checkSumOK:Z

.field private devMajor:I

.field private devMinor:I

.field private final file:Ljava/io/File;

.field private groupId:J

.field private groupName:Ljava/lang/String;

.field private isExtended:Z

.field private linkFlag:B

.field private linkName:Ljava/lang/String;

.field private magic:Ljava/lang/String;

.field private modTime:J

.field private mode:I

.field private name:Ljava/lang/String;

.field private realSize:J

.field private size:J

.field private userId:J

.field private userName:Ljava/lang/String;

.field private version:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .registers 8

    .prologue
    const/16 v6, 0x1f

    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 118
    const-string v1, ""

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->name:Ljava/lang/String;

    .line 124
    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->userId:J

    .line 127
    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->groupId:J

    .line 130
    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->size:J

    .line 142
    const-string v1, ""

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkName:Ljava/lang/String;

    .line 145
    const-string v1, "ustar\u0000"

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->magic:Ljava/lang/String;

    .line 147
    const-string v1, "00"

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->version:Ljava/lang/String;

    .line 153
    const-string v1, ""

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->groupName:Ljava/lang/String;

    .line 156
    iput v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->devMajor:I

    .line 159
    iput v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->devMinor:I

    .line 186
    const-string v1, "user.name"

    const-string v2, ""

    invoke-static {v1, v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 188
    .local v0, "user":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v6, :cond_38

    .line 189
    invoke-virtual {v0, v3, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 192
    :cond_38
    iput-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->userName:Ljava/lang/String;

    .line 193
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->file:Ljava/io/File;

    .line 194
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 266
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 267
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;)V
    .registers 9
    .param p1, "file"    # Ljava/io/File;
    .param p2, "fileName"    # Ljava/lang/String;

    .prologue
    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    .line 276
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 118
    const-string v2, ""

    iput-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->name:Ljava/lang/String;

    .line 124
    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->userId:J

    .line 127
    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->groupId:J

    .line 130
    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->size:J

    .line 142
    const-string v2, ""

    iput-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkName:Ljava/lang/String;

    .line 145
    const-string v2, "ustar\u0000"

    iput-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->magic:Ljava/lang/String;

    .line 147
    const-string v2, "00"

    iput-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->version:Ljava/lang/String;

    .line 153
    const-string v2, ""

    iput-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->groupName:Ljava/lang/String;

    .line 156
    iput v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->devMajor:I

    .line 159
    iput v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->devMinor:I

    .line 277
    invoke-static {p2, v3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->normalizeFileName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 278
    .local v1, "normalizedName":Ljava/lang/String;
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->file:Ljava/io/File;

    .line 280
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_6e

    .line 281
    const/16 v2, 0x41ed

    iput v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->mode:I

    .line 282
    const/16 v2, 0x35

    iput-byte v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkFlag:B

    .line 284
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    .line 285
    .local v0, "nameLength":I
    if-eqz v0, :cond_48

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2f

    if-eq v2, v3, :cond_6b

    .line 286
    :cond_48
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->name:Ljava/lang/String;

    .line 297
    .end local v0    # "nameLength":I
    :goto_5d
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    iput-wide v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->modTime:J

    .line 298
    const-string v2, ""

    iput-object v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->userName:Ljava/lang/String;

    .line 299
    return-void

    .line 288
    .restart local v0    # "nameLength":I
    :cond_6b
    iput-object v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->name:Ljava/lang/String;

    goto :goto_5d

    .line 291
    .end local v0    # "nameLength":I
    :cond_6e
    const v2, 0x81a4

    iput v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->mode:I

    .line 292
    const/16 v2, 0x30

    iput-byte v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkFlag:B

    .line 293
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v2

    iput-wide v2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->size:J

    .line 294
    iput-object v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->name:Ljava/lang/String;

    goto :goto_5d
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 203
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;-><init>(Ljava/lang/String;Z)V

    .line 204
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;B)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "linkFlag"    # B

    .prologue
    .line 236
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;-><init>(Ljava/lang/String;BZ)V

    .line 237
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;BZ)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "linkFlag"    # B
    .param p3, "preserveLeadingSlashes"    # Z

    .prologue
    .line 250
    invoke-direct {p0, p1, p3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;-><init>(Ljava/lang/String;Z)V

    .line 251
    iput-byte p2, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkFlag:B

    .line 252
    const/16 v0, 0x4c

    if-ne p2, v0, :cond_11

    .line 253
    const-string v0, "ustar "

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->magic:Ljava/lang/String;

    .line 254
    const-string v0, " \u0000"

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->version:Ljava/lang/String;

    .line 256
    :cond_11
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "preserveLeadingSlashes"    # Z

    .prologue
    .line 217
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;-><init>()V

    .line 219
    invoke-static {p1, p2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->normalizeFileName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    .line 220
    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    .line 222
    .local v0, "isDir":Z
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->name:Ljava/lang/String;

    .line 223
    if-eqz v0, :cond_2e

    const/16 v1, 0x41ed

    :goto_13
    iput v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->mode:I

    .line 224
    if-eqz v0, :cond_32

    const/16 v1, 0x35

    :goto_19
    iput-byte v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkFlag:B

    .line 225
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    const-wide/16 v3, 0x3e8

    div-long/2addr v1, v3

    iput-wide v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->modTime:J

    .line 226
    const-string v1, ""

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->userName:Ljava/lang/String;

    .line 227
    return-void

    .line 223
    :cond_2e
    const v1, 0x81a4

    goto :goto_13

    .line 224
    :cond_32
    const/16 v1, 0x30

    goto :goto_19
.end method

.method public constructor <init>([B)V
    .registers 2
    .param p1, "headerBuf"    # [B

    .prologue
    .line 309
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;-><init>()V

    .line 310
    invoke-virtual {p0, p1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->parseTarHeader([B)V

    .line 311
    return-void
.end method

.method public constructor <init>([BLorg/apache/commons/compress/archivers/zip/ZipEncoding;)V
    .registers 3
    .param p1, "headerBuf"    # [B
    .param p2, "encoding"    # Lorg/apache/commons/compress/archivers/zip/ZipEncoding;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 325
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;-><init>()V

    .line 326
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->parseTarHeader([BLorg/apache/commons/compress/archivers/zip/ZipEncoding;)V

    .line 327
    return-void
.end method

.method private evaluateType([B)I
    .registers 5
    .param p1, "header"    # [B

    .prologue
    const/16 v2, 0x101

    const/4 v1, 0x6

    .line 1120
    const-string v0, "ustar "

    invoke-static {v0, p1, v2, v1}, Lorg/apache/commons/compress/utils/ArchiveUtils;->matchAsciiBuffer(Ljava/lang/String;[BII)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 1121
    const/4 v0, 0x2

    .line 1126
    :goto_c
    return v0

    .line 1123
    :cond_d
    const-string v0, "ustar\u0000"

    invoke-static {v0, p1, v2, v1}, Lorg/apache/commons/compress/utils/ArchiveUtils;->matchAsciiBuffer(Ljava/lang/String;[BII)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 1124
    const/4 v0, 0x3

    goto :goto_c

    .line 1126
    :cond_17
    const/4 v0, 0x0

    goto :goto_c
.end method

.method private static normalizeFileName(Ljava/lang/String;Z)Ljava/lang/String;
    .registers 11
    .param p0, "fileName"    # Ljava/lang/String;
    .param p1, "preserveLeadingSlashes"    # Z

    .prologue
    const/16 v8, 0x3a

    const/4 v7, 0x2

    const/4 v6, 0x1

    .line 1076
    const-string v4, "os.name"

    invoke-static {v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    .line 1078
    .local v3, "osname":Ljava/lang/String;
    if-eqz v3, :cond_3f

    .line 1083
    const-string v4, "windows"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_56

    .line 1084
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-le v4, v7, :cond_3f

    .line 1085
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1086
    .local v0, "ch1":C
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1088
    .local v1, "ch2":C
    if-ne v1, v8, :cond_3f

    const/16 v4, 0x61

    if-lt v0, v4, :cond_33

    const/16 v4, 0x7a

    if-le v0, v4, :cond_3b

    :cond_33
    const/16 v4, 0x41

    if-lt v0, v4, :cond_3f

    const/16 v4, 0x5a

    if-gt v0, v4, :cond_3f

    .line 1091
    :cond_3b
    invoke-virtual {p0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 1102
    .end local v0    # "ch1":C
    .end local v1    # "ch2":C
    :cond_3f
    :goto_3f
    sget-char v4, Ljava/io/File;->separatorChar:C

    const/16 v5, 0x2f

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    .line 1107
    :goto_47
    if-nez p1, :cond_6c

    const-string v4, "/"

    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6c

    .line 1108
    invoke-virtual {p0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_47

    .line 1094
    :cond_56
    const-string v4, "netware"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_3f

    .line 1095
    invoke-virtual {p0, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 1096
    .local v2, "colon":I
    const/4 v4, -0x1

    if-eq v2, v4, :cond_3f

    .line 1097
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_3f

    .line 1110
    .end local v2    # "colon":I
    :cond_6c
    return-object p0
.end method

.method private parseTarHeader([BLorg/apache/commons/compress/archivers/zip/ZipEncoding;Z)V
    .registers 15
    .param p1, "header"    # [B
    .param p2, "encoding"    # Lorg/apache/commons/compress/archivers/zip/ZipEncoding;
    .param p3, "oldStyle"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x9b

    const/16 v9, 0xc

    const/16 v8, 0x64

    const/16 v7, 0x20

    const/16 v6, 0x8

    .line 1002
    const/4 v0, 0x0

    .line 1004
    .local v0, "offset":I
    if-eqz p3, :cond_e8

    invoke-static {p1, v0, v8}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseName([BII)Ljava/lang/String;

    move-result-object v4

    :goto_11
    iput-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->name:Ljava/lang/String;

    .line 1006
    add-int/lit8 v0, v0, 0x64

    .line 1007
    invoke-static {p1, v0, v6}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseOctalOrBinary([BII)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->mode:I

    .line 1008
    add-int/lit8 v0, v0, 0x8

    .line 1009
    invoke-static {p1, v0, v6}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseOctalOrBinary([BII)J

    move-result-wide v4

    long-to-int v4, v4

    int-to-long v4, v4

    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->userId:J

    .line 1010
    add-int/lit8 v0, v0, 0x8

    .line 1011
    invoke-static {p1, v0, v6}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseOctalOrBinary([BII)J

    move-result-wide v4

    long-to-int v4, v4

    int-to-long v4, v4

    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->groupId:J

    .line 1012
    add-int/lit8 v0, v0, 0x8

    .line 1013
    invoke-static {p1, v0, v9}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseOctalOrBinary([BII)J

    move-result-wide v4

    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->size:J

    .line 1014
    add-int/lit8 v0, v0, 0xc

    .line 1015
    invoke-static {p1, v0, v9}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseOctalOrBinary([BII)J

    move-result-wide v4

    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->modTime:J

    .line 1016
    add-int/lit8 v0, v0, 0xc

    .line 1017
    invoke-static {p1}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->verifyCheckSum([B)Z

    move-result v4

    iput-boolean v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->checkSumOK:Z

    .line 1018
    add-int/lit8 v0, v0, 0x8

    .line 1019
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "offset":I
    .local v1, "offset":I
    aget-byte v4, p1, v0

    iput-byte v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkFlag:B

    .line 1020
    if-eqz p3, :cond_ee

    invoke-static {p1, v1, v8}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseName([BII)Ljava/lang/String;

    move-result-object v4

    :goto_56
    iput-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkName:Ljava/lang/String;

    .line 1022
    add-int/lit8 v0, v1, 0x64

    .line 1023
    .end local v1    # "offset":I
    .restart local v0    # "offset":I
    const/4 v4, 0x6

    invoke-static {p1, v0, v4}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseName([BII)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->magic:Ljava/lang/String;

    .line 1024
    add-int/lit8 v0, v0, 0x6

    .line 1025
    const/4 v4, 0x2

    invoke-static {p1, v0, v4}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseName([BII)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->version:Ljava/lang/String;

    .line 1026
    add-int/lit8 v0, v0, 0x2

    .line 1027
    if-eqz p3, :cond_f4

    invoke-static {p1, v0, v7}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseName([BII)Ljava/lang/String;

    move-result-object v4

    :goto_72
    iput-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->userName:Ljava/lang/String;

    .line 1029
    add-int/lit8 v0, v0, 0x20

    .line 1030
    if-eqz p3, :cond_fa

    invoke-static {p1, v0, v7}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseName([BII)Ljava/lang/String;

    move-result-object v4

    :goto_7c
    iput-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->groupName:Ljava/lang/String;

    .line 1032
    add-int/lit8 v0, v0, 0x20

    .line 1033
    invoke-static {p1, v0, v6}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseOctalOrBinary([BII)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->devMajor:I

    .line 1034
    add-int/lit8 v0, v0, 0x8

    .line 1035
    invoke-static {p1, v0, v6}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseOctalOrBinary([BII)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->devMinor:I

    .line 1036
    add-int/lit8 v0, v0, 0x8

    .line 1038
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->evaluateType([B)I

    move-result v3

    .line 1039
    .local v3, "type":I
    packed-switch v3, :pswitch_data_124

    .line 1055
    if-eqz p3, :cond_11d

    invoke-static {p1, v0, v10}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseName([BII)Ljava/lang/String;

    move-result-object v2

    .line 1060
    .local v2, "prefix":Ljava/lang/String;
    :goto_9f
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_c6

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->name:Ljava/lang/String;

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_c6

    .line 1061
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->name:Ljava/lang/String;

    .line 1063
    :cond_c6
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_e7

    .line 1064
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->name:Ljava/lang/String;

    .line 1068
    .end local v2    # "prefix":Ljava/lang/String;
    :cond_e7
    :goto_e7
    return-void

    .line 1004
    .end local v3    # "type":I
    :cond_e8
    invoke-static {p1, v0, v8, p2}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseName([BIILorg/apache/commons/compress/archivers/zip/ZipEncoding;)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_11

    .line 1020
    .end local v0    # "offset":I
    .restart local v1    # "offset":I
    :cond_ee
    invoke-static {p1, v1, v8, p2}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseName([BIILorg/apache/commons/compress/archivers/zip/ZipEncoding;)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_56

    .line 1027
    .end local v1    # "offset":I
    .restart local v0    # "offset":I
    :cond_f4
    invoke-static {p1, v0, v7, p2}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseName([BIILorg/apache/commons/compress/archivers/zip/ZipEncoding;)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_72

    .line 1030
    :cond_fa
    invoke-static {p1, v0, v7, p2}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseName([BIILorg/apache/commons/compress/archivers/zip/ZipEncoding;)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_7c

    .line 1041
    .restart local v3    # "type":I
    :pswitch_100
    add-int/lit8 v0, v0, 0xc

    .line 1042
    add-int/lit8 v0, v0, 0xc

    .line 1043
    add-int/lit8 v0, v0, 0xc

    .line 1044
    add-int/lit8 v0, v0, 0x4

    .line 1045
    add-int/lit8 v0, v0, 0x1

    .line 1046
    add-int/lit8 v0, v0, 0x60

    .line 1047
    invoke-static {p1, v0}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseBoolean([BI)Z

    move-result v4

    iput-boolean v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->isExtended:Z

    .line 1048
    add-int/lit8 v0, v0, 0x1

    .line 1049
    invoke-static {p1, v0, v9}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseOctal([BII)J

    move-result-wide v4

    iput-wide v4, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->realSize:J

    .line 1050
    add-int/lit8 v0, v0, 0xc

    .line 1051
    goto :goto_e7

    .line 1055
    :cond_11d
    invoke-static {p1, v0, v10, p2}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseName([BIILorg/apache/commons/compress/archivers/zip/ZipEncoding;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_9f

    .line 1039
    nop

    :pswitch_data_124
    .packed-switch 0x2
        :pswitch_100
    .end packed-switch
.end method

.method private writeEntryHeaderField(J[BIIZ)I
    .registers 12
    .param p1, "value"    # J
    .param p3, "outbuf"    # [B
    .param p4, "offset"    # I
    .param p5, "length"    # I
    .param p6, "starMode"    # Z

    .prologue
    const-wide/16 v3, 0x0

    .line 954
    if-nez p6, :cond_18

    cmp-long v0, p1, v3

    if-ltz v0, :cond_13

    const-wide/16 v0, 0x1

    add-int/lit8 v2, p5, -0x1

    mul-int/lit8 v2, v2, 0x3

    shl-long/2addr v0, v2

    cmp-long v0, p1, v0

    if-ltz v0, :cond_18

    .line 959
    :cond_13
    invoke-static {v3, v4, p3, p4, p5}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatLongOctalBytes(J[BII)I

    move-result v0

    .line 961
    :goto_17
    return v0

    :cond_18
    invoke-static {p1, p2, p3, p4, p5}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatLongOctalOrBinaryBytes(J[BII)I

    move-result v0

    goto :goto_17
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "it"    # Ljava/lang/Object;

    .prologue
    .line 349
    if-eqz p1, :cond_c

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eq v0, v1, :cond_e

    .line 350
    :cond_c
    const/4 v0, 0x0

    .line 352
    .end local p1    # "it":Ljava/lang/Object;
    :goto_d
    return v0

    .restart local p1    # "it":Ljava/lang/Object;
    :cond_e
    check-cast p1, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    .end local p1    # "it":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->equals(Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;)Z

    move-result v0

    goto :goto_d
.end method

.method public equals(Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;)Z
    .registers 4
    .param p1, "it"    # Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    .prologue
    .line 337
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getDevMajor()I
    .registers 2

    .prologue
    .line 654
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->devMajor:I

    return v0
.end method

.method public getDevMinor()I
    .registers 2

    .prologue
    .line 679
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->devMinor:I

    return v0
.end method

.method public getDirectoryEntries()[Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;
    .registers 8

    .prologue
    .line 863
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->file:Ljava/io/File;

    if-eqz v3, :cond_c

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->file:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_10

    .line 864
    :cond_c
    const/4 v3, 0x0

    new-array v2, v3, [Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    .line 874
    :cond_f
    return-object v2

    .line 867
    :cond_10
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->file:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v1

    .line 868
    .local v1, "list":[Ljava/lang/String;
    array-length v3, v1

    new-array v2, v3, [Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    .line 870
    .local v2, "result":[Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1a
    array-length v3, v1

    if-ge v0, v3, :cond_f

    .line 871
    new-instance v3, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->file:Ljava/io/File;

    aget-object v6, v1, v0

    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;-><init>(Ljava/io/File;)V

    aput-object v3, v2, v0

    .line 870
    add-int/lit8 v0, v0, 0x1

    goto :goto_1a
.end method

.method public getFile()Ljava/io/File;
    .registers 2

    .prologue
    .line 613
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->file:Ljava/io/File;

    return-object v0
.end method

.method public getGroupId()I
    .registers 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 474
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->groupId:J

    const-wide/16 v2, -0x1

    and-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method

.method public getGroupName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 530
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->groupName:Ljava/lang/String;

    return-object v0
.end method

.method public getLastModifiedDate()Ljava/util/Date;
    .registers 2

    .prologue
    .line 593
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getModTime()Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getLinkName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 410
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkName:Ljava/lang/String;

    return-object v0
.end method

.method public getLongGroupId()J
    .registers 3

    .prologue
    .line 493
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->groupId:J

    return-wide v0
.end method

.method public getLongUserId()J
    .registers 3

    .prologue
    .line 452
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->userId:J

    return-wide v0
.end method

.method public getModTime()Ljava/util/Date;
    .registers 6

    .prologue
    .line 589
    new-instance v0, Ljava/util/Date;

    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->modTime:J

    const-wide/16 v3, 0x3e8

    mul-long/2addr v1, v3

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public getMode()I
    .registers 2

    .prologue
    .line 622
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->mode:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 383
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getRealSize()J
    .registers 3

    .prologue
    .line 713
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->realSize:J

    return-wide v0
.end method

.method public getSize()J
    .registers 3

    .prologue
    .line 631
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->size:J

    return-wide v0
.end method

.method public getUserId()I
    .registers 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 433
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->userId:J

    const-wide/16 v2, -0x1

    and-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method

.method public getUserName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 512
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->userName:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 362
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public isBlockDevice()Z
    .registers 3

    .prologue
    .line 843
    iget-byte v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkFlag:B

    const/16 v1, 0x34

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isCharacterDevice()Z
    .registers 3

    .prologue
    .line 833
    iget-byte v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkFlag:B

    const/16 v1, 0x33

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isCheckSumOK()Z
    .registers 2

    .prologue
    .line 604
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->checkSumOK:Z

    return v0
.end method

.method public isDescendent(Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;)Z
    .registers 4
    .param p1, "desc"    # Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    .prologue
    .line 374
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isDirectory()Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    .line 775
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->file:Ljava/io/File;

    if-eqz v1, :cond_c

    .line 776
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    .line 787
    :cond_b
    :goto_b
    return v0

    .line 779
    :cond_c
    iget-byte v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkFlag:B

    const/16 v2, 0x35

    if-eq v1, v2, :cond_b

    .line 783
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_b

    .line 787
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public isExtended()Z
    .registers 2

    .prologue
    .line 704
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->isExtended:Z

    return v0
.end method

.method public isFIFO()Z
    .registers 3

    .prologue
    .line 853
    iget-byte v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkFlag:B

    const/16 v1, 0x36

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isFile()Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    .line 797
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->file:Ljava/io/File;

    if-eqz v1, :cond_c

    .line 798
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v0

    .line 803
    :cond_b
    :goto_b
    return v0

    .line 800
    :cond_c
    iget-byte v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkFlag:B

    if-eqz v1, :cond_b

    iget-byte v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkFlag:B

    const/16 v2, 0x30

    if-eq v1, v2, :cond_b

    .line 803
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_b

    const/4 v0, 0x0

    goto :goto_b
.end method

.method public isGNULongLinkEntry()Z
    .registers 3

    .prologue
    .line 731
    iget-byte v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkFlag:B

    const/16 v1, 0x4b

    if-ne v0, v1, :cond_12

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->name:Ljava/lang/String;

    const-string v1, "././@LongLink"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public isGNULongNameEntry()Z
    .registers 3

    .prologue
    .line 741
    iget-byte v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkFlag:B

    const/16 v1, 0x4c

    if-ne v0, v1, :cond_12

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->name:Ljava/lang/String;

    const-string v1, "././@LongLink"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public isGNUSparse()Z
    .registers 3

    .prologue
    .line 722
    iget-byte v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkFlag:B

    const/16 v1, 0x53

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isGlobalPaxHeader()Z
    .registers 3

    .prologue
    .line 766
    iget-byte v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkFlag:B

    const/16 v1, 0x67

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isLink()Z
    .registers 3

    .prologue
    .line 823
    iget-byte v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkFlag:B

    const/16 v1, 0x31

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isPaxHeader()Z
    .registers 3

    .prologue
    .line 754
    iget-byte v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkFlag:B

    const/16 v1, 0x78

    if-eq v0, v1, :cond_c

    iget-byte v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkFlag:B

    const/16 v1, 0x58

    if-ne v0, v1, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isSymbolicLink()Z
    .registers 3

    .prologue
    .line 813
    iget-byte v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkFlag:B

    const/16 v1, 0x32

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public parseTarHeader([B)V
    .registers 6
    .param p1, "header"    # [B

    .prologue
    .line 973
    :try_start_0
    sget-object v2, Lorg/apache/commons/compress/archivers/tar/TarUtils;->DEFAULT_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-virtual {p0, p1, v2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->parseTarHeader([BLorg/apache/commons/compress/archivers/zip/ZipEncoding;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 982
    :goto_5
    return-void

    .line 974
    :catch_6
    move-exception v0

    .line 976
    .local v0, "ex":Ljava/io/IOException;
    :try_start_7
    sget-object v2, Lorg/apache/commons/compress/archivers/tar/TarUtils;->DEFAULT_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    const/4 v3, 0x1

    invoke-direct {p0, p1, v2, v3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->parseTarHeader([BLorg/apache/commons/compress/archivers/zip/ZipEncoding;Z)V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_d} :catch_e

    goto :goto_5

    .line 977
    :catch_e
    move-exception v1

    .line 979
    .local v1, "ex2":Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public parseTarHeader([BLorg/apache/commons/compress/archivers/zip/ZipEncoding;)V
    .registers 4
    .param p1, "header"    # [B
    .param p2, "encoding"    # Lorg/apache/commons/compress/archivers/zip/ZipEncoding;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 996
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->parseTarHeader([BLorg/apache/commons/compress/archivers/zip/ZipEncoding;Z)V

    .line 997
    return-void
.end method

.method public setDevMajor(I)V
    .registers 5
    .param p1, "devNo"    # I

    .prologue
    .line 665
    if-gez p1, :cond_1b

    .line 666
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Major device number is out of range: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 669
    :cond_1b
    iput p1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->devMajor:I

    .line 670
    return-void
.end method

.method public setDevMinor(I)V
    .registers 5
    .param p1, "devNo"    # I

    .prologue
    .line 690
    if-gez p1, :cond_1b

    .line 691
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Minor device number is out of range: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 694
    :cond_1b
    iput p1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->devMinor:I

    .line 695
    return-void
.end method

.method public setGroupId(I)V
    .registers 4
    .param p1, "groupId"    # I

    .prologue
    .line 483
    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setGroupId(J)V

    .line 484
    return-void
.end method

.method public setGroupId(J)V
    .registers 3
    .param p1, "groupId"    # J

    .prologue
    .line 503
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->groupId:J

    .line 504
    return-void
.end method

.method public setGroupName(Ljava/lang/String;)V
    .registers 2
    .param p1, "groupName"    # Ljava/lang/String;

    .prologue
    .line 539
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->groupName:Ljava/lang/String;

    .line 540
    return-void
.end method

.method public setIds(II)V
    .registers 3
    .param p1, "userId"    # I
    .param p2, "groupId"    # I

    .prologue
    .line 549
    invoke-virtual {p0, p1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setUserId(I)V

    .line 550
    invoke-virtual {p0, p2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setGroupId(I)V

    .line 551
    return-void
.end method

.method public setLinkName(Ljava/lang/String;)V
    .registers 2
    .param p1, "link"    # Ljava/lang/String;

    .prologue
    .line 421
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkName:Ljava/lang/String;

    .line 422
    return-void
.end method

.method public setModTime(J)V
    .registers 5
    .param p1, "time"    # J

    .prologue
    .line 571
    const-wide/16 v0, 0x3e8

    div-long v0, p1, v0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->modTime:J

    .line 572
    return-void
.end method

.method public setModTime(Ljava/util/Date;)V
    .registers 6
    .param p1, "time"    # Ljava/util/Date;

    .prologue
    .line 580
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->modTime:J

    .line 581
    return-void
.end method

.method public setMode(I)V
    .registers 2
    .param p1, "mode"    # I

    .prologue
    .line 401
    iput p1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->mode:I

    .line 402
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 392
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->normalizeFileName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->name:Ljava/lang/String;

    .line 393
    return-void
.end method

.method public setNames(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "groupName"    # Ljava/lang/String;

    .prologue
    .line 560
    invoke-virtual {p0, p1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setUserName(Ljava/lang/String;)V

    .line 561
    invoke-virtual {p0, p2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setGroupName(Ljava/lang/String;)V

    .line 562
    return-void
.end method

.method public setSize(J)V
    .registers 6
    .param p1, "size"    # J

    .prologue
    .line 641
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_1f

    .line 642
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Size is out of range: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 644
    :cond_1f
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->size:J

    .line 645
    return-void
.end method

.method public setUserId(I)V
    .registers 4
    .param p1, "userId"    # I

    .prologue
    .line 442
    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->setUserId(J)V

    .line 443
    return-void
.end method

.method public setUserId(J)V
    .registers 3
    .param p1, "userId"    # J

    .prologue
    .line 462
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->userId:J

    .line 463
    return-void
.end method

.method public setUserName(Ljava/lang/String;)V
    .registers 2
    .param p1, "userName"    # Ljava/lang/String;

    .prologue
    .line 521
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->userName:Ljava/lang/String;

    .line 522
    return-void
.end method

.method public writeEntryHeader([B)V
    .registers 6
    .param p1, "outbuf"    # [B

    .prologue
    .line 886
    :try_start_0
    sget-object v2, Lorg/apache/commons/compress/archivers/tar/TarUtils;->DEFAULT_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    const/4 v3, 0x0

    invoke-virtual {p0, p1, v2, v3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->writeEntryHeader([BLorg/apache/commons/compress/archivers/zip/ZipEncoding;Z)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_6} :catch_7

    .line 895
    :goto_6
    return-void

    .line 887
    :catch_7
    move-exception v0

    .line 889
    .local v0, "ex":Ljava/io/IOException;
    :try_start_8
    sget-object v2, Lorg/apache/commons/compress/archivers/tar/TarUtils;->FALLBACK_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    const/4 v3, 0x0

    invoke-virtual {p0, p1, v2, v3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->writeEntryHeader([BLorg/apache/commons/compress/archivers/zip/ZipEncoding;Z)V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_e} :catch_f

    goto :goto_6

    .line 890
    :catch_f
    move-exception v1

    .line 892
    .local v1, "ex2":Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public writeEntryHeader([BLorg/apache/commons/compress/archivers/zip/ZipEncoding;Z)V
    .registers 16
    .param p1, "outbuf"    # [B
    .param p2, "encoding"    # Lorg/apache/commons/compress/archivers/zip/ZipEncoding;
    .param p3, "starMode"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 910
    const/4 v4, 0x0

    .line 912
    .local v4, "offset":I
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->name:Ljava/lang/String;

    const/16 v1, 0x64

    invoke-static {v0, p1, v4, v1, p2}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatNameBytes(Ljava/lang/String;[BIILorg/apache/commons/compress/archivers/zip/ZipEncoding;)I

    move-result v4

    .line 914
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->mode:I

    int-to-long v1, v0

    const/16 v5, 0x8

    move-object v0, p0

    move-object v3, p1

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->writeEntryHeaderField(J[BIIZ)I

    move-result v4

    .line 915
    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->userId:J

    const/16 v5, 0x8

    move-object v0, p0

    move-object v3, p1

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->writeEntryHeaderField(J[BIIZ)I

    move-result v4

    .line 917
    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->groupId:J

    const/16 v5, 0x8

    move-object v0, p0

    move-object v3, p1

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->writeEntryHeaderField(J[BIIZ)I

    move-result v4

    .line 919
    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->size:J

    const/16 v5, 0xc

    move-object v0, p0

    move-object v3, p1

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->writeEntryHeaderField(J[BIIZ)I

    move-result v4

    .line 920
    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->modTime:J

    const/16 v5, 0xc

    move-object v0, p0

    move-object v3, p1

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->writeEntryHeaderField(J[BIIZ)I

    move-result v4

    .line 923
    move v10, v4

    .line 925
    .local v10, "csOffset":I
    const/4 v7, 0x0

    .local v7, "c":I
    move v11, v4

    .end local v4    # "offset":I
    .local v11, "offset":I
    :goto_44
    const/16 v0, 0x8

    if-ge v7, v0, :cond_52

    .line 926
    add-int/lit8 v4, v11, 0x1

    .end local v11    # "offset":I
    .restart local v4    # "offset":I
    const/16 v0, 0x20

    aput-byte v0, p1, v11

    .line 925
    add-int/lit8 v7, v7, 0x1

    move v11, v4

    .end local v4    # "offset":I
    .restart local v11    # "offset":I
    goto :goto_44

    .line 929
    :cond_52
    add-int/lit8 v4, v11, 0x1

    .end local v11    # "offset":I
    .restart local v4    # "offset":I
    iget-byte v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkFlag:B

    aput-byte v0, p1, v11

    .line 930
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->linkName:Ljava/lang/String;

    const/16 v1, 0x64

    invoke-static {v0, p1, v4, v1, p2}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatNameBytes(Ljava/lang/String;[BIILorg/apache/commons/compress/archivers/zip/ZipEncoding;)I

    move-result v4

    .line 932
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->magic:Ljava/lang/String;

    const/4 v1, 0x6

    invoke-static {v0, p1, v4, v1}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatNameBytes(Ljava/lang/String;[BII)I

    move-result v4

    .line 933
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->version:Ljava/lang/String;

    const/4 v1, 0x2

    invoke-static {v0, p1, v4, v1}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatNameBytes(Ljava/lang/String;[BII)I

    move-result v4

    .line 934
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->userName:Ljava/lang/String;

    const/16 v1, 0x20

    invoke-static {v0, p1, v4, v1, p2}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatNameBytes(Ljava/lang/String;[BIILorg/apache/commons/compress/archivers/zip/ZipEncoding;)I

    move-result v4

    .line 936
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->groupName:Ljava/lang/String;

    const/16 v1, 0x20

    invoke-static {v0, p1, v4, v1, p2}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatNameBytes(Ljava/lang/String;[BIILorg/apache/commons/compress/archivers/zip/ZipEncoding;)I

    move-result v4

    .line 938
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->devMajor:I

    int-to-long v1, v0

    const/16 v5, 0x8

    move-object v0, p0

    move-object v3, p1

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->writeEntryHeaderField(J[BIIZ)I

    move-result v4

    .line 940
    iget v0, p0, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->devMinor:I

    int-to-long v1, v0

    const/16 v5, 0x8

    move-object v0, p0

    move-object v3, p1

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->writeEntryHeaderField(J[BIIZ)I

    move-result v4

    .line 943
    :goto_96
    array-length v0, p1

    if-ge v4, v0, :cond_a0

    .line 944
    add-int/lit8 v11, v4, 0x1

    .end local v4    # "offset":I
    .restart local v11    # "offset":I
    const/4 v0, 0x0

    aput-byte v0, p1, v4

    move v4, v11

    .end local v11    # "offset":I
    .restart local v4    # "offset":I
    goto :goto_96

    .line 947
    :cond_a0
    invoke-static {p1}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->computeCheckSum([B)J

    move-result-wide v8

    .line 949
    .local v8, "chk":J
    const/16 v0, 0x8

    invoke-static {v8, v9, p1, v10, v0}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatCheckSumOctalBytes(J[BII)I

    .line 950
    return-void
.end method
