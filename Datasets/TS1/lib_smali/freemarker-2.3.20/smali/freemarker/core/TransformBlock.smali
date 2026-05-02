.class final Lfreemarker/core/TransformBlock;
.super Lfreemarker/core/TemplateElement;
.source "TransformBlock.java"


# instance fields
.field namedArgs:Ljava/util/Map;

.field private volatile transient sortedNamedArgsCache:Ljava/lang/ref/SoftReference;

.field private transformExpression:Lfreemarker/core/Expression;


# direct methods
.method constructor <init>(Lfreemarker/core/Expression;Ljava/util/Map;Lfreemarker/core/TemplateElement;)V
    .registers 4
    .param p1, "transformExpression"    # Lfreemarker/core/Expression;
    .param p2, "namedArgs"    # Ljava/util/Map;
    .param p3, "nestedBlock"    # Lfreemarker/core/TemplateElement;

    .prologue
    .line 84
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 85
    iput-object p1, p0, Lfreemarker/core/TransformBlock;->transformExpression:Lfreemarker/core/Expression;

    .line 86
    iput-object p2, p0, Lfreemarker/core/TransformBlock;->namedArgs:Ljava/util/Map;

    .line 87
    iput-object p3, p0, Lfreemarker/core/TransformBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    .line 88
    return-void
.end method

