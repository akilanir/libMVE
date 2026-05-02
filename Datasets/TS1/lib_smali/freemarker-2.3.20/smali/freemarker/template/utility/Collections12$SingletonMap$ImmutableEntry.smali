.class Lfreemarker/template/utility/Collections12$SingletonMap$ImmutableEntry;
.super Ljava/lang/Object;
.source "Collections12.java"

# interfaces
.implements Ljava/util/Map$Entry;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/template/utility/Collections12$SingletonMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ImmutableEntry"
.end annotation


# instance fields
.field final k:Ljava/lang/Object;

.field final v:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 204
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 205
    iput-object p1, p0, Lfreemarker/template/utility/Collections12$SingletonMap$ImmutableEntry;->k:Ljava/lang/Object;

    .line 206
    iput-object p2, p0, Lfreemarker/template/utility/Collections12$SingletonMap$ImmutableEntry;->v:Ljava/lang/Object;

    .line 207
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 226
    instance-of v2, p1, Ljava/util/Map$Entry;

    if-nez v2, :cond_6

    .line 229
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 228
    check-cast v0, Ljava/util/Map$Entry;

    .line 229
    .local v0, "e":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    iget-object v3, p0, Lfreemarker/template/utility/Collections12$SingletonMap$ImmutableEntry;->k:Ljava/lang/Object;

    invoke-static {v2, v3}, Lfreemarker/template/utility/Collections12;->access$100(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    iget-object v3, p0, Lfreemarker/template/utility/Collections12$SingletonMap$ImmutableEntry;->v:Ljava/lang/Object;

    invoke-static {v2, v3}, Lfreemarker/template/utility/Collections12;->access$100(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method

.method public getKey()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 211
    iget-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonMap$ImmutableEntry;->k:Ljava/lang/Object;

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 216
    iget-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonMap$ImmutableEntry;->v:Ljava/lang/Object;

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 234
    iget-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonMap$ImmutableEntry;->k:Ljava/lang/Object;

    if-nez v0, :cond_c

    move v0, v1

    :goto_6
    iget-object v2, p0, Lfreemarker/template/utility/Collections12$SingletonMap$ImmutableEntry;->v:Ljava/lang/Object;

    if-nez v2, :cond_13

    :goto_a
    xor-int/2addr v0, v1

    return v0

    :cond_c
    iget-object v0, p0, Lfreemarker/template/utility/Collections12$SingletonMap$ImmutableEntry;->k:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_6

    :cond_13
    iget-object v1, p0, Lfreemarker/template/utility/Collections12$SingletonMap$ImmutableEntry;->v:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto :goto_a
.end method

.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 221
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 241
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lfreemarker/template/utility/Collections12$SingletonMap$ImmutableEntry;->k:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/template/utility/Collections12$SingletonMap$ImmutableEntry;->v:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
