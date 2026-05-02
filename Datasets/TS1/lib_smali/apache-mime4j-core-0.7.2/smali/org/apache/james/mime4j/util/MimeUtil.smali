.class public final Lorg/apache/james/mime4j/util/MimeUtil;
.super Ljava/lang/Object;
.source "MimeUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/james/mime4j/util/MimeUtil$Rfc822DateFormat;
    }
.end annotation


# static fields
.field public static final ENC_7BIT:Ljava/lang/String; = "7bit"

.field public static final ENC_8BIT:Ljava/lang/String; = "8bit"

.field public static final ENC_BASE64:Ljava/lang/String; = "base64"

.field public static final ENC_BINARY:Ljava/lang/String; = "binary"

.field public static final ENC_QUOTED_PRINTABLE:Ljava/lang/String; = "quoted-printable"

.field private static final RFC822_DATE_FORMAT:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/text/DateFormat;",
            ">;"
        }
    .end annotation
.end field

.field private static counter:I

.field private static final random:Ljava/util/Random;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 58
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lorg/apache/james/mime4j/util/MimeUtil;->random:Ljava/util/Random;

    .line 61
    const/4 v0, 0x0

    sput v0, Lorg/apache/james/mime4j/util/MimeUtil;->counter:I

    .line 278
    new-instance v0, Lorg/apache/james/mime4j/util/MimeUtil$1;

    invoke-direct {v0}, Lorg/apache/james/mime4j/util/MimeUtil$1;-><init>()V

    sput-object v0, Lorg/apache/james/mime4j/util/MimeUtil;->RFC822_DATE_FORMAT:Ljava/lang/ThreadLocal;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    return-void
.end method

