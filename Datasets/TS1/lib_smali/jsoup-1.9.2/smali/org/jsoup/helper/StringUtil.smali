.class public final Lorg/jsoup/helper/StringUtil;
.super Ljava/lang/Object;
.source "StringUtil.java"


# static fields
.field private static final padding:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 14
    const/16 v0, 0xb

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, ""

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, " "

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "  "

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "   "

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "    "

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "     "

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "      "

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "       "

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "        "

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "         "

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "          "

    aput-object v2, v0, v1

    sput-object v0, Lorg/jsoup/helper/StringUtil;->padding:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static appendNormalisedWhitespace(Ljava/lang/StringBuilder;Ljava/lang/String;Z)V
    .registers 9
    .param p0, "accum"    # Ljava/lang/StringBuilder;
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "stripLeading"    # Z

    .prologue
    .line 128
    const/4 v2, 0x0

    .line 129
    .local v2, "lastWasWhite":Z
    const/4 v4, 0x0

    .line 131
    .local v4, "reachedNonWhite":Z
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 133
    .local v3, "len":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    if-ge v1, v3, :cond_2c

    .line 134
    invoke-virtual {p1, v1}, Ljava/lang/String;->codePointAt(I)I

    move-result v0

    .line 135
    .local v0, "c":I
    invoke-static {v0}, Lorg/jsoup/helper/StringUtil;->isWhitespace(I)Z

    move-result v5

    if-eqz v5, :cond_26

    .line 136
    if-eqz p2, :cond_17

    if-eqz v4, :cond_19

    :cond_17
    if-eqz v2, :cond_1f

    .line 133
    :cond_19
    :goto_19
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v5

    add-int/2addr v1, v5

    goto :goto_7

    .line 138
    :cond_1f
    const/16 v5, 0x20

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 139
    const/4 v2, 0x1

    goto :goto_19

    .line 142
    :cond_26
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->appendCodePoint(I)Ljava/lang/StringBuilder;

    .line 143
    const/4 v2, 0x0

    .line 144
    const/4 v4, 0x1

    goto :goto_19

    .line 147
    .end local v0    # "c":I
    :cond_2c
    return-void
.end method

