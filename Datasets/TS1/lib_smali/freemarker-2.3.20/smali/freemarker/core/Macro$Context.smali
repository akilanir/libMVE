.class Lfreemarker/core/Macro$Context;
.super Ljava/lang/Object;
.source "Macro.java"

# interfaces
.implements Lfreemarker/core/LocalContext;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/Macro;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Context"
.end annotation


# instance fields
.field body:Lfreemarker/core/TemplateElement;

.field bodyNamespace:Lfreemarker/core/Environment$Namespace;

.field bodyParameterNames:Ljava/util/List;

.field localVars:Lfreemarker/core/Environment$Namespace;

.field prevLocalContextStack:Ljava/util/ArrayList;

.field prevMacroContext:Lfreemarker/core/Macro$Context;

.field private final this$0:Lfreemarker/core/Macro;


# direct methods
.method constructor <init>(Lfreemarker/core/Macro;Lfreemarker/core/Environment;Lfreemarker/core/TemplateElement;Ljava/util/List;)V
    .registers 6
    .param p2, "env"    # Lfreemarker/core/Environment;
    .param p3, "body"    # Lfreemarker/core/TemplateElement;
    .param p4, "bodyParameterNames"    # Ljava/util/List;

    .prologue
    .line 191
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/Macro$Context;->this$0:Lfreemarker/core/Macro;

    .line 192
    new-instance v0, Lfreemarker/core/Environment$Namespace;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v0, p2}, Lfreemarker/core/Environment$Namespace;-><init>(Lfreemarker/core/Environment;)V

    iput-object v0, p0, Lfreemarker/core/Macro$Context;->localVars:Lfreemarker/core/Environment$Namespace;

    .line 193
    invoke-virtual {p2}, Lfreemarker/core/Environment;->getCurrentMacroContext()Lfreemarker/core/Macro$Context;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/Macro$Context;->prevMacroContext:Lfreemarker/core/Macro$Context;

    .line 194
    invoke-virtual {p2}, Lfreemarker/core/Environment;->getCurrentNamespace()Lfreemarker/core/Environment$Namespace;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/Macro$Context;->bodyNamespace:Lfreemarker/core/Environment$Namespace;

    .line 195
    invoke-virtual {p2}, Lfreemarker/core/Environment;->getLocalContextStack()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/Macro$Context;->prevLocalContextStack:Ljava/util/ArrayList;

    .line 196
    iput-object p3, p0, Lfreemarker/core/Macro$Context;->body:Lfreemarker/core/TemplateElement;

    .line 197
    iput-object p4, p0, Lfreemarker/core/Macro$Context;->bodyParameterNames:Ljava/util/List;

    .line 198
    return-void
.end method


# virtual methods
.method public getLocalVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 287
    iget-object v0, p0, Lfreemarker/core/Macro$Context;->localVars:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v0, p1}, Lfreemarker/core/Environment$Namespace;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    return-object v0
.end method

.method public getLocalVariableNames()Ljava/util/Collection;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 302
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 303
    .local v1, "result":Ljava/util/HashSet;
    iget-object v2, p0, Lfreemarker/core/Macro$Context;->localVars:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v2}, Lfreemarker/core/Environment$Namespace;->keys()Lfreemarker/template/TemplateCollectionModel;

    move-result-object v2

    invoke-interface {v2}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v0

    .local v0, "it":Lfreemarker/template/TemplateModelIterator;
    :goto_f
    invoke-interface {v0}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_21

    .line 304
    invoke-interface {v0}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_f

    .line 306
    :cond_21
    return-object v1
.end method

.method getLocals()Lfreemarker/core/Environment$Namespace;
    .registers 2

    .prologue
    .line 291
    iget-object v0, p0, Lfreemarker/core/Macro$Context;->localVars:Lfreemarker/core/Environment$Namespace;

    return-object v0
.end method

.method getMacro()Lfreemarker/core/Macro;
    .registers 2

    .prologue
    .line 202
    iget-object v0, p0, Lfreemarker/core/Macro$Context;->this$0:Lfreemarker/core/Macro;

    return-object v0
.end method

