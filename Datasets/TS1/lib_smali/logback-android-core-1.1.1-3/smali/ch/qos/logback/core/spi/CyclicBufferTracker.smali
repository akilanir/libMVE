.class public Lch/qos/logback/core/spi/CyclicBufferTracker;
.super Lch/qos/logback/core/spi/AbstractComponentTracker;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/spi/AbstractComponentTracker",
        "<",
        "Lch/qos/logback/core/helpers/CyclicBuffer",
        "<TE;>;>;"
    }
.end annotation


# static fields
.field static final DEFAULT_BUFFER_SIZE:I = 0x100

.field static final DEFAULT_NUMBER_OF_BUFFERS:I = 0x40


# instance fields
.field bufferSize:I


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/spi/AbstractComponentTracker;-><init>()V

    const/16 v0, 0x100

    iput v0, p0, Lch/qos/logback/core/spi/CyclicBufferTracker;->bufferSize:I

    const/16 v0, 0x40

    invoke-virtual {p0, v0}, Lch/qos/logback/core/spi/CyclicBufferTracker;->setMaxComponents(I)V

    return-void
.end method


# virtual methods
.method protected buildComponent(Ljava/lang/String;)Lch/qos/logback/core/helpers/CyclicBuffer;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lch/qos/logback/core/helpers/CyclicBuffer",
            "<TE;>;"
        }
    .end annotation

    new-instance v0, Lch/qos/logback/core/helpers/CyclicBuffer;

    iget v1, p0, Lch/qos/logback/core/spi/CyclicBufferTracker;->bufferSize:I

    invoke-direct {v0, v1}, Lch/qos/logback/core/helpers/CyclicBuffer;-><init>(I)V

    return-object v0
.end method

.method protected bridge synthetic buildComponent(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    invoke-virtual {p0, p1}, Lch/qos/logback/core/spi/CyclicBufferTracker;->buildComponent(Ljava/lang/String;)Lch/qos/logback/core/helpers/CyclicBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getBufferSize()I
    .registers 2

    iget v0, p0, Lch/qos/logback/core/spi/CyclicBufferTracker;->bufferSize:I

    return v0
.end method

.method protected isComponentStale(Lch/qos/logback/core/helpers/CyclicBuffer;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/helpers/CyclicBuffer",
            "<TE;>;)Z"
        }
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method protected bridge synthetic isComponentStale(Ljava/lang/Object;)Z
    .registers 3

    check-cast p1, Lch/qos/logback/core/helpers/CyclicBuffer;

    invoke-virtual {p0, p1}, Lch/qos/logback/core/spi/CyclicBufferTracker;->isComponentStale(Lch/qos/logback/core/helpers/CyclicBuffer;)Z

    move-result v0

    return v0
.end method

.method lingererKeysAsOrderedList()Ljava/util/List;
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

    iget-object v1, p0, Lch/qos/logback/core/spi/CyclicBufferTracker;->lingerersMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method liveKeysAsOrderedList()Ljava/util/List;
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

    iget-object v1, p0, Lch/qos/logback/core/spi/CyclicBufferTracker;->liveMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method protected processPriorToRemoval(Lch/qos/logback/core/helpers/CyclicBuffer;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/helpers/CyclicBuffer",
            "<TE;>;)V"
        }
    .end annotation

    invoke-virtual {p1}, Lch/qos/logback/core/helpers/CyclicBuffer;->clear()V

    return-void
.end method

.method protected bridge synthetic processPriorToRemoval(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lch/qos/logback/core/helpers/CyclicBuffer;

    invoke-virtual {p0, p1}, Lch/qos/logback/core/spi/CyclicBufferTracker;->processPriorToRemoval(Lch/qos/logback/core/helpers/CyclicBuffer;)V

    return-void
.end method

.method public setBufferSize(I)V
    .registers 2

    iput p1, p0, Lch/qos/logback/core/spi/CyclicBufferTracker;->bufferSize:I

    return-void
.end method
