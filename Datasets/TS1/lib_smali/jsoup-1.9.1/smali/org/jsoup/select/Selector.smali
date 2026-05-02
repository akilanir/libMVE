.class public Lorg/jsoup/select/Selector;
.super Ljava/lang/Object;
.source "Selector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jsoup/select/Selector$SelectorParseException;
    }
.end annotation


# instance fields
.field private final evaluator:Lorg/jsoup/select/Evaluator;

.field private final root:Lorg/jsoup/nodes/Element;


# direct methods
.method private constructor <init>(Ljava/lang/String;Lorg/jsoup/nodes/Element;)V
    .registers 4
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "root"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 80
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 81
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 82
    invoke-static {p2}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 84
    invoke-static {p1}, Lorg/jsoup/select/QueryParser;->parse(Ljava/lang/String;)Lorg/jsoup/select/Evaluator;

    move-result-object v0

    iput-object v0, p0, Lorg/jsoup/select/Selector;->evaluator:Lorg/jsoup/select/Evaluator;

    .line 86
    iput-object p2, p0, Lorg/jsoup/select/Selector;->root:Lorg/jsoup/nodes/Element;

    .line 87
    return-void
.end method

.method private constructor <init>(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)V
    .registers 3
    .param p1, "evaluator"    # Lorg/jsoup/select/Evaluator;
    .param p2, "root"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 91
    invoke-static {p2}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 93
    iput-object p1, p0, Lorg/jsoup/select/Selector;->evaluator:Lorg/jsoup/select/Evaluator;

    .line 94
    iput-object p2, p0, Lorg/jsoup/select/Selector;->root:Lorg/jsoup/nodes/Element;

    .line 95
    return-void
.end method

.method static filterOut(Ljava/util/Collection;Ljava/util/Collection;)Lorg/jsoup/select/Elements;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/jsoup/nodes/Element;",
            ">;",
            "Ljava/util/Collection",
            "<",
            "Lorg/jsoup/nodes/Element;",
            ">;)",
            "Lorg/jsoup/select/Elements;"
        }
    .end annotation

    .prologue
    .line 153
    .local p0, "elements":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jsoup/nodes/Element;>;"
    .local p1, "outs":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jsoup/nodes/Element;>;"
    new-instance v3, Lorg/jsoup/select/Elements;

    invoke-direct {v3}, Lorg/jsoup/select/Elements;-><init>()V

    .line 154
    .local v3, "output":Lorg/jsoup/select/Elements;
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_9
    :goto_9
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_33

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 155
    .local v0, "el":Lorg/jsoup/nodes/Element;
    const/4 v1, 0x0

    .line 156
    .local v1, "found":Z
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2d

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Element;

    .line 157
    .local v2, "out":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0, v2}, Lorg/jsoup/nodes/Element;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1a

    .line 158
    const/4 v1, 0x1

    .line 162
    .end local v2    # "out":Lorg/jsoup/nodes/Element;
    :cond_2d
    if-nez v1, :cond_9

    .line 163
    invoke-virtual {v3, v0}, Lorg/jsoup/select/Elements;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 165
    .end local v0    # "el":Lorg/jsoup/nodes/Element;
    .end local v1    # "found":Z
    :cond_33
    return-object v3
.end method

.method private select()Lorg/jsoup/select/Elements;
    .registers 3

    .prologue
    .line 148
    iget-object v0, p0, Lorg/jsoup/select/Selector;->evaluator:Lorg/jsoup/select/Evaluator;

    iget-object v1, p0, Lorg/jsoup/select/Selector;->root:Lorg/jsoup/nodes/Element;

    invoke-static {v0, v1}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public static select(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jsoup/select/Elements;
    .registers 11
    .param p0, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/jsoup/nodes/Element;",
            ">;)",
            "Lorg/jsoup/select/Elements;"
        }
    .end annotation

    .prologue
    .line 128
    .local p1, "roots":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lorg/jsoup/nodes/Element;>;"
    invoke-static {p0}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 129
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 130
    invoke-static {p0}, Lorg/jsoup/select/QueryParser;->parse(Ljava/lang/String;)Lorg/jsoup/select/Evaluator;

    move-result-object v2

    .line 131
    .local v2, "evaluator":Lorg/jsoup/select/Evaluator;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 132
    .local v1, "elements":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jsoup/nodes/Element;>;"
    new-instance v5, Ljava/util/IdentityHashMap;

    invoke-direct {v5}, Ljava/util/IdentityHashMap;-><init>()V

    .line 135
    .local v5, "seenElements":Ljava/util/IdentityHashMap;, "Ljava/util/IdentityHashMap<Lorg/jsoup/nodes/Element;Ljava/lang/Boolean;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_18
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_47

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jsoup/nodes/Element;

    .line 136
    .local v4, "root":Lorg/jsoup/nodes/Element;
    invoke-static {v2, v4}, Lorg/jsoup/select/Selector;->select(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v3

    .line 137
    .local v3, "found":Lorg/jsoup/select/Elements;
    invoke-virtual {v3}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_2c
    :goto_2c
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_18

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 138
    .local v0, "el":Lorg/jsoup/nodes/Element;
    invoke-virtual {v5, v0}, Ljava/util/IdentityHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2c

    .line 139
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 140
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v5, v0, v8}, Ljava/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2c

    .line 144
    .end local v0    # "el":Lorg/jsoup/nodes/Element;
    .end local v3    # "found":Lorg/jsoup/select/Elements;
    .end local v4    # "root":Lorg/jsoup/nodes/Element;
    :cond_47
    new-instance v6, Lorg/jsoup/select/Elements;

    invoke-direct {v6, v1}, Lorg/jsoup/select/Elements;-><init>(Ljava/util/List;)V

    return-object v6
.end method

.method public static select(Ljava/lang/String;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;
    .registers 3
    .param p0, "query"    # Ljava/lang/String;
    .param p1, "root"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 106
    new-instance v0, Lorg/jsoup/select/Selector;

    invoke-direct {v0, p0, p1}, Lorg/jsoup/select/Selector;-><init>(Ljava/lang/String;Lorg/jsoup/nodes/Element;)V

    invoke-direct {v0}, Lorg/jsoup/select/Selector;->select()Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public static select(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;
    .registers 3
    .param p0, "evaluator"    # Lorg/jsoup/select/Evaluator;
    .param p1, "root"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 117
    new-instance v0, Lorg/jsoup/select/Selector;

    invoke-direct {v0, p0, p1}, Lorg/jsoup/select/Selector;-><init>(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)V

    invoke-direct {v0}, Lorg/jsoup/select/Selector;->select()Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method
