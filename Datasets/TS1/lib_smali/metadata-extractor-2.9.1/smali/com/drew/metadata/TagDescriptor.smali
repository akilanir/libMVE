.class public Lcom/drew/metadata/TagDescriptor;
.super Ljava/lang/Object;
.source "TagDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/drew/metadata/Directory;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field protected final _directory:Lcom/drew/metadata/Directory;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 44
    const-class v0, Lcom/drew/metadata/TagDescriptor;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/drew/metadata/TagDescriptor;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lcom/drew/metadata/Directory;)V
    .registers 2
    .param p1    # Lcom/drew/metadata/Directory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 50
    .local p0, "this":Lcom/drew/metadata/TagDescriptor;, "Lcom/drew/metadata/TagDescriptor<TT;>;"
    .local p1, "directory":Lcom/drew/metadata/Directory;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lcom/drew/metadata/TagDescriptor;->_directory:Lcom/drew/metadata/Directory;

    .line 52
    return-void
.end method

.method public static convertBytesToVersionString([II)Ljava/lang/String;
    .registers 7
    .param p0, "components"    # [I
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param
    .param p1, "majorDigits"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/16 v4, 0x30

    .line 109
    if-nez p0, :cond_6

    .line 110
    const/4 v3, 0x0

    .line 122
    :goto_5
    return-object v3

    .line 111
    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .local v2, "version":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    const/4 v3, 0x4

    if-ge v1, v3, :cond_2c

    array-length v3, p0

    if-ge v1, v3, :cond_2c

    .line 113
    if-ne v1, p1, :cond_19

    .line 114
    const/16 v3, 0x2e

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 115
    :cond_19
    aget v3, p0, v1

    int-to-char v0, v3

    .line 116
    .local v0, "c":C
    if-ge v0, v4, :cond_21

    .line 117
    add-int/lit8 v3, v0, 0x30

    int-to-char v0, v3

    .line 118
    :cond_21
    if-nez v1, :cond_28

    if-ne v0, v4, :cond_28

    .line 112
    :goto_25
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 120
    :cond_28
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_25

    .line 122
    .end local v0    # "c":C
    :cond_2c
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_5
.end method

.method protected static getFStopDescription(D)Ljava/lang/String;
    .registers 5
    .param p0, "fStop"    # D
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 305
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "0.0"

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 306
    .local v0, "format":Ljava/text/DecimalFormat;
    sget-object v1, Ljava/math/RoundingMode;->HALF_UP:Ljava/math/RoundingMode;

    invoke-virtual {v0, v1}, Ljava/text/DecimalFormat;->setRoundingMode(Ljava/math/RoundingMode;)V

    .line 307
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "f/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0, p0, p1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected static getFocalLengthDescription(D)Ljava/lang/String;
    .registers 5
    .param p0, "mm"    # D
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 313
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "0.#"

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 314
    .local v0, "format":Ljava/text/DecimalFormat;
    sget-object v1, Ljava/math/RoundingMode;->HALF_UP:Ljava/math/RoundingMode;

    invoke-virtual {v0, v1}, Ljava/text/DecimalFormat;->setRoundingMode(Ljava/math/RoundingMode;)V

    .line 315
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0, p1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " mm"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method protected get7BitStringFromBytes(I)Ljava/lang/String;
    .registers 8
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 253
    .local p0, "this":Lcom/drew/metadata/TagDescriptor;, "Lcom/drew/metadata/TagDescriptor<TT;>;"
    iget-object v4, p0, Lcom/drew/metadata/TagDescriptor;->_directory:Lcom/drew/metadata/Directory;

    invoke-virtual {v4, p1}, Lcom/drew/metadata/Directory;->getByteArray(I)[B

    move-result-object v0

    .line 255
    .local v0, "bytes":[B
    if-nez v0, :cond_a

    .line 256
    const/4 v4, 0x0

    .line 267
    :goto_9
    return-object v4

    .line 258
    :cond_a
    array-length v3, v0

    .line 259
    .local v3, "length":I
    const/4 v2, 0x0

    .local v2, "index":I
    :goto_c
    array-length v4, v0

    if-ge v2, v4, :cond_1a

    .line 260
    aget-byte v4, v0, v2

    and-int/lit16 v1, v4, 0xff

    .line 261
    .local v1, "i":I
    if-eqz v1, :cond_19

    const/16 v4, 0x7f

    if-le v1, v4, :cond_21

    .line 262
    :cond_19
    move v3, v2

    .line 267
    .end local v1    # "i":I
    :cond_1a
    new-instance v4, Ljava/lang/String;

    const/4 v5, 0x0

    invoke-direct {v4, v0, v5, v3}, Ljava/lang/String;-><init>([BII)V

    goto :goto_9

    .line 259
    .restart local v1    # "i":I
    :cond_21
    add-int/lit8 v2, v2, 0x1

    goto :goto_c
.end method

.method protected getAsciiStringFromBytes(I)Ljava/lang/String;
    .registers 7
    .param p1, "tag"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/TagDescriptor;, "Lcom/drew/metadata/TagDescriptor<TT;>;"
    const/4 v2, 0x0

    .line 273
    iget-object v3, p0, Lcom/drew/metadata/TagDescriptor;->_directory:Lcom/drew/metadata/Directory;

    invoke-virtual {v3, p1}, Lcom/drew/metadata/Directory;->getByteArray(I)[B

    move-result-object v1

    .line 275
    .local v1, "values":[B
    if-nez v1, :cond_a

    .line 281
    :goto_9
    return-object v2

    .line 279
    :cond_a
    :try_start_a
    new-instance v3, Ljava/lang/String;

    const-string v4, "ASCII"

    invoke-direct {v3, v1, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_14
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_a .. :try_end_14} :catch_16

    move-result-object v2

    goto :goto_9

    .line 280
    :catch_16
    move-exception v0

    .line 281
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    goto :goto_9
.end method

.method protected varargs getBitFlagDescription(I[Ljava/lang/Object;)Ljava/lang/String;
    .registers 13
    .param p1, "tagType"    # I
    .param p2, "labels"    # [Ljava/lang/Object;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/TagDescriptor;, "Lcom/drew/metadata/TagDescriptor<TT;>;"
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 223
    iget-object v8, p0, Lcom/drew/metadata/TagDescriptor;->_directory:Lcom/drew/metadata/Directory;

    invoke-virtual {v8, p1}, Lcom/drew/metadata/Directory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v5

    .line 225
    .local v5, "value":Ljava/lang/Integer;
    if-nez v5, :cond_c

    .line 226
    const/4 v6, 0x0

    .line 247
    :goto_b
    return-object v6

    .line 228
    :cond_c
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 230
    .local v4, "parts":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 231
    .local v0, "bitIndex":I
    :goto_12
    array-length v8, p2

    if-le v8, v0, :cond_5e

    .line 232
    aget-object v2, p2, v0

    .line 233
    .local v2, "labelObj":Ljava/lang/Object;
    if-eqz v2, :cond_43

    .line 234
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v8

    and-int/lit8 v8, v8, 0x1

    if-ne v8, v6, :cond_39

    move v1, v6

    .line 235
    .local v1, "isBitSet":Z
    :goto_22
    instance-of v8, v2, [Ljava/lang/String;

    if-eqz v8, :cond_52

    .line 236
    check-cast v2, [Ljava/lang/String;

    .end local v2    # "labelObj":Ljava/lang/Object;
    move-object v3, v2

    check-cast v3, [Ljava/lang/String;

    .line 237
    .local v3, "labelPair":[Ljava/lang/String;
    sget-boolean v8, Lcom/drew/metadata/TagDescriptor;->$assertionsDisabled:Z

    if-nez v8, :cond_3b

    array-length v8, v3

    const/4 v9, 0x2

    if-eq v8, v9, :cond_3b

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .end local v1    # "isBitSet":Z
    .end local v3    # "labelPair":[Ljava/lang/String;
    .restart local v2    # "labelObj":Ljava/lang/Object;
    :cond_39
    move v1, v7

    .line 234
    goto :goto_22

    .line 238
    .end local v2    # "labelObj":Ljava/lang/Object;
    .restart local v1    # "isBitSet":Z
    .restart local v3    # "labelPair":[Ljava/lang/String;
    :cond_3b
    if-eqz v1, :cond_50

    move v8, v6

    :goto_3e
    aget-object v8, v3, v8

    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 243
    .end local v1    # "isBitSet":Z
    .end local v3    # "labelPair":[Ljava/lang/String;
    :cond_43
    :goto_43
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v8

    shr-int/lit8 v8, v8, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 244
    add-int/lit8 v0, v0, 0x1

    .line 245
    goto :goto_12

    .restart local v1    # "isBitSet":Z
    .restart local v3    # "labelPair":[Ljava/lang/String;
    :cond_50
    move v8, v7

    .line 238
    goto :goto_3e

    .line 239
    .end local v3    # "labelPair":[Ljava/lang/String;
    .restart local v2    # "labelObj":Ljava/lang/Object;
    :cond_52
    if-eqz v1, :cond_43

    instance-of v8, v2, Ljava/lang/String;

    if-eqz v8, :cond_43

    .line 240
    check-cast v2, Ljava/lang/String;

    .end local v2    # "labelObj":Ljava/lang/Object;
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_43

    .line 247
    .end local v1    # "isBitSet":Z
    :cond_5e
    const-string v6, ", "

    invoke-static {v4, v6}, Lcom/drew/lang/StringUtil;->join(Ljava/lang/Iterable;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_b
.end method

.method protected getByteLengthDescription(I)Ljava/lang/String;
    .registers 8
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/TagDescriptor;, "Lcom/drew/metadata/TagDescriptor<TT;>;"
    const/4 v5, 0x1

    .line 156
    iget-object v1, p0, Lcom/drew/metadata/TagDescriptor;->_directory:Lcom/drew/metadata/Directory;

    invoke-virtual {v1, p1}, Lcom/drew/metadata/Directory;->getByteArray(I)[B

    move-result-object v0

    .line 157
    .local v0, "bytes":[B
    if-nez v0, :cond_b

    .line 158
    const/4 v1, 0x0

    .line 159
    :goto_a
    return-object v1

    :cond_b
    const-string v2, "(%d byte%s)"

    const/4 v1, 0x2

    new-array v3, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    array-length v4, v0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v1

    array-length v1, v0

    if-ne v1, v5, :cond_24

    const-string v1, ""

    :goto_1d
    aput-object v1, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_a

    :cond_24
    const-string v1, "s"

    goto :goto_1d
.end method

.method protected getDecimalRational(II)Ljava/lang/String;
    .registers 9
    .param p1, "tagType"    # I
    .param p2, "decimalPlaces"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 174
    .local p0, "this":Lcom/drew/metadata/TagDescriptor;, "Lcom/drew/metadata/TagDescriptor<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/TagDescriptor;->_directory:Lcom/drew/metadata/Directory;

    invoke-virtual {v1, p1}, Lcom/drew/metadata/Directory;->getRational(I)Lcom/drew/lang/Rational;

    move-result-object v0

    .line 175
    .local v0, "value":Lcom/drew/lang/Rational;
    if-nez v0, :cond_a

    .line 176
    const/4 v1, 0x0

    .line 177
    :goto_9
    return-object v1

    :cond_a
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "%."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "f"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v0}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_9
.end method

.method public getDescription(I)Ljava/lang/String;
    .registers 9
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/TagDescriptor;, "Lcom/drew/metadata/TagDescriptor<TT;>;"
    const/4 v6, 0x1

    .line 67
    iget-object v2, p0, Lcom/drew/metadata/TagDescriptor;->_directory:Lcom/drew/metadata/Directory;

    invoke-virtual {v2, p1}, Lcom/drew/metadata/Directory;->getObject(I)Ljava/lang/Object;

    move-result-object v1

    .line 69
    .local v1, "object":Ljava/lang/Object;
    if-nez v1, :cond_b

    .line 70
    const/4 v2, 0x0

    .line 89
    .end local v1    # "object":Ljava/lang/Object;
    :goto_a
    return-object v2

    .line 73
    .restart local v1    # "object":Ljava/lang/Object;
    :cond_b
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-eqz v2, :cond_37

    .line 74
    invoke-static {v1}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v0

    .line 75
    .local v0, "length":I
    const/16 v2, 0x10

    if-le v0, v2, :cond_37

    .line 76
    const-string v3, "[%d %s]"

    const/4 v2, 0x2

    new-array v4, v2, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v2

    if-ne v0, v6, :cond_34

    const-string v2, "value"

    :goto_2d
    aput-object v2, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_a

    :cond_34
    const-string v2, "values"

    goto :goto_2d

    .line 80
    .end local v0    # "length":I
    :cond_37
    instance-of v2, v1, Ljava/util/Date;

    if-eqz v2, :cond_51

    .line 83
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "EEE MMM dd HH:mm:ss Z yyyy"

    invoke-direct {v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    check-cast v1, Ljava/util/Date;

    .end local v1    # "object":Ljava/lang/Object;
    invoke-virtual {v2, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "([0-9]{2} [^ ]+)$"

    const-string v4, ":$1"

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_a

    .line 89
    .restart local v1    # "object":Ljava/lang/Object;
    :cond_51
    iget-object v2, p0, Lcom/drew/metadata/TagDescriptor;->_directory:Lcom/drew/metadata/Directory;

    invoke-virtual {v2, p1}, Lcom/drew/metadata/Directory;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_a
.end method

.method protected getEpochTimeDescription(I)Ljava/lang/String;
    .registers 6
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 211
    .local p0, "this":Lcom/drew/metadata/TagDescriptor;, "Lcom/drew/metadata/TagDescriptor<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/TagDescriptor;->_directory:Lcom/drew/metadata/Directory;

    invoke-virtual {v1, p1}, Lcom/drew/metadata/Directory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v0

    .line 212
    .local v0, "value":Ljava/lang/Long;
    if-nez v0, :cond_a

    .line 213
    const/4 v1, 0x0

    .line 214
    :goto_9
    return-object v1

    :cond_a
    new-instance v1, Ljava/util/Date;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v1}, Ljava/util/Date;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_9
.end method

.method protected getFormattedFloat(ILjava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "tagType"    # I
    .param p2, "format"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 192
    .local p0, "this":Lcom/drew/metadata/TagDescriptor;, "Lcom/drew/metadata/TagDescriptor<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/TagDescriptor;->_directory:Lcom/drew/metadata/Directory;

    invoke-virtual {v1, p1}, Lcom/drew/metadata/Directory;->getFloatObject(I)Ljava/lang/Float;

    move-result-object v0

    .line 193
    .local v0, "value":Ljava/lang/Float;
    if-nez v0, :cond_a

    .line 194
    const/4 v1, 0x0

    .line 195
    :goto_9
    return-object v1

    :cond_a
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {p2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_9
.end method

.method protected getFormattedInt(ILjava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "tagType"    # I
    .param p2, "format"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 183
    .local p0, "this":Lcom/drew/metadata/TagDescriptor;, "Lcom/drew/metadata/TagDescriptor<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/TagDescriptor;->_directory:Lcom/drew/metadata/Directory;

    invoke-virtual {v1, p1}, Lcom/drew/metadata/Directory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 184
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_a

    .line 185
    const/4 v1, 0x0

    .line 186
    :goto_9
    return-object v1

    :cond_a
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {p2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_9
.end method

.method protected getFormattedString(ILjava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "tagType"    # I
    .param p2, "format"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 201
    .local p0, "this":Lcom/drew/metadata/TagDescriptor;, "Lcom/drew/metadata/TagDescriptor<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/TagDescriptor;->_directory:Lcom/drew/metadata/Directory;

    invoke-virtual {v1, p1}, Lcom/drew/metadata/Directory;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 202
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_a

    .line 203
    const/4 v1, 0x0

    .line 204
    :goto_9
    return-object v1

    :cond_a
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {p2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_9
.end method

.method protected varargs getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p1, "tagType"    # I
    .param p2, "baseIndex"    # I
    .param p3, "descriptions"    # [Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 141
    .local p0, "this":Lcom/drew/metadata/TagDescriptor;, "Lcom/drew/metadata/TagDescriptor<TT;>;"
    iget-object v3, p0, Lcom/drew/metadata/TagDescriptor;->_directory:Lcom/drew/metadata/Directory;

    invoke-virtual {v3, p1}, Lcom/drew/metadata/Directory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v2

    .line 142
    .local v2, "index":Ljava/lang/Integer;
    if-nez v2, :cond_a

    .line 143
    const/4 v1, 0x0

    .line 150
    :cond_9
    :goto_9
    return-object v1

    .line 144
    :cond_a
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    sub-int v0, v3, p2

    .line 145
    .local v0, "arrayIndex":I
    if-ltz v0, :cond_19

    array-length v3, p3

    if-ge v0, v3, :cond_19

    .line 146
    aget-object v1, p3, v0

    .line 147
    .local v1, "description":Ljava/lang/String;
    if-nez v1, :cond_9

    .line 150
    .end local v1    # "description":Ljava/lang/String;
    :cond_19
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_9
.end method

.method protected varargs getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "tagType"    # I
    .param p2, "descriptions"    # [Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 135
    .local p0, "this":Lcom/drew/metadata/TagDescriptor;, "Lcom/drew/metadata/TagDescriptor<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/drew/metadata/TagDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getLensSpecificationDescription(I)Ljava/lang/String;
    .registers 13
    .param p1, "tag"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/drew/metadata/TagDescriptor;, "Lcom/drew/metadata/TagDescriptor<TT;>;"
    const/4 v10, 0x3

    const-wide/16 v8, 0x0

    const/4 v7, 0x0

    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 321
    iget-object v3, p0, Lcom/drew/metadata/TagDescriptor;->_directory:Lcom/drew/metadata/Directory;

    invoke-virtual {v3, p1}, Lcom/drew/metadata/Directory;->getRationalArray(I)[Lcom/drew/lang/Rational;

    move-result-object v2

    .line 323
    .local v2, "values":[Lcom/drew/lang/Rational;
    if-eqz v2, :cond_26

    array-length v3, v2

    const/4 v4, 0x4

    if-ne v3, v4, :cond_26

    aget-object v3, v2, v7

    invoke-virtual {v3}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v3

    cmpl-double v3, v3, v8

    if-nez v3, :cond_28

    aget-object v3, v2, v6

    invoke-virtual {v3}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v3

    cmpl-double v3, v3, v8

    if-nez v3, :cond_28

    .line 324
    :cond_26
    const/4 v3, 0x0

    .line 345
    :goto_27
    return-object v3

    .line 326
    :cond_28
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 328
    .local v1, "sb":Ljava/lang/StringBuilder;
    aget-object v3, v2, v7

    aget-object v4, v2, v5

    invoke-virtual {v3, v4}, Lcom/drew/lang/Rational;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7d

    .line 329
    aget-object v3, v2, v7

    invoke-virtual {v3, v5}, Lcom/drew/lang/Rational;->toSimpleString(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "mm"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 333
    :goto_46
    aget-object v3, v2, v6

    invoke-virtual {v3}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v3

    cmpl-double v3, v3, v8

    if-eqz v3, :cond_78

    .line 334
    const/16 v3, 0x20

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 336
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v3, "0.0"

    invoke-direct {v0, v3}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 337
    .local v0, "format":Ljava/text/DecimalFormat;
    sget-object v3, Ljava/math/RoundingMode;->HALF_UP:Ljava/math/RoundingMode;

    invoke-virtual {v0, v3}, Ljava/text/DecimalFormat;->setRoundingMode(Ljava/math/RoundingMode;)V

    .line 339
    aget-object v3, v2, v6

    aget-object v4, v2, v10

    invoke-virtual {v3, v4}, Lcom/drew/lang/Rational;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9d

    .line 340
    aget-object v3, v2, v6

    invoke-virtual {v3}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/drew/metadata/TagDescriptor;->getFStopDescription(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 345
    .end local v0    # "format":Ljava/text/DecimalFormat;
    :cond_78
    :goto_78
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_27

    .line 331
    :cond_7d
    aget-object v3, v2, v7

    invoke-virtual {v3, v5}, Lcom/drew/lang/Rational;->toSimpleString(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x2d

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, v2, v5

    invoke-virtual {v4, v5}, Lcom/drew/lang/Rational;->toSimpleString(Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "mm"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_46

    .line 342
    .restart local v0    # "format":Ljava/text/DecimalFormat;
    :cond_9d
    const-string v3, "f/"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, v2, v6

    invoke-virtual {v4}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x2d

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, v2, v10

    invoke-virtual {v4}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_78
.end method

.method protected getRationalOrDoubleString(I)Ljava/lang/String;
    .registers 6
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 288
    .local p0, "this":Lcom/drew/metadata/TagDescriptor;, "Lcom/drew/metadata/TagDescriptor<TT;>;"
    iget-object v3, p0, Lcom/drew/metadata/TagDescriptor;->_directory:Lcom/drew/metadata/Directory;

    invoke-virtual {v3, p1}, Lcom/drew/metadata/Directory;->getRational(I)Lcom/drew/lang/Rational;

    move-result-object v2

    .line 289
    .local v2, "rational":Lcom/drew/lang/Rational;
    if-eqz v2, :cond_e

    .line 290
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/drew/lang/Rational;->toSimpleString(Z)Ljava/lang/String;

    move-result-object v3

    .line 299
    :goto_d
    return-object v3

    .line 292
    :cond_e
    iget-object v3, p0, Lcom/drew/metadata/TagDescriptor;->_directory:Lcom/drew/metadata/Directory;

    invoke-virtual {v3, p1}, Lcom/drew/metadata/Directory;->getDoubleObject(I)Ljava/lang/Double;

    move-result-object v0

    .line 293
    .local v0, "d":Ljava/lang/Double;
    if-eqz v0, :cond_22

    .line 295
    new-instance v1, Ljava/text/DecimalFormat;

    const-string v3, "0.###"

    invoke-direct {v1, v3}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 296
    .local v1, "format":Ljava/text/DecimalFormat;
    invoke-virtual {v1, v0}, Ljava/text/DecimalFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_d

    .line 299
    .end local v1    # "format":Ljava/text/DecimalFormat;
    :cond_22
    const/4 v3, 0x0

    goto :goto_d
.end method

.method protected getSimpleRational(I)Ljava/lang/String;
    .registers 4
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 165
    .local p0, "this":Lcom/drew/metadata/TagDescriptor;, "Lcom/drew/metadata/TagDescriptor<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/TagDescriptor;->_directory:Lcom/drew/metadata/Directory;

    invoke-virtual {v1, p1}, Lcom/drew/metadata/Directory;->getRational(I)Lcom/drew/lang/Rational;

    move-result-object v0

    .line 166
    .local v0, "value":Lcom/drew/lang/Rational;
    if-nez v0, :cond_a

    .line 167
    const/4 v1, 0x0

    .line 168
    :goto_9
    return-object v1

    :cond_a
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/drew/lang/Rational;->toSimpleString(Z)Ljava/lang/String;

    move-result-object v1

    goto :goto_9
.end method

.method protected getVersionBytesDescription(II)Ljava/lang/String;
    .registers 5
    .param p1, "tagType"    # I
    .param p2, "majorDigits"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 128
    .local p0, "this":Lcom/drew/metadata/TagDescriptor;, "Lcom/drew/metadata/TagDescriptor<TT;>;"
    iget-object v1, p0, Lcom/drew/metadata/TagDescriptor;->_directory:Lcom/drew/metadata/Directory;

    invoke-virtual {v1, p1}, Lcom/drew/metadata/Directory;->getIntArray(I)[I

    move-result-object v0

    .line 129
    .local v0, "values":[I
    if-nez v0, :cond_a

    const/4 v1, 0x0

    :goto_9
    return-object v1

    :cond_a
    invoke-static {v0, p2}, Lcom/drew/metadata/TagDescriptor;->convertBytesToVersionString([II)Ljava/lang/String;

    move-result-object v1

    goto :goto_9
.end method
