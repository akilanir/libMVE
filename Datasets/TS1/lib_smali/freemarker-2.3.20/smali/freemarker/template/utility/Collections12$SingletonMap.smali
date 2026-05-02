.class Lfreemarker/template/utility/Collections12$SingletonMap;
.super Ljava/util/AbstractMap;
.source "Collections12.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/template/utility/Collections12;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SingletonMap"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/template/utility/Collections12$SingletonMap$ImmutableEntry;
    }
.end annotation


# instance fields
.field private transient entrySet:Ljava/util/Set;

.field private final k:Ljava/lang/Object;

.field private transient keySet:Ljava/util/Set;

.field private final v:Ljava/lang/Object;

.field private transient values:Ljava/util/Collection;


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 143
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 173
    iput-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonMap;->keySet:Ljava/util/Set;

    .line 174
    iput-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonMap;->entrySet:Ljava/util/Set;

    .line 175
    iput-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonMap;->values:Ljava/util/Collection;

    .line 144
    iput-object p1, p0, Lfreemarker/template/utility/Collections12$SingletonMap;->k:Ljava/lang/Object;

    .line 145
    iput-object p2, p0, Lfreemarker/template/utility/Collections12$SingletonMap;->v:Ljava/lang/Object;

    .line 146
    return-void
.end method


# virtual methods
.method public containsKey(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 160
    iget-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonMap;->k:Ljava/lang/Object;

    invoke-static {p1, v0}, Lfreemarker/template/utility/Collections12;->access$100(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 165
    iget-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonMap;->v:Ljava/lang/Object;

    invoke-static {p1, v0}, Lfreemarker/template/utility/Collections12;->access$100(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public entrySet()Ljava/util/Set;
    .registers 4

    .prologue
    .line 186
    iget-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonMap;->entrySet:Ljava/util/Set;

    if-nez v0, :cond_13

    .line 187
    new-instance v0, Lfreemarker/template/utility/Collections12$SingletonMap$ImmutableEntry;

    iget-object v1, p0, Lfreemarker/template/utility/Collections12$SingletonMap;->k:Ljava/lang/Object;

    iget-object v2, p0, Lfreemarker/template/utility/Collections12$SingletonMap;->v:Ljava/lang/Object;

    invoke-direct {v0, v1, v2}, Lfreemarker/template/utility/Collections12$SingletonMap$ImmutableEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonMap;->entrySet:Ljava/util/Set;

    .line 188
    :cond_13
    iget-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonMap;->entrySet:Ljava/util/Set;

    return-object v0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 170
    iget-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonMap;->k:Ljava/lang/Object;

    invoke-static {p1, v0}, Lfreemarker/template/utility/Collections12;->access$100(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonMap;->v:Ljava/lang/Object;

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 155
    const/4 v0, 0x0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .registers 2

    .prologue
    .line 179
    iget-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonMap;->keySet:Ljava/util/Set;

    if-nez v0, :cond_c

    .line 180
    iget-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonMap;->k:Ljava/lang/Object;

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonMap;->keySet:Ljava/util/Set;

    .line 181
    :cond_c
    iget-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonMap;->keySet:Ljava/util/Set;

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 150
    const/4 v0, 0x1

    return v0
.end method

.method public values()Ljava/util/Collection;
    .registers 2

    .prologue
    .line 193
    iget-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonMap;->values:Ljava/util/Collection;

    if-nez v0, :cond_c

    .line 194
    iget-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonMap;->v:Ljava/lang/Object;

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonMap;->values:Ljava/util/Collection;

    .line 195
    :cond_c
    iget-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonMap;->values:Ljava/util/Collection;

    return-object v0
.end method