.method public static createUniqueBoundary()Ljava/lang/String;
    .registers 4

    .prologue
    const/16 v3, 0x2e

    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "-=Part."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    invoke-static {}, Lorg/apache/james/mime4j/util/MimeUtil;->nextCounterValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 124
    sget-object v1, Lorg/apache/james/mime4j/util/MimeUtil;->random:Ljava/util/Random;

    invoke-virtual {v1}, Ljava/util/Random;->nextLong()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 126
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 128
    sget-object v1, Lorg/apache/james/mime4j/util/MimeUtil;->random:Ljava/util/Random;

    invoke-virtual {v1}, Ljava/util/Random;->nextLong()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    const-string v1, "=-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static createUniqueMessageId(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "hostName"    # Ljava/lang/String;

    .prologue
    const/16 v3, 0x2e

    .line 146
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "<Mime4j."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 147
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-static {}, Lorg/apache/james/mime4j/util/MimeUtil;->nextCounterValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 149
    sget-object v1, Lorg/apache/james/mime4j/util/MimeUtil;->random:Ljava/util/Random;

    invoke-virtual {v1}, Ljava/util/Random;->nextLong()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 151
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    if-eqz p0, :cond_3c

    .line 153
    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 154
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    :cond_3c
    const/16 v1, 0x3e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 157
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static fold(Ljava/lang/String;I)Ljava/lang/String;
    .registers 11
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "usedCharacters"    # I

    .prologue
    const/16 v8, 0x4c

    const/4 v7, 0x0

    .line 199
    const/16 v2, 0x4c

    .line 201
    .local v2, "maxCharacters":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 202
    .local v1, "length":I
    add-int v6, p1, v1

    if-gt v6, v8, :cond_e

    .line 212
    .end local p0    # "s":Ljava/lang/String;
    :goto_d
    return-object p0

    .line 205
    .restart local p0    # "s":Ljava/lang/String;
    :cond_e
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 207
    .local v4, "sb":Ljava/lang/StringBuilder;
    neg-int v0, p1

    .line 208
    .local v0, "lastLineBreak":I
    invoke-static {p0, v7}, Lorg/apache/james/mime4j/util/MimeUtil;->indexOfWsp(Ljava/lang/String;I)I

    move-result v5

    .line 210
    .local v5, "wspIdx":I
    :goto_18
    if-ne v5, v1, :cond_2a

    .line 211
    invoke-static {v7, v0}, Ljava/lang/Math;->max(II)I

    move-result v6

    invoke-virtual {p0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_d

    .line 215
    :cond_2a
    add-int/lit8 v6, v5, 0x1

    invoke-static {p0, v6}, Lorg/apache/james/mime4j/util/MimeUtil;->indexOfWsp(Ljava/lang/String;I)I

    move-result v3

    .line 217
    .local v3, "nextWspIdx":I
    sub-int v6, v3, v0

    if-le v6, v8, :cond_45

    .line 218
    invoke-static {v7, v0}, Ljava/lang/Math;->max(II)I

    move-result v6

    invoke-virtual {p0, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    const-string v6, "\r\n"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    move v0, v5

    .line 223
    :cond_45
    move v5, v3

    .line 224
    goto :goto_18
.end method

.method public static formatDate(Ljava/util/Date;Ljava/util/TimeZone;)Ljava/lang/String;
    .registers 4
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "zone"    # Ljava/util/TimeZone;

    .prologue
    .line 171
    sget-object v1, Lorg/apache/james/mime4j/util/MimeUtil;->RFC822_DATE_FORMAT:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/text/DateFormat;

    .line 173
    .local v0, "df":Ljava/text/DateFormat;
    if-nez p1, :cond_16

    .line 174
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 179
    :goto_11
    invoke-virtual {v0, p0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 176
    :cond_16
    invoke-virtual {v0, p1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    goto :goto_11
.end method

.method private static indexOfWsp(Ljava/lang/String;I)I
    .registers 6
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "fromIndex"    # I

    .prologue
    .line 265
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 266
    .local v2, "len":I
    move v1, p1

    .local v1, "index":I
    :goto_5
    if-ge v1, v2, :cond_17

    .line 267
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 268
    .local v0, "c":C
    const/16 v3, 0x20

    if-eq v0, v3, :cond_13

    const/16 v3, 0x9

    if-ne v0, v3, :cond_14

    .line 271
    .end local v0    # "c":C
    .end local v1    # "index":I
    :cond_13
    :goto_13
    return v1

    .line 266
    .restart local v0    # "c":C
    .restart local v1    # "index":I
    :cond_14
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .end local v0    # "c":C
    :cond_17
    move v1, v2

    .line 271
    goto :goto_13
.end method

.method public static isBase64Encoding(Ljava/lang/String;)Z
    .registers 2
    .param p0, "pTransferEncoding"    # Ljava/lang/String;

    .prologue
    .line 93
    const-string v0, "base64"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isMessage(Ljava/lang/String;)Z
    .registers 2
    .param p0, "pMimeType"    # Ljava/lang/String;

    .prologue
    .line 79
    if-eqz p0, :cond_c

    const-string v0, "message/rfc822"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public static isMultipart(Ljava/lang/String;)Z
    .registers 3
    .param p0, "pMimeType"    # Ljava/lang/String;

    .prologue
    .line 86
    if-eqz p0, :cond_10

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "multipart/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public static isQuotedPrintableEncoded(Ljava/lang/String;)Z
    .registers 2
    .param p0, "pTransferEncoding"    # Ljava/lang/String;

    .prologue
    .line 100
    const-string v0, "quoted-printable"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isSameMimeType(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 3
    .param p0, "pType1"    # Ljava/lang/String;
    .param p1, "pType2"    # Ljava/lang/String;

    .prologue
    .line 72
    if-eqz p0, :cond_c

    if-eqz p1, :cond_c

    invoke-virtual {p0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private static declared-synchronized nextCounterValue()I
    .registers 3

    .prologue
    .line 275
    const-class v1, Lorg/apache/james/mime4j/util/MimeUtil;

    monitor-enter v1

    :try_start_3
    sget v0, Lorg/apache/james/mime4j/util/MimeUtil;->counter:I

    add-int/lit8 v2, v0, 0x1

    sput v2, Lorg/apache/james/mime4j/util/MimeUtil;->counter:I
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_b

    monitor-exit v1

    return v0

    :catchall_b
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static unfold(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 235
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 236
    .local v2, "length":I
    const/4 v1, 0x0

    .local v1, "idx":I
    :goto_5
    if-ge v1, v2, :cond_17

    .line 237
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 238
    .local v0, "c":C
    const/16 v3, 0xd

    if-eq v0, v3, :cond_13

    const/16 v3, 0xa

    if-ne v0, v3, :cond_18

    .line 239
    :cond_13
    invoke-static {p0, v1}, Lorg/apache/james/mime4j/util/MimeUtil;->unfold0(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    .line 243
    .end local v0    # "c":C
    .end local p0    # "s":Ljava/lang/String;
    :cond_17
    return-object p0

    .line 236
    .restart local v0    # "c":C
    .restart local p0    # "s":Ljava/lang/String;
    :cond_18
    add-int/lit8 v1, v1, 0x1

    goto :goto_5
.end method

.method private static unfold0(Ljava/lang/String;I)Ljava/lang/String;
    .registers 7
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "crlfIdx"    # I

    .prologue
    .line 247
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 248
    .local v2, "length":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 250
    .local v3, "sb":Ljava/lang/StringBuilder;
    if-lez p1, :cond_13

    .line 251
    const/4 v4, 0x0

    invoke-virtual {p0, v4, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 254
    :cond_13
    add-int/lit8 v1, p1, 0x1

    .local v1, "idx":I
    :goto_15
    if-ge v1, v2, :cond_29

    .line 255
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 256
    .local v0, "c":C
    const/16 v4, 0xd

    if-eq v0, v4, :cond_26

    const/16 v4, 0xa

    if-eq v0, v4, :cond_26

    .line 257
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 254
    :cond_26
    add-int/lit8 v1, v1, 0x1

    goto :goto_15

    .line 261
    .end local v0    # "c":C
    :cond_29
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method
