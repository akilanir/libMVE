.class public Lorg/apache/http/message/BasicHeaderValueFormatter;
.super Ljava/lang/Object;
.source "BasicHeaderValueFormatter.java"

# interfaces
.implements Lorg/apache/http/message/HeaderValueFormatter;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field public static final DEFAULT:Lorg/apache/http/message/BasicHeaderValueFormatter;

.field public static final SEPARATORS:Ljava/lang/String; = " ;,:@()<>\\\"/[]?={}\t"

.field public static final UNSAFE_CHARS:Ljava/lang/String; = "\"\\"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 52
    new-instance v0, Lorg/apache/http/message/BasicHeaderValueFormatter;

    invoke-direct {v0}, Lorg/apache/http/message/BasicHeaderValueFormatter;-><init>()V

    sput-object v0, Lorg/apache/http/message/BasicHeaderValueFormatter;->DEFAULT:Lorg/apache/http/message/BasicHeaderValueFormatter;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final formatElements([Lorg/apache/http/HeaderElement;ZLorg/apache/http/message/HeaderValueFormatter;)Ljava/lang/String;
    .registers 4
    .param p0, "elems"    # [Lorg/apache/http/HeaderElement;
    .param p1, "quote"    # Z
    .param p2, "formatter"    # Lorg/apache/http/message/HeaderValueFormatter;

    .prologue
    .line 90
    if-nez p2, :cond_4

    .line 91
    sget-object p2, Lorg/apache/http/message/BasicHeaderValueFormatter;->DEFAULT:Lorg/apache/http/message/BasicHeaderValueFormatter;

    .line 92
    :cond_4
    const/4 v0, 0x0

    invoke-interface {p2, v0, p0, p1}, Lorg/apache/http/message/HeaderValueFormatter;->formatElements(Lorg/apache/http/util/CharArrayBuffer;[Lorg/apache/http/HeaderElement;Z)Lorg/apache/http/util/CharArrayBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final formatHeaderElement(Lorg/apache/http/HeaderElement;ZLorg/apache/http/message/HeaderValueFormatter;)Ljava/lang/String;
    .registers 4
    .param p0, "elem"    # Lorg/apache/http/HeaderElement;
    .param p1, "quote"    # Z
    .param p2, "formatter"    # Lorg/apache/http/message/HeaderValueFormatter;

    .prologue
    .line 159
    if-nez p2, :cond_4

    .line 160
    sget-object p2, Lorg/apache/http/message/BasicHeaderValueFormatter;->DEFAULT:Lorg/apache/http/message/BasicHeaderValueFormatter;

    .line 161
    :cond_4
    const/4 v0, 0x0

    invoke-interface {p2, v0, p0, p1}, Lorg/apache/http/message/HeaderValueFormatter;->formatHeaderElement(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/HeaderElement;Z)Lorg/apache/http/util/CharArrayBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final formatNameValuePair(Lorg/apache/http/NameValuePair;ZLorg/apache/http/message/HeaderValueFormatter;)Ljava/lang/String;
    .registers 4
    .param p0, "nvp"    # Lorg/apache/http/NameValuePair;
    .param p1, "quote"    # Z
    .param p2, "formatter"    # Lorg/apache/http/message/HeaderValueFormatter;

    .prologue
    .line 315
    if-nez p2, :cond_4

    .line 316
    sget-object p2, Lorg/apache/http/message/BasicHeaderValueFormatter;->DEFAULT:Lorg/apache/http/message/BasicHeaderValueFormatter;

    .line 317
    :cond_4
    const/4 v0, 0x0

    invoke-interface {p2, v0, p0, p1}, Lorg/apache/http/message/HeaderValueFormatter;->formatNameValuePair(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/NameValuePair;Z)Lorg/apache/http/util/CharArrayBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final formatParameters([Lorg/apache/http/NameValuePair;ZLorg/apache/http/message/HeaderValueFormatter;)Ljava/lang/String;
    .registers 4
    .param p0, "nvps"    # [Lorg/apache/http/NameValuePair;
    .param p1, "quote"    # Z
    .param p2, "formatter"    # Lorg/apache/http/message/HeaderValueFormatter;

    .prologue
    .line 247
    if-nez p2, :cond_4

    .line 248
    sget-object p2, Lorg/apache/http/message/BasicHeaderValueFormatter;->DEFAULT:Lorg/apache/http/message/BasicHeaderValueFormatter;

    .line 249
    :cond_4
    const/4 v0, 0x0

    invoke-interface {p2, v0, p0, p1}, Lorg/apache/http/message/HeaderValueFormatter;->formatParameters(Lorg/apache/http/util/CharArrayBuffer;[Lorg/apache/http/NameValuePair;Z)Lorg/apache/http/util/CharArrayBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected doFormatValue(Lorg/apache/http/util/CharArrayBuffer;Ljava/lang/String;Z)V
    .registers 8
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "quote"    # Z

    .prologue
    const/16 v3, 0x22

    .line 383
    if-nez p3, :cond_18

    .line 384
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_18

    if-nez p3, :cond_18

    .line 385
    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {p0, v2}, Lorg/apache/http/message/BasicHeaderValueFormatter;->isSeparator(C)Z

    move-result p3

    .line 384
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 389
    .end local v1    # "i":I
    :cond_18
    if-eqz p3, :cond_1d

    .line 390
    invoke-virtual {p1, v3}, Lorg/apache/http/util/CharArrayBuffer;->append(C)V

    .line 392
    :cond_1d
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_1e
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_39

    .line 393
    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 394
    .local v0, "ch":C
    invoke-virtual {p0, v0}, Lorg/apache/http/message/BasicHeaderValueFormatter;->isUnsafe(C)Z

    move-result v2

    if-eqz v2, :cond_33

    .line 395
    const/16 v2, 0x5c

    invoke-virtual {p1, v2}, Lorg/apache/http/util/CharArrayBuffer;->append(C)V

    .line 397
    :cond_33
    invoke-virtual {p1, v0}, Lorg/apache/http/util/CharArrayBuffer;->append(C)V

    .line 392
    add-int/lit8 v1, v1, 0x1

    goto :goto_1e

    .line 399
    .end local v0    # "ch":C
    :cond_39
    if-eqz p3, :cond_3e

    .line 400
    invoke-virtual {p1, v3}, Lorg/apache/http/util/CharArrayBuffer;->append(C)V

    .line 402
    :cond_3e
    return-void
.end method

.method protected estimateElementsLen([Lorg/apache/http/HeaderElement;)I
    .registers 6
    .param p1, "elems"    # [Lorg/apache/http/HeaderElement;

    .prologue
    .line 131
    if-eqz p1, :cond_6

    array-length v2, p1

    const/4 v3, 0x1

    if-ge v2, v3, :cond_8

    .line 132
    :cond_6
    const/4 v1, 0x0

    .line 139
    :cond_7
    return v1

    .line 134
    :cond_8
    array-length v2, p1

    add-int/lit8 v2, v2, -0x1

    mul-int/lit8 v1, v2, 0x2

    .line 135
    .local v1, "result":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    array-length v2, p1

    if-ge v0, v2, :cond_7

    .line 136
    aget-object v2, p1, v0

    invoke-virtual {p0, v2}, Lorg/apache/http/message/BasicHeaderValueFormatter;->estimateHeaderElementLen(Lorg/apache/http/HeaderElement;)I

    move-result v2

    add-int/2addr v1, v2

    .line 135
    add-int/lit8 v0, v0, 0x1

    goto :goto_e
.end method

.method protected estimateHeaderElementLen(Lorg/apache/http/HeaderElement;)I
    .registers 7
    .param p1, "elem"    # Lorg/apache/http/HeaderElement;

    .prologue
    .line 208
    if-nez p1, :cond_4

    .line 209
    const/4 v2, 0x0

    .line 226
    :cond_3
    return v2

    .line 211
    :cond_4
    invoke-interface {p1}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v2

    .line 212
    .local v2, "result":I
    invoke-interface {p1}, Lorg/apache/http/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 213
    .local v3, "value":Ljava/lang/String;
    if-eqz v3, :cond_19

    .line 215
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x3

    add-int/2addr v2, v4

    .line 218
    :cond_19
    invoke-interface {p1}, Lorg/apache/http/HeaderElement;->getParameterCount()I

    move-result v1

    .line 219
    .local v1, "parcnt":I
    if-lez v1, :cond_3

    .line 220
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_20
    if-ge v0, v1, :cond_3

    .line 221
    invoke-interface {p1, v0}, Lorg/apache/http/HeaderElement;->getParameter(I)Lorg/apache/http/NameValuePair;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/http/message/BasicHeaderValueFormatter;->estimateNameValuePairLen(Lorg/apache/http/NameValuePair;)I

    move-result v4

    add-int/lit8 v4, v4, 0x2

    add-int/2addr v2, v4

    .line 220
    add-int/lit8 v0, v0, 0x1

    goto :goto_20
.end method

.method protected estimateNameValuePairLen(Lorg/apache/http/NameValuePair;)I
    .registers 5
    .param p1, "nvp"    # Lorg/apache/http/NameValuePair;

    .prologue
    .line 356
    if-nez p1, :cond_4

    .line 357
    const/4 v0, 0x0

    .line 365
    :cond_3
    :goto_3
    return v0

    .line 359
    :cond_4
    invoke-interface {p1}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    .line 360
    .local v0, "result":I
    invoke-interface {p1}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 361
    .local v1, "value":Ljava/lang/String;
    if-eqz v1, :cond_3

    .line 363
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x3

    add-int/2addr v0, v2

    goto :goto_3
.end method

.method protected estimateParametersLen([Lorg/apache/http/NameValuePair;)I
    .registers 6
    .param p1, "nvps"    # [Lorg/apache/http/NameValuePair;

    .prologue
    .line 288
    if-eqz p1, :cond_6

    array-length v2, p1

    const/4 v3, 0x1

    if-ge v2, v3, :cond_8

    .line 289
    :cond_6
    const/4 v1, 0x0

    .line 296
    :cond_7
    return v1

    .line 291
    :cond_8
    array-length v2, p1

    add-int/lit8 v2, v2, -0x1

    mul-int/lit8 v1, v2, 0x2

    .line 292
    .local v1, "result":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    array-length v2, p1

    if-ge v0, v2, :cond_7

    .line 293
    aget-object v2, p1, v0

    invoke-virtual {p0, v2}, Lorg/apache/http/message/BasicHeaderValueFormatter;->estimateNameValuePairLen(Lorg/apache/http/NameValuePair;)I

    move-result v2

    add-int/2addr v1, v2

    .line 292
    add-int/lit8 v0, v0, 0x1

    goto :goto_e
.end method

.method public formatElements(Lorg/apache/http/util/CharArrayBuffer;[Lorg/apache/http/HeaderElement;Z)Lorg/apache/http/util/CharArrayBuffer;
    .registers 8
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "elems"    # [Lorg/apache/http/HeaderElement;
    .param p3, "quote"    # Z

    .prologue
    .line 100
    if-nez p2, :cond_a

    .line 101
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Header element array must not be null."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 105
    :cond_a
    invoke-virtual {p0, p2}, Lorg/apache/http/message/BasicHeaderValueFormatter;->estimateElementsLen([Lorg/apache/http/HeaderElement;)I

    move-result v1

    .line 106
    .local v1, "len":I
    if-nez p1, :cond_28

    .line 107
    new-instance p1, Lorg/apache/http/util/CharArrayBuffer;

    .end local p1    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    invoke-direct {p1, v1}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 112
    .restart local p1    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    :goto_15
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_16
    array-length v2, p2

    if-ge v0, v2, :cond_2c

    .line 113
    if-lez v0, :cond_20

    .line 114
    const-string v2, ", "

    invoke-virtual {p1, v2}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 116
    :cond_20
    aget-object v2, p2, v0

    invoke-virtual {p0, p1, v2, p3}, Lorg/apache/http/message/BasicHeaderValueFormatter;->formatHeaderElement(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/HeaderElement;Z)Lorg/apache/http/util/CharArrayBuffer;

    .line 112
    add-int/lit8 v0, v0, 0x1

    goto :goto_16

    .line 109
    .end local v0    # "i":I
    :cond_28
    invoke-virtual {p1, v1}, Lorg/apache/http/util/CharArrayBuffer;->ensureCapacity(I)V

    goto :goto_15

    .line 119
    .restart local v0    # "i":I
    :cond_2c
    return-object p1
.end method

.method public formatHeaderElement(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/HeaderElement;Z)Lorg/apache/http/util/CharArrayBuffer;
    .registers 10
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "elem"    # Lorg/apache/http/HeaderElement;
    .param p3, "quote"    # Z

    .prologue
    .line 169
    if-nez p2, :cond_a

    .line 170
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Header element must not be null."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 174
    :cond_a
    invoke-virtual {p0, p2}, Lorg/apache/http/message/BasicHeaderValueFormatter;->estimateHeaderElementLen(Lorg/apache/http/HeaderElement;)I

    move-result v1

    .line 175
    .local v1, "len":I
    if-nez p1, :cond_42

    .line 176
    new-instance p1, Lorg/apache/http/util/CharArrayBuffer;

    .end local p1    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    invoke-direct {p1, v1}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 181
    .restart local p1    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    :goto_15
    invoke-interface {p2}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 182
    invoke-interface {p2}, Lorg/apache/http/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 183
    .local v3, "value":Ljava/lang/String;
    if-eqz v3, :cond_2a

    .line 184
    const/16 v4, 0x3d

    invoke-virtual {p1, v4}, Lorg/apache/http/util/CharArrayBuffer;->append(C)V

    .line 185
    invoke-virtual {p0, p1, v3, p3}, Lorg/apache/http/message/BasicHeaderValueFormatter;->doFormatValue(Lorg/apache/http/util/CharArrayBuffer;Ljava/lang/String;Z)V

    .line 188
    :cond_2a
    invoke-interface {p2}, Lorg/apache/http/HeaderElement;->getParameterCount()I

    move-result v2

    .line 189
    .local v2, "parcnt":I
    if-lez v2, :cond_46

    .line 190
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_31
    if-ge v0, v2, :cond_46

    .line 191
    const-string v4, "; "

    invoke-virtual {p1, v4}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 192
    invoke-interface {p2, v0}, Lorg/apache/http/HeaderElement;->getParameter(I)Lorg/apache/http/NameValuePair;

    move-result-object v4

    invoke-virtual {p0, p1, v4, p3}, Lorg/apache/http/message/BasicHeaderValueFormatter;->formatNameValuePair(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/NameValuePair;Z)Lorg/apache/http/util/CharArrayBuffer;

    .line 190
    add-int/lit8 v0, v0, 0x1

    goto :goto_31

    .line 178
    .end local v0    # "i":I
    .end local v2    # "parcnt":I
    .end local v3    # "value":Ljava/lang/String;
    :cond_42
    invoke-virtual {p1, v1}, Lorg/apache/http/util/CharArrayBuffer;->ensureCapacity(I)V

    goto :goto_15

    .line 196
    .restart local v2    # "parcnt":I
    .restart local v3    # "value":Ljava/lang/String;
    :cond_46
    return-object p1
.end method

.method public formatNameValuePair(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/NameValuePair;Z)Lorg/apache/http/util/CharArrayBuffer;
    .registers 8
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "nvp"    # Lorg/apache/http/NameValuePair;
    .param p3, "quote"    # Z

    .prologue
    .line 325
    if-nez p2, :cond_a

    .line 326
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "NameValuePair must not be null."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 330
    :cond_a
    invoke-virtual {p0, p2}, Lorg/apache/http/message/BasicHeaderValueFormatter;->estimateNameValuePairLen(Lorg/apache/http/NameValuePair;)I

    move-result v0

    .line 331
    .local v0, "len":I
    if-nez p1, :cond_2b

    .line 332
    new-instance p1, Lorg/apache/http/util/CharArrayBuffer;

    .end local p1    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    invoke-direct {p1, v0}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 337
    .restart local p1    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    :goto_15
    invoke-interface {p2}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 338
    invoke-interface {p2}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 339
    .local v1, "value":Ljava/lang/String;
    if-eqz v1, :cond_2a

    .line 340
    const/16 v2, 0x3d

    invoke-virtual {p1, v2}, Lorg/apache/http/util/CharArrayBuffer;->append(C)V

    .line 341
    invoke-virtual {p0, p1, v1, p3}, Lorg/apache/http/message/BasicHeaderValueFormatter;->doFormatValue(Lorg/apache/http/util/CharArrayBuffer;Ljava/lang/String;Z)V

    .line 344
    :cond_2a
    return-object p1

    .line 334
    .end local v1    # "value":Ljava/lang/String;
    :cond_2b
    invoke-virtual {p1, v0}, Lorg/apache/http/util/CharArrayBuffer;->ensureCapacity(I)V

    goto :goto_15
.end method

.method public formatParameters(Lorg/apache/http/util/CharArrayBuffer;[Lorg/apache/http/NameValuePair;Z)Lorg/apache/http/util/CharArrayBuffer;
    .registers 8
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "nvps"    # [Lorg/apache/http/NameValuePair;
    .param p3, "quote"    # Z

    .prologue
    .line 257
    if-nez p2, :cond_a

    .line 258
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Parameters must not be null."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 262
    :cond_a
    invoke-virtual {p0, p2}, Lorg/apache/http/message/BasicHeaderValueFormatter;->estimateParametersLen([Lorg/apache/http/NameValuePair;)I

    move-result v1

    .line 263
    .local v1, "len":I
    if-nez p1, :cond_28

    .line 264
    new-instance p1, Lorg/apache/http/util/CharArrayBuffer;

    .end local p1    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    invoke-direct {p1, v1}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 269
    .restart local p1    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    :goto_15
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_16
    array-length v2, p2

    if-ge v0, v2, :cond_2c

    .line 270
    if-lez v0, :cond_20

    .line 271
    const-string v2, "; "

    invoke-virtual {p1, v2}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 273
    :cond_20
    aget-object v2, p2, v0

    invoke-virtual {p0, p1, v2, p3}, Lorg/apache/http/message/BasicHeaderValueFormatter;->formatNameValuePair(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/NameValuePair;Z)Lorg/apache/http/util/CharArrayBuffer;

    .line 269
    add-int/lit8 v0, v0, 0x1

    goto :goto_16

    .line 266
    .end local v0    # "i":I
    :cond_28
    invoke-virtual {p1, v1}, Lorg/apache/http/util/CharArrayBuffer;->ensureCapacity(I)V

    goto :goto_15

    .line 276
    .restart local v0    # "i":I
    :cond_2c
    return-object p1
.end method

.method protected isSeparator(C)Z
    .registers 3
    .param p1, "ch"    # C

    .prologue
    .line 414
    const-string v0, " ;,:@()<>\\\"/[]?={}\t"

    invoke-virtual {v0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected isUnsafe(C)Z
    .registers 3
    .param p1, "ch"    # C

    .prologue
    .line 427
    const-string v0, "\"\\"

    invoke-virtual {v0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method
