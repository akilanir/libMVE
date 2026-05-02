.class public Lorg/apache/commons/digester/substitution/MultiVariableExpander;
.super Ljava/lang/Object;
.source "MultiVariableExpander.java"

# interfaces
.implements Lorg/apache/commons/digester/substitution/VariableExpander;


# instance fields
.field private markers:Ljava/util/ArrayList;

.field private nEntries:I

.field private sources:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x2

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/digester/substitution/MultiVariableExpander;->nEntries:I

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/digester/substitution/MultiVariableExpander;->markers:Ljava/util/ArrayList;

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/digester/substitution/MultiVariableExpander;->sources:Ljava/util/ArrayList;

    .line 36
    return-void
.end method


# virtual methods
.method public addSource(Ljava/lang/String;Ljava/util/Map;)V
    .registers 4
    .param p1, "marker"    # Ljava/lang/String;
    .param p2, "source"    # Ljava/util/Map;

    .prologue
    .line 39
    iget v0, p0, Lorg/apache/commons/digester/substitution/MultiVariableExpander;->nEntries:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/digester/substitution/MultiVariableExpander;->nEntries:I

    .line 40
    iget-object v0, p0, Lorg/apache/commons/digester/substitution/MultiVariableExpander;->markers:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    iget-object v0, p0, Lorg/apache/commons/digester/substitution/MultiVariableExpander;->sources:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    return-void
.end method

.method public expand(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "param"    # Ljava/lang/String;

    .prologue
    .line 52
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v1, p0, Lorg/apache/commons/digester/substitution/MultiVariableExpander;->nEntries:I

    if-lt v0, v1, :cond_6

    .line 58
    return-object p1

    .line 53
    :cond_6
    iget-object v1, p0, Lorg/apache/commons/digester/substitution/MultiVariableExpander;->markers:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lorg/apache/commons/digester/substitution/MultiVariableExpander;->sources:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    invoke-virtual {p0, p1, v1, v2}, Lorg/apache/commons/digester/substitution/MultiVariableExpander;->expand(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p1

    .line 52
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public expand(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .registers 15
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "marker"    # Ljava/lang/String;
    .param p3, "source"    # Ljava/util/Map;

    .prologue
    const/4 v10, -0x1

    .line 77
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v8, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "{"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 78
    .local v5, "startMark":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v3

    .line 80
    .local v3, "markLen":I
    const/4 v1, 0x0

    .line 83
    .local v1, "index":I
    :goto_19
    invoke-virtual {p1, v5, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 84
    if-ne v1, v10, :cond_20

    .line 86
    return-object p1

    .line 89
    :cond_20
    add-int v4, v1, v3

    .line 90
    .local v4, "startIndex":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    if-le v4, v8, :cond_30

    .line 92
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "var expression starts at end of string"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 96
    :cond_30
    const-string v8, "}"

    add-int v9, v1, v3

    invoke-virtual {p1, v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    .line 97
    .local v0, "endIndex":I
    if-ne v0, v10, :cond_42

    .line 99
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "var expression starts but does not end"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 103
    :cond_42
    add-int v8, v1, v3

    invoke-virtual {p1, v8, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 104
    .local v2, "key":Ljava/lang/String;
    invoke-interface {p3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 105
    .local v6, "value":Ljava/lang/Object;
    if-nez v6, :cond_6d

    .line 106
    new-instance v8, Ljava/lang/IllegalArgumentException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "parameter ["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "] is not defined."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 109
    :cond_6d
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    .line 111
    .local v7, "varValue":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v9, 0x0

    invoke-virtual {p1, v9, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    add-int/lit8 v9, v0, 0x1

    invoke-virtual {p1, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 112
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v1, v8

    goto :goto_19
.end method
