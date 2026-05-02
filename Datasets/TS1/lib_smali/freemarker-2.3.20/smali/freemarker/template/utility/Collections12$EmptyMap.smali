.class final Lfreemarker/template/utility/Collections12$EmptyMap;
.super Ljava/util/AbstractMap;
.source "Collections12.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/template/utility/Collections12;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "EmptyMap"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/template/utility/Collections12$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/template/utility/Collections12$1;

    .prologue
    .line 76
    invoke-direct {p0}, Lfreemarker/template/utility/Collections12$EmptyMap;-><init>()V

    return-void
.end method


# virtual methods
.method public containsKey(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 92
    const/4 v0, 0x0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 97
    const/4 v0, 0x0

    return v0
.end method

.method public entrySet()Ljava/util/Set;
    .registers 2

    .prologue
    .line 117
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 122
    instance-of v0, p1, Ljava/util/Map;

    if-eqz v0, :cond_e

    check-cast p1, Ljava/util/Map;

    .end local p1    # "o":Ljava/lang/Object;
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 102
    const/4 v0, 0x0

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 127
    const/4 v0, 0x0

    return v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 87
    const/4 v0, 0x1

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .registers 2

    .prologue
    .line 107
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 82
    const/4 v0, 0x0

    return v0
.end method

.method public values()Ljava/util/Collection;
    .registers 2

    .prologue
    .line 112
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    return-object v0
.end method
