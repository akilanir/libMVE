.class final Lcom/koushikdutta/async/http/cache/RawHeaders;
.super Ljava/lang/Object;
.source "RawHeaders.java"


# static fields
.field private static final FIELD_NAME_COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private httpMinorVersion:I

.field private final namesAndValues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private responseCode:I

.field private responseMessage:Ljava/lang/String;

.field private statusLine:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 48
    new-instance v0, Lcom/koushikdutta/async/http/cache/RawHeaders$1;

    invoke-direct {v0}, Lcom/koushikdutta/async/http/cache/RawHeaders$1;-><init>()V

    sput-object v0, Lcom/koushikdutta/async/http/cache/RawHeaders;->FIELD_NAME_COMPARATOR:Ljava/util/Comparator;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    .line 64
    const/4 v0, 0x1

    iput v0, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->httpMinorVersion:I

    .line 65
    const/4 v0, -0x1

    iput v0, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->responseCode:I

    .line 68
    return-void
.end method

.method public constructor <init>(Lcom/koushikdutta/async/http/cache/RawHeaders;)V
    .registers 4
    .param p1, "copyFrom"    # Lcom/koushikdutta/async/http/cache/RawHeaders;

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    .line 64
    const/4 v0, 0x1

    iput v0, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->httpMinorVersion:I

    .line 65
    const/4 v0, -0x1

    iput v0, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->responseCode:I

    .line 71
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/http/cache/RawHeaders;->copy(Lcom/koushikdutta/async/http/cache/RawHeaders;)V

    .line 72
    return-void
.end method

.method public static fromMultimap(Ljava/util/Map;)Lcom/koushikdutta/async/http/cache/RawHeaders;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lcom/koushikdutta/async/http/cache/RawHeaders;"
        }
    .end annotation

    .prologue
    .line 290
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    new-instance v3, Lcom/koushikdutta/async/http/cache/RawHeaders;

    invoke-direct {v3}, Lcom/koushikdutta/async/http/cache/RawHeaders;-><init>()V

    .line 291
    .local v3, "result":Lcom/koushikdutta/async/http/cache/RawHeaders;
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_d
    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_41

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 292
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 293
    .local v1, "fieldName":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 294
    .local v4, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v1, :cond_2b

    .line 295
    invoke-virtual {v3, v1, v4}, Lcom/koushikdutta/async/http/cache/RawHeaders;->addAll(Ljava/lang/String;Ljava/util/List;)V

    goto :goto_d

    .line 296
    :cond_2b
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_d

    .line 297
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v3, v5}, Lcom/koushikdutta/async/http/cache/RawHeaders;->setStatusLine(Ljava/lang/String;)V

    goto :goto_d

    .line 300
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v1    # "fieldName":Ljava/lang/String;
    .end local v4    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_41
    return-object v3
.end method