.method private getSortedNamedArgs()Ljava/util/List;
    .registers 5

    .prologue
    .line 175
    iget-object v0, p0, Lfreemarker/core/TransformBlock;->sortedNamedArgsCache:Ljava/lang/ref/SoftReference;

    .line 176
    .local v0, "ref":Ljava/lang/ref/Reference;
    if-eqz v0, :cond_e

    .line 177
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 178
    .local v1, "res":Ljava/util/List;
    if-eqz v1, :cond_e

    move-object v2, v1

    .line 183
    .end local v1    # "res":Ljava/util/List;
    .local v2, "res":Ljava/util/List;
    :goto_d
    return-object v2

    .line 181
    .end local v2    # "res":Ljava/util/List;
    :cond_e
    iget-object v3, p0, Lfreemarker/core/TransformBlock;->namedArgs:Ljava/util/Map;

    invoke-static {v3}, Lfreemarker/core/MiscUtil;->sortMapOfExpressions(Ljava/util/Map;)Ljava/util/List;

    move-result-object v1

    .line 182
    .restart local v1    # "res":Ljava/util/List;
    new-instance v3, Ljava/lang/ref/SoftReference;

    invoke-direct {v3, v1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v3, p0, Lfreemarker/core/TransformBlock;->sortedNamedArgsCache:Ljava/lang/ref/SoftReference;

    move-object v2, v1

    .line 183
    .end local v1    # "res":Ljava/util/List;
    .restart local v2    # "res":Ljava/util/List;
    goto :goto_d
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 13
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    iget-object v8, p0, Lfreemarker/core/TransformBlock;->transformExpression:Lfreemarker/core/Expression;

    invoke-virtual {p1, v8}, Lfreemarker/core/Environment;->getTransform(Lfreemarker/core/Expression;)Lfreemarker/template/TemplateTransformModel;

    move-result-object v5

    .line 94
    .local v5, "ttm":Lfreemarker/template/TemplateTransformModel;
    if-eqz v5, :cond_4b

    .line 96
    iget-object v8, p0, Lfreemarker/core/TransformBlock;->namedArgs:Ljava/util/Map;

    if-eqz v8, :cond_43

    iget-object v8, p0, Lfreemarker/core/TransformBlock;->namedArgs:Ljava/util/Map;

    invoke-interface {v8}, Ljava/util/Map;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_43

    .line 97
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 98
    .local v0, "args":Ljava/util/Map;
    iget-object v8, p0, Lfreemarker/core/TransformBlock;->namedArgs:Ljava/util/Map;

    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;
    :goto_23
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_45

    .line 99
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 100
    .local v1, "entry":Ljava/util/Map$Entry;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 101
    .local v3, "key":Ljava/lang/String;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lfreemarker/core/Expression;

    .line 102
    .local v7, "valueExp":Lfreemarker/core/Expression;
    invoke-virtual {v7, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v6

    .line 103
    .local v6, "value":Lfreemarker/template/TemplateModel;
    invoke-interface {v0, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_23

    .line 106
    .end local v0    # "args":Ljava/util/Map;
    .end local v1    # "entry":Ljava/util/Map$Entry;
    .end local v2    # "it":Ljava/util/Iterator;
    .end local v3    # "key":Ljava/lang/String;
    .end local v6    # "value":Lfreemarker/template/TemplateModel;
    .end local v7    # "valueExp":Lfreemarker/core/Expression;
    :cond_43
    sget-object v0, Lfreemarker/template/EmptyMap;->instance:Lfreemarker/template/EmptyMap;

    .line 108
    .restart local v0    # "args":Ljava/util/Map;
    :cond_45
    iget-object v8, p0, Lfreemarker/core/TransformBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {p1, v8, v5, v0}, Lfreemarker/core/Environment;->visitAndTransform(Lfreemarker/core/TemplateElement;Lfreemarker/template/TemplateTransformModel;Ljava/util/Map;)V

    .line 114
    return-void

    .line 111
    .end local v0    # "args":Ljava/util/Map;
    :cond_4b
    iget-object v8, p0, Lfreemarker/core/TransformBlock;->transformExpression:Lfreemarker/core/Expression;

    invoke-virtual {v8, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v4

    .line 112
    .local v4, "tm":Lfreemarker/template/TemplateModel;
    new-instance v8, Lfreemarker/core/UnexpectedTypeException;

    iget-object v9, p0, Lfreemarker/core/TransformBlock;->transformExpression:Lfreemarker/core/Expression;

    const-string v10, "transform"

    invoke-direct {v8, v9, v4, v10, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v8
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 7
    .param p1, "canonical"    # Z

    .prologue
    const/16 v4, 0x20

    .line 117
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 118
    .local v2, "sb":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_e

    const/16 v3, 0x3c

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 119
    :cond_e
    invoke-virtual {p0}, Lfreemarker/core/TransformBlock;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 120
    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 121
    iget-object v3, p0, Lfreemarker/core/TransformBlock;->transformExpression:Lfreemarker/core/Expression;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 122
    iget-object v3, p0, Lfreemarker/core/TransformBlock;->namedArgs:Ljava/util/Map;

    if-eqz v3, :cond_4e

    .line 123
    invoke-direct {p0}, Lfreemarker/core/TransformBlock;->getSortedNamedArgs()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_29
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4e

    .line 124
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 125
    .local v0, "entry":Ljava/util/Map$Entry;
    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 126
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 127
    const/16 v3, 0x3d

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 128
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfreemarker/core/Expression;

    invoke-static {v2, v3}, Lfreemarker/core/MessageUtil;->appendExpressionAsUntearable(Ljava/lang/StringBuffer;Lfreemarker/core/Expression;)Ljava/lang/StringBuffer;

    goto :goto_29

    .line 131
    .end local v0    # "entry":Ljava/util/Map$Entry;
    .end local v1    # "it":Ljava/util/Iterator;
    :cond_4e
    if-eqz p1, :cond_75

    .line 132
    const-string v3, ">"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 133
    iget-object v3, p0, Lfreemarker/core/TransformBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v3, :cond_62

    .line 134
    iget-object v3, p0, Lfreemarker/core/TransformBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v3}, Lfreemarker/core/TemplateElement;->getCanonicalForm()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 136
    :cond_62
    const-string v3, "</"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0}, Lfreemarker/core/TransformBlock;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const/16 v4, 0x3e

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 138
    :cond_75
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 142
    const-string v0, "#transform"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 146
    iget-object v0, p0, Lfreemarker/core/TransformBlock;->namedArgs:Ljava/util/Map;

    if-eqz v0, :cond_f

    iget-object v0, p0, Lfreemarker/core/TransformBlock;->namedArgs:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    :goto_c
    add-int/lit8 v0, v0, 0x1

    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_c
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 4
    .param p1, "idx"    # I

    .prologue
    .line 161
    if-nez p1, :cond_5

    .line 162
    sget-object v0, Lfreemarker/core/ParameterRole;->CALLEE:Lfreemarker/core/ParameterRole;

    .line 164
    :goto_4
    return-object v0

    .line 163
    :cond_5
    add-int/lit8 v0, p1, -0x1

    iget-object v1, p0, Lfreemarker/core/TransformBlock;->namedArgs:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x2

    if-ge v0, v1, :cond_1d

    .line 164
    add-int/lit8 v0, p1, -0x1

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_1a

    sget-object v0, Lfreemarker/core/ParameterRole;->ARGUMENT_NAME:Lfreemarker/core/ParameterRole;

    goto :goto_4

    :cond_1a
    sget-object v0, Lfreemarker/core/ParameterRole;->ARGUMENT_VALUE:Lfreemarker/core/ParameterRole;

    goto :goto_4

    .line 166
    :cond_1d
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 5
    .param p1, "idx"    # I

    .prologue
    .line 150
    if-nez p1, :cond_5

    .line 151
    iget-object v1, p0, Lfreemarker/core/TransformBlock;->transformExpression:Lfreemarker/core/Expression;

    .line 154
    :goto_4
    return-object v1

    .line 152
    :cond_5
    iget-object v1, p0, Lfreemarker/core/TransformBlock;->namedArgs:Ljava/util/Map;

    if-eqz v1, :cond_33

    add-int/lit8 v1, p1, -0x1

    iget-object v2, p0, Lfreemarker/core/TransformBlock;->namedArgs:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    if-ge v1, v2, :cond_33

    .line 153
    invoke-direct {p0}, Lfreemarker/core/TransformBlock;->getSortedNamedArgs()Ljava/util/List;

    move-result-object v1

    add-int/lit8 v2, p1, -0x1

    div-int/lit8 v2, v2, 0x2

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 154
    .local v0, "namedArg":Ljava/util/Map$Entry;
    add-int/lit8 v1, p1, -0x1

    rem-int/lit8 v1, v1, 0x2

    if-nez v1, :cond_2e

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    goto :goto_4

    :cond_2e
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    goto :goto_4

    .line 156
    .end local v0    # "namedArg":Ljava/util/Map$Entry;
    :cond_33
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v1
.end method
