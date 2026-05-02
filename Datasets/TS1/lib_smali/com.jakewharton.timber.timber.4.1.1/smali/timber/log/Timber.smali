.class public final Ltimber/log/Timber;
.super Ljava/lang/Object;
.source "Timber.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltimber/log/Timber$DebugTree;,
        Ltimber/log/Timber$Tree;
    }
.end annotation


# static fields
.field private static final FOREST:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ltimber/log/Timber$Tree;",
            ">;"
        }
    .end annotation
.end field

.field private static final TREE_ARRAY_EMPTY:[Ltimber/log/Timber$Tree;

.field private static final TREE_OF_SOULS:Ltimber/log/Timber$Tree;

.field static volatile forestAsArray:[Ltimber/log/Timber$Tree;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 150
    const/4 v0, 0x0

    new-array v0, v0, [Ltimber/log/Timber$Tree;

    sput-object v0, Ltimber/log/Timber;->TREE_ARRAY_EMPTY:[Ltimber/log/Timber$Tree;

    .line 152
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    .line 153
    sget-object v0, Ltimber/log/Timber;->TREE_ARRAY_EMPTY:[Ltimber/log/Timber$Tree;

    sput-object v0, Ltimber/log/Timber;->forestAsArray:[Ltimber/log/Timber$Tree;

    .line 156
    new-instance v0, Ltimber/log/Timber$1;

    invoke-direct {v0}, Ltimber/log/Timber$1;-><init>()V

    sput-object v0, Ltimber/log/Timber;->TREE_OF_SOULS:Ltimber/log/Timber$Tree;

    return-void
.end method

.method private constructor <init>()V
    .registers 3

    .prologue
    .line 274
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 275
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "No instances."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public static asTree()Ltimber/log/Timber$Tree;
    .registers 1

    .prologue
    .line 92
    sget-object v0, Ltimber/log/Timber;->TREE_OF_SOULS:Ltimber/log/Timber$Tree;

    return-object v0
.end method

.method public static varargs d(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NonNls;
        .end annotation
    .end param
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 29
    sget-object v0, Ltimber/log/Timber;->TREE_OF_SOULS:Ltimber/log/Timber$Tree;

    invoke-virtual {v0, p0, p1}, Ltimber/log/Timber$Tree;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 30
    return-void
.end method

.method public static varargs d(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p0, "t"    # Ljava/lang/Throwable;
    .param p1, "message"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NonNls;
        .end annotation
    .end param
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 34
    sget-object v0, Ltimber/log/Timber;->TREE_OF_SOULS:Ltimber/log/Timber$Tree;

    invoke-virtual {v0, p0, p1, p2}, Ltimber/log/Timber$Tree;->d(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 35
    return-void
.end method

.method public static varargs e(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NonNls;
        .end annotation
    .end param
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 59
    sget-object v0, Ltimber/log/Timber;->TREE_OF_SOULS:Ltimber/log/Timber$Tree;

    invoke-virtual {v0, p0, p1}, Ltimber/log/Timber$Tree;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 60
    return-void
.end method

.method public static varargs e(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p0, "t"    # Ljava/lang/Throwable;
    .param p1, "message"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NonNls;
        .end annotation
    .end param
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 64
    sget-object v0, Ltimber/log/Timber;->TREE_OF_SOULS:Ltimber/log/Timber$Tree;

    invoke-virtual {v0, p0, p1, p2}, Ltimber/log/Timber$Tree;->e(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 65
    return-void
.end method

.method public static forest()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ltimber/log/Timber$Tree;",
            ">;"
        }
    .end annotation

    .prologue
    .line 139
    sget-object v1, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    monitor-enter v1

    .line 140
    :try_start_3
    new-instance v0, Ljava/util/ArrayList;

    sget-object v2, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 141
    :catchall_10
    move-exception v0

    monitor-exit v1
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_10

    throw v0
.end method

.method public static varargs i(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NonNls;
        .end annotation
    .end param
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 39
    sget-object v0, Ltimber/log/Timber;->TREE_OF_SOULS:Ltimber/log/Timber$Tree;

    invoke-virtual {v0, p0, p1}, Ltimber/log/Timber$Tree;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 40
    return-void
.end method

.method public static varargs i(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p0, "t"    # Ljava/lang/Throwable;
    .param p1, "message"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NonNls;
        .end annotation
    .end param
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 44
    sget-object v0, Ltimber/log/Timber;->TREE_OF_SOULS:Ltimber/log/Timber$Tree;

    invoke-virtual {v0, p0, p1, p2}, Ltimber/log/Timber$Tree;->i(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 45
    return-void
.end method

.method public static varargs log(ILjava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p0, "priority"    # I
    .param p1, "message"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NonNls;
        .end annotation
    .end param
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 79
    sget-object v0, Ltimber/log/Timber;->TREE_OF_SOULS:Ltimber/log/Timber$Tree;

    invoke-virtual {v0, p0, p1, p2}, Ltimber/log/Timber$Tree;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 80
    return-void
.end method

.method public static varargs log(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p0, "priority"    # I
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NonNls;
        .end annotation
    .end param
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 84
    sget-object v0, Ltimber/log/Timber;->TREE_OF_SOULS:Ltimber/log/Timber$Tree;

    invoke-virtual {v0, p0, p1, p2, p3}, Ltimber/log/Timber$Tree;->log(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 85
    return-void
.end method

.method public static plant(Ltimber/log/Timber$Tree;)V
    .registers 4
    .param p0, "tree"    # Ltimber/log/Timber$Tree;

    .prologue
    .line 107
    if-nez p0, :cond_a

    .line 108
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "tree == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 110
    :cond_a
    sget-object v0, Ltimber/log/Timber;->TREE_OF_SOULS:Ltimber/log/Timber$Tree;

    if-ne p0, v0, :cond_16

    .line 111
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot plant Timber into itself."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 113
    :cond_16
    sget-object v1, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    monitor-enter v1

    .line 114
    :try_start_19
    sget-object v0, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    sget-object v0, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    sget-object v2, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Ltimber/log/Timber$Tree;

    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ltimber/log/Timber$Tree;

    sput-object v0, Ltimber/log/Timber;->forestAsArray:[Ltimber/log/Timber$Tree;

    .line 116
    monitor-exit v1

    .line 117
    return-void

    .line 116
    :catchall_32
    move-exception v0

    monitor-exit v1
    :try_end_34
    .catchall {:try_start_19 .. :try_end_34} :catchall_32

    throw v0
.end method

.method public static tag(Ljava/lang/String;)Ltimber/log/Timber$Tree;
    .registers 5
    .param p0, "tag"    # Ljava/lang/String;

    .prologue
    .line 97
    sget-object v1, Ltimber/log/Timber;->forestAsArray:[Ltimber/log/Timber$Tree;

    .line 99
    .local v1, "forest":[Ltimber/log/Timber$Tree;
    const/4 v2, 0x0

    .local v2, "i":I
    array-length v0, v1

    .local v0, "count":I
    :goto_4
    if-ge v2, v0, :cond_10

    .line 100
    aget-object v3, v1, v2

    iget-object v3, v3, Ltimber/log/Timber$Tree;->explicitTag:Ljava/lang/ThreadLocal;

    invoke-virtual {v3, p0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 99
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 102
    :cond_10
    sget-object v3, Ltimber/log/Timber;->TREE_OF_SOULS:Ltimber/log/Timber$Tree;

    return-object v3
.end method

.method public static treeCount()I
    .registers 2

    .prologue
    .line 145
    sget-object v1, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    monitor-enter v1

    .line 146
    :try_start_3
    sget-object v0, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    monitor-exit v1

    return v0

    .line 147
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public static uproot(Ltimber/log/Timber$Tree;)V
    .registers 5
    .param p0, "tree"    # Ltimber/log/Timber$Tree;

    .prologue
    .line 121
    sget-object v1, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    monitor-enter v1

    .line 122
    :try_start_3
    sget-object v0, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_27

    .line 123
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot uproot tree which is not planted: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 126
    :catchall_24
    move-exception v0

    monitor-exit v1
    :try_end_26
    .catchall {:try_start_3 .. :try_end_26} :catchall_24

    throw v0

    .line 125
    :cond_27
    :try_start_27
    sget-object v0, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    sget-object v2, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Ltimber/log/Timber$Tree;

    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ltimber/log/Timber$Tree;

    sput-object v0, Ltimber/log/Timber;->forestAsArray:[Ltimber/log/Timber$Tree;

    .line 126
    monitor-exit v1
    :try_end_3a
    .catchall {:try_start_27 .. :try_end_3a} :catchall_24

    .line 127
    return-void
.end method

.method public static uprootAll()V
    .registers 2

    .prologue
    .line 131
    sget-object v1, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    monitor-enter v1

    .line 132
    :try_start_3
    sget-object v0, Ltimber/log/Timber;->FOREST:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 133
    sget-object v0, Ltimber/log/Timber;->TREE_ARRAY_EMPTY:[Ltimber/log/Timber$Tree;

    sput-object v0, Ltimber/log/Timber;->forestAsArray:[Ltimber/log/Timber$Tree;

    .line 134
    monitor-exit v1

    .line 135
    return-void

    .line 134
    :catchall_e
    move-exception v0

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_e

    throw v0
.end method

.method public static varargs v(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NonNls;
        .end annotation
    .end param
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 19
    sget-object v0, Ltimber/log/Timber;->TREE_OF_SOULS:Ltimber/log/Timber$Tree;

    invoke-virtual {v0, p0, p1}, Ltimber/log/Timber$Tree;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 20
    return-void
.end method

.method public static varargs v(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p0, "t"    # Ljava/lang/Throwable;
    .param p1, "message"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NonNls;
        .end annotation
    .end param
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 24
    sget-object v0, Ltimber/log/Timber;->TREE_OF_SOULS:Ltimber/log/Timber$Tree;

    invoke-virtual {v0, p0, p1, p2}, Ltimber/log/Timber$Tree;->v(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 25
    return-void
.end method

.method public static varargs w(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NonNls;
        .end annotation
    .end param
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 49
    sget-object v0, Ltimber/log/Timber;->TREE_OF_SOULS:Ltimber/log/Timber$Tree;

    invoke-virtual {v0, p0, p1}, Ltimber/log/Timber$Tree;->w(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 50
    return-void
.end method

.method public static varargs w(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p0, "t"    # Ljava/lang/Throwable;
    .param p1, "message"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NonNls;
        .end annotation
    .end param
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 54
    sget-object v0, Ltimber/log/Timber;->TREE_OF_SOULS:Ltimber/log/Timber$Tree;

    invoke-virtual {v0, p0, p1, p2}, Ltimber/log/Timber$Tree;->w(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 55
    return-void
.end method

.method public static varargs wtf(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NonNls;
        .end annotation
    .end param
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 69
    sget-object v0, Ltimber/log/Timber;->TREE_OF_SOULS:Ltimber/log/Timber$Tree;

    invoke-virtual {v0, p0, p1}, Ltimber/log/Timber$Tree;->wtf(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 70
    return-void
.end method

.method public static varargs wtf(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p0, "t"    # Ljava/lang/Throwable;
    .param p1, "message"    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NonNls;
        .end annotation
    .end param
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 74
    sget-object v0, Ltimber/log/Timber;->TREE_OF_SOULS:Ltimber/log/Timber$Tree;

    invoke-virtual {v0, p0, p1, p2}, Ltimber/log/Timber$Tree;->wtf(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 75
    return-void
.end method
