.class final Lfreemarker/core/UnifiedCall;
.super Lfreemarker/core/TemplateElement;
.source "UnifiedCall.java"


# instance fields
.field private bodyParameterNames:Ljava/util/List;

.field legacySyntax:Z

.field private nameExp:Lfreemarker/core/Expression;

.field private namedArgs:Ljava/util/Map;

.field private positionalArgs:Ljava/util/List;

.field private volatile transient sortedNamedArgsCache:Ljava/lang/ref/SoftReference;


# direct methods
.method constructor <init>(Lfreemarker/core/Expression;Ljava/util/List;Lfreemarker/core/TemplateElement;Ljava/util/List;)V
    .registers 6
    .param p1, "nameExp"    # Lfreemarker/core/Expression;
    .param p2, "positionalArgs"    # Ljava/util/List;
    .param p3, "nestedBlock"    # Lfreemarker/core/TemplateElement;
    .param p4, "bodyParameterNames"    # Ljava/util/List;

    .prologue
    .line 95
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 96
    iput-object p1, p0, Lfreemarker/core/UnifiedCall;->nameExp:Lfreemarker/core/Expression;

    .line 97
    iput-object p2, p0, Lfreemarker/core/UnifiedCall;->positionalArgs:Ljava/util/List;

    .line 98
    sget-object v0, Lfreemarker/core/TextBlock;->EMPTY_BLOCK:Lfreemarker/core/TextBlock;

    if-ne p3, v0, :cond_c

    .line 99
    const/4 p3, 0x0

    .line 101
    :cond_c
    iput-object p3, p0, Lfreemarker/core/UnifiedCall;->nestedBlock:Lfreemarker/core/TemplateElement;

    .line 102
    iput-object p4, p0, Lfreemarker/core/UnifiedCall;->bodyParameterNames:Ljava/util/List;

    .line 103
    return-void
.end method

.method constructor <init>(Lfreemarker/core/Expression;Ljava/util/Map;Lfreemarker/core/TemplateElement;Ljava/util/List;)V
    .registers 5
    .param p1, "nameExp"    # Lfreemarker/core/Expression;
    .param p2, "namedArgs"    # Ljava/util/Map;
    .param p3, "nestedBlock"    # Lfreemarker/core/TemplateElement;
    .param p4, "bodyParameterNames"    # Ljava/util/List;

    .prologue
    .line 84
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 85
    iput-object p1, p0, Lfreemarker/core/UnifiedCall;->nameExp:Lfreemarker/core/Expression;

    .line 86
    iput-object p2, p0, Lfreemarker/core/UnifiedCall;->namedArgs:Ljava/util/Map;

    .line 87
    iput-object p3, p0, Lfreemarker/core/UnifiedCall;->nestedBlock:Lfreemarker/core/TemplateElement;

    .line 88
    iput-object p4, p0, Lfreemarker/core/UnifiedCall;->bodyParameterNames:Ljava/util/List;

    .line 89
    return-void
.end method

