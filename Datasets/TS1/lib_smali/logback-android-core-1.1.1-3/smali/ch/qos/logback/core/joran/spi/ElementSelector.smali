.class public Lch/qos/logback/core/joran/spi/ElementSelector;
.super Lch/qos/logback/core/joran/spi/ElementPath;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/joran/spi/ElementPath;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0, p1}, Lch/qos/logback/core/joran/spi/ElementPath;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1}, Lch/qos/logback/core/joran/spi/ElementPath;-><init>(Ljava/util/List;)V

    return-void
.end method

.method private equalityCheck(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4

    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7

    const/4 v0, 0x0

    if-eqz p1, :cond_7

    instance-of v1, p1, Lch/qos/logback/core/joran/spi/ElementSelector;

    if-nez v1, :cond_8

    :cond_7
    :goto_7
    return v0

    :cond_8
    check-cast p1, Lch/qos/logback/core/joran/spi/ElementSelector;

    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/ElementSelector;->size()I

    move-result v1

    invoke-virtual {p0}, Lch/qos/logback/core/joran/spi/ElementSelector;->size()I

    move-result v2

    if-ne v1, v2, :cond_7

    invoke-virtual {p0}, Lch/qos/logback/core/joran/spi/ElementSelector;->size()I

    move-result v2

    move v1, v0

    :goto_19
    if-ge v1, v2, :cond_2c

    invoke-virtual {p0, v1}, Lch/qos/logback/core/joran/spi/ElementSelector;->get(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v1}, Lch/qos/logback/core/joran/spi/ElementSelector;->get(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v3, v4}, Lch/qos/logback/core/joran/spi/ElementSelector;->equalityCheck(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    :cond_2c
    const/4 v0, 0x1

    goto :goto_7
.end method

.method public fullPathMatch(Lch/qos/logback/core/joran/spi/ElementPath;)Z
    .registers 7

    const/4 v0, 0x0

    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/ElementPath;->size()I

    move-result v1

    invoke-virtual {p0}, Lch/qos/logback/core/joran/spi/ElementSelector;->size()I

    move-result v2

    if-eq v1, v2, :cond_c

    :cond_b
    :goto_b
    return v0

    :cond_c
    invoke-virtual {p0}, Lch/qos/logback/core/joran/spi/ElementSelector;->size()I

    move-result v2

    move v1, v0

    :goto_11
    if-ge v1, v2, :cond_24

    invoke-virtual {p0, v1}, Lch/qos/logback/core/joran/spi/ElementSelector;->get(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v1}, Lch/qos/logback/core/joran/spi/ElementPath;->get(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v3, v4}, Lch/qos/logback/core/joran/spi/ElementSelector;->equalityCheck(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_b

    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    :cond_24
    const/4 v0, 0x1

    goto :goto_b
.end method

.method public getPrefixMatchLength(Lch/qos/logback/core/joran/spi/ElementPath;)I
    .registers 7

    const/4 v3, 0x0

    if-nez p1, :cond_5

    move v0, v3

    :goto_4
    return v0

    :cond_5
    iget-object v0, p0, Lch/qos/logback/core/joran/spi/ElementSelector;->partList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v1, p1, Lch/qos/logback/core/joran/spi/ElementPath;->partList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-eqz v0, :cond_15

    if-nez v1, :cond_17

    :cond_15
    move v0, v3

    goto :goto_4

    :cond_17
    if-gt v0, v1, :cond_3a

    move v2, v0

    :goto_1a
    move v4, v3

    :goto_1b
    if-ge v4, v2, :cond_3c

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/ElementSelector;->partList:Ljava/util/ArrayList;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p1, Lch/qos/logback/core/joran/spi/ElementPath;->partList:Ljava/util/ArrayList;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lch/qos/logback/core/joran/spi/ElementSelector;->equalityCheck(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3c

    add-int/lit8 v0, v3, 0x1

    add-int/lit8 v3, v4, 0x1

    move v4, v3

    move v3, v0

    goto :goto_1b

    :cond_3a
    move v2, v1

    goto :goto_1a

    :cond_3c
    move v0, v3

    goto :goto_4
.end method

.method public getTailMatchLength(Lch/qos/logback/core/joran/spi/ElementPath;)I
    .registers 10

    const/4 v0, 0x0

    if-nez p1, :cond_4

    :cond_3
    :goto_3
    return v0

    :cond_4
    iget-object v1, p0, Lch/qos/logback/core/joran/spi/ElementSelector;->partList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    iget-object v1, p1, Lch/qos/logback/core/joran/spi/ElementPath;->partList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-eqz v3, :cond_3

    if-eqz v4, :cond_3

    if-gt v3, v4, :cond_3c

    move v2, v3

    :goto_17
    const/4 v1, 0x1

    move v6, v1

    move v5, v0

    :goto_1a
    if-gt v6, v2, :cond_3e

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/ElementSelector;->partList:Ljava/util/ArrayList;

    sub-int v1, v3, v6

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p1, Lch/qos/logback/core/joran/spi/ElementPath;->partList:Ljava/util/ArrayList;

    sub-int v7, v4, v6

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lch/qos/logback/core/joran/spi/ElementSelector;->equalityCheck(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3e

    add-int/lit8 v5, v5, 0x1

    add-int/lit8 v0, v6, 0x1

    move v6, v0

    goto :goto_1a

    :cond_3c
    move v2, v4

    goto :goto_17

    :cond_3e
    move v0, v5

    goto :goto_3
.end method

.method public hashCode()I
    .registers 5

    const/4 v0, 0x0

    invoke-virtual {p0}, Lch/qos/logback/core/joran/spi/ElementSelector;->size()I

    move-result v2

    move v1, v0

    :goto_6
    if-ge v0, v2, :cond_18

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/spi/ElementSelector;->get(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    xor-int/2addr v1, v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_18
    return v1
.end method

.method public isContainedIn(Lch/qos/logback/core/joran/spi/ElementPath;)Z
    .registers 4

    if-nez p1, :cond_4

    const/4 v0, 0x0

    :goto_3
    return v0

    :cond_4
    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/ElementPath;->toStableString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lch/qos/logback/core/joran/spi/ElementSelector;->toStableString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    goto :goto_3
.end method
