.class final Lfreemarker/core/SwitchBlock;
.super Lfreemarker/core/TemplateElement;
.source "SwitchBlock.java"


# instance fields
.field private defaultCase:Lfreemarker/core/Case;

.field private final searched:Lfreemarker/core/Expression;


# direct methods
.method constructor <init>(Lfreemarker/core/Expression;)V
    .registers 3
    .param p1, "searched"    # Lfreemarker/core/Expression;

    .prologue
    .line 72
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 73
    iput-object p1, p0, Lfreemarker/core/SwitchBlock;->searched:Lfreemarker/core/Expression;

    .line 74
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lfreemarker/core/SwitchBlock;->nestedElements:Ljava/util/List;

    .line 75
    return-void
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 12
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    const/4 v9, 0x0

    .line 91
    .local v9, "processedCase":Z
    iget-object v0, p0, Lfreemarker/core/SwitchBlock;->nestedElements:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .line 93
    .local v7, "iterator":Ljava/util/Iterator;
    :cond_7
    :goto_7
    :try_start_7
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_31

    .line 94
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lfreemarker/core/Case;

    .line 95
    .local v6, "cas":Lfreemarker/core/Case;
    const/4 v8, 0x0

    .line 98
    .local v8, "processCase":Z
    if-eqz v9, :cond_1e

    .line 99
    const/4 v8, 0x1

    .line 106
    :cond_17
    :goto_17
    if-eqz v8, :cond_7

    .line 107
    invoke-virtual {p1, v6}, Lfreemarker/core/Environment;->visitByHiddingParent(Lfreemarker/core/TemplateElement;)V

    .line 108
    const/4 v9, 0x1

    goto :goto_7

    .line 100
    :cond_1e
    iget-object v0, v6, Lfreemarker/core/Case;->condition:Lfreemarker/core/Expression;

    if-eqz v0, :cond_17

    .line 102
    iget-object v0, p0, Lfreemarker/core/SwitchBlock;->searched:Lfreemarker/core/Expression;

    const/4 v1, 0x1

    const-string v2, "case=="

    iget-object v3, v6, Lfreemarker/core/Case;->condition:Lfreemarker/core/Expression;

    iget-object v4, v6, Lfreemarker/core/Case;->condition:Lfreemarker/core/Expression;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lfreemarker/core/EvalUtil;->compare(Lfreemarker/core/Expression;ILjava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Z

    move-result v8

    goto :goto_17

    .line 114
    .end local v6    # "cas":Lfreemarker/core/Case;
    .end local v8    # "processCase":Z
    :cond_31
    if-nez v9, :cond_3c

    iget-object v0, p0, Lfreemarker/core/SwitchBlock;->defaultCase:Lfreemarker/core/Case;

    if-eqz v0, :cond_3c

    .line 115
    iget-object v0, p0, Lfreemarker/core/SwitchBlock;->defaultCase:Lfreemarker/core/Case;

    invoke-virtual {p1, v0}, Lfreemarker/core/Environment;->visitByHiddingParent(Lfreemarker/core/TemplateElement;)V
    :try_end_3c
    .catch Lfreemarker/core/BreakInstruction$Break; {:try_start_7 .. :try_end_3c} :catch_3d

    .line 119
    :cond_3c
    :goto_3c
    return-void

    .line 118
    :catch_3d
    move-exception v0

    goto :goto_3c
.end method

.method addCase(Lfreemarker/core/Case;)V
    .registers 3
    .param p1, "cas"    # Lfreemarker/core/Case;

    .prologue
    .line 81
    iget-object v0, p1, Lfreemarker/core/Case;->condition:Lfreemarker/core/Expression;

    if-nez v0, :cond_6

    .line 82
    iput-object p1, p0, Lfreemarker/core/SwitchBlock;->defaultCase:Lfreemarker/core/Case;

    .line 84
    :cond_6
    iget-object v0, p0, Lfreemarker/core/SwitchBlock;->nestedElements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    return-void
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 8
    .param p1, "canonical"    # Z

    .prologue
    const/16 v5, 0x3e

    .line 122
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 123
    .local v0, "buf":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_e

    const/16 v3, 0x3c

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 124
    :cond_e
    invoke-virtual {p0}, Lfreemarker/core/SwitchBlock;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 125
    const/16 v3, 0x20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 126
    iget-object v3, p0, Lfreemarker/core/SwitchBlock;->searched:Lfreemarker/core/Expression;

    invoke-virtual {v3}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 127
    if-eqz p1, :cond_54

    .line 128
    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 129
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_29
    iget-object v3, p0, Lfreemarker/core/SwitchBlock;->nestedElements:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_43

    .line 130
    iget-object v3, p0, Lfreemarker/core/SwitchBlock;->nestedElements:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/core/Case;

    .line 131
    .local v1, "cas":Lfreemarker/core/Case;
    invoke-virtual {v1}, Lfreemarker/core/Case;->getCanonicalForm()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 129
    add-int/lit8 v2, v2, 0x1

    goto :goto_29

    .line 133
    .end local v1    # "cas":Lfreemarker/core/Case;
    :cond_43
    const-string v3, "</"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0}, Lfreemarker/core/SwitchBlock;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 135
    .end local v2    # "i":I
    :cond_54
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 139
    const-string v0, "#switch"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 143
    const/4 v0, 0x1

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 152
    if-eqz p1, :cond_8

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 153
    :cond_8
    sget-object v0, Lfreemarker/core/ParameterRole;->VALUE:Lfreemarker/core/ParameterRole;

    return-object v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 147
    if-eqz p1, :cond_8

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 148
    :cond_8
    iget-object v0, p0, Lfreemarker/core/SwitchBlock;->searched:Lfreemarker/core/Expression;

    return-object v0
.end method
