.class public Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;
.super Ljava/lang/Object;
.source "BasicHeaderValueFormatter.java"

# interfaces
.implements Lcz/msebera/android/httpclient/message/HeaderValueFormatter;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# static fields
.field public static final DEFAULT:Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final INSTANCE:Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;

.field public static final SEPARATORS:Ljava/lang/String; = " ;,:@()<>\\\"/[]?={}\t"

.field public static final UNSAFE_CHARS:Ljava/lang/String; = "\"\\"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 56
    new-instance v0, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;-><init>()V

    sput-object v0, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->DEFAULT:Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;

    .line 58
    new-instance v0, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;-><init>()V

    sput-object v0, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    return-void
.end method

.method public static formatElements([Lcz/msebera/android/httpclient/HeaderElement;ZLcz/msebera/android/httpclient/message/HeaderValueFormatter;)Ljava/lang/String;
    .registers 4
    .param p0, "elems"    # [Lcz/msebera/android/httpclient/HeaderElement;
    .param p1, "quote"    # Z
    .param p2, "formatter"    # Lcz/msebera/android/httpclient/message/HeaderValueFormatter;

    .prologue
    .line 92
    if-eqz p2, :cond_c

    .end local p2    # "formatter":Lcz/msebera/android/httpclient/message/HeaderValueFormatter;
    :goto_2
    const/4 v0, 0x0

    .line 93
    invoke-interface {p2, v0, p0, p1}, Lcz/msebera/android/httpclient/message/HeaderValueFormatter;->formatElements(Lcz/msebera/android/httpclient/util/CharArrayBuffer;[Lcz/msebera/android/httpclient/HeaderElement;Z)Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 92
    .restart local p2    # "formatter":Lcz/msebera/android/httpclient/message/HeaderValueFormatter;
    :cond_c
    sget-object p2, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;

    goto :goto_2
.end method

.method public static formatHeaderElement(Lcz/msebera/android/httpclient/HeaderElement;ZLcz/msebera/android/httpclient/message/HeaderValueFormatter;)Ljava/lang/String;
    .registers 4
    .param p0, "elem"    # Lcz/msebera/android/httpclient/HeaderElement;
    .param p1, "quote"    # Z
    .param p2, "formatter"    # Lcz/msebera/android/httpclient/message/HeaderValueFormatter;

    .prologue
    .line 158
    if-eqz p2, :cond_c

    .end local p2    # "formatter":Lcz/msebera/android/httpclient/message/HeaderValueFormatter;
    :goto_2
    const/4 v0, 0x0

    .line 159
    invoke-interface {p2, v0, p0, p1}, Lcz/msebera/android/httpclient/message/HeaderValueFormatter;->formatHeaderElement(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/HeaderElement;Z)Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 158
    .restart local p2    # "formatter":Lcz/msebera/android/httpclient/message/HeaderValueFormatter;
    :cond_c
    sget-object p2, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;

    goto :goto_2
.end method

.method public static formatNameValuePair(Lcz/msebera/android/httpclient/NameValuePair;ZLcz/msebera/android/httpclient/message/HeaderValueFormatter;)Ljava/lang/String;
    .registers 4
    .param p0, "nvp"    # Lcz/msebera/android/httpclient/NameValuePair;
    .param p1, "quote"    # Z
    .param p2, "formatter"    # Lcz/msebera/android/httpclient/message/HeaderValueFormatter;

    .prologue
    .line 308
    if-eqz p2, :cond_c

    .end local p2    # "formatter":Lcz/msebera/android/httpclient/message/HeaderValueFormatter;
    :goto_2
    const/4 v0, 0x0

    .line 309
    invoke-interface {p2, v0, p0, p1}, Lcz/msebera/android/httpclient/message/HeaderValueFormatter;->formatNameValuePair(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/NameValuePair;Z)Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 308
    .restart local p2    # "formatter":Lcz/msebera/android/httpclient/message/HeaderValueFormatter;
    :cond_c
    sget-object p2, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;

    goto :goto_2
.end method

.method public static formatParameters([Lcz/msebera/android/httpclient/NameValuePair;ZLcz/msebera/android/httpclient/message/HeaderValueFormatter;)Ljava/lang/String;
    .registers 4
    .param p0, "nvps"    # [Lcz/msebera/android/httpclient/NameValuePair;
    .param p1, "quote"    # Z
    .param p2, "formatter"    # Lcz/msebera/android/httpclient/message/HeaderValueFormatter;

    .prologue
    .line 243
    if-eqz p2, :cond_c

    .end local p2    # "formatter":Lcz/msebera/android/httpclient/message/HeaderValueFormatter;
    :goto_2
    const/4 v0, 0x0

    .line 244
    invoke-interface {p2, v0, p0, p1}, Lcz/msebera/android/httpclient/message/HeaderValueFormatter;->formatParameters(Lcz/msebera/android/httpclient/util/CharArrayBuffer;[Lcz/msebera/android/httpclient/NameValuePair;Z)Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 243
    .restart local p2    # "formatter":Lcz/msebera/android/httpclient/message/HeaderValueFormatter;
    :cond_c
    sget-object p2, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;

    goto :goto_2
.end method


# virtual methods
.method protected doFormatValue(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Ljava/lang/String;Z)V
    .registers 9
    .param p1, "buffer"    # Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "quote"    # Z

    .prologue
    const/16 v4, 0x22

    .line 373
    move v2, p3

    .line 374
    .local v2, "quoteFlag":Z
    if-nez v2, :cond_19

    .line 375
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_19

    if-nez v2, :cond_19

    .line 376
    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {p0, v3}, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->isSeparator(C)Z

    move-result v2

    .line 375
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 380
    .end local v1    # "i":I
    :cond_19
    if-eqz v2, :cond_1e

    .line 381
    invoke-virtual {p1, v4}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(C)V

    .line 383
    :cond_1e
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_1f
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_3a

    .line 384
    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 385
    .local v0, "ch":C
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->isUnsafe(C)Z

    move-result v3

    if-eqz v3, :cond_34

    .line 386
    const/16 v3, 0x5c

    invoke-virtual {p1, v3}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(C)V

    .line 388
    :cond_34
    invoke-virtual {p1, v0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(C)V

    .line 383
    add-int/lit8 v1, v1, 0x1

    goto :goto_1f

    .line 390
    .end local v0    # "ch":C
    :cond_3a
    if-eqz v2, :cond_3f

    .line 391
    invoke-virtual {p1, v4}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(C)V

    .line 393
    :cond_3f
    return-void
.end method

.method protected estimateElementsLen([Lcz/msebera/android/httpclient/HeaderElement;)I
    .registers 7
    .param p1, "elems"    # [Lcz/msebera/android/httpclient/HeaderElement;

    .prologue
    const/4 v2, 0x0

    .line 129
    if-eqz p1, :cond_7

    array-length v3, p1

    const/4 v4, 0x1

    if-ge v3, v4, :cond_9

    :cond_7
    move v1, v2

    .line 138
    :cond_8
    return v1

    .line 133
    :cond_9
    array-length v3, p1

    add-int/lit8 v3, v3, -0x1

    mul-int/lit8 v1, v3, 0x2

    .line 134
    .local v1, "result":I
    array-length v3, p1

    :goto_f
    if-ge v2, v3, :cond_8

    aget-object v0, p1, v2

    .line 135
    .local v0, "elem":Lcz/msebera/android/httpclient/HeaderElement;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->estimateHeaderElementLen(Lcz/msebera/android/httpclient/HeaderElement;)I

    move-result v4

    add-int/2addr v1, v4

    .line 134
    add-int/lit8 v2, v2, 0x1

    goto :goto_f
.end method

.method protected estimateHeaderElementLen(Lcz/msebera/android/httpclient/HeaderElement;)I
    .registers 7
    .param p1, "elem"    # Lcz/msebera/android/httpclient/HeaderElement;

    .prologue
    .line 203
    if-nez p1, :cond_4

    .line 204
    const/4 v2, 0x0

    .line 222
    :cond_3
    return v2

    .line 207
    :cond_4
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v2

    .line 208
    .local v2, "result":I
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 209
    .local v3, "value":Ljava/lang/String;
    if-eqz v3, :cond_19

    .line 211
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x3

    add-int/2addr v2, v4

    .line 214
    :cond_19
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HeaderElement;->getParameterCount()I

    move-result v1

    .line 215
    .local v1, "parcnt":I
    if-lez v1, :cond_3

    .line 216
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_20
    if-ge v0, v1, :cond_3

    .line 218
    invoke-interface {p1, v0}, Lcz/msebera/android/httpclient/HeaderElement;->getParameter(I)Lcz/msebera/android/httpclient/NameValuePair;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->estimateNameValuePairLen(Lcz/msebera/android/httpclient/NameValuePair;)I

    move-result v4

    add-int/lit8 v4, v4, 0x2

    add-int/2addr v2, v4

    .line 216
    add-int/lit8 v0, v0, 0x1

    goto :goto_20
.end method

.method protected estimateNameValuePairLen(Lcz/msebera/android/httpclient/NameValuePair;)I
    .registers 5
    .param p1, "nvp"    # Lcz/msebera/android/httpclient/NameValuePair;

    .prologue
    .line 345
    if-nez p1, :cond_4

    .line 346
    const/4 v0, 0x0

    .line 355
    :cond_3
    :goto_3
    return v0

    .line 349
    :cond_4
    invoke-interface {p1}, Lcz/msebera/android/httpclient/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    .line 350
    .local v0, "result":I
    invoke-interface {p1}, Lcz/msebera/android/httpclient/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 351
    .local v1, "value":Ljava/lang/String;
    if-eqz v1, :cond_3

    .line 353
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x3

    add-int/2addr v0, v2

    goto :goto_3
.end method

.method protected estimateParametersLen([Lcz/msebera/android/httpclient/NameValuePair;)I
    .registers 7
    .param p1, "nvps"    # [Lcz/msebera/android/httpclient/NameValuePair;

    .prologue
    const/4 v2, 0x0

    .line 280
    if-eqz p1, :cond_7

    array-length v3, p1

    const/4 v4, 0x1

    if-ge v3, v4, :cond_9

    :cond_7
    move v1, v2

    .line 289
    :cond_8
    return v1

    .line 284
    :cond_9
    array-length v3, p1

    add-int/lit8 v3, v3, -0x1

    mul-int/lit8 v1, v3, 0x2

    .line 285
    .local v1, "result":I
    array-length v3, p1

    :goto_f
    if-ge v2, v3, :cond_8

    aget-object v0, p1, v2

    .line 286
    .local v0, "nvp":Lcz/msebera/android/httpclient/NameValuePair;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->estimateNameValuePairLen(Lcz/msebera/android/httpclient/NameValuePair;)I

    move-result v4

    add-int/2addr v1, v4

    .line 285
    add-int/lit8 v2, v2, 0x1

    goto :goto_f
.end method

.method public formatElements(Lcz/msebera/android/httpclient/util/CharArrayBuffer;[Lcz/msebera/android/httpclient/HeaderElement;Z)Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .registers 8
    .param p1, "charBuffer"    # Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .param p2, "elems"    # [Lcz/msebera/android/httpclient/HeaderElement;
    .param p3, "quote"    # Z

    .prologue
    .line 101
    const-string v3, "Header element array"

    invoke-static {p2, v3}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 102
    invoke-virtual {p0, p2}, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->estimateElementsLen([Lcz/msebera/android/httpclient/HeaderElement;)I

    move-result v2

    .line 103
    .local v2, "len":I
    move-object v0, p1

    .line 104
    .local v0, "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    if-nez v0, :cond_24

    .line 105
    new-instance v0, Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    .end local v0    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    invoke-direct {v0, v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;-><init>(I)V

    .line 110
    .restart local v0    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    :goto_11
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_12
    array-length v3, p2

    if-ge v1, v3, :cond_28

    .line 111
    if-lez v1, :cond_1c

    .line 112
    const-string v3, ", "

    invoke-virtual {v0, v3}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 114
    :cond_1c
    aget-object v3, p2, v1

    invoke-virtual {p0, v0, v3, p3}, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->formatHeaderElement(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/HeaderElement;Z)Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    .line 110
    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    .line 107
    .end local v1    # "i":I
    :cond_24
    invoke-virtual {v0, v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->ensureCapacity(I)V

    goto :goto_11

    .line 117
    .restart local v1    # "i":I
    :cond_28
    return-object v0
.end method

.method public formatHeaderElement(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/HeaderElement;Z)Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .registers 10
    .param p1, "charBuffer"    # Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .param p2, "elem"    # Lcz/msebera/android/httpclient/HeaderElement;
    .param p3, "quote"    # Z

    .prologue
    .line 167
    const-string v5, "Header element"

    invoke-static {p2, v5}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 168
    invoke-virtual {p0, p2}, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->estimateHeaderElementLen(Lcz/msebera/android/httpclient/HeaderElement;)I

    move-result v2

    .line 169
    .local v2, "len":I
    move-object v0, p1

    .line 170
    .local v0, "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    if-nez v0, :cond_3e

    .line 171
    new-instance v0, Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    .end local v0    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    invoke-direct {v0, v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;-><init>(I)V

    .line 176
    .restart local v0    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    :goto_11
    invoke-interface {p2}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 177
    invoke-interface {p2}, Lcz/msebera/android/httpclient/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v4

    .line 178
    .local v4, "value":Ljava/lang/String;
    if-eqz v4, :cond_26

    .line 179
    const/16 v5, 0x3d

    invoke-virtual {v0, v5}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(C)V

    .line 180
    invoke-virtual {p0, v0, v4, p3}, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->doFormatValue(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Ljava/lang/String;Z)V

    .line 183
    :cond_26
    invoke-interface {p2}, Lcz/msebera/android/httpclient/HeaderElement;->getParameterCount()I

    move-result v3

    .line 184
    .local v3, "parcnt":I
    if-lez v3, :cond_42

    .line 185
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2d
    if-ge v1, v3, :cond_42

    .line 186
    const-string v5, "; "

    invoke-virtual {v0, v5}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 187
    invoke-interface {p2, v1}, Lcz/msebera/android/httpclient/HeaderElement;->getParameter(I)Lcz/msebera/android/httpclient/NameValuePair;

    move-result-object v5

    invoke-virtual {p0, v0, v5, p3}, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->formatNameValuePair(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/NameValuePair;Z)Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    .line 185
    add-int/lit8 v1, v1, 0x1

    goto :goto_2d

    .line 173
    .end local v1    # "i":I
    .end local v3    # "parcnt":I
    .end local v4    # "value":Ljava/lang/String;
    :cond_3e
    invoke-virtual {v0, v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->ensureCapacity(I)V

    goto :goto_11

    .line 191
    .restart local v3    # "parcnt":I
    .restart local v4    # "value":Ljava/lang/String;
    :cond_42
    return-object v0
.end method

.method public formatNameValuePair(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/NameValuePair;Z)Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .registers 8
    .param p1, "charBuffer"    # Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .param p2, "nvp"    # Lcz/msebera/android/httpclient/NameValuePair;
    .param p3, "quote"    # Z

    .prologue
    .line 317
    const-string v3, "Name / value pair"

    invoke-static {p2, v3}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 318
    invoke-virtual {p0, p2}, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->estimateNameValuePairLen(Lcz/msebera/android/httpclient/NameValuePair;)I

    move-result v1

    .line 319
    .local v1, "len":I
    move-object v0, p1

    .line 320
    .local v0, "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    if-nez v0, :cond_27

    .line 321
    new-instance v0, Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    .end local v0    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;-><init>(I)V

    .line 326
    .restart local v0    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    :goto_11
    invoke-interface {p2}, Lcz/msebera/android/httpclient/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 327
    invoke-interface {p2}, Lcz/msebera/android/httpclient/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 328
    .local v2, "value":Ljava/lang/String;
    if-eqz v2, :cond_26

    .line 329
    const/16 v3, 0x3d

    invoke-virtual {v0, v3}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(C)V

    .line 330
    invoke-virtual {p0, v0, v2, p3}, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->doFormatValue(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Ljava/lang/String;Z)V

    .line 333
    :cond_26
    return-object v0

    .line 323
    .end local v2    # "value":Ljava/lang/String;
    :cond_27
    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->ensureCapacity(I)V

    goto :goto_11
.end method

.method public formatParameters(Lcz/msebera/android/httpclient/util/CharArrayBuffer;[Lcz/msebera/android/httpclient/NameValuePair;Z)Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .registers 8
    .param p1, "charBuffer"    # Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .param p2, "nvps"    # [Lcz/msebera/android/httpclient/NameValuePair;
    .param p3, "quote"    # Z

    .prologue
    .line 252
    const-string v3, "Header parameter array"

    invoke-static {p2, v3}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 253
    invoke-virtual {p0, p2}, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->estimateParametersLen([Lcz/msebera/android/httpclient/NameValuePair;)I

    move-result v2

    .line 254
    .local v2, "len":I
    move-object v0, p1

    .line 255
    .local v0, "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    if-nez v0, :cond_24

    .line 256
    new-instance v0, Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    .end local v0    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    invoke-direct {v0, v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;-><init>(I)V

    .line 261
    .restart local v0    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    :goto_11
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_12
    array-length v3, p2

    if-ge v1, v3, :cond_28

    .line 262
    if-lez v1, :cond_1c

    .line 263
    const-string v3, "; "

    invoke-virtual {v0, v3}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 265
    :cond_1c
    aget-object v3, p2, v1

    invoke-virtual {p0, v0, v3, p3}, Lcz/msebera/android/httpclient/message/BasicHeaderValueFormatter;->formatNameValuePair(Lcz/msebera/android/httpclient/util/CharArrayBuffer;Lcz/msebera/android/httpclient/NameValuePair;Z)Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    .line 261
    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    .line 258
    .end local v1    # "i":I
    :cond_24
    invoke-virtual {v0, v2}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->ensureCapacity(I)V

    goto :goto_11

    .line 268
    .restart local v1    # "i":I
    :cond_28
    return-object v0
.end method

.method protected isSeparator(C)Z
    .registers 3
    .param p1, "ch"    # C

    .prologue
    .line 405
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
    .line 418
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
