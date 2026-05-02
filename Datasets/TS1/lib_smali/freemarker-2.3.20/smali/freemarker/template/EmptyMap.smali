.class public Lfreemarker/template/EmptyMap;
.super Ljava/lang/Object;
.source "EmptyMap.java"

# interfaces
.implements Ljava/util/Map;
.implements Ljava/lang/Cloneable;


# static fields
.field public static final instance:Lfreemarker/template/EmptyMap;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 16
    new-instance v0, Lfreemarker/template/EmptyMap;

    invoke-direct {v0}, Lfreemarker/template/EmptyMap;-><init>()V

    sput-object v0, Lfreemarker/template/EmptyMap;->instance:Lfreemarker/template/EmptyMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 1

    .prologue
    .line 20
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "arg0"    # Ljava/lang/Object;

    .prologue
    .line 23
    const/4 v0, 0x0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "arg0"    # Ljava/lang/Object;

    .prologue
    .line 27
    const/4 v0, 0x0

    return v0
.end method

.method public entrySet()Ljava/util/Set;
    .registers 2

    .prologue
    .line 31
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    return-object v0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "arg0"    # Ljava/lang/Object;

    .prologue
    .line 35
    const/4 v0, 0x0

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 39
    const/4 v0, 0x1

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .registers 2

    .prologue
    .line 43
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "arg0"    # Ljava/lang/Object;
    .param p2, "arg1"    # Ljava/lang/Object;

    .prologue
    .line 47
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This Map is read-only."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public putAll(Ljava/util/Map;)V
    .registers 4
    .param p1, "arg0"    # Ljava/util/Map;

    .prologue
    .line 53
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 54
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This Map is read-only."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 56
    :cond_16
    return-void
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "arg0"    # Ljava/lang/Object;

    .prologue
    .line 59
    const/4 v0, 0x0

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 63
    const/4 v0, 0x0

    return v0
.end method

.method public values()Ljava/util/Collection;
    .registers 2

    .prologue
    .line 67
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object v0
.end method
