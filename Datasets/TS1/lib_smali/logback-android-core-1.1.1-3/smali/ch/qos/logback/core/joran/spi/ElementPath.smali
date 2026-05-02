.class public Lch/qos/logback/core/joran/spi/ElementPath;
.super Ljava/lang/Object;


# instance fields
.field partList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/joran/spi/ElementPath;->partList:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/joran/spi/ElementPath;->partList:Ljava/util/ArrayList;

    if-nez p1, :cond_d

    :cond_c
    return-void

    :cond_d
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_c

    array-length v2, v1

    const/4 v0, 0x0

    :goto_17
    if-ge v0, v2, :cond_c

    aget-object v3, v1, v0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_26

    iget-object v4, p0, Lch/qos/logback/core/joran/spi/ElementPath;->partList:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_26
    add-int/lit8 v0, v0, 0x1

    goto :goto_17
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/joran/spi/ElementPath;->partList:Ljava/util/ArrayList;

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/ElementPath;->partList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method private equalityCheck(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4

    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public duplicate()Lch/qos/logback/core/joran/spi/ElementPath;
    .registers 4

    new-instance v0, Lch/qos/logback/core/joran/spi/ElementPath;

    invoke-direct {v0}, Lch/qos/logback/core/joran/spi/ElementPath;-><init>()V

    iget-object v1, v0, Lch/qos/logback/core/joran/spi/ElementPath;->partList:Ljava/util/ArrayList;

    iget-object v2, p0, Lch/qos/logback/core/joran/spi/ElementPath;->partList:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7

    const/4 v0, 0x0

    if-eqz p1, :cond_7

    instance-of v1, p1, Lch/qos/logback/core/joran/spi/ElementPath;

    if-nez v1, :cond_8

    :cond_7
    :goto_7
    return v0

    :cond_8
    check-cast p1, Lch/qos/logback/core/joran/spi/ElementPath;

    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/ElementPath;->size()I

    move-result v1

    invoke-virtual {p0}, Lch/qos/logback/core/joran/spi/ElementPath;->size()I

    move-result v2

    if-ne v1, v2, :cond_7

    invoke-virtual {p0}, Lch/qos/logback/core/joran/spi/ElementPath;->size()I

    move-result v2

    move v1, v0

    :goto_19
    if-ge v1, v2, :cond_2c

    invoke-virtual {p0, v1}, Lch/qos/logback/core/joran/spi/ElementPath;->get(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v1}, Lch/qos/logback/core/joran/spi/ElementPath;->get(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v3, v4}, Lch/qos/logback/core/joran/spi/ElementPath;->equalityCheck(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    :cond_2c
    const/4 v0, 0x1

    goto :goto_7
.end method

.method public get(I)Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/ElementPath;->partList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getCopyOfPartList()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lch/qos/logback/core/joran/spi/ElementPath;->partList:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public peekLast()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/ElementPath;->partList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_19

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/ElementPath;->partList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v1, p0, Lch/qos/logback/core/joran/spi/ElementPath;->partList:Ljava/util/ArrayList;

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :goto_18
    return-object v0

    :cond_19
    const/4 v0, 0x0

    goto :goto_18
.end method

.method public pop()V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/ElementPath;->partList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_15

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/ElementPath;->partList:Ljava/util/ArrayList;

    iget-object v1, p0, Lch/qos/logback/core/joran/spi/ElementPath;->partList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_15
    return-void
.end method

.method public push(Ljava/lang/String;)V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/ElementPath;->partList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public size()I
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/ElementPath;->partList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method protected toStableString()Ljava/lang/String;
    .registers 5

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/ElementPath;->partList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_27

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v3, "["

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "]"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_b

    :cond_27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Lch/qos/logback/core/joran/spi/ElementPath;->toStableString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
