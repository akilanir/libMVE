.class public Lorg/jsoup/nodes/Attributes;
.super Ljava/lang/Object;
.source "Attributes.java"

# interfaces
.implements Ljava/lang/Iterable;
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jsoup/nodes/Attributes$Dataset;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Lorg/jsoup/nodes/Attribute;",
        ">;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# static fields
.field protected static final dataPrefix:Ljava/lang/String; = "data-"


# instance fields
.field private attributes:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/jsoup/nodes/Attribute;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    .line 213
    return-void
.end method

.method static synthetic access$100(Lorg/jsoup/nodes/Attributes;)Ljava/util/LinkedHashMap;
    .registers 2
    .param p0, "x0"    # Lorg/jsoup/nodes/Attributes;

    .prologue
    .line 19
    iget-object v0, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    return-object v0
.end method

.method static synthetic access$102(Lorg/jsoup/nodes/Attributes;Ljava/util/LinkedHashMap;)Ljava/util/LinkedHashMap;
    .registers 2
    .param p0, "x0"    # Lorg/jsoup/nodes/Attributes;
    .param p1, "x1"    # Ljava/util/LinkedHashMap;

    .prologue
    .line 19
    iput-object p1, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    return-object p1
.end method

.method static synthetic access$300(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 19
    invoke-static {p0}, Lorg/jsoup/nodes/Attributes;->dataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static dataKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 273
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "data-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public addAll(Lorg/jsoup/nodes/Attributes;)V
    .registers 4
    .param p1, "incoming"    # Lorg/jsoup/nodes/Attributes;

    .prologue
    .line 110
    invoke-virtual {p1}, Lorg/jsoup/nodes/Attributes;->size()I

    move-result v0

    if-nez v0, :cond_7

    .line 115
    :goto_6
    return-void

    .line 112
    :cond_7
    iget-object v0, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_16

    .line 113
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Lorg/jsoup/nodes/Attributes;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    iput-object v0, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    .line 114
    :cond_16
    iget-object v0, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    iget-object v1, p1, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->putAll(Ljava/util/Map;)V

    goto :goto_6
.end method

.method public asList()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jsoup/nodes/Attribute;",
            ">;"
        }
    .end annotation

    .prologue
    .line 127
    iget-object v2, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    if-nez v2, :cond_9

    .line 128
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    .line 134
    :goto_8
    return-object v2

    .line 130
    :cond_9
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 131
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Attribute;>;"
    iget-object v2, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_32

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 132
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/jsoup/nodes/Attribute;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1e

    .line 134
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/jsoup/nodes/Attribute;>;"
    :cond_32
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    goto :goto_8
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 19
    invoke-virtual {p0}, Lorg/jsoup/nodes/Attributes;->clone()Lorg/jsoup/nodes/Attributes;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/jsoup/nodes/Attributes;
    .registers 8

    .prologue
    .line 198
    iget-object v3, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    if-nez v3, :cond_a

    .line 199
    new-instance v1, Lorg/jsoup/nodes/Attributes;

    invoke-direct {v1}, Lorg/jsoup/nodes/Attributes;-><init>()V

    .line 210
    :cond_9
    return-object v1

    .line 203
    :cond_a
    :try_start_a
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Attributes;
    :try_end_10
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_a .. :try_end_10} :catch_3b

    .line 207
    .local v1, "clone":Lorg/jsoup/nodes/Attributes;
    new-instance v3, Ljava/util/LinkedHashMap;

    iget-object v4, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v4}, Ljava/util/LinkedHashMap;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/LinkedHashMap;-><init>(I)V

    iput-object v3, v1, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    .line 208
    invoke-virtual {p0}, Lorg/jsoup/nodes/Attributes;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_21
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_9

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Attribute;

    .line 209
    .local v0, "attribute":Lorg/jsoup/nodes/Attribute;
    iget-object v4, v1, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Lorg/jsoup/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Lorg/jsoup/nodes/Attribute;->clone()Lorg/jsoup/nodes/Attribute;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_21

    .line 204
    .end local v0    # "attribute":Lorg/jsoup/nodes/Attribute;
    .end local v1    # "clone":Lorg/jsoup/nodes/Attributes;
    :catch_3b
    move-exception v2

    .line 205
    .local v2, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public dataset()Ljava/util/Map;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 143
    new-instance v0, Lorg/jsoup/nodes/Attributes$Dataset;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/jsoup/nodes/Attributes$Dataset;-><init>(Lorg/jsoup/nodes/Attributes;Lorg/jsoup/nodes/Attributes$1;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 179
    if-ne p0, p1, :cond_5

    .line 184
    :cond_4
    :goto_4
    return v1

    .line 180
    :cond_5
    instance-of v3, p1, Lorg/jsoup/nodes/Attributes;

    if-nez v3, :cond_b

    move v1, v2

    goto :goto_4

    :cond_b
    move-object v0, p1

    .line 182
    check-cast v0, Lorg/jsoup/nodes/Attributes;

    .line 184
    .local v0, "that":Lorg/jsoup/nodes/Attributes;
    iget-object v3, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    if-eqz v3, :cond_1e

    iget-object v3, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    iget-object v4, v0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v4}, Ljava/util/LinkedHashMap;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    :cond_1c
    move v1, v2

    goto :goto_4

    :cond_1e
    iget-object v3, v0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    if-nez v3, :cond_1c

    goto :goto_4