.method public static parse(Ljava/lang/String;)Lcom/koushikdutta/async/http/cache/RawHeaders;
    .registers 8
    .param p0, "payload"    # Ljava/lang/String;

    .prologue
    .line 304
    const-string v6, "\n"

    invoke-virtual {p0, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 306
    .local v5, "lines":[Ljava/lang/String;
    new-instance v1, Lcom/koushikdutta/async/http/cache/RawHeaders;

    invoke-direct {v1}, Lcom/koushikdutta/async/http/cache/RawHeaders;-><init>()V

    .line 307
    .local v1, "headers":Lcom/koushikdutta/async/http/cache/RawHeaders;
    move-object v0, v5

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_e
    if-ge v2, v3, :cond_2d

    aget-object v4, v0, v2

    .line 308
    .local v4, "line":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 309
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1f

    .line 307
    :goto_1c
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 312
    :cond_1f
    invoke-virtual {v1}, Lcom/koushikdutta/async/http/cache/RawHeaders;->getStatusLine()Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_29

    .line 313
    invoke-virtual {v1, v4}, Lcom/koushikdutta/async/http/cache/RawHeaders;->setStatusLine(Ljava/lang/String;)V

    goto :goto_1c

    .line 315
    :cond_29
    invoke-virtual {v1, v4}, Lcom/koushikdutta/async/http/cache/RawHeaders;->addLine(Ljava/lang/String;)V

    goto :goto_1c

    .line 317
    .end local v4    # "line":Ljava/lang/String;
    :cond_2d
    return-object v1
.end method


# virtual methods
.method public add(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 154
    if-nez p1, :cond_a

    .line 155
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "fieldName == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 157
    :cond_a
    if-nez p2, :cond_2b

    .line 163
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Ignoring HTTP header field \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' because its value is null"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 168
    :goto_2a
    return-void

    .line 166
    :cond_2b
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 167
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2a
.end method

.method public addAll(Ljava/lang/String;Ljava/util/List;)V
    .registers 6
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 180
    .local p2, "headerFields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 181
    .local v1, "value":Ljava/lang/String;
    invoke-virtual {p0, p1, v1}, Lcom/koushikdutta/async/http/cache/RawHeaders;->add(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 183
    .end local v1    # "value":Ljava/lang/String;
    :cond_14
    return-void
.end method

.method public addLine(Ljava/lang/String;)V
    .registers 5
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 142
    const-string v1, ":"

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 143
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_f

    .line 144
    const-string v1, ""

    invoke-virtual {p0, v1, p1}, Lcom/koushikdutta/async/http/cache/RawHeaders;->add(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    :goto_e
    return-void

    .line 146
    :cond_f
    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/koushikdutta/async/http/cache/RawHeaders;->add(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_e
.end method

.method public copy(Lcom/koushikdutta/async/http/cache/RawHeaders;)V
    .registers 4
    .param p1, "copyFrom"    # Lcom/koushikdutta/async/http/cache/RawHeaders;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    iget-object v1, p1, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 76
    iget-object v0, p1, Lcom/koushikdutta/async/http/cache/RawHeaders;->statusLine:Ljava/lang/String;

    iput-object v0, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->statusLine:Ljava/lang/String;

    .line 77
    iget v0, p1, Lcom/koushikdutta/async/http/cache/RawHeaders;->httpMinorVersion:I

    iput v0, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->httpMinorVersion:I

    .line 78
    iget v0, p1, Lcom/koushikdutta/async/http/cache/RawHeaders;->responseCode:I

    iput v0, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->responseCode:I

    .line 79
    iget-object v0, p1, Lcom/koushikdutta/async/http/cache/RawHeaders;->responseMessage:Ljava/lang/String;

    iput-object v0, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->responseMessage:Ljava/lang/String;

    .line 80
    return-void
.end method

.method public get(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 227
    iget-object v1, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v0, v1, -0x2

    .local v0, "i":I
    :goto_8
    if-ltz v0, :cond_26

    .line 228
    iget-object v1, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_23

    .line 229
    iget-object v1, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    add-int/lit8 v2, v0, 0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 232
    :goto_22
    return-object v1

    .line 227
    :cond_23
    add-int/lit8 v0, v0, -0x2

    goto :goto_8

    .line 232
    :cond_26
    const/4 v1, 0x0

    goto :goto_22
.end method

.method public getAll(Ljava/util/Set;)Lcom/koushikdutta/async/http/cache/RawHeaders;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/koushikdutta/async/http/cache/RawHeaders;"
        }
    .end annotation

    .prologue
    .line 239
    .local p1, "fieldNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v2, Lcom/koushikdutta/async/http/cache/RawHeaders;

    invoke-direct {v2}, Lcom/koushikdutta/async/http/cache/RawHeaders;-><init>()V

    .line 240
    .local v2, "result":Lcom/koushikdutta/async/http/cache/RawHeaders;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    iget-object v3, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_2c

    .line 241
    iget-object v3, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 242
    .local v0, "fieldName":Ljava/lang/String;
    invoke-interface {p1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_29

    .line 243
    iget-object v3, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    add-int/lit8 v4, v1, 0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v0, v3}, Lcom/koushikdutta/async/http/cache/RawHeaders;->add(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    :cond_29
    add-int/lit8 v1, v1, 0x2

    goto :goto_6

    .line 246
    .end local v0    # "fieldName":Ljava/lang/String;
    :cond_2c
    return-object v2
.end method

.method public getFieldName(I)Ljava/lang/String;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 205
    mul-int/lit8 v0, p1, 0x2

    .line 206
    .local v0, "fieldNameIndex":I
    if-ltz v0, :cond_c

    iget-object v1, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_e

    .line 207
    :cond_c
    const/4 v1, 0x0

    .line 209
    :goto_d
    return-object v1

    :cond_e
    iget-object v1, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_d
.end method

.method public getHttpMinorVersion()I
    .registers 3

    .prologue
    .line 120
    iget v0, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->httpMinorVersion:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_8

    iget v0, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->httpMinorVersion:I

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x1

    goto :goto_7
.end method

.method public getResponseCode()I
    .registers 2

    .prologue
    .line 127
    iget v0, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->responseCode:I

    return v0
.end method

.method public getResponseMessage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->responseMessage:Ljava/lang/String;

    return-object v0
.end method

.method public getStatusLine()Ljava/lang/String;
    .registers 2

    .prologue
    .line 112
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->statusLine:Ljava/lang/String;

    return-object v0
.end method

.method public getValue(I)Ljava/lang/String;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 216
    mul-int/lit8 v1, p1, 0x2

    add-int/lit8 v0, v1, 0x1

    .line 217
    .local v0, "valueIndex":I
    if-ltz v0, :cond_e

    iget-object v1, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_10

    .line 218
    :cond_e
    const/4 v1, 0x0

    .line 220
    :goto_f
    return-object v1

    :cond_10
    iget-object v1, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_f
.end method

.method public length()I
    .registers 2

    .prologue
    .line 198
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public removeAll(Ljava/lang/String;)V
    .registers 4
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 171
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_24

    .line 172
    iget-object v1, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_21

    .line 173
    iget-object v1, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 174
    iget-object v1, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 171
    :cond_21
    add-int/lit8 v0, v0, 0x2

    goto :goto_1

    .line 177
    :cond_24
    return-void
.end method

.method public set(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 190
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/http/cache/RawHeaders;->removeAll(Ljava/lang/String;)V

    .line 191
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/async/http/cache/RawHeaders;->add(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    return-void
.end method

.method public setStatusLine(Ljava/lang/String;)V
    .registers 6
    .param p1, "statusLine"    # Ljava/lang/String;

    .prologue
    .line 87
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 88
    iput-object p1, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->statusLine:Ljava/lang/String;

    .line 90
    if-eqz p1, :cond_10

    const-string v2, "HTTP/"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_11

    .line 109
    :cond_10
    :goto_10
    return-void

    .line 93
    :cond_11
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 94
    const-string v2, " "

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v1, v2, 0x1

    .line 95
    .local v1, "mark":I
    if-eqz v1, :cond_10

    .line 98
    add-int/lit8 v2, v1, -0x2

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x31

    if-eq v2, v3, :cond_2c

    .line 99
    const/4 v2, 0x0

    iput v2, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->httpMinorVersion:I

    .line 101
    :cond_2c
    add-int/lit8 v0, v1, 0x3

    .line 102
    .local v0, "last":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-le v0, v2, :cond_38

    .line 103
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 105
    :cond_38
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->responseCode:I

    .line 106
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-gt v2, v3, :cond_10

    .line 107
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->responseMessage:Ljava/lang/String;

    goto :goto_10
.end method

.method public toHeaderString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 250
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x100

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 251
    .local v1, "result":Ljava/lang/StringBuilder;
    iget-object v2, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->statusLine:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\r\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_13
    iget-object v2, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_43

    .line 253
    iget-object v2, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v2, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    add-int/lit8 v4, v0, 0x1

    .line 254
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\r\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    add-int/lit8 v0, v0, 0x2

    goto :goto_13

    .line 256
    :cond_43
    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 257
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public toMultimap()Ljava/util/Map;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 265
    new-instance v4, Ljava/util/TreeMap;

    sget-object v6, Lcom/koushikdutta/async/http/cache/RawHeaders;->FIELD_NAME_COMPARATOR:Ljava/util/Comparator;

    invoke-direct {v4, v6}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    .line 266
    .local v4, "result":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_8
    iget-object v6, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v2, v6, :cond_3f

    .line 267
    iget-object v6, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 268
    .local v1, "fieldName":Ljava/lang/String;
    iget-object v6, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->namesAndValues:Ljava/util/List;

    add-int/lit8 v7, v2, 0x1

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 270
    .local v5, "value":Ljava/lang/String;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 271
    .local v0, "allValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 272
    .local v3, "otherValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v3, :cond_32

    .line 273
    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 275
    :cond_32
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 276
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v4, v1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    add-int/lit8 v2, v2, 0x2

    goto :goto_8

    .line 278
    .end local v0    # "allValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v1    # "fieldName":Ljava/lang/String;
    .end local v3    # "otherValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v5    # "value":Ljava/lang/String;
    :cond_3f
    iget-object v6, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->statusLine:Ljava/lang/String;

    if-eqz v6, :cond_51

    .line 279
    const/4 v6, 0x0

    iget-object v7, p0, Lcom/koushikdutta/async/http/cache/RawHeaders;->statusLine:Ljava/lang/String;

    invoke-static {v7}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v4, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 281
    :cond_51
    invoke-static {v4}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v6

    return-object v6
.end method
