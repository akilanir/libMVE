.class Lfreemarker/ext/beans/HashAdapter$1$1$1;
.super Ljava/lang/Object;
.source "HashAdapter.java"

# interfaces
.implements Ljava/util/Map$Entry;


# instance fields
.field private final this$2:Lfreemarker/ext/beans/HashAdapter$1$1;

.field private final val$key:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lfreemarker/ext/beans/HashAdapter$1$1;Ljava/lang/Object;)V
    .registers 3

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/beans/HashAdapter$1$1$1;->this$2:Lfreemarker/ext/beans/HashAdapter$1$1;

    iput-object p2, p0, Lfreemarker/ext/beans/HashAdapter$1$1$1;->val$key:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 9
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x0

    .line 105
    instance-of v6, p1, Ljava/util/Map$Entry;

    if-nez v6, :cond_6

    .line 116
    :cond_5
    :goto_5
    return v5

    :cond_6
    move-object v0, p1

    .line 107
    check-cast v0, Ljava/util/Map$Entry;

    .line 108
    .local v0, "e":Ljava/util/Map$Entry;
    invoke-virtual {p0}, Lfreemarker/ext/beans/HashAdapter$1$1$1;->getKey()Ljava/lang/Object;

    move-result-object v1

    .line 109
    .local v1, "k1":Ljava/lang/Object;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    .line 110
    .local v2, "k2":Ljava/lang/Object;
    if-eq v1, v2, :cond_1b

    if-eqz v1, :cond_5

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 111
    :cond_1b
    invoke-virtual {p0}, Lfreemarker/ext/beans/HashAdapter$1$1$1;->getValue()Ljava/lang/Object;

    move-result-object v3

    .line 112
    .local v3, "v1":Ljava/lang/Object;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 113
    .local v4, "v2":Ljava/lang/Object;
    if-eq v3, v4, :cond_2d

    if-eqz v3, :cond_5

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 114
    :cond_2d
    const/4 v5, 0x1

    goto :goto_5
.end method

.method public getKey()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lfreemarker/ext/beans/HashAdapter$1$1$1;->val$key:Ljava/lang/Object;

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 97
    iget-object v0, p0, Lfreemarker/ext/beans/HashAdapter$1$1$1;->this$2:Lfreemarker/ext/beans/HashAdapter$1$1;

    invoke-static {v0}, Lfreemarker/ext/beans/HashAdapter$1$1;->access$300(Lfreemarker/ext/beans/HashAdapter$1$1;)Lfreemarker/ext/beans/HashAdapter$1;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/ext/beans/HashAdapter$1;->access$100(Lfreemarker/ext/beans/HashAdapter$1;)Lfreemarker/ext/beans/HashAdapter;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/ext/beans/HashAdapter$1$1$1;->val$key:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lfreemarker/ext/beans/HashAdapter;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 120
    invoke-virtual {p0}, Lfreemarker/ext/beans/HashAdapter$1$1$1;->getValue()Ljava/lang/Object;

    move-result-object v0

    .line 121
    .local v0, "value":Ljava/lang/Object;
    iget-object v2, p0, Lfreemarker/ext/beans/HashAdapter$1$1$1;->val$key:Ljava/lang/Object;

    if-nez v2, :cond_e

    move v2, v1

    :goto_a
    if-nez v0, :cond_15

    :goto_c
    xor-int/2addr v1, v2

    return v1

    :cond_e
    iget-object v2, p0, Lfreemarker/ext/beans/HashAdapter$1$1$1;->val$key:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    goto :goto_a

    :cond_15
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto :goto_c
.end method

.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 101
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