.method private getSortedNamedArgs()Ljava/util/List;
    .registers 5

    .prologue
    .line 265
    iget-object v0, p0, Lfreemarker/core/UnifiedCall;->sortedNamedArgsCache:Ljava/lang/ref/SoftReference;

    .line 266
    .local v0, "ref":Ljava/lang/ref/Reference;
    if-eqz v0, :cond_e

    .line 267
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 268
    .local v1, "res":Ljava/util/List;
    if-eqz v1, :cond_e

    move-object v2, v1

    .line 273
    .end local v1    # "res":Ljava/util/List;
    .local v2, "res":Ljava/util/List;
    :goto_d
    return-object v2

    .line 271
    .end local v2    # "res":Ljava/util/List;
    :cond_e
    iget-object v3, p0, Lfreemarker/core/UnifiedCall;->namedArgs:Ljava/util/Map;

    invoke-static {v3}, Lfreemarker/core/MiscUtil;->sortMapOfExpressions(Ljava/util/Map;)Ljava/util/List;

    move-result-object v1

    .line 272
    .restart local v1    # "res":Ljava/util/List;
    new-instance v3, Ljava/lang/ref/SoftReference;

    invoke-direct {v3, v1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v3, p0, Lfreemarker/core/UnifiedCall;->sortedNamedArgsCache:Ljava/lang/ref/SoftReference;

    move-object v2, v1

    .line 273
    .end local v1    # "res":Ljava/util/List;
    .restart local v2    # "res":Ljava/util/List;
    goto :goto_d
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 16
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    iget-object v0, p0, Lfreemarker/core/UnifiedCall;->nameExp:Lfreemarker/core/Expression;

    invoke-virtual {v0, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v11

    .line 107
    .local v11, "tm":Lfreemarker/template/TemplateModel;
    sget-object v0, Lfreemarker/core/Macro;->DO_NOTHING_MACRO:Lfreemarker/core/Macro;

    if-ne v11, v0, :cond_b

    .line 149
    .end local v11    # "tm":Lfreemarker/template/TemplateModel;
    :goto_a
    return-void

    .line 108
    .restart local v11    # "tm":Lfreemarker/template/TemplateModel;
    :cond_b
    instance-of v0, v11, Lfreemarker/core/Macro;

    if-eqz v0, :cond_50

    move-object v1, v11

    .line 109
    check-cast v1, Lfreemarker/core/Macro;

    .line 110
    .local v1, "macro":Lfreemarker/core/Macro;
    iget-boolean v0, v1, Lfreemarker/core/Macro;->isFunction:Z

    if-eqz v0, :cond_43

    iget-boolean v0, p0, Lfreemarker/core/UnifiedCall;->legacySyntax:Z

    if-nez v0, :cond_43

    .line 111
    new-instance v0, Lfreemarker/core/_MiscTemplateException;

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "Routine "

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Lfreemarker/core/_DelayedJQuote;

    invoke-virtual {v1}, Lfreemarker/core/Macro;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, " is a function, not a directive. Functions can only be called from expressions, like in ${f()}, ${x + f()} or "

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string v4, "<@someDirective someParam=f() />"

    aput-object v4, v2, v3

    const/4 v3, 0x4

    const-string v4, "."

    aput-object v4, v2, v3

    invoke-direct {v0, p1, v2}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v0

    .line 116
    :cond_43
    iget-object v2, p0, Lfreemarker/core/UnifiedCall;->namedArgs:Ljava/util/Map;

    iget-object v3, p0, Lfreemarker/core/UnifiedCall;->positionalArgs:Ljava/util/List;

    iget-object v4, p0, Lfreemarker/core/UnifiedCall;->bodyParameterNames:Ljava/util/List;

    iget-object v5, p0, Lfreemarker/core/UnifiedCall;->nestedBlock:Lfreemarker/core/TemplateElement;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Lfreemarker/core/Environment;->visit(Lfreemarker/core/Macro;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Lfreemarker/core/TemplateElement;)V

    goto :goto_a

    .line 120
    .end local v1    # "macro":Lfreemarker/core/Macro;
    :cond_50
    instance-of v8, v11, Lfreemarker/template/TemplateDirectiveModel;

    .line 121
    .local v8, "isDirectiveModel":Z
    if-nez v8, :cond_58

    instance-of v0, v11, Lfreemarker/template/TemplateTransformModel;

    if-eqz v0, :cond_ab

    .line 123
    :cond_58
    iget-object v0, p0, Lfreemarker/core/UnifiedCall;->namedArgs:Ljava/util/Map;

    if-eqz v0, :cond_93

    iget-object v0, p0, Lfreemarker/core/UnifiedCall;->namedArgs:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_93

    .line 124
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 125
    .local v6, "args":Ljava/util/Map;
    iget-object v0, p0, Lfreemarker/core/UnifiedCall;->namedArgs:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "it":Ljava/util/Iterator;
    :goto_73
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_95

    .line 126
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    .line 127
    .local v7, "entry":Ljava/util/Map$Entry;
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 128
    .local v10, "key":Ljava/lang/String;
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lfreemarker/core/Expression;

    .line 129
    .local v13, "valueExp":Lfreemarker/core/Expression;
    invoke-virtual {v13, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v12

    .line 130
    .local v12, "value":Lfreemarker/template/TemplateModel;
    invoke-interface {v6, v10, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_73

    .line 133
    .end local v6    # "args":Ljava/util/Map;
    .end local v7    # "entry":Ljava/util/Map$Entry;
    .end local v9    # "it":Ljava/util/Iterator;
    .end local v10    # "key":Ljava/lang/String;
    .end local v12    # "value":Lfreemarker/template/TemplateModel;
    .end local v13    # "valueExp":Lfreemarker/core/Expression;
    :cond_93
    sget-object v6, Lfreemarker/template/EmptyMap;->instance:Lfreemarker/template/EmptyMap;

    .line 135
    .restart local v6    # "args":Ljava/util/Map;
    :cond_95
    if-eqz v8, :cond_a2

    .line 136
    iget-object v0, p0, Lfreemarker/core/UnifiedCall;->nestedBlock:Lfreemarker/core/TemplateElement;

    check-cast v11, Lfreemarker/template/TemplateDirectiveModel;

    .end local v11    # "tm":Lfreemarker/template/TemplateModel;
    iget-object v2, p0, Lfreemarker/core/UnifiedCall;->bodyParameterNames:Ljava/util/List;

    invoke-virtual {p1, v0, v11, v6, v2}, Lfreemarker/core/Environment;->visit(Lfreemarker/core/TemplateElement;Lfreemarker/template/TemplateDirectiveModel;Ljava/util/Map;Ljava/util/List;)V

    goto/16 :goto_a

    .line 140
    .restart local v11    # "tm":Lfreemarker/template/TemplateModel;
    :cond_a2
    iget-object v0, p0, Lfreemarker/core/UnifiedCall;->nestedBlock:Lfreemarker/core/TemplateElement;

    check-cast v11, Lfreemarker/template/TemplateTransformModel;

    .end local v11    # "tm":Lfreemarker/template/TemplateModel;
    invoke-virtual {p1, v0, v11, v6}, Lfreemarker/core/Environment;->visitAndTransform(Lfreemarker/core/TemplateElement;Lfreemarker/template/TemplateTransformModel;Ljava/util/Map;)V

    goto/16 :goto_a

    .line 143
    .end local v6    # "args":Ljava/util/Map;
    .restart local v11    # "tm":Lfreemarker/template/TemplateModel;
    :cond_ab
    if-nez v11, :cond_b4

    .line 144
    iget-object v0, p0, Lfreemarker/core/UnifiedCall;->nameExp:Lfreemarker/core/Expression;

    invoke-static {v0, p1}, Lfreemarker/core/InvalidReferenceException;->getInstance(Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Lfreemarker/core/InvalidReferenceException;

    move-result-object v0

    throw v0

    .line 146
    :cond_b4
    new-instance v0, Lfreemarker/core/UnexpectedTypeException;

    iget-object v2, p0, Lfreemarker/core/UnifiedCall;->nameExp:Lfreemarker/core/Expression;

    const-string v3, "user-defined directive (macro, etc.)"

    invoke-direct {v0, v2, v11, v3, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v0
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 12
    .param p1, "canonical"    # Z

    .prologue
    const/16 v9, 0x3e

    const/16 v8, 0x20

    .line 152
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    .line 153
    .local v5, "sb":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_10

    const/16 v6, 0x3c

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 154
    :cond_10
    const/16 v6, 0x40

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 155
    iget-object v6, p0, Lfreemarker/core/UnifiedCall;->nameExp:Lfreemarker/core/Expression;

    invoke-static {v5, v6}, Lfreemarker/core/MessageUtil;->appendExpressionAsUntearable(Ljava/lang/StringBuffer;Lfreemarker/core/Expression;)Ljava/lang/StringBuffer;

    .line 156
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v6

    const/16 v7, 0x29

    if-ne v6, v7, :cond_52

    const/4 v4, 0x1

    .line 157
    .local v4, "nameIsInParen":Z
    :goto_29
    iget-object v6, p0, Lfreemarker/core/UnifiedCall;->positionalArgs:Ljava/util/List;

    if-eqz v6, :cond_54

    .line 158
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2e
    iget-object v6, p0, Lfreemarker/core/UnifiedCall;->positionalArgs:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v3, v6, :cond_80

    .line 159
    iget-object v6, p0, Lfreemarker/core/UnifiedCall;->positionalArgs:Ljava/util/List;

    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/Expression;

    .line 160
    .local v0, "argExp":Lfreemarker/core/Expression;
    if-eqz v3, :cond_45

    .line 161
    const/16 v6, 0x2c

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 163
    :cond_45
    invoke-virtual {v5, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 164
    invoke-virtual {v0}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 158
    add-int/lit8 v3, v3, 0x1

    goto :goto_2e

    .line 156
    .end local v0    # "argExp":Lfreemarker/core/Expression;
    .end local v3    # "i":I
    .end local v4    # "nameIsInParen":Z
    :cond_52
    const/4 v4, 0x0

    goto :goto_29

    .line 167
    .restart local v4    # "nameIsInParen":Z
    :cond_54
    invoke-direct {p0}, Lfreemarker/core/UnifiedCall;->getSortedNamedArgs()Ljava/util/List;

    move-result-object v1

    .line 168
    .local v1, "entries":Ljava/util/List;
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_59
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v6

    if-ge v3, v6, :cond_80

    .line 169
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 170
    .local v2, "entry":Ljava/util/Map$Entry;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/Expression;

    .line 171
    .restart local v0    # "argExp":Lfreemarker/core/Expression;
    invoke-virtual {v5, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 172
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 173
    const/16 v6, 0x3d

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 174
    invoke-static {v5, v0}, Lfreemarker/core/MessageUtil;->appendExpressionAsUntearable(Ljava/lang/StringBuffer;Lfreemarker/core/Expression;)Ljava/lang/StringBuffer;

    .line 168
    add-int/lit8 v3, v3, 0x1

    goto :goto_59

    .line 177
    .end local v0    # "argExp":Lfreemarker/core/Expression;
    .end local v1    # "entries":Ljava/util/List;
    .end local v2    # "entry":Ljava/util/Map$Entry;
    :cond_80
    if-eqz p1, :cond_8b

    .line 178
    iget-object v6, p0, Lfreemarker/core/UnifiedCall;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-nez v6, :cond_90

    .line 179
    const-string v6, "/>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 193
    :cond_8b
    :goto_8b
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 182
    :cond_90
    invoke-virtual {v5, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 183
    iget-object v6, p0, Lfreemarker/core/UnifiedCall;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v6}, Lfreemarker/core/TemplateElement;->getCanonicalForm()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 184
    const-string v6, "</@"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 185
    if-nez v4, :cond_c2

    iget-object v6, p0, Lfreemarker/core/UnifiedCall;->nameExp:Lfreemarker/core/Expression;

    instance-of v6, v6, Lfreemarker/core/Identifier;

    if-nez v6, :cond_b9

    iget-object v6, p0, Lfreemarker/core/UnifiedCall;->nameExp:Lfreemarker/core/Expression;

    instance-of v6, v6, Lfreemarker/core/Dot;

    if-eqz v6, :cond_c2

    iget-object v6, p0, Lfreemarker/core/UnifiedCall;->nameExp:Lfreemarker/core/Expression;

    check-cast v6, Lfreemarker/core/Dot;

    invoke-virtual {v6}, Lfreemarker/core/Dot;->onlyHasIdentifiers()Z

    move-result v6

    if-eqz v6, :cond_c2

    .line 188
    :cond_b9
    iget-object v6, p0, Lfreemarker/core/UnifiedCall;->nameExp:Lfreemarker/core/Expression;

    invoke-virtual {v6}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 190
    :cond_c2
    invoke-virtual {v5, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_8b
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 197
    const-string v0, "@"

    return-object v0
.end method

.method getParameterCount()I
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 201
    iget-object v0, p0, Lfreemarker/core/UnifiedCall;->positionalArgs:Ljava/util/List;

    if-eqz v0, :cond_26

    iget-object v0, p0, Lfreemarker/core/UnifiedCall;->positionalArgs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_b
    add-int/lit8 v2, v0, 0x1

    iget-object v0, p0, Lfreemarker/core/UnifiedCall;->namedArgs:Ljava/util/Map;

    if-eqz v0, :cond_28

    iget-object v0, p0, Lfreemarker/core/UnifiedCall;->namedArgs:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    :goto_19
    add-int/2addr v0, v2

    iget-object v2, p0, Lfreemarker/core/UnifiedCall;->bodyParameterNames:Ljava/util/List;

    if-eqz v2, :cond_24

    iget-object v1, p0, Lfreemarker/core/UnifiedCall;->bodyParameterNames:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    :cond_24
    add-int/2addr v0, v1

    return v0

    :cond_26
    move v0, v1

    goto :goto_b

    :cond_28
    move v0, v1

    goto :goto_19
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 8
    .param p1, "idx"    # I

    .prologue
    const/4 v1, 0x0

    .line 235
    if-nez p1, :cond_6

    .line 236
    sget-object v4, Lfreemarker/core/ParameterRole;->CALLEE:Lfreemarker/core/ParameterRole;

    .line 251
    :goto_5
    return-object v4

    .line 238
    :cond_6
    const/4 v0, 0x1

    .line 239
    .local v0, "base":I
    iget-object v4, p0, Lfreemarker/core/UnifiedCall;->positionalArgs:Ljava/util/List;

    if-eqz v4, :cond_18

    iget-object v4, p0, Lfreemarker/core/UnifiedCall;->positionalArgs:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .line 240
    .local v3, "positionalArgsSize":I
    :goto_11
    sub-int v4, p1, v0

    if-ge v4, v3, :cond_1a

    .line 241
    sget-object v4, Lfreemarker/core/ParameterRole;->ARGUMENT_VALUE:Lfreemarker/core/ParameterRole;

    goto :goto_5

    .end local v3    # "positionalArgsSize":I
    :cond_18
    move v3, v1

    .line 239
    goto :goto_11

    .line 243
    .restart local v3    # "positionalArgsSize":I
    :cond_1a
    add-int/2addr v0, v3

    .line 244
    iget-object v4, p0, Lfreemarker/core/UnifiedCall;->namedArgs:Ljava/util/Map;

    if-eqz v4, :cond_34

    iget-object v4, p0, Lfreemarker/core/UnifiedCall;->namedArgs:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v2

    .line 245
    .local v2, "namedArgsSize":I
    :goto_25
    sub-int v4, p1, v0

    mul-int/lit8 v5, v2, 0x2

    if-ge v4, v5, :cond_39

    .line 246
    sub-int v4, p1, v0

    rem-int/lit8 v4, v4, 0x2

    if-nez v4, :cond_36

    sget-object v4, Lfreemarker/core/ParameterRole;->ARGUMENT_NAME:Lfreemarker/core/ParameterRole;

    goto :goto_5

    .end local v2    # "namedArgsSize":I
    :cond_34
    move v2, v1

    .line 244
    goto :goto_25

    .line 246
    .restart local v2    # "namedArgsSize":I
    :cond_36
    sget-object v4, Lfreemarker/core/ParameterRole;->ARGUMENT_VALUE:Lfreemarker/core/ParameterRole;

    goto :goto_5

    .line 248
    :cond_39
    mul-int/lit8 v4, v2, 0x2

    add-int/2addr v0, v4

    .line 249
    iget-object v4, p0, Lfreemarker/core/UnifiedCall;->bodyParameterNames:Ljava/util/List;

    if-eqz v4, :cond_46

    iget-object v4, p0, Lfreemarker/core/UnifiedCall;->bodyParameterNames:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v1

    .line 250
    .local v1, "bodyParameterNamesSize":I
    :cond_46
    sub-int v4, p1, v0

    if-ge v4, v1, :cond_4d

    .line 251
    sget-object v4, Lfreemarker/core/ParameterRole;->TARGET_LOOP_VARIABLE:Lfreemarker/core/ParameterRole;

    goto :goto_5

    .line 253
    :cond_4d
    new-instance v4, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v4}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v4
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 9
    .param p1, "idx"    # I

    .prologue
    const/4 v1, 0x0

    .line 208
    if-nez p1, :cond_6

    .line 209
    iget-object v5, p0, Lfreemarker/core/UnifiedCall;->nameExp:Lfreemarker/core/Expression;

    .line 225
    :goto_5
    return-object v5

    .line 211
    :cond_6
    const/4 v0, 0x1

    .line 212
    .local v0, "base":I
    iget-object v5, p0, Lfreemarker/core/UnifiedCall;->positionalArgs:Ljava/util/List;

    if-eqz v5, :cond_1e

    iget-object v5, p0, Lfreemarker/core/UnifiedCall;->positionalArgs:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v4

    .line 213
    .local v4, "positionalArgsSize":I
    :goto_11
    sub-int v5, p1, v0

    if-ge v5, v4, :cond_20

    .line 214
    iget-object v5, p0, Lfreemarker/core/UnifiedCall;->positionalArgs:Ljava/util/List;

    sub-int v6, p1, v0

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    goto :goto_5

    .end local v4    # "positionalArgsSize":I
    :cond_1e
    move v4, v1

    .line 212
    goto :goto_11

    .line 216
    .restart local v4    # "positionalArgsSize":I
    :cond_20
    add-int/2addr v0, v4

    .line 217
    iget-object v5, p0, Lfreemarker/core/UnifiedCall;->namedArgs:Ljava/util/Map;

    if-eqz v5, :cond_4a

    iget-object v5, p0, Lfreemarker/core/UnifiedCall;->namedArgs:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->size()I

    move-result v3

    .line 218
    .local v3, "namedArgsSize":I
    :goto_2b
    sub-int v5, p1, v0

    mul-int/lit8 v6, v3, 0x2

    if-ge v5, v6, :cond_51

    .line 219
    invoke-direct {p0}, Lfreemarker/core/UnifiedCall;->getSortedNamedArgs()Ljava/util/List;

    move-result-object v5

    sub-int v6, p1, v0

    div-int/lit8 v6, v6, 0x2

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 220
    .local v2, "namedArg":Ljava/util/Map$Entry;
    sub-int v5, p1, v0

    rem-int/lit8 v5, v5, 0x2

    if-nez v5, :cond_4c

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    goto :goto_5

    .end local v2    # "namedArg":Ljava/util/Map$Entry;
    .end local v3    # "namedArgsSize":I
    :cond_4a
    move v3, v1

    .line 217
    goto :goto_2b

    .line 220
    .restart local v2    # "namedArg":Ljava/util/Map$Entry;
    .restart local v3    # "namedArgsSize":I
    :cond_4c
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    goto :goto_5

    .line 222
    .end local v2    # "namedArg":Ljava/util/Map$Entry;
    :cond_51
    mul-int/lit8 v5, v3, 0x2

    add-int/2addr v0, v5

    .line 223
    iget-object v5, p0, Lfreemarker/core/UnifiedCall;->bodyParameterNames:Ljava/util/List;

    if-eqz v5, :cond_5e

    iget-object v5, p0, Lfreemarker/core/UnifiedCall;->bodyParameterNames:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v1

    .line 224
    .local v1, "bodyParameterNamesSize":I
    :cond_5e
    sub-int v5, p1, v0

    if-ge v5, v1, :cond_6b

    .line 225
    iget-object v5, p0, Lfreemarker/core/UnifiedCall;->bodyParameterNames:Ljava/util/List;

    sub-int v6, p1, v0

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    goto :goto_5

    .line 227
    :cond_6b
    new-instance v5, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v5}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v5
.end method
