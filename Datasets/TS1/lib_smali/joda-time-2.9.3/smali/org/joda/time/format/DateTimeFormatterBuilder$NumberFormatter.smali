.class abstract Lorg/joda/time/format/DateTimeFormatterBuilder$NumberFormatter;
.super Ljava/lang/Object;
.source "DateTimeFormatterBuilder.java"

# interfaces
.implements Lorg/joda/time/format/InternalPrinter;
.implements Lorg/joda/time/format/InternalParser;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/joda/time/format/DateTimeFormatterBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "NumberFormatter"
.end annotation


# instance fields
.field protected final iFieldType:Lorg/joda/time/DateTimeFieldType;

.field protected final iMaxParsedDigits:I

.field protected final iSigned:Z


# direct methods
.method constructor <init>(Lorg/joda/time/DateTimeFieldType;IZ)V
    .registers 4

    .prologue
    .line 1293
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1294
    iput-object p1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$NumberFormatter;->iFieldType:Lorg/joda/time/DateTimeFieldType;

    .line 1295
    iput p2, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$NumberFormatter;->iMaxParsedDigits:I

    .line 1296
    iput-boolean p3, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$NumberFormatter;->iSigned:Z

    .line 1297
    return-void
.end method


# virtual methods
.method public estimateParsedLength()I
    .registers 2

    .prologue
    .line 1300
    iget v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$NumberFormatter;->iMaxParsedDigits:I

    return v0
.end method

.method public parseInto(Lorg/joda/time/format/DateTimeParserBucket;Ljava/lang/CharSequence;I)I
    .registers 16

    .prologue
    const/16 v10, 0x30

    const/16 v9, 0x2d

    const/16 v8, 0x2b

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1304
    iget v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$NumberFormatter;->iMaxParsedDigits:I

    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v1

    sub-int/2addr v1, p3

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    move v4, v3

    move v1, v3

    move v5, v0

    move v0, v3

    .line 1309
    :goto_17
    if-ge v4, v5, :cond_c1

    .line 1310
    add-int v6, p3, v4

    invoke-interface {p2, v6}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    .line 1311
    if-nez v4, :cond_59

    if-eq v6, v9, :cond_25

    if-ne v6, v8, :cond_59

    :cond_25
    iget-boolean v7, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$NumberFormatter;->iSigned:Z

    if-eqz v7, :cond_59

    .line 1312
    if-ne v6, v9, :cond_47

    move v1, v2

    .line 1313
    :goto_2c
    if-ne v6, v8, :cond_49

    move v0, v2

    .line 1316
    :goto_2f
    add-int/lit8 v6, v4, 0x1

    if-ge v6, v5, :cond_c1

    add-int v6, p3, v4

    add-int/lit8 v6, v6, 0x1

    invoke-interface {p2, v6}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    if-lt v6, v10, :cond_c1

    const/16 v7, 0x39

    if-le v6, v7, :cond_4b

    move v3, v1

    .line 1332
    :goto_42
    if-nez v4, :cond_64

    .line 1333
    xor-int/lit8 v1, p3, -0x1

    .line 1366
    :goto_46
    return v1

    :cond_47
    move v1, v3

    .line 1312
    goto :goto_2c

    :cond_49
    move v0, v3

    .line 1313
    goto :goto_2f

    .line 1320
    :cond_4b
    add-int/lit8 v4, v4, 0x1

    .line 1323
    add-int/lit8 v5, v5, 0x1

    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v6

    sub-int/2addr v6, p3

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v5

    goto :goto_17

    .line 1326
    :cond_59
    if-lt v6, v10, :cond_c1

    const/16 v7, 0x39

    if-le v6, v7, :cond_61

    move v3, v1

    .line 1327
    goto :goto_42

    .line 1329
    :cond_61
    add-int/lit8 v4, v4, 0x1

    .line 1330
    goto :goto_17

    .line 1337
    :cond_64
    const/16 v1, 0x9

    if-lt v4, v1, :cond_8f

    .line 1340
    if-eqz v0, :cond_80

    .line 1341
    add-int/lit8 v0, p3, 0x1

    add-int v1, p3, v4

    invoke-interface {p2, v0, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 1365
    :cond_7a
    :goto_7a
    iget-object v2, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$NumberFormatter;->iFieldType:Lorg/joda/time/DateTimeFieldType;

    invoke-virtual {p1, v2, v0}, Lorg/joda/time/format/DateTimeParserBucket;->saveField(Lorg/joda/time/DateTimeFieldType;I)V

    goto :goto_46

    .line 1343
    :cond_80
    add-int v1, p3, v4

    invoke-interface {p2, p3, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_7a

    .line 1348
    :cond_8f
    if-nez v3, :cond_93

    if-eqz v0, :cond_bf

    .line 1349
    :cond_93
    add-int/lit8 v0, p3, 0x1

    move v1, v0

    .line 1352
    :goto_96
    add-int/lit8 v0, v1, 0x1

    :try_start_98
    invoke-interface {p2, v1}, Ljava/lang/CharSequence;->charAt(I)C
    :try_end_9b
    .catch Ljava/lang/StringIndexOutOfBoundsException; {:try_start_98 .. :try_end_9b} :catch_b7

    move-result v1

    add-int/lit8 v2, v1, -0x30

    .line 1356
    add-int v1, p3, v4

    move v11, v0

    move v0, v2

    move v2, v11

    .line 1357
    :goto_a3
    if-ge v2, v1, :cond_bb

    .line 1358
    shl-int/lit8 v4, v0, 0x3

    shl-int/lit8 v0, v0, 0x1

    add-int/2addr v4, v0

    add-int/lit8 v0, v2, 0x1

    invoke-interface {p2, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    add-int/2addr v2, v4

    add-int/lit8 v2, v2, -0x30

    move v11, v0

    move v0, v2

    move v2, v11

    goto :goto_a3

    .line 1353
    :catch_b7
    move-exception v0

    .line 1354
    xor-int/lit8 v1, p3, -0x1

    goto :goto_46

    .line 1360
    :cond_bb
    if-eqz v3, :cond_7a

    .line 1361
    neg-int v0, v0

    goto :goto_7a

    :cond_bf
    move v1, p3

    goto :goto_96

    :cond_c1
    move v3, v1

    goto :goto_42
.end method
