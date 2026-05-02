.class public final Lorg/dmfs/xmlobjects/QualifiedName;
.super Ljava/lang/Object;


# static fields
.field private static final QUALIFIED_NAME_CACHE:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private final mHashCode:I

.field public final name:Ljava/lang/String;

.field public final namespace:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lorg/dmfs/xmlobjects/QualifiedName;->QUALIFIED_NAME_CACHE:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p2, :cond_d

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "name part of a qualified name must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d
    iput-object p1, p0, Lorg/dmfs/xmlobjects/QualifiedName;->namespace:Ljava/lang/String;

    iput-object p2, p0, Lorg/dmfs/xmlobjects/QualifiedName;->name:Ljava/lang/String;

    if-nez p1, :cond_1a

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_17
    iput v0, p0, Lorg/dmfs/xmlobjects/QualifiedName;->mHashCode:I

    return-void

    :cond_1a
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    goto :goto_17
.end method

.method public static get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;
    .registers 2

    const/4 v0, 0x0

    invoke-static {v0, p0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    return-object v0
.end method

.method public static get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;
    .registers 6

    if-eqz p0, :cond_9

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_9

    const/4 p0, 0x0

    :cond_9
    sget-object v2, Lorg/dmfs/xmlobjects/QualifiedName;->QUALIFIED_NAME_CACHE:Ljava/util/Map;

    monitor-enter v2

    :try_start_c
    sget-object v0, Lorg/dmfs/xmlobjects/QualifiedName;->QUALIFIED_NAME_CACHE:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_2a

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    new-instance v1, Lorg/dmfs/xmlobjects/QualifiedName;

    invoke-direct {v1, p0, p1}, Lorg/dmfs/xmlobjects/QualifiedName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v3, Lorg/dmfs/xmlobjects/QualifiedName;->QUALIFIED_NAME_CACHE:Ljava/util/Map;

    invoke-interface {v3, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_28
    :goto_28
    monitor-exit v2

    return-object v1

    :cond_2a
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/dmfs/xmlobjects/QualifiedName;

    if-nez v1, :cond_28

    new-instance v1, Lorg/dmfs/xmlobjects/QualifiedName;

    invoke-direct {v1, p0, p1}, Lorg/dmfs/xmlobjects/QualifiedName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_28

    :catchall_3b
    move-exception v0

    monitor-exit v2
    :try_end_3d
    .catchall {:try_start_c .. :try_end_3d} :catchall_3b

    throw v0
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

.method public hashCode()I
    .registers 2

    iget v0, p0, Lorg/dmfs/xmlobjects/QualifiedName;->mHashCode:I

    return v0
.end method

.method public toClarkString()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lorg/dmfs/xmlobjects/QualifiedName;->namespace:Ljava/lang/String;

    if-nez v0, :cond_7

    iget-object v0, p0, Lorg/dmfs/xmlobjects/QualifiedName;->name:Ljava/lang/String;

    :goto_6
    return-object v0

    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/dmfs/xmlobjects/QualifiedName;->namespace:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/dmfs/xmlobjects/QualifiedName;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lorg/dmfs/xmlobjects/QualifiedName;->namespace:Ljava/lang/String;

    if-nez v0, :cond_7

    iget-object v0, p0, Lorg/dmfs/xmlobjects/QualifiedName;->name:Ljava/lang/String;

    :goto_6
    return-object v0

    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/dmfs/xmlobjects/QualifiedName;->namespace:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/dmfs/xmlobjects/QualifiedName;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method
