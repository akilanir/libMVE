.class public abstract Lch/qos/logback/core/spi/AbstractComponentTracker;
.super Ljava/lang/Object;

# interfaces
.implements Lch/qos/logback/core/spi/ComponentTracker;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;,
        Lch/qos/logback/core/spi/AbstractComponentTracker$RemovalPredicator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<C:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lch/qos/logback/core/spi/ComponentTracker",
        "<TC;>;"
    }
.end annotation


# static fields
.field private static final ACCESS_ORDERED:Z = true

.field public static final LINGERING_TIMEOUT:J = 0x2710L

.field public static final WAIT_BETWEEN_SUCCESSIVE_REMOVAL_ITERATIONS:J = 0x3e8L


# instance fields
.field private byExcedent:Lch/qos/logback/core/spi/AbstractComponentTracker$RemovalPredicator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lch/qos/logback/core/spi/AbstractComponentTracker$RemovalPredicator",
            "<TC;>;"
        }
    .end annotation
.end field

.field private byLingering:Lch/qos/logback/core/spi/AbstractComponentTracker$RemovalPredicator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lch/qos/logback/core/spi/AbstractComponentTracker$RemovalPredicator",
            "<TC;>;"
        }
    .end annotation
.end field

.field private byTimeout:Lch/qos/logback/core/spi/AbstractComponentTracker$RemovalPredicator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lch/qos/logback/core/spi/AbstractComponentTracker$RemovalPredicator",
            "<TC;>;"
        }
    .end annotation
.end field

.field lastCheck:J

.field lingerersMap:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lch/qos/logback/core/spi/AbstractComponentTracker$Entry",
            "<TC;>;>;"
        }
    .end annotation
.end field

.field liveMap:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lch/qos/logback/core/spi/AbstractComponentTracker$Entry",
            "<TC;>;>;"
        }
    .end annotation
.end field

.field protected maxComponents:I

.field protected timeout:J