.end method

.method public get(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 35
    iget-object v1, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    if-nez v1, :cond_a

    .line 36
    const-string v1, ""

    .line 39
    :goto_9
    return-object v1

    .line 38
    :cond_a
    iget-object v1, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Attribute;

    .line 39
    .local v0, "attr":Lorg/jsoup/nodes/Attribute;
    if-eqz v0, :cond_1d

    invoke-virtual {v0}, Lorg/jsoup/nodes/Attribute;->getValue()Ljava/lang/String;

    move-result-object v1

    goto :goto_9

    :cond_1d
    const-string v1, ""

    goto :goto_9
.end method

.method public hasKey(Ljava/lang/String;)Z
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 92
    iget-object v0, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 193
    iget-object v0, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->hashCode()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public html()Ljava/lang/String;
    .registers 4

    .prologue
    .line 151
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 152
    .local v0, "accum":Ljava/lang/StringBuilder;
    new-instance v1, Lorg/jsoup/nodes/Document;

    const-string v2, ""

    invoke-direct {v1, v2}, Lorg/jsoup/nodes/Document;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lorg/jsoup/nodes/Document;->outputSettings()Lorg/jsoup/nodes/Document$OutputSettings;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/jsoup/nodes/Attributes;->html(Ljava/lang/StringBuilder;Lorg/jsoup/nodes/Document$OutputSettings;)V

    .line 153
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method html(Ljava/lang/StringBuilder;Lorg/jsoup/nodes/Document$OutputSettings;)V
    .registers 7
    .param p1, "accum"    # Ljava/lang/StringBuilder;
    .param p2, "out"    # Lorg/jsoup/nodes/Document$OutputSettings;

    .prologue
    .line 157
    iget-object v2, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    if-nez v2, :cond_5

    .line 165
    :cond_4
    return-void

    .line 160
    :cond_5
    iget-object v2, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 161
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/jsoup/nodes/Attribute;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Attribute;

    .line 162
    .local v0, "attribute":Lorg/jsoup/nodes/Attribute;
    const-string v3, " "

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    invoke-virtual {v0, p1, p2}, Lorg/jsoup/nodes/Attribute;->html(Ljava/lang/StringBuilder;Lorg/jsoup/nodes/Document$OutputSettings;)V

    goto :goto_f
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jsoup/nodes/Attribute;",
            ">;"
        }
    .end annotation

    .prologue
    .line 118
    invoke-virtual {p0}, Lorg/jsoup/nodes/Attributes;->asList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 48
    new-instance v0, Lorg/jsoup/nodes/Attribute;

    invoke-direct {v0, p1, p2}, Lorg/jsoup/nodes/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .local v0, "attr":Lorg/jsoup/nodes/Attribute;
    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Attributes;->put(Lorg/jsoup/nodes/Attribute;)V

    .line 50
    return-void
.end method

.method public put(Ljava/lang/String;Z)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Z

    .prologue
    .line 58
    if-eqz p2, :cond_b

    .line 59
    new-instance v0, Lorg/jsoup/nodes/BooleanAttribute;

    invoke-direct {v0, p1}, Lorg/jsoup/nodes/BooleanAttribute;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Attributes;->put(Lorg/jsoup/nodes/Attribute;)V

    .line 62
    :goto_a
    return-void

    .line 61
    :cond_b
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Attributes;->remove(Ljava/lang/String;)V

    goto :goto_a
.end method

.method public put(Lorg/jsoup/nodes/Attribute;)V
    .registers 4
    .param p1, "attribute"    # Lorg/jsoup/nodes/Attribute;

    .prologue
    .line 69
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 70
    iget-object v0, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_f

    .line 71
    new-instance v0, Ljava/util/LinkedHashMap;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    iput-object v0, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    .line 72
    :cond_f
    iget-object v0, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Lorg/jsoup/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    return-void
.end method

.method public remove(Ljava/lang/String;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 80
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 81
    iget-object v0, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_8

    .line 84
    :goto_7
    return-void

    .line 83
    :cond_8
    iget-object v0, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_7
.end method

.method public size()I
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_6

    .line 101
    const/4 v0, 0x0

    .line 102
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lorg/jsoup/nodes/Attributes;->attributes:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->size()I

    move-result v0

    goto :goto_5
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 169
    invoke-virtual {p0}, Lorg/jsoup/nodes/Attributes;->html()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
