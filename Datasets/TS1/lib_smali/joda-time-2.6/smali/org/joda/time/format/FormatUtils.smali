.class public Lorg/joda/time/format/FormatUtils;
.super Ljava/lang/Object;
.source "FormatUtils.java"


# static fields
.field private static final LOG_10:D


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 31
    const-wide/high16 v0, 0x4024000000000000L    # 10.0

    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    sput-wide v0, Lorg/joda/time/format/FormatUtils;->LOG_10:D

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method

.method public static appendPaddedInteger(Ljava/lang/Appendable;II)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v1, 0xa

    const/16 v4, 0x30

    .line 69
    if-gez p1, :cond_10

    .line 70
    const/16 v0, 0x2d

    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 71
    const/high16 v0, -0x80000000

    if-eq p1, v0, :cond_1b

    .line 72
    neg-int p1, p1

    .line 81
    :cond_10
    if-ge p1, v1, :cond_30

    .line 82
    :goto_12
    const/4 v0, 0x1

    if-le p2, v0, :cond_29

    .line 83
    invoke-interface {p0, v4}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 82
    add-int/lit8 p2, p2, -0x1

    goto :goto_12

    .line 74
    :cond_1b
    :goto_1b
    if-le p2, v1, :cond_23

    .line 75
    invoke-interface {p0, v4}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 74
    add-int/lit8 p2, p2, -0x1

    goto :goto_1b

    .line 77
    :cond_23
    const-string v0, "2147483648"

    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 111
    :goto_28
    return-void

    .line 85
    :cond_29
    add-int/lit8 v0, p1, 0x30

    int-to-char v0, v0

    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_28

    .line 86
    :cond_30
    const/16 v0, 0x64

    if-ge p1, v0, :cond_5a

    .line 87
    :goto_34
    const/4 v0, 0x2

    if-le p2, v0, :cond_3d

    .line 88
    invoke-interface {p0, v4}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 87
    add-int/lit8 p2, p2, -0x1

    goto :goto_34

    .line 93
    :cond_3d
    add-int/lit8 v0, p1, 0x1

    const v1, 0xcccccc

    mul-int/2addr v0, v1

    shr-int/lit8 v0, v0, 0x1b

    .line 94
    add-int/lit8 v1, v0, 0x30

    int-to-char v1, v1

    invoke-interface {p0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 96
    shl-int/lit8 v1, v0, 0x3

    sub-int v1, p1, v1

    shl-int/lit8 v0, v0, 0x1

    sub-int v0, v1, v0

    add-int/lit8 v0, v0, 0x30

    int-to-char v0, v0

    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_28

    .line 99
    :cond_5a
    const/16 v0, 0x3e8

    if-ge p1, v0, :cond_67

    .line 100
    const/4 v0, 0x3

    .line 106
    :goto_5f
    if-le p2, v0, :cond_79

    .line 107
    invoke-interface {p0, v4}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 106
    add-int/lit8 p2, p2, -0x1

    goto :goto_5f

    .line 101
    :cond_67
    const/16 v0, 0x2710

    if-ge p1, v0, :cond_6d

    .line 102
    const/4 v0, 0x4

    goto :goto_5f

    .line 104
    :cond_6d
    int-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    sget-wide v2, Lorg/joda/time/format/FormatUtils;->LOG_10:D

    div-double/2addr v0, v2

    double-to-int v0, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_5f

    .line 109
    :cond_79
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_28
.end method

.method public static appendPaddedInteger(Ljava/lang/Appendable;JI)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x30

    const/16 v3, 0x13

    .line 143
    long-to-int v0, p1

    .line 144
    int-to-long v1, v0

    cmp-long v1, v1, p1

    if-nez v1, :cond_e

    .line 145
    invoke-static {p0, v0, p3}, Lorg/joda/time/format/FormatUtils;->appendPaddedInteger(Ljava/lang/Appendable;II)V

    .line 167
    :goto_d
    return-void

    .line 146
    :cond_e
    if-gt p3, v3, :cond_18

    .line 147
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_d

    .line 149
    :cond_18
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_2a

    .line 150
    const/16 v0, 0x2d

    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 151
    const-wide/high16 v0, -0x8000000000000000L

    cmp-long v0, p1, v0

    if-eqz v0, :cond_3d

    .line 152
    neg-long p1, p1

    .line 161
    :cond_2a
    long-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    sget-wide v2, Lorg/joda/time/format/FormatUtils;->LOG_10:D

    div-double/2addr v0, v2

    double-to-int v0, v0

    add-int/lit8 v0, v0, 0x1

    .line 162
    :goto_35
    if-le p3, v0, :cond_4b

    .line 163
    invoke-interface {p0, v4}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 162
    add-int/lit8 p3, p3, -0x1

    goto :goto_35

    .line 154
    :cond_3d
    :goto_3d
    if-le p3, v3, :cond_45

    .line 155
    invoke-interface {p0, v4}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 154
    add-int/lit8 p3, p3, -0x1

    goto :goto_3d

    .line 157
    :cond_45
    const-string v0, "9223372036854775808"

    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_d

    .line 165
    :cond_4b
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_d
.end method

.method public static appendPaddedInteger(Ljava/lang/StringBuffer;II)V
    .registers 4

    .prologue
    .line 51
    :try_start_0
    invoke-static {p0, p1, p2}, Lorg/joda/time/format/FormatUtils;->appendPaddedInteger(Ljava/lang/Appendable;II)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 55
    :goto_3
    return-void

    .line 52
    :catch_4
    move-exception v0

    goto :goto_3
.end method

.method public static appendPaddedInteger(Ljava/lang/StringBuffer;JI)V
    .registers 5

    .prologue
    .line 125
    :try_start_0
    invoke-static {p0, p1, p2, p3}, Lorg/joda/time/format/FormatUtils;->appendPaddedInteger(Ljava/lang/Appendable;JI)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 129
    :goto_3
    return-void

    .line 126
    :catch_4
    move-exception v0

    goto :goto_3
.end method

.method public static appendUnpaddedInteger(Ljava/lang/Appendable;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 291
    if-gez p1, :cond_c

    .line 292
    const/16 v0, 0x2d

    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 293
    const/high16 v0, -0x80000000

    if-eq p1, v0, :cond_17

    .line 294
    neg-int p1, p1

    .line 300
    :cond_c
    const/16 v0, 0xa

    if-ge p1, v0, :cond_1d

    .line 301
    add-int/lit8 v0, p1, 0x30

    int-to-char v0, v0

    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 313
    :goto_16
    return-void

    .line 296
    :cond_17
    const-string v0, "2147483648"

    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_16

    .line 302
    :cond_1d
    const/16 v0, 0x64

    if-ge p1, v0, :cond_3e

    .line 306
    add-int/lit8 v0, p1, 0x1

    const v1, 0xcccccc

    mul-int/2addr v0, v1

    shr-int/lit8 v0, v0, 0x1b

    .line 307
    add-int/lit8 v1, v0, 0x30

    int-to-char v1, v1

    invoke-interface {p0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 309
    shl-int/lit8 v1, v0, 0x3

    sub-int v1, p1, v1

    shl-int/lit8 v0, v0, 0x1

    sub-int v0, v1, v0

    add-int/lit8 v0, v0, 0x30

    int-to-char v0, v0

    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_16

    .line 311
    :cond_3e
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_16
.end method

.method public static appendUnpaddedInteger(Ljava/lang/Appendable;J)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 340
    long-to-int v0, p1

    .line 341
    int-to-long v1, v0

    cmp-long v1, v1, p1

    if-nez v1, :cond_a

    .line 342
    invoke-static {p0, v0}, Lorg/joda/time/format/FormatUtils;->appendUnpaddedInteger(Ljava/lang/Appendable;I)V

    .line 346
    :goto_9
    return-void

    .line 344
    :cond_a
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_9
.end method

.method public static appendUnpaddedInteger(Ljava/lang/StringBuffer;I)V
    .registers 3

    .prologue
    .line 275
    :try_start_0
    invoke-static {p0, p1}, Lorg/joda/time/format/FormatUtils;->appendUnpaddedInteger(Ljava/lang/Appendable;I)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 279
    :goto_3
    return-void

    .line 276
    :catch_4
    move-exception v0

    goto :goto_3
.end method

.method public static appendUnpaddedInteger(Ljava/lang/StringBuffer;J)V
    .registers 4

    .prologue
    .line 325
    :try_start_0
    invoke-static {p0, p1, p2}, Lorg/joda/time/format/FormatUtils;->appendUnpaddedInteger(Ljava/lang/Appendable;J)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 329
    :goto_3
    return-void

    .line 326
    :catch_4
    move-exception v0

    goto :goto_3
.end method

.method public static calculateDigitCount(J)I
    .registers 6

    .prologue
    .line 407
    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-gez v0, :cond_17

    .line 408
    const-wide/high16 v0, -0x8000000000000000L

    cmp-long v0, p0, v0

    if-eqz v0, :cond_14

    .line 409
    neg-long v0, p0

    invoke-static {v0, v1}, Lorg/joda/time/format/FormatUtils;->calculateDigitCount(J)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    .line 414
    :goto_13
    return v0

    .line 411
    :cond_14
    const/16 v0, 0x14

    goto :goto_13

    .line 414
    :cond_17
    const-wide/16 v0, 0xa

    cmp-long v0, p0, v0

    if-gez v0, :cond_1f

    const/4 v0, 0x1

    goto :goto_13

    :cond_1f
    const-wide/16 v0, 0x64

    cmp-long v0, p0, v0

    if-gez v0, :cond_27

    const/4 v0, 0x2

    goto :goto_13

    :cond_27
    const-wide/16 v0, 0x3e8

    cmp-long v0, p0, v0

    if-gez v0, :cond_2f

    const/4 v0, 0x3

    goto :goto_13

    :cond_2f
    const-wide/16 v0, 0x2710

    cmp-long v0, p0, v0

    if-gez v0, :cond_37

    const/4 v0, 0x4

    goto :goto_13

    :cond_37
    long-to-double v0, p0

    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    sget-wide v2, Lorg/joda/time/format/FormatUtils;->LOG_10:D

    div-double/2addr v0, v2

    double-to-int v0, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_13
.end method

.method static createErrorMessage(Ljava/lang/String;I)Ljava/lang/String;
    .registers 6

    .prologue
    const/16 v3, 0x22

    .line 428
    add-int/lit8 v0, p1, 0x20

    .line 430
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v2, v0, 0x3

    if-gt v1, v2, :cond_27

    move-object v0, p0

    .line 436
    :goto_d
    if-gtz p1, :cond_33

    .line 437
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid format: \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 444
    :goto_26
    return-object v0

    .line 433
    :cond_27
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const-string v1, "..."

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_d

    .line 440
    :cond_33
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-lt p1, v1, :cond_53

    .line 441
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid format: \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\" is too short"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_26

    .line 444
    :cond_53
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid format: \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\" is malformed at \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_26
.end method

.method static parseTwoDigits(Ljava/lang/CharSequence;I)I
    .registers 4

    .prologue
    .line 423
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    add-int/lit8 v0, v0, -0x30

    .line 424
    shl-int/lit8 v1, v0, 0x3

    shl-int/lit8 v0, v0, 0x1

    add-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x1

    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x30

    return v0
.end method

.method public static writePaddedInteger(Ljava/io/Writer;II)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v1, 0xa

    const/16 v4, 0x30

    .line 182
    if-gez p1, :cond_10

    .line 183
    const/16 v0, 0x2d

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(I)V

    .line 184
    const/high16 v0, -0x80000000

    if-eq p1, v0, :cond_1b

    .line 185
    neg-int p1, p1

    .line 194
    :cond_10
    if-ge p1, v1, :cond_2f

    .line 195
    :goto_12
    const/4 v0, 0x1

    if-le p2, v0, :cond_29

    .line 196
    invoke-virtual {p0, v4}, Ljava/io/Writer;->write(I)V

    .line 195
    add-int/lit8 p2, p2, -0x1

    goto :goto_12

    .line 187
    :cond_1b
    :goto_1b
    if-le p2, v1, :cond_23

    .line 188
    invoke-virtual {p0, v4}, Ljava/io/Writer;->write(I)V

    .line 187
    add-int/lit8 p2, p2, -0x1

    goto :goto_1b

    .line 190
    :cond_23
    const-string v0, "2147483648"

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 224
    :goto_28
    return-void

    .line 198
    :cond_29
    add-int/lit8 v0, p1, 0x30

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(I)V

    goto :goto_28

    .line 199
    :cond_2f
    const/16 v0, 0x64

    if-ge p1, v0, :cond_57

    .line 200
    :goto_33
    const/4 v0, 0x2

    if-le p2, v0, :cond_3c

    .line 201
    invoke-virtual {p0, v4}, Ljava/io/Writer;->write(I)V

    .line 200
    add-int/lit8 p2, p2, -0x1

    goto :goto_33

    .line 206
    :cond_3c
    add-int/lit8 v0, p1, 0x1

    const v1, 0xcccccc

    mul-int/2addr v0, v1

    shr-int/lit8 v0, v0, 0x1b

    .line 207
    add-int/lit8 v1, v0, 0x30

    invoke-virtual {p0, v1}, Ljava/io/Writer;->write(I)V

    .line 209
    shl-int/lit8 v1, v0, 0x3

    sub-int v1, p1, v1

    shl-int/lit8 v0, v0, 0x1

    sub-int v0, v1, v0

    add-int/lit8 v0, v0, 0x30

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(I)V

    goto :goto_28

    .line 212
    :cond_57
    const/16 v0, 0x3e8

    if-ge p1, v0, :cond_64

    .line 213
    const/4 v0, 0x3

    .line 219
    :goto_5c
    if-le p2, v0, :cond_76

    .line 220
    invoke-virtual {p0, v4}, Ljava/io/Writer;->write(I)V

    .line 219
    add-int/lit8 p2, p2, -0x1

    goto :goto_5c

    .line 214
    :cond_64
    const/16 v0, 0x2710

    if-ge p1, v0, :cond_6a

    .line 215
    const/4 v0, 0x4

    goto :goto_5c

    .line 217
    :cond_6a
    int-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    sget-wide v2, Lorg/joda/time/format/FormatUtils;->LOG_10:D

    div-double/2addr v0, v2

    double-to-int v0, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_5c

    .line 222
    :cond_76
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_28
.end method

.method public static writePaddedInteger(Ljava/io/Writer;JI)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x30

    const/16 v3, 0x13

    .line 239
    long-to-int v0, p1

    .line 240
    int-to-long v1, v0

    cmp-long v1, v1, p1

    if-nez v1, :cond_e

    .line 241
    invoke-static {p0, v0, p3}, Lorg/joda/time/format/FormatUtils;->writePaddedInteger(Ljava/io/Writer;II)V

    .line 263
    :goto_d
    return-void

    .line 242
    :cond_e
    if-gt p3, v3, :cond_18

    .line 243
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_d

    .line 245
    :cond_18
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_2a

    .line 246
    const/16 v0, 0x2d

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(I)V

    .line 247
    const-wide/high16 v0, -0x8000000000000000L

    cmp-long v0, p1, v0

    if-eqz v0, :cond_3d

    .line 248
    neg-long p1, p1

    .line 257
    :cond_2a
    long-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    sget-wide v2, Lorg/joda/time/format/FormatUtils;->LOG_10:D

    div-double/2addr v0, v2

    double-to-int v0, v0

    add-int/lit8 v0, v0, 0x1

    .line 258
    :goto_35
    if-le p3, v0, :cond_4b

    .line 259
    invoke-virtual {p0, v4}, Ljava/io/Writer;->write(I)V

    .line 258
    add-int/lit8 p3, p3, -0x1

    goto :goto_35

    .line 250
    :cond_3d
    :goto_3d
    if-le p3, v3, :cond_45

    .line 251
    invoke-virtual {p0, v4}, Ljava/io/Writer;->write(I)V

    .line 250
    add-int/lit8 p3, p3, -0x1

    goto :goto_3d

    .line 253
    :cond_45
    const-string v0, "9223372036854775808"

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_d

    .line 261
    :cond_4b
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_d
.end method

.method public static writeUnpaddedInteger(Ljava/io/Writer;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 359
    if-gez p1, :cond_c

    .line 360
    const/16 v0, 0x2d

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(I)V

    .line 361
    const/high16 v0, -0x80000000

    if-eq p1, v0, :cond_16

    .line 362
    neg-int p1, p1

    .line 368
    :cond_c
    const/16 v0, 0xa

    if-ge p1, v0, :cond_1c

    .line 369
    add-int/lit8 v0, p1, 0x30

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(I)V

    .line 381
    :goto_15
    return-void

    .line 364
    :cond_16
    const-string v0, "2147483648"

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_15

    .line 370
    :cond_1c
    const/16 v0, 0x64

    if-ge p1, v0, :cond_3b

    .line 374
    add-int/lit8 v0, p1, 0x1

    const v1, 0xcccccc

    mul-int/2addr v0, v1

    shr-int/lit8 v0, v0, 0x1b

    .line 375
    add-int/lit8 v1, v0, 0x30

    invoke-virtual {p0, v1}, Ljava/io/Writer;->write(I)V

    .line 377
    shl-int/lit8 v1, v0, 0x3

    sub-int v1, p1, v1

    shl-int/lit8 v0, v0, 0x1

    sub-int v0, v1, v0

    add-int/lit8 v0, v0, 0x30

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(I)V

    goto :goto_15

    .line 379
    :cond_3b
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_15
.end method

.method public static writeUnpaddedInteger(Ljava/io/Writer;J)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 394
    long-to-int v0, p1

    .line 395
    int-to-long v1, v0

    cmp-long v1, v1, p1

    if-nez v1, :cond_a

    .line 396
    invoke-static {p0, v0}, Lorg/joda/time/format/FormatUtils;->writeUnpaddedInteger(Ljava/io/Writer;I)V

    .line 400
    :goto_9
    return-void

    .line 398
    :cond_a
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_9
.end method