# direct methods
.method public constructor <init>()V
    .registers 5

    const/4 v3, 0x1

    const/high16 v2, 0x3f400000    # 0.75f

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x7fffffff

    iput v0, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->maxComponents:I

    const-wide/32 v0, 0x1b7740

    iput-wide v0, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->timeout:J

    new-instance v0, Ljava/util/LinkedHashMap;

    const/16 v1, 0x20

    invoke-direct {v0, v1, v2, v3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->liveMap:Ljava/util/LinkedHashMap;

    new-instance v0, Ljava/util/LinkedHashMap;

    const/16 v1, 0x10

    invoke-direct {v0, v1, v2, v3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->lingerersMap:Ljava/util/LinkedHashMap;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->lastCheck:J

    new-instance v0, Lch/qos/logback/core/spi/AbstractComponentTracker$1;

    invoke-direct {v0, p0}, Lch/qos/logback/core/spi/AbstractComponentTracker$1;-><init>(Lch/qos/logback/core/spi/AbstractComponentTracker;)V

    iput-object v0, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->byExcedent:Lch/qos/logback/core/spi/AbstractComponentTracker$RemovalPredicator;

    new-instance v0, Lch/qos/logback/core/spi/AbstractComponentTracker$2;

    invoke-direct {v0, p0}, Lch/qos/logback/core/spi/AbstractComponentTracker$2;-><init>(Lch/qos/logback/core/spi/AbstractComponentTracker;)V

    iput-object v0, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->byTimeout:Lch/qos/logback/core/spi/AbstractComponentTracker$RemovalPredicator;

    new-instance v0, Lch/qos/logback/core/spi/AbstractComponentTracker$3;

    invoke-direct {v0, p0}, Lch/qos/logback/core/spi/AbstractComponentTracker$3;-><init>(Lch/qos/logback/core/spi/AbstractComponentTracker;)V

    iput-object v0, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->byLingering:Lch/qos/logback/core/spi/AbstractComponentTracker$RemovalPredicator;

    return-void
.end method

.method static synthetic access$000(Lch/qos/logback/core/spi/AbstractComponentTracker;Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;J)Z
    .registers 5

    invoke-direct {p0, p1, p2, p3}, Lch/qos/logback/core/spi/AbstractComponentTracker;->isEntryStale(Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;J)Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lch/qos/logback/core/spi/AbstractComponentTracker;Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;J)Z
    .registers 5

    invoke-direct {p0, p1, p2, p3}, Lch/qos/logback/core/spi/AbstractComponentTracker;->isEntryDoneLingering(Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;J)Z

    move-result v0

    return v0
.end method

.method private genericStaleComponentRemover(Ljava/util/LinkedHashMap;JLch/qos/logback/core/spi/AbstractComponentTracker$RemovalPredicator;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lch/qos/logback/core/spi/AbstractComponentTracker$Entry",
            "<TC;>;>;J",
            "Lch/qos/logback/core/spi/AbstractComponentTracker$RemovalPredicator",
            "<TC;>;)V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_29

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;

    invoke-interface {p4, v0, p2, p3}, Lch/qos/logback/core/spi/AbstractComponentTracker$RemovalPredicator;->isSlatedForRemoval(Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;J)Z

    move-result v2

    if-eqz v2, :cond_29

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    iget-object v0, v0, Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;->component:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lch/qos/logback/core/spi/AbstractComponentTracker;->processPriorToRemoval(Ljava/lang/Object;)V

    goto :goto_8

    :cond_29
    return-void
.end method

.method private getFromEitherMap(Ljava/lang/String;)Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lch/qos/logback/core/spi/AbstractComponentTracker$Entry",
            "<TC;>;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->liveMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;

    if-eqz v0, :cond_b

    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->lingerersMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;

    goto :goto_a
.end method

.method private isEntryDoneLingering(Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;J)Z
    .registers 8

    iget-wide v0, p1, Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;->timestamp:J

    const-wide/16 v2, 0x2710

    add-long/2addr v0, v2

    cmp-long v0, v0, p2

    if-gez v0, :cond_b

    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method private isEntryStale(Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;J)Z
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/spi/AbstractComponentTracker$Entry",
            "<TC;>;J)Z"
        }
    .end annotation

    const/4 v0, 0x1

    iget-object v1, p1, Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;->component:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lch/qos/logback/core/spi/AbstractComponentTracker;->isComponentStale(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    :cond_9
    :goto_9
    return v0

    :cond_a
    iget-wide v1, p1, Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;->timestamp:J

    iget-wide v3, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->timeout:J

    add-long/2addr v1, v3

    cmp-long v1, v1, p2

    if-ltz v1, :cond_9

    const/4 v0, 0x0

    goto :goto_9
.end method

.method private isTooSoonForRemovalIteration(J)Z
    .registers 7

    iget-wide v0, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->lastCheck:J

    const-wide/16 v2, 0x3e8

    add-long/2addr v0, v2

    cmp-long v0, v0, p1

    if-lez v0, :cond_b

    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    iput-wide p1, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->lastCheck:J

    const/4 v0, 0x0

    goto :goto_a
.end method

.method private removeExcedentComponents()V
    .registers 5

    iget-object v0, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->liveMap:Ljava/util/LinkedHashMap;

    const-wide/16 v1, 0x0

    iget-object v3, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->byExcedent:Lch/qos/logback/core/spi/AbstractComponentTracker$RemovalPredicator;

    invoke-direct {p0, v0, v1, v2, v3}, Lch/qos/logback/core/spi/AbstractComponentTracker;->genericStaleComponentRemover(Ljava/util/LinkedHashMap;JLch/qos/logback/core/spi/AbstractComponentTracker$RemovalPredicator;)V

    return-void
.end method

.method private removeStaleComponentsFromLingerersMap(J)V
    .registers 5

    iget-object v0, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->lingerersMap:Ljava/util/LinkedHashMap;

    iget-object v1, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->byLingering:Lch/qos/logback/core/spi/AbstractComponentTracker$RemovalPredicator;

    invoke-direct {p0, v0, p1, p2, v1}, Lch/qos/logback/core/spi/AbstractComponentTracker;->genericStaleComponentRemover(Ljava/util/LinkedHashMap;JLch/qos/logback/core/spi/AbstractComponentTracker$RemovalPredicator;)V

    return-void
.end method

.method private removeStaleComponentsFromMainMap(J)V
    .registers 5

    iget-object v0, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->liveMap:Ljava/util/LinkedHashMap;

    iget-object v1, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->byTimeout:Lch/qos/logback/core/spi/AbstractComponentTracker$RemovalPredicator;

    invoke-direct {p0, v0, p1, p2, v1}, Lch/qos/logback/core/spi/AbstractComponentTracker;->genericStaleComponentRemover(Ljava/util/LinkedHashMap;JLch/qos/logback/core/spi/AbstractComponentTracker$RemovalPredicator;)V

    return-void
.end method


# virtual methods
.method public allComponents()Ljava/util/Collection;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TC;>;"
        }
    .end annotation

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->liveMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_21

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;

    iget-object v0, v0, Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;->component:Ljava/lang/Object;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_f

    :cond_21
    iget-object v0, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->lingerersMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;

    iget-object v0, v0, Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;->component:Ljava/lang/Object;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2b

    :cond_3d
    return-object v1
.end method

.method public allKeys()Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->liveMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iget-object v1, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->lingerersMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    return-object v0
.end method

.method protected abstract buildComponent(Ljava/lang/String;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TC;"
        }
    .end annotation
.end method

.method public endOfLife(Ljava/lang/String;)V
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->liveMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;

    if-nez v0, :cond_b

    :goto_a
    return-void

    :cond_b
    iget-object v1, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->lingerersMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_a
.end method

.method public declared-synchronized find(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TC;"
        }
    .end annotation

    monitor-enter p0

    :try_start_1
    invoke-direct {p0, p1}, Lch/qos/logback/core/spi/AbstractComponentTracker;->getFromEitherMap(Ljava/lang/String;)Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_d

    move-result-object v0

    if-nez v0, :cond_a

    const/4 v0, 0x0

    :goto_8
    monitor-exit p0

    return-object v0

    :cond_a
    :try_start_a
    iget-object v0, v0, Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;->component:Ljava/lang/Object;
    :try_end_c
    .catchall {:try_start_a .. :try_end_c} :catchall_d

    goto :goto_8

    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getComponentCount()I
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->liveMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->size()I

    move-result v0

    iget-object v1, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->lingerersMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->size()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getMaxComponents()I
    .registers 2

    iget v0, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->maxComponents:I

    return v0
.end method

.method public declared-synchronized getOrCreate(Ljava/lang/String;J)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J)TC;"
        }
    .end annotation

    monitor-enter p0

    :try_start_1
    invoke-direct {p0, p1}, Lch/qos/logback/core/spi/AbstractComponentTracker;->getFromEitherMap(Ljava/lang/String;)Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;

    move-result-object v0

    if-nez v0, :cond_19

    invoke-virtual {p0, p1}, Lch/qos/logback/core/spi/AbstractComponentTracker;->buildComponent(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    new-instance v0, Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;

    invoke-direct {v0, p1, v1, p2, p3}, Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;-><init>(Ljava/lang/String;Ljava/lang/Object;J)V

    iget-object v1, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->liveMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_15
    iget-object v0, v0, Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;->component:Ljava/lang/Object;
    :try_end_17
    .catchall {:try_start_1 .. :try_end_17} :catchall_1d

    monitor-exit p0

    return-object v0

    :cond_19
    :try_start_19
    invoke-virtual {v0, p2, p3}, Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;->setTimestamp(J)V
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_1d

    goto :goto_15

    :catchall_1d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getTimeout()J
    .registers 3

    iget-wide v0, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->timeout:J

    return-wide v0
.end method

.method protected abstract isComponentStale(Ljava/lang/Object;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;)Z"
        }
    .end annotation
