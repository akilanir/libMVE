.class public final Lorg/dmfs/xmlobjects/ElementDescriptor;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final DEFAULT_CONTEXT:Lorg/dmfs/xmlobjects/XmlContext;


# instance fields
.field public final builder:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/builder/IObjectBuilder",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final mContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lorg/dmfs/xmlobjects/XmlContext;",
            ">;"
        }
    .end annotation
.end field

.field private mElementContext:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;>;"
        }
    .end annotation
.end field

.field public final qualifiedName:Lorg/dmfs/xmlobjects/QualifiedName;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lorg/dmfs/xmlobjects/ElementDescriptor$1;

    invoke-direct {v0}, Lorg/dmfs/xmlobjects/ElementDescriptor$1;-><init>()V

    sput-object v0, Lorg/dmfs/xmlobjects/ElementDescriptor;->DEFAULT_CONTEXT:Lorg/dmfs/xmlobjects/XmlContext;

    return-void
.end method

.method private constructor <init>(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;Lorg/dmfs/xmlobjects/XmlContext;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Lorg/dmfs/xmlobjects/builder/IObjectBuilder",
            "<TT;>;",
            "Lorg/dmfs/xmlobjects/XmlContext;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p1, :cond_d

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "qname must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d
    iput-object p1, p0, Lorg/dmfs/xmlobjects/ElementDescriptor;->qualifiedName:Lorg/dmfs/xmlobjects/QualifiedName;

    iput-object p2, p0, Lorg/dmfs/xmlobjects/ElementDescriptor;->builder:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/dmfs/xmlobjects/ElementDescriptor;->mContext:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public static get(Lorg/dmfs/xmlobjects/QualifiedName;)Lorg/dmfs/xmlobjects/ElementDescriptor;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            ")",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;"
        }
    .end annotation

    sget-object v1, Lorg/dmfs/xmlobjects/ElementDescriptor;->DEFAULT_CONTEXT:Lorg/dmfs/xmlobjects/XmlContext;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lorg/dmfs/xmlobjects/ElementDescriptor;->DEFAULT_CONTEXT:Lorg/dmfs/xmlobjects/XmlContext;

    iget-object v0, v0, Lorg/dmfs/xmlobjects/XmlContext;->DESCRIPTOR_MAP:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/xmlobjects/ElementDescriptor;

    monitor-exit v1

    return-object v0

    :catchall_f
    move-exception v0

    monitor-exit v1
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_f

    throw v0
.end method

