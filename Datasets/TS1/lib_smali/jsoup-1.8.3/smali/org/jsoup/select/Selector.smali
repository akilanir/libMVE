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
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 79
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 80
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 81
    invoke-static {p2}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 83
    invoke-static {p1}, Lorg/jsoup/select/QueryParser;->parse(Ljava/lang/String;)Lorg/jsoup/select/Evaluator;

    move-result-object v0

    iput-object v0, p0, Lorg/jsoup/select/Selector;->evaluator:Lorg/jsoup/select/Evaluator;

    .line 85
    iput-object p2, p0, Lorg/jsoup/select/Selector;->root:Lorg/jsoup/nodes/Element;

    .line 86
    return-void
.end method

.method private constructor <init>(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)V
    .registers 3
    .param p1, "evaluator"    # Lorg/jsoup/select/Evaluator;
    .param p2, "root"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 90
    invoke-static {p2}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 92
    iput-object p1, p0, Lorg/jsoup/select/Selector;->evaluator:Lorg/jsoup/select/Evaluator;

    .line 93
    iput-object p2, p0, Lorg/jsoup/select/Selector;->root:Lorg/jsoup/nodes/Element;

    .line 94
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
    .line 144
    .local p0, "elements":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jsoup/nodes/Element;>;"
    .local p1, "outs":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jsoup/nodes/Element;>;"
    new-instance v3, Lorg/jsoup/select/Elements;

    invoke-direct {v3}, Lorg/jsoup/select/Elements;-><init>()V

    .line 145
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

    .line 146
    .local v0, "el":Lorg/jsoup/nodes/Element;
    const/4 v1, 0x0

    .line 147
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

    .line 148
    .local v2, "out":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0, v2}, Lorg/jsoup/nodes/Element;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1a

    .line 149
    const/4 v1, 0x1

    .line 153
    .end local v2    # "out":Lorg/jsoup/nodes/Element;
    :cond_2d
    if-nez v1, :cond_9

    .line 154
    invoke-virtual {v3, v0}, Lorg/jsoup/select/Elements;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 156
    .end local v0    # "el":Lorg/jsoup/nodes/Element;
    .end local v1    # "found":Z
    :cond_33
    return-object v3
.end method

.method private select()Lorg/jsoup/select/Elements;
    .registers 3

    .prologue
    .line 139
    iget-object v0, p0, Lorg/jsoup/select/Selector;->evaluator:Lorg/jsoup/select/Evaluator;

    iget-object v1, p0, Lorg/jsoup/select/Selector;->root:Lorg/jsoup/nodes/Element;

    invoke-static {v0, v1}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public static select(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jsoup/select/Elements;
    .registers 7
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
    .line 127
    .local p1, "roots":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lorg/jsoup/nodes/Element;>;"
    invoke-static {p0}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 128
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 129
    invoke-static {p0}, Lorg/jsoup/select/QueryParser;->parse(Ljava/lang/String;)Lorg/jsoup/select/Evaluator;

    move-result-object v1

    .line 130
    .local v1, "evaluator":Lorg/jsoup/select/Evaluator;
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 132
    .local v0, "elements":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Lorg/jsoup/nodes/Element;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_13
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_27

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Element;

    .line 133
    .local v2, "root":Lorg/jsoup/nodes/Element;
    invoke-static {v1, v2}, Lorg/jsoup/select/Selector;->select(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/LinkedHashSet;->addAll(Ljava/util/Collection;)Z

    goto :goto_13

    .line 135
    .end local v2    # "root":Lorg/jsoup/nodes/Element;
    :cond_27
    new-instance v3, Lorg/jsoup/select/Elements;

    invoke-direct {v3, v0}, Lorg/jsoup/select/Elements;-><init>(Ljava/util/Collection;)V

    return-object v3
.end method

.method public static select(Ljava/lang/String;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;
    .registers 3
    .param p0, "query"    # Ljava/lang/String;
    .param p1, "root"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 105
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
    .line 116
    new-instance v0, Lorg/jsoup/select/Selector;

    invoke-direct {v0, p0, p1}, Lorg/jsoup/select/Selector;-><init>(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)V

    invoke-direct {v0}, Lorg/jsoup/select/Selector;->select()Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method
