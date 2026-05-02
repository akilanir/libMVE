.class final Lfreemarker/core/ListLiteral;
.super Lfreemarker/core/Expression;
.source "ListLiteral.java"


# instance fields
.field final items:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Ljava/util/ArrayList;)V
    .registers 2
    .param p1, "items"    # Ljava/util/ArrayList;

    .prologue
    .line 74
    invoke-direct {p0}, Lfreemarker/core/Expression;-><init>()V

    .line 75
    iput-object p1, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    .line 76
    invoke-virtual {p1}, Ljava/util/ArrayList;->trimToSize()V

    .line 77
    return-void
.end method

.method private checkIndex(I)V
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 221
    iget-object v0, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_12

    .line 222
    :cond_c
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 224
    :cond_12
    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 7
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 80
    new-instance v2, Lfreemarker/template/SimpleSequence;

    iget-object v4, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-direct {v2, v4}, Lfreemarker/template/SimpleSequence;-><init>(I)V

    .line 81
    .local v2, "list":Lfreemarker/template/SimpleSequence;
    iget-object v4, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_30

    .line 82
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/Expression;

    .line 83
    .local v0, "exp":Lfreemarker/core/Expression;
    invoke-virtual {v0, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v3

    .line 84
    .local v3, "tm":Lfreemarker/template/TemplateModel;
    if-eqz p1, :cond_29

    invoke-virtual {p1}, Lfreemarker/core/Environment;->isClassicCompatible()Z

    move-result v4

    if-nez v4, :cond_2c

    .line 85
    :cond_29
    invoke-virtual {v0, v3, p1}, Lfreemarker/core/Expression;->assertNonNull(Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)V

    .line 87
    :cond_2c
    invoke-virtual {v2, v3}, Lfreemarker/template/SimpleSequence;->add(Ljava/lang/Object;)V

    goto :goto_11

    .line 89
    .end local v0    # "exp":Lfreemarker/core/Expression;
    .end local v3    # "tm":Lfreemarker/template/TemplateModel;
    :cond_30
    return-object v2
.end method

.method protected deepCloneWithIdentifierReplaced_inner(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;
    .registers 7
    .param p1, "replacedIdentifier"    # Ljava/lang/String;
    .param p2, "replacement"    # Lfreemarker/core/Expression;
    .param p3, "replacementState"    # Lfreemarker/core/Expression$ReplacemenetState;

    .prologue
    .line 198
    iget-object v2, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 199
    .local v0, "clonedValues":Ljava/util/ArrayList;
    invoke-virtual {v0}, Ljava/util/ArrayList;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .local v1, "iter":Ljava/util/ListIterator;
    :goto_c
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    .line 200
    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/core/Expression;

    invoke-virtual {v2, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/ListIterator;->set(Ljava/lang/Object;)V

    goto :goto_c

    .line 203
    :cond_20
    new-instance v2, Lfreemarker/core/ListLiteral;

    invoke-direct {v2, v0}, Lfreemarker/core/ListLiteral;-><init>(Ljava/util/ArrayList;)V

    return-object v2
.end method

.method evaluateStringsToNamespaces(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateSequenceModel;
    .registers 13
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 173
    invoke-virtual {p0, p1}, Lfreemarker/core/ListLiteral;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v6

    check-cast v6, Lfreemarker/template/TemplateSequenceModel;

    .line 174
    .local v6, "val":Lfreemarker/template/TemplateSequenceModel;
    new-instance v4, Lfreemarker/template/SimpleSequence;

    invoke-interface {v6}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v7

    invoke-direct {v4, v7}, Lfreemarker/template/SimpleSequence;-><init>(I)V

    .line 175
    .local v4, "result":Lfreemarker/template/SimpleSequence;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    iget-object v7, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v0, v7, :cond_62

    .line 176
    iget-object v7, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 177
    .local v2, "itemExpr":Ljava/lang/Object;
    instance-of v7, v2, Lfreemarker/core/StringLiteral;

    if-eqz v7, :cond_5a

    move-object v7, v2

    .line 178
    check-cast v7, Lfreemarker/core/StringLiteral;

    invoke-virtual {v7}, Lfreemarker/core/StringLiteral;->getAsString()Ljava/lang/String;

    move-result-object v5

    .line 180
    .local v5, "s":Ljava/lang/String;
    const/4 v7, 0x0

    :try_start_2a
    invoke-virtual {p1, v5, v7}, Lfreemarker/core/Environment;->importLib(Ljava/lang/String;Ljava/lang/String;)Lfreemarker/core/Environment$Namespace;

    move-result-object v3

    .line 181
    .local v3, "ns":Lfreemarker/core/Environment$Namespace;
    invoke-virtual {v4, v3}, Lfreemarker/template/SimpleSequence;->add(Ljava/lang/Object;)V
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_31} :catch_34

    .line 175
    .end local v3    # "ns":Lfreemarker/core/Environment$Namespace;
    .end local v5    # "s":Ljava/lang/String;
    :goto_31
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 183
    .restart local v5    # "s":Ljava/lang/String;
    :catch_34
    move-exception v1

    .line 184
    .local v1, "ioe":Ljava/io/IOException;
    new-instance v7, Lfreemarker/core/_MiscTemplateException;

    check-cast v2, Lfreemarker/core/StringLiteral;

    .end local v2    # "itemExpr":Ljava/lang/Object;
    const/4 v8, 0x4

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const-string v10, "Couldn\'t import library "

    aput-object v10, v8, v9

    const/4 v9, 0x1

    new-instance v10, Lfreemarker/core/_DelayedJQuote;

    invoke-direct {v10, v5}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    aput-object v10, v8, v9

    const/4 v9, 0x2

    const-string v10, ": "

    aput-object v10, v8, v9

    const/4 v9, 0x3

    new-instance v10, Lfreemarker/core/_DelayedGetMessage;

    invoke-direct {v10, v1}, Lfreemarker/core/_DelayedGetMessage;-><init>(Ljava/lang/Throwable;)V

    aput-object v10, v8, v9

    invoke-direct {v7, v2, v8}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;[Ljava/lang/Object;)V

    throw v7

    .line 190
    .end local v1    # "ioe":Ljava/io/IOException;
    .end local v5    # "s":Ljava/lang/String;
    .restart local v2    # "itemExpr":Ljava/lang/Object;
    :cond_5a
    invoke-interface {v6, v0}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v7

    invoke-virtual {v4, v7}, Lfreemarker/template/SimpleSequence;->add(Ljava/lang/Object;)V

    goto :goto_31

    .line 193
    .end local v2    # "itemExpr":Ljava/lang/Object;
    :cond_62
    return-object v4
.end method

.method public getCanonicalForm()Ljava/lang/String;
    .registers 6

    .prologue
    .line 140
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v4, "["

    invoke-direct {v0, v4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 141
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget-object v4, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 142
    .local v2, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_e
    if-ge v1, v2, :cond_2b

    .line 143
    iget-object v4, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfreemarker/core/Expression;

    .line 144
    .local v3, "value":Lfreemarker/core/Expression;
    invoke-virtual {v3}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 145
    add-int/lit8 v4, v2, -0x1

    if-eq v1, v4, :cond_28

    .line 146
    const-string v4, ", "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 142
    :cond_28
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 149
    .end local v3    # "value":Lfreemarker/core/Expression;
    :cond_2b
    const-string v4, "]"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 150
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method getModelList(Lfreemarker/core/Environment;)Ljava/util/List;
    .registers 8
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 120
    iget-object v4, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 121
    .local v3, "size":I
    packed-switch v3, :pswitch_data_44

    .line 129
    new-instance v2, Ljava/util/ArrayList;

    iget-object v4, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 130
    .local v2, "result":Ljava/util/List;
    iget-object v4, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .local v1, "iterator":Ljava/util/ListIterator;
    :goto_1a
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_30

    .line 131
    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/Expression;

    .line 132
    .local v0, "exp":Lfreemarker/core/Expression;
    invoke-virtual {v0, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1a

    .line 123
    .end local v0    # "exp":Lfreemarker/core/Expression;
    .end local v1    # "iterator":Ljava/util/ListIterator;
    .end local v2    # "result":Ljava/util/List;
    :pswitch_2e
    sget-object v2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 134
    :cond_30
    :goto_30
    return-object v2

    .line 126
    :pswitch_31
    iget-object v4, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lfreemarker/core/Expression;

    invoke-virtual {v4, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v4

    invoke-static {v4}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    goto :goto_30

    .line 121
    nop

    :pswitch_data_44
    .packed-switch 0x0
        :pswitch_2e
        :pswitch_31
    .end packed-switch
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 154
    const-string v0, "[...]"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 207
    iget-object v0, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 216
    invoke-direct {p0, p1}, Lfreemarker/core/ListLiteral;->checkIndex(I)V

    .line 217
    sget-object v0, Lfreemarker/core/ParameterRole;->ITEM_VALUE:Lfreemarker/core/ParameterRole;

    return-object v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 211
    invoke-direct {p0, p1}, Lfreemarker/core/ListLiteral;->checkIndex(I)V

    .line 212
    iget-object v0, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method getValueList(Lfreemarker/core/Environment;)Ljava/util/List;
    .registers 8
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 97
    iget-object v4, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 98
    .local v3, "size":I
    packed-switch v3, :pswitch_data_44

    .line 106
    new-instance v2, Ljava/util/ArrayList;

    iget-object v4, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 107
    .local v2, "result":Ljava/util/List;
    iget-object v4, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .local v1, "iterator":Ljava/util/ListIterator;
    :goto_1a
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_30

    .line 108
    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/Expression;

    .line 109
    .local v0, "exp":Lfreemarker/core/Expression;
    invoke-virtual {v0, p1}, Lfreemarker/core/Expression;->evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1a

    .line 100
    .end local v0    # "exp":Lfreemarker/core/Expression;
    .end local v1    # "iterator":Ljava/util/ListIterator;
    .end local v2    # "result":Ljava/util/List;
    :pswitch_2e
    sget-object v2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 111
    :cond_30
    :goto_30
    return-object v2

    .line 103
    :pswitch_31
    iget-object v4, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lfreemarker/core/Expression;

    invoke-virtual {v4, p1}, Lfreemarker/core/Expression;->evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    goto :goto_30

    .line 98
    nop

    :pswitch_data_44
    .packed-switch 0x0
        :pswitch_2e
        :pswitch_31
    .end packed-switch
.end method

.method isLiteral()Z
    .registers 5

    .prologue
    const/4 v2, 0x1

    .line 158
    iget-object v3, p0, Lfreemarker/core/ListLiteral;->constantValue:Lfreemarker/template/TemplateModel;

    if-eqz v3, :cond_6

    .line 167
    :cond_5
    :goto_5
    return v2

    .line 161
    :cond_6
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    iget-object v3, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_5

    .line 162
    iget-object v3, p0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/Expression;

    .line 163
    .local v0, "exp":Lfreemarker/core/Expression;
    invoke-virtual {v0}, Lfreemarker/core/Expression;->isLiteral()Z

    move-result v3

    if-nez v3, :cond_1f

    .line 164
    const/4 v2, 0x0

    goto :goto_5

    .line 161
    :cond_1f
    add-int/lit8 v1, v1, 0x1

    goto :goto_7
.end method