.method public static get(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/ElementDescriptor;)Lorg/dmfs/xmlobjects/ElementDescriptor;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;)",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;"
        }
    .end annotation

    if-eqz p1, :cond_6

    iget-object v0, p1, Lorg/dmfs/xmlobjects/ElementDescriptor;->mElementContext:Ljava/util/Map;

    if-nez v0, :cond_b

    :cond_6
    invoke-static {p0}, Lorg/dmfs/xmlobjects/ElementDescriptor;->get(Lorg/dmfs/xmlobjects/QualifiedName;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    :cond_a
    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p1, Lorg/dmfs/xmlobjects/ElementDescriptor;->mElementContext:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-nez v0, :cond_a

    invoke-static {p0}, Lorg/dmfs/xmlobjects/ElementDescriptor;->get(Lorg/dmfs/xmlobjects/QualifiedName;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    goto :goto_a
.end method

.method public static get(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/xmlobjects/XmlContext;)Lorg/dmfs/xmlobjects/ElementDescriptor;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;",
            "Lorg/dmfs/xmlobjects/XmlContext;",
            ")",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;"
        }
    .end annotation

    if-eqz p1, :cond_6

    iget-object v0, p1, Lorg/dmfs/xmlobjects/ElementDescriptor;->mElementContext:Ljava/util/Map;

    if-nez v0, :cond_b

    :cond_6
    invoke-static {p0, p2}, Lorg/dmfs/xmlobjects/ElementDescriptor;->get(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/XmlContext;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    :cond_a
    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p1, Lorg/dmfs/xmlobjects/ElementDescriptor;->mElementContext:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-nez v0, :cond_a

    invoke-static {p0, p2}, Lorg/dmfs/xmlobjects/ElementDescriptor;->get(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/XmlContext;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    goto :goto_a
.end method

.method public static get(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/XmlContext;)Lorg/dmfs/xmlobjects/ElementDescriptor;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Lorg/dmfs/xmlobjects/XmlContext;",
            ")",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;"
        }
    .end annotation

    if-nez p1, :cond_4

    sget-object p1, Lorg/dmfs/xmlobjects/ElementDescriptor;->DEFAULT_CONTEXT:Lorg/dmfs/xmlobjects/XmlContext;

    :cond_4
    monitor-enter p1

    :try_start_5
    iget-object v0, p1, Lorg/dmfs/xmlobjects/XmlContext;->DESCRIPTOR_MAP:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-eqz v0, :cond_11

    monitor-exit p1

    :goto_10
    return-object v0

    :cond_11
    monitor-exit p1
    :try_end_12
    .catchall {:try_start_5 .. :try_end_12} :catchall_24

    sget-object v1, Lorg/dmfs/xmlobjects/ElementDescriptor;->DEFAULT_CONTEXT:Lorg/dmfs/xmlobjects/XmlContext;

    monitor-enter v1

    :try_start_15
    sget-object v0, Lorg/dmfs/xmlobjects/ElementDescriptor;->DEFAULT_CONTEXT:Lorg/dmfs/xmlobjects/XmlContext;

    iget-object v0, v0, Lorg/dmfs/xmlobjects/XmlContext;->DESCRIPTOR_MAP:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/xmlobjects/ElementDescriptor;

    monitor-exit v1

    goto :goto_10

    :catchall_21
    move-exception v0

    monitor-exit v1
    :try_end_23
    .catchall {:try_start_15 .. :try_end_23} :catchall_21

    throw v0

    :catchall_24
    move-exception v0

    :try_start_25
    monitor-exit p1
    :try_end_26
    .catchall {:try_start_25 .. :try_end_26} :catchall_24

    throw v0
.end method

.method public static overload(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<-TT;>;",
            "Lorg/dmfs/xmlobjects/builder/IObjectBuilder",
            "<TT;>;)",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;"
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/xmlobjects/ElementDescriptor;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/xmlobjects/XmlContext;

    if-nez v0, :cond_12

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "can not overload element in gc\'ed context"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_12
    monitor-enter v0

    :try_start_13
    iget-object v1, v0, Lorg/dmfs/xmlobjects/XmlContext;->DESCRIPTOR_MAP:Ljava/util/Map;

    iget-object v2, p0, Lorg/dmfs/xmlobjects/ElementDescriptor;->qualifiedName:Lorg/dmfs/xmlobjects/QualifiedName;

    new-instance v3, Lorg/dmfs/xmlobjects/ElementDescriptor;

    invoke-direct {v3, v2, p1, v0}, Lorg/dmfs/xmlobjects/ElementDescriptor;-><init>(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;Lorg/dmfs/xmlobjects/XmlContext;)V

    iget-object v4, p0, Lorg/dmfs/xmlobjects/ElementDescriptor;->mElementContext:Ljava/util/Map;

    iput-object v4, v3, Lorg/dmfs/xmlobjects/ElementDescriptor;->mElementContext:Ljava/util/Map;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0

    return-object v3

    :catchall_25
    move-exception v1

    monitor-exit v0
    :try_end_27
    .catchall {:try_start_13 .. :try_end_27} :catchall_25

    throw v1
.end method

.method public static register(Ljava/lang/String;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/builder/IObjectBuilder",
            "<TT;>;)",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;"
        }
    .end annotation

    invoke-static {p0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/xmlobjects/ElementDescriptor;->DEFAULT_CONTEXT:Lorg/dmfs/xmlobjects/XmlContext;

    invoke-static {v0, p1, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;Lorg/dmfs/xmlobjects/XmlContext;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    return-object v0
.end method

.method public static register(Ljava/lang/String;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;Lorg/dmfs/xmlobjects/XmlContext;)Lorg/dmfs/xmlobjects/ElementDescriptor;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/builder/IObjectBuilder",
            "<TT;>;",
            "Lorg/dmfs/xmlobjects/XmlContext;",
            ")",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;"
        }
    .end annotation

    invoke-static {p0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;Lorg/dmfs/xmlobjects/XmlContext;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    return-object v0
.end method

.method public static register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Lorg/dmfs/xmlobjects/builder/IObjectBuilder",
            "<TT;>;)",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;"
        }
    .end annotation

    sget-object v0, Lorg/dmfs/xmlobjects/ElementDescriptor;->DEFAULT_CONTEXT:Lorg/dmfs/xmlobjects/XmlContext;

    invoke-static {p0, p1, v0}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;Lorg/dmfs/xmlobjects/XmlContext;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    return-object v0
.end method

.method public static register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;Lorg/dmfs/xmlobjects/XmlContext;)Lorg/dmfs/xmlobjects/ElementDescriptor;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Lorg/dmfs/xmlobjects/builder/IObjectBuilder",
            "<TT;>;",
            "Lorg/dmfs/xmlobjects/XmlContext;",
            ")",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;"
        }
    .end annotation

    if-nez p2, :cond_4

    sget-object p2, Lorg/dmfs/xmlobjects/ElementDescriptor;->DEFAULT_CONTEXT:Lorg/dmfs/xmlobjects/XmlContext;

    :cond_4
    monitor-enter p2

    :try_start_5
    iget-object v0, p2, Lorg/dmfs/xmlobjects/XmlContext;->DESCRIPTOR_MAP:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2f

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "descriptor for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " already exists, use \'overload\' to override the definition"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_2c
    move-exception v0

    monitor-exit p2
    :try_end_2e
    .catchall {:try_start_5 .. :try_end_2e} :catchall_2c

    throw v0

    :cond_2f
    :try_start_2f
    new-instance v1, Lorg/dmfs/xmlobjects/ElementDescriptor;

    invoke-direct {v1, p0, p1, p2}, Lorg/dmfs/xmlobjects/ElementDescriptor;-><init>(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;Lorg/dmfs/xmlobjects/XmlContext;)V

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit p2
    :try_end_38
    .catchall {:try_start_2f .. :try_end_38} :catchall_2c

    return-object v1
.end method

.method public static varargs registerWithParents(Ljava/lang/String;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;[Lorg/dmfs/xmlobjects/ElementDescriptor;)Lorg/dmfs/xmlobjects/ElementDescriptor;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/builder/IObjectBuilder",
            "<TT;>;[",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;)",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;"
        }
    .end annotation

    invoke-static {p0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lorg/dmfs/xmlobjects/ElementDescriptor;->registerWithParents(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;[Lorg/dmfs/xmlobjects/ElementDescriptor;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    return-object v0
.end method

.method public static varargs registerWithParents(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;[Lorg/dmfs/xmlobjects/ElementDescriptor;)Lorg/dmfs/xmlobjects/ElementDescriptor;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Lorg/dmfs/xmlobjects/builder/IObjectBuilder",
            "<TT;>;[",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;)",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p2, :cond_6

    array-length v1, p2

    if-nez v1, :cond_e

    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "no parent elements provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    new-instance v2, Lorg/dmfs/xmlobjects/ElementDescriptor;

    aget-object v1, p2, v0

    invoke-virtual {v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->getContext()Lorg/dmfs/xmlobjects/XmlContext;

    move-result-object v1

    invoke-direct {v2, p0, p1, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;-><init>(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;Lorg/dmfs/xmlobjects/XmlContext;)V

    array-length v3, p2

    move v1, v0

    :goto_1b
    if-ge v1, v3, :cond_74

    aget-object v4, p2, v1

    invoke-virtual {v2}, Lorg/dmfs/xmlobjects/ElementDescriptor;->getContext()Lorg/dmfs/xmlobjects/XmlContext;

    move-result-object v0

    invoke-virtual {v4}, Lorg/dmfs/xmlobjects/ElementDescriptor;->getContext()Lorg/dmfs/xmlobjects/XmlContext;

    move-result-object v5

    if-eq v0, v5, :cond_31

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Parent descriptors don\'t belong to the same XmlContext"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_31
    iget-object v0, v4, Lorg/dmfs/xmlobjects/ElementDescriptor;->mElementContext:Ljava/util/Map;

    if-nez v0, :cond_49

    new-instance v0, Ljava/util/HashMap;

    const/16 v5, 0x8

    invoke-direct {v0, v5}, Ljava/util/HashMap;-><init>(I)V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, v4, Lorg/dmfs/xmlobjects/ElementDescriptor;->mElementContext:Ljava/util/Map;

    :cond_42
    invoke-interface {v0, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1b

    :cond_49
    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_42

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "descriptor for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " already exists in parent "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v4, Lorg/dmfs/xmlobjects/ElementDescriptor;->qualifiedName:Lorg/dmfs/xmlobjects/QualifiedName;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_74
    return-object v2
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 3

    if-ne p1, p0, :cond_4

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public getContext()Lorg/dmfs/xmlobjects/XmlContext;
    .registers 2

    iget-object v0, p0, Lorg/dmfs/xmlobjects/ElementDescriptor;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/xmlobjects/XmlContext;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    iget-object v0, p0, Lorg/dmfs/xmlobjects/ElementDescriptor;->qualifiedName:Lorg/dmfs/xmlobjects/QualifiedName;

    invoke-virtual {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->hashCode()I

    move-result v0

    return v0
.end method