.end method

.method protected abstract processPriorToRemoval(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;)V"
        }
    .end annotation
.end method

.method public declared-synchronized removeStaleComponents(J)V
    .registers 4

    monitor-enter p0

    :try_start_1
    invoke-direct {p0, p1, p2}, Lch/qos/logback/core/spi/AbstractComponentTracker;->isTooSoonForRemovalIteration(J)Z
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_13

    move-result v0

    if-eqz v0, :cond_9

    :goto_7
    monitor-exit p0

    return-void

    :cond_9
    :try_start_9
    invoke-direct {p0}, Lch/qos/logback/core/spi/AbstractComponentTracker;->removeExcedentComponents()V

    invoke-direct {p0, p1, p2}, Lch/qos/logback/core/spi/AbstractComponentTracker;->removeStaleComponentsFromMainMap(J)V

    invoke-direct {p0, p1, p2}, Lch/qos/logback/core/spi/AbstractComponentTracker;->removeStaleComponentsFromLingerersMap(J)V
    :try_end_12
    .catchall {:try_start_9 .. :try_end_12} :catchall_13

    goto :goto_7

    :catchall_13
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setMaxComponents(I)V
    .registers 2

    iput p1, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->maxComponents:I

    return-void
.end method

.method public setTimeout(J)V
    .registers 3

    iput-wide p1, p0, Lch/qos/logback/core/spi/AbstractComponentTracker;->timeout:J

    return-void
.end method