.method public static varargs in(Ljava/lang/String;[Ljava/lang/String;)Z
    .registers 7
    .param p0, "needle"    # Ljava/lang/String;
    .param p1, "haystack"    # [Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 150
    array-length v3, p1

    move v2, v1

    :goto_3
    if-ge v2, v3, :cond_e

    aget-object v0, p1, v2

    .line 151
    .local v0, "hay":Ljava/lang/String;
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 152
    const/4 v1, 0x1

    .line 154
    .end local v0    # "hay":Ljava/lang/String;
    :cond_e
    return v1

    .line 150
    .restart local v0    # "hay":Ljava/lang/String;
    :cond_f
    add-int/lit8 v2, v2, 0x1

    goto :goto_3
.end method

.method public static inSorted(Ljava/lang/String;[Ljava/lang/String;)Z
    .registers 3
    .param p0, "needle"    # Ljava/lang/String;
    .param p1, "haystack"    # [Ljava/lang/String;

    .prologue
    .line 158
    invoke-static {p1, p0}, Ljava/util/Arrays;->binarySearch([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static isBlank(Ljava/lang/String;)Z
    .registers 5
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 72
    if-eqz p0, :cond_9

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_a

    .line 80
    :cond_9
    :goto_9
    return v2

    .line 75
    :cond_a
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 76
    .local v1, "l":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    if-ge v0, v1, :cond_9

    .line 77
    invoke-virtual {p0, v0}, Ljava/lang/String;->codePointAt(I)I

    move-result v3

    invoke-static {v3}, Lorg/jsoup/helper/StringUtil;->isWhitespace(I)Z

    move-result v3

    if-nez v3, :cond_1d

    .line 78
    const/4 v2, 0x0

    goto :goto_9

    .line 76
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_f
.end method

.method public static isNumeric(Ljava/lang/String;)Z
    .registers 5
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 89
    if-eqz p0, :cond_9

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_a

    .line 97
    :cond_9
    :goto_9
    return v2

    .line 92
    :cond_a
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 93
    .local v1, "l":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    if-ge v0, v1, :cond_1e

    .line 94
    invoke-virtual {p0, v0}, Ljava/lang/String;->codePointAt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isDigit(I)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 93
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 97
    :cond_1e
    const/4 v2, 0x1

    goto :goto_9
.end method

.method public static isWhitespace(I)Z
    .registers 2
    .param p0, "c"    # I

    .prologue
    .line 106
    const/16 v0, 0x20

    if-eq p0, v0, :cond_14

    const/16 v0, 0x9

    if-eq p0, v0, :cond_14

    const/16 v0, 0xa

    if-eq p0, v0, :cond_14

    const/16 v0, 0xc

    if-eq p0, v0, :cond_14

    const/16 v0, 0xd

    if-ne p0, v0, :cond_16

    :cond_14
    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public static join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "strings"    # Ljava/util/Collection;
    .param p1, "sep"    # Ljava/lang/String;

    .prologue
    .line 23
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-static {v0, p1}, Lorg/jsoup/helper/StringUtil;->join(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static join(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "strings"    # Ljava/util/Iterator;
    .param p1, "sep"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_9

    .line 34
    const-string v1, ""

    .line 45
    :cond_8
    :goto_8
    return-object v1

    .line 36
    :cond_9
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 37
    .local v1, "start":Ljava/lang/String;
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 40
    new-instance v2, Ljava/lang/StringBuilder;

    const/16 v3, 0x40

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 41
    .local v0, "sb":Ljava/lang/StringBuilder;
    :goto_22
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_33

    .line 42
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_22

    .line 45
    :cond_33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_8
.end method

.method public static normaliseWhitespace(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 116
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 117
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    invoke-static {v0, p0, v1}, Lorg/jsoup/helper/StringUtil;->appendNormalisedWhitespace(Ljava/lang/StringBuilder;Ljava/lang/String;Z)V

    .line 118
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static padding(I)Ljava/lang/String;
    .registers 5
    .param p0, "width"    # I

    .prologue
    .line 54
    if-gez p0, :cond_a

    .line 55
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "width must be > 0"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 57
    :cond_a
    sget-object v2, Lorg/jsoup/helper/StringUtil;->padding:[Ljava/lang/String;

    array-length v2, v2

    if-ge p0, v2, :cond_14

    .line 58
    sget-object v2, Lorg/jsoup/helper/StringUtil;->padding:[Ljava/lang/String;

    aget-object v2, v2, p0

    .line 63
    :goto_13
    return-object v2

    .line 60
    :cond_14
    new-array v1, p0, [C

    .line 61
    .local v1, "out":[C
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_17
    if-ge v0, p0, :cond_20

    .line 62
    const/16 v2, 0x20

    aput-char v2, v1, v0

    .line 61
    add-int/lit8 v0, v0, 0x1

    goto :goto_17

    .line 63
    :cond_20
    invoke-static {v1}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v2

    goto :goto_13
.end method

.method public static resolve(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "baseUrl"    # Ljava/lang/String;
    .param p1, "relUrl"    # Ljava/lang/String;

    .prologue
    .line 189
    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_5} :catch_e

    .line 195
    .local v1, "base":Ljava/net/URL;
    :try_start_5
    invoke-static {v1, p1}, Lorg/jsoup/helper/StringUtil;->resolve(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v3

    .line 197
    .end local v1    # "base":Ljava/net/URL;
    :goto_d
    return-object v3

    .line 190
    :catch_e
    move-exception v2

    .line 192
    .local v2, "e":Ljava/net/MalformedURLException;
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 193
    .local v0, "abs":Ljava/net/URL;
    invoke-virtual {v0}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;
    :try_end_17
    .catch Ljava/net/MalformedURLException; {:try_start_5 .. :try_end_17} :catch_19

    move-result-object v3

    goto :goto_d

    .line 196
    .end local v0    # "abs":Ljava/net/URL;
    .end local v2    # "e":Ljava/net/MalformedURLException;
    :catch_19
    move-exception v2

    .line 197
    .restart local v2    # "e":Ljava/net/MalformedURLException;
    const-string v3, ""

    goto :goto_d
.end method

.method public static resolve(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;
    .registers 8
    .param p0, "base"    # Ljava/net/URL;
    .param p1, "relUrl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 170
    const-string v1, "?"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 171
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 173
    :cond_1d
    const/16 v1, 0x2e

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-nez v1, :cond_5a

    invoke-virtual {p0}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eqz v1, :cond_5a

    .line 174
    new-instance v0, Ljava/net/URL;

    invoke-virtual {p0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    move-result v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .end local p0    # "base":Ljava/net/URL;
    .local v0, "base":Ljava/net/URL;
    move-object p0, v0

    .line 176
    .end local v0    # "base":Ljava/net/URL;
    .restart local p0    # "base":Ljava/net/URL;
    :cond_5a
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p0, p1}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v1
.end method
