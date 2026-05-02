.class public Lezvcard/ValidationWarnings;
.super Ljava/lang/Object;
.source "ValidationWarnings.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Ljava/util/Map$Entry",
        "<",
        "Lezvcard/property/VCardProperty;",
        "Ljava/util/List",
        "<",
        "Lezvcard/Warning;",
        ">;>;>;"
    }
.end annotation


# instance fields
.field private final warnings:Lezvcard/util/ListMultimap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lezvcard/util/ListMultimap",
            "<",
            "Lezvcard/property/VCardProperty;",
            "Lezvcard/Warning;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    new-instance v0, Lezvcard/util/ListMultimap;

    invoke-direct {v0}, Lezvcard/util/ListMultimap;-><init>()V

    iput-object v0, p0, Lezvcard/ValidationWarnings;->warnings:Lezvcard/util/ListMultimap;

    return-void
.end method


# virtual methods
.method public add(Lezvcard/property/VCardProperty;Lezvcard/Warning;)V
    .registers 4
    .param p1, "property"    # Lezvcard/property/VCardProperty;
    .param p2, "warning"    # Lezvcard/Warning;

    .prologue
    .line 94
    iget-object v0, p0, Lezvcard/ValidationWarnings;->warnings:Lezvcard/util/ListMultimap;

    invoke-virtual {v0, p1, p2}, Lezvcard/util/ListMultimap;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 95
    return-void
.end method

.method public add(Lezvcard/property/VCardProperty;Ljava/util/List;)V
    .registers 4
    .param p1, "property"    # Lezvcard/property/VCardProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/property/VCardProperty;",
            "Ljava/util/List",
            "<",
            "Lezvcard/Warning;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 103
    .local p2, "warnings":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    iget-object v0, p0, Lezvcard/ValidationWarnings;->warnings:Lezvcard/util/ListMultimap;

    invoke-virtual {v0, p1, p2}, Lezvcard/util/ListMultimap;->putAll(Ljava/lang/Object;Ljava/util/Collection;)V

    .line 104
    return-void
.end method

.method public getByProperty(Ljava/lang/Class;)Ljava/util/List;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lezvcard/property/VCardProperty;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lezvcard/Warning;",
            ">;"
        }
    .end annotation

    .prologue
    .line 131
    .local p1, "propertyClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lezvcard/property/VCardProperty;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 132
    .local v3, "propWarnings":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    iget-object v5, p0, Lezvcard/ValidationWarnings;->warnings:Lezvcard/util/ListMultimap;

    invoke-virtual {v5}, Lezvcard/util/ListMultimap;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_b
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_33

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 133
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lezvcard/property/VCardProperty;Ljava/util/List<Lezvcard/Warning;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lezvcard/property/VCardProperty;

    .line 135
    .local v4, "property":Lezvcard/property/VCardProperty;
    if-nez v4, :cond_21

    if-eqz p1, :cond_29

    :cond_21
    if-eqz v4, :cond_b

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    if-ne p1, v5, :cond_b

    .line 136
    :cond_29
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 137
    .local v2, "propViolations":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    invoke-interface {v3, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_b

    .line 140
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lezvcard/property/VCardProperty;Ljava/util/List<Lezvcard/Warning;>;>;"
    .end local v2    # "propViolations":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    .end local v4    # "property":Lezvcard/property/VCardProperty;
    :cond_33
    return-object v3
.end method

.method public getWarnings()Lezvcard/util/ListMultimap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lezvcard/util/ListMultimap",
            "<",
            "Lezvcard/property/VCardProperty;",
            "Lezvcard/Warning;",
            ">;"
        }
    .end annotation

    .prologue
    .line 111
    iget-object v0, p0, Lezvcard/ValidationWarnings;->warnings:Lezvcard/util/ListMultimap;

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 120
    iget-object v0, p0, Lezvcard/ValidationWarnings;->warnings:Lezvcard/util/ListMultimap;

    invoke-virtual {v0}, Lezvcard/util/ListMultimap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Lezvcard/property/VCardProperty;",
            "Ljava/util/List",
            "<",
            "Lezvcard/Warning;",
            ">;>;>;"
        }
    .end annotation

    .prologue
    .line 187
    iget-object v0, p0, Lezvcard/ValidationWarnings;->warnings:Lezvcard/util/ListMultimap;

    invoke-virtual {v0}, Lezvcard/util/ListMultimap;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 11

    .prologue
    .line 156
    invoke-static {}, Ljava/text/NumberFormat;->getIntegerInstance()Ljava/text/NumberFormat;

    move-result-object v4

    .line 157
    .local v4, "nf":Ljava/text/NumberFormat;
    const/4 v9, 0x2

    invoke-virtual {v4, v9}, Ljava/text/NumberFormat;->setMinimumIntegerDigits(I)V

    .line 159
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 160
    .local v8, "sb":Ljava/lang/StringBuilder;
    iget-object v9, p0, Lezvcard/ValidationWarnings;->warnings:Lezvcard/util/ListMultimap;

    invoke-virtual {v9}, Lezvcard/util/ListMultimap;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_13
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_76

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 161
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lezvcard/property/VCardProperty;Ljava/util/List<Lezvcard/Warning;>;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lezvcard/property/VCardProperty;

    .line 162
    .local v7, "property":Lezvcard/property/VCardProperty;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 164
    .local v6, "propViolations":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_2f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_13

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lezvcard/Warning;

    .line 165
    .local v5, "propViolation":Lezvcard/Warning;
    if-eqz v7, :cond_52

    .line 166
    const/16 v9, 0x5b

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 167
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    const-string v9, "] | "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    :cond_52
    invoke-virtual {v5}, Lezvcard/Warning;->getCode()Ljava/lang/Integer;

    move-result-object v0

    .line 172
    .local v0, "code":Ljava/lang/Integer;
    if-eqz v0, :cond_69

    .line 173
    const/16 v9, 0x57

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 174
    invoke-virtual {v4, v0}, Ljava/text/NumberFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    const-string v9, ": "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    :cond_69
    invoke-virtual {v5}, Lezvcard/Warning;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    sget-object v9, Lezvcard/util/StringUtils;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2f

    .line 183
    .end local v0    # "code":Ljava/lang/Integer;
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lezvcard/property/VCardProperty;Ljava/util/List<Lezvcard/Warning;>;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v5    # "propViolation":Lezvcard/Warning;
    .end local v6    # "propViolations":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    .end local v7    # "property":Lezvcard/property/VCardProperty;
    :cond_76
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    return-object v9
.end method