.method runMacro(Lfreemarker/core/Environment;)V
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 206
    invoke-virtual {p0, p1}, Lfreemarker/core/Macro$Context;->sanityCheck(Lfreemarker/core/Environment;)V

    .line 208
    iget-object v0, p0, Lfreemarker/core/Macro$Context;->this$0:Lfreemarker/core/Macro;

    iget-object v0, v0, Lfreemarker/core/Macro;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v0, :cond_10

    .line 209
    iget-object v0, p0, Lfreemarker/core/Macro$Context;->this$0:Lfreemarker/core/Macro;

    iget-object v0, v0, Lfreemarker/core/Macro;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {p1, v0}, Lfreemarker/core/Environment;->visit(Lfreemarker/core/TemplateElement;)V

    .line 211
    :cond_10
    return-void
.end method

.method sanityCheck(Lfreemarker/core/Environment;)V
    .registers 19
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 219
    :cond_0
    const/4 v5, 0x0

    .line 220
    .local v5, "firstUnresolvedExpression":Lfreemarker/core/Expression;
    const/4 v4, 0x0

    .line 221
    .local v4, "firstReferenceException":Lfreemarker/core/InvalidReferenceException;
    const/4 v6, 0x0

    .local v6, "hasUnresolvedArg":Z
    move v8, v6

    .line 222
    .local v8, "resolvedAnArg":I
    const/4 v7, 0x0

    .end local v8    # "resolvedAnArg":I
    .local v7, "i":I
    :goto_5
    move-object/from16 v0, p0

    iget-object v11, v0, Lfreemarker/core/Macro$Context;->this$0:Lfreemarker/core/Macro;

    invoke-static {v11}, Lfreemarker/core/Macro;->access$000(Lfreemarker/core/Macro;)[Ljava/lang/String;

    move-result-object v11

    array-length v11, v11

    if-ge v7, v11, :cond_d4

    .line 223
    move-object/from16 v0, p0

    iget-object v11, v0, Lfreemarker/core/Macro$Context;->this$0:Lfreemarker/core/Macro;

    invoke-static {v11}, Lfreemarker/core/Macro;->access$000(Lfreemarker/core/Macro;)[Ljava/lang/String;

    move-result-object v11

    aget-object v1, v11, v7

    .line 224
    .local v1, "argName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v11, v0, Lfreemarker/core/Macro$Context;->localVars:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v11, v1}, Lfreemarker/core/Environment$Namespace;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v11

    if-nez v11, :cond_40

    .line 225
    move-object/from16 v0, p0

    iget-object v11, v0, Lfreemarker/core/Macro$Context;->this$0:Lfreemarker/core/Macro;

    invoke-static {v11}, Lfreemarker/core/Macro;->access$100(Lfreemarker/core/Macro;)Ljava/util/Map;

    move-result-object v11

    invoke-interface {v11, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lfreemarker/core/Expression;

    .line 226
    .local v10, "valueExp":Lfreemarker/core/Expression;
    if-eqz v10, :cond_52

    .line 228
    :try_start_34
    move-object/from16 v0, p1

    invoke-virtual {v10, v0}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v9

    .line 229
    .local v9, "tm":Lfreemarker/template/TemplateModel;
    if-nez v9, :cond_43

    .line 230
    if-nez v6, :cond_40

    .line 231
    move-object v5, v10

    .line 232
    const/4 v6, 0x1

    .line 222
    .end local v9    # "tm":Lfreemarker/template/TemplateModel;
    .end local v10    # "valueExp":Lfreemarker/core/Expression;
    :cond_40
    :goto_40
    add-int/lit8 v7, v7, 0x1

    goto :goto_5

    .line 236
    .restart local v9    # "tm":Lfreemarker/template/TemplateModel;
    .restart local v10    # "valueExp":Lfreemarker/core/Expression;
    :cond_43
    move-object/from16 v0, p0

    iget-object v11, v0, Lfreemarker/core/Macro$Context;->localVars:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v11, v1, v9}, Lfreemarker/core/Environment$Namespace;->put(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_4a
    .catch Lfreemarker/core/InvalidReferenceException; {:try_start_34 .. :try_end_4a} :catch_4c

    .line 237
    const/4 v8, 0x1

    .local v8, "resolvedAnArg":Z
    goto :goto_40

    .line 240
    .end local v8    # "resolvedAnArg":Z
    .end local v9    # "tm":Lfreemarker/template/TemplateModel;
    :catch_4c
    move-exception v3

    .line 241
    .local v3, "e":Lfreemarker/core/InvalidReferenceException;
    if-nez v6, :cond_40

    .line 242
    const/4 v6, 0x1

    .line 243
    move-object v4, v3

    goto :goto_40

    .line 247
    .end local v3    # "e":Lfreemarker/core/InvalidReferenceException;
    :cond_52
    invoke-virtual/range {p1 .. p1}, Lfreemarker/core/Environment;->isClassicCompatible()Z

    move-result v11

    if-nez v11, :cond_40

    .line 248
    move-object/from16 v0, p0

    iget-object v11, v0, Lfreemarker/core/Macro$Context;->localVars:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v11, v1}, Lfreemarker/core/Environment$Namespace;->containsKey(Ljava/lang/String;)Z

    move-result v2

    .line 249
    .local v2, "argWasSpecified":Z
    new-instance v12, Lfreemarker/core/_MiscTemplateException;

    new-instance v13, Lfreemarker/core/_ErrorDescriptionBuilder;

    const/16 v11, 0x8

    new-array v14, v11, [Ljava/lang/Object;

    const/4 v11, 0x0

    const-string v15, "When calling macro "

    aput-object v15, v14, v11

    const/4 v11, 0x1

    new-instance v15, Lfreemarker/core/_DelayedJQuote;

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/Macro$Context;->this$0:Lfreemarker/core/Macro;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lfreemarker/core/Macro;->access$200(Lfreemarker/core/Macro;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    aput-object v15, v14, v11

    const/4 v11, 0x2

    const-string v15, ", required parameter "

    aput-object v15, v14, v11

    const/4 v11, 0x3

    new-instance v15, Lfreemarker/core/_DelayedJQuote;

    invoke-direct {v15, v1}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    aput-object v15, v14, v11

    const/4 v11, 0x4

    const-string v15, " (parameter #"

    aput-object v15, v14, v11

    const/4 v11, 0x5

    new-instance v15, Ljava/lang/Integer;

    add-int/lit8 v16, v7, 0x1

    invoke-direct/range {v15 .. v16}, Ljava/lang/Integer;-><init>(I)V

    aput-object v15, v14, v11

    const/4 v11, 0x6

    const-string v15, ") was "

    aput-object v15, v14, v11

    const/4 v15, 0x7

    if-eqz v2, :cond_be

    const-string v11, "specified, but had null/missing value."

    :goto_a5
    aput-object v11, v14, v15

    invoke-direct {v13, v14}, Lfreemarker/core/_ErrorDescriptionBuilder;-><init>([Ljava/lang/Object;)V

    if-eqz v2, :cond_c1

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v14, 0x0

    const-string v15, "If the parameter value expression on the caller side is known to be legally null/missing, you may want to specify a default value for it with the \"!\" operator, like paramValue!defaultValue."

    aput-object v15, v11, v14

    :goto_b4
    invoke-virtual {v13, v11}, Lfreemarker/core/_ErrorDescriptionBuilder;->tip([Ljava/lang/Object;)Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v11

    move-object/from16 v0, p1

    invoke-direct {v12, v0, v11}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;)V

    throw v12

    :cond_be
    const-string v11, "not specified."

    goto :goto_a5

    :cond_c1
    const/4 v11, 0x3

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v14, 0x0

    const-string v15, "If the omission was deliberate, you may consider making the parameter optional in the macro by specifying a default value for it, like "

    aput-object v15, v11, v14

    const/4 v14, 0x1

    const-string v15, "<#macro macroName paramName=defaultExpr>"

    aput-object v15, v11, v14

    const/4 v14, 0x2

    const-string v15, ")"

    aput-object v15, v11, v14

    goto :goto_b4

    .line 272
    .end local v1    # "argName":Ljava/lang/String;
    .end local v2    # "argWasSpecified":Z
    .end local v10    # "valueExp":Lfreemarker/core/Expression;
    :cond_d4
    if-eqz v8, :cond_d8

    if-nez v6, :cond_0

    .line 273
    :cond_d8
    if-eqz v6, :cond_ea

    .line 274
    if-eqz v4, :cond_dd

    .line 275
    throw v4

    .line 276
    :cond_dd
    invoke-virtual/range {p1 .. p1}, Lfreemarker/core/Environment;->isClassicCompatible()Z

    move-result v11

    if-nez v11, :cond_ea

    .line 277
    move-object/from16 v0, p1

    invoke-static {v5, v0}, Lfreemarker/core/InvalidReferenceException;->getInstance(Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Lfreemarker/core/InvalidReferenceException;

    move-result-object v11

    throw v11

    .line 280
    :cond_ea
    return-void
.end method

.method setLocalVar(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "var"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 298
    iget-object v0, p0, Lfreemarker/core/Macro$Context;->localVars:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v0, p1, p2}, Lfreemarker/core/Environment$Namespace;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 299
    return-void
.end method
