.class public abstract Lfreemarker/core/Expression;
.super Lfreemarker/core/TemplateObject;
.source "Expression.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/Expression$ReplacemenetState;
    }
.end annotation


# instance fields
.field constantValue:Lfreemarker/template/TemplateModel;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 72
    invoke-direct {p0}, Lfreemarker/core/TemplateObject;-><init>()V

    .line 166
    return-void
.end method

.method static coerceModelToString(Lfreemarker/template/TemplateModel;Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Ljava/lang/String;
    .registers 4
    .param p0, "tm"    # Lfreemarker/template/TemplateModel;
    .param p1, "exp"    # Lfreemarker/core/Expression;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 126
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, p2}, Lfreemarker/core/EvalUtil;->coerceModelToString(Lfreemarker/template/TemplateModel;Lfreemarker/core/Expression;Ljava/lang/String;Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static isEmpty(Lfreemarker/template/TemplateModel;)Z
    .registers 5
    .param p0, "model"    # Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 182
    instance-of v3, p0, Lfreemarker/ext/beans/BeanModel;

    if-eqz v3, :cond_d

    .line 183
    check-cast p0, Lfreemarker/ext/beans/BeanModel;

    .end local p0    # "model":Lfreemarker/template/TemplateModel;
    invoke-virtual {p0}, Lfreemarker/ext/beans/BeanModel;->isEmpty()Z

    move-result v1

    .line 200
    .restart local p0    # "model":Lfreemarker/template/TemplateModel;
    :cond_c
    :goto_c
    return v1

    .line 184
    :cond_d
    instance-of v3, p0, Lfreemarker/template/TemplateSequenceModel;

    if-eqz v3, :cond_1b

    .line 185
    check-cast p0, Lfreemarker/template/TemplateSequenceModel;

    .end local p0    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {p0}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v3

    if-eqz v3, :cond_c

    move v1, v2

    goto :goto_c

    .line 186
    .restart local p0    # "model":Lfreemarker/template/TemplateModel;
    :cond_1b
    instance-of v3, p0, Lfreemarker/template/TemplateScalarModel;

    if-eqz v3, :cond_30

    .line 187
    check-cast p0, Lfreemarker/template/TemplateScalarModel;

    .end local p0    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {p0}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v0

    .line 188
    .local v0, "s":Ljava/lang/String;
    if-eqz v0, :cond_2d

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_2e

    :cond_2d
    move v2, v1

    :cond_2e
    move v1, v2

    goto :goto_c

    .line 189
    .end local v0    # "s":Ljava/lang/String;
    .restart local p0    # "model":Lfreemarker/template/TemplateModel;
    :cond_30
    if-eqz p0, :cond_c

    .line 191
    instance-of v3, p0, Lfreemarker/template/TemplateCollectionModel;

    if-eqz v3, :cond_44

    .line 192
    check-cast p0, Lfreemarker/template/TemplateCollectionModel;

    .end local p0    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {p0}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v3

    invoke-interface {v3}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_c

    move v1, v2

    goto :goto_c

    .line 193
    .restart local p0    # "model":Lfreemarker/template/TemplateModel;
    :cond_44
    instance-of v3, p0, Lfreemarker/template/TemplateHashModel;

    if-eqz v3, :cond_4f

    .line 194
    check-cast p0, Lfreemarker/template/TemplateHashModel;

    .end local p0    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {p0}, Lfreemarker/template/TemplateHashModel;->isEmpty()Z

    move-result v1

    goto :goto_c

    .line 195
    .restart local p0    # "model":Lfreemarker/template/TemplateModel;
    :cond_4f
    instance-of v3, p0, Lfreemarker/template/TemplateNumberModel;

    if-nez v3, :cond_5b

    instance-of v3, p0, Lfreemarker/template/TemplateDateModel;

    if-nez v3, :cond_5b

    instance-of v3, p0, Lfreemarker/template/TemplateBooleanModel;

    if-eqz v3, :cond_c

    :cond_5b
    move v1, v2

    .line 198
    goto :goto_c
.end method


# virtual methods
.method abstract _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation
.end method

.method assertNonNull(Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)V
    .registers 4
    .param p1, "model"    # Lfreemarker/template/TemplateModel;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/InvalidReferenceException;
        }
    .end annotation

    .prologue
    .line 205
    if-nez p1, :cond_7

    invoke-static {p0, p2}, Lfreemarker/core/InvalidReferenceException;->getInstance(Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Lfreemarker/core/InvalidReferenceException;

    move-result-object v0

    throw v0

    .line 206
    :cond_7
    return-void
.end method

.method final deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;
    .registers 6
    .param p1, "replacedIdentifier"    # Ljava/lang/String;
    .param p2, "replacement"    # Lfreemarker/core/Expression;
    .param p3, "replacementState"    # Lfreemarker/core/Expression$ReplacemenetState;

    .prologue
    .line 159
    invoke-virtual {p0, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced_inner(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v0

    .line 160
    .local v0, "clone":Lfreemarker/core/Expression;
    iget v1, v0, Lfreemarker/core/Expression;->beginLine:I

    if-nez v1, :cond_b

    .line 161
    invoke-virtual {v0, p0}, Lfreemarker/core/Expression;->copyLocationFrom(Lfreemarker/core/TemplateObject;)Lfreemarker/core/TemplateObject;

    .line 163
    :cond_b
    return-object v0
.end method

.method protected abstract deepCloneWithIdentifierReplaced_inner(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;
.end method

.method final eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 111
    iget-object v0, p0, Lfreemarker/core/Expression;->constantValue:Lfreemarker/template/TemplateModel;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lfreemarker/core/Expression;->constantValue:Lfreemarker/template/TemplateModel;

    :goto_6
    return-object v0

    :cond_7
    invoke-virtual {p0, p1}, Lfreemarker/core/Expression;->_eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    goto :goto_6
.end method

.method evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 115
    invoke-virtual {p0, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p0, v1, p1}, Lfreemarker/core/EvalUtil;->coerceModelToString(Lfreemarker/template/TemplateModel;Lfreemarker/core/Expression;Ljava/lang/String;Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method evalAndCoerceToString(Lfreemarker/core/Environment;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;
    .param p2, "seqTip"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 122
    invoke-virtual {p0, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    invoke-static {v0, p0, p2, p1}, Lfreemarker/core/EvalUtil;->coerceModelToString(Lfreemarker/template/TemplateModel;Lfreemarker/core/Expression;Ljava/lang/String;Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method evalToBoolean(Lfreemarker/core/Environment;)Z
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 143
    invoke-virtual {p0, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 144
    .local v0, "model":Lfreemarker/template/TemplateModel;
    invoke-virtual {p0, v0, p1}, Lfreemarker/core/Expression;->modelToBoolean(Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Z

    move-result v1

    return v1
.end method

.method evalToNumber(Lfreemarker/core/Environment;)Ljava/lang/Number;
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 130
    invoke-virtual {p0, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 131
    .local v0, "model":Lfreemarker/template/TemplateModel;
    invoke-virtual {p0, v0, p1}, Lfreemarker/core/Expression;->modelToNumber(Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Ljava/lang/Number;

    move-result-object v1

    return-object v1
.end method

.method public final getAsTemplateModel(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 107
    invoke-virtual {p0, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    return-object v0
.end method

.method abstract isLiteral()Z
.end method

.method modelToBoolean(Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Z
    .registers 4
    .param p1, "model"    # Lfreemarker/template/TemplateModel;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 148
    instance-of v0, p1, Lfreemarker/template/TemplateBooleanModel;

    if-eqz v0, :cond_b

    .line 149
    check-cast p1, Lfreemarker/template/TemplateBooleanModel;

    .end local p1    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {p1}, Lfreemarker/template/TemplateBooleanModel;->getAsBoolean()Z

    move-result v0

    .line 151
    :goto_a
    return v0

    .line 150
    .restart local p1    # "model":Lfreemarker/template/TemplateModel;
    :cond_b
    invoke-virtual {p2}, Lfreemarker/core/Environment;->isClassicCompatible()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 151
    if-eqz p1, :cond_1b

    invoke-static {p1}, Lfreemarker/core/Expression;->isEmpty(Lfreemarker/template/TemplateModel;)Z

    move-result v0

    if-nez v0, :cond_1b

    const/4 v0, 0x1

    goto :goto_a

    :cond_1b
    const/4 v0, 0x0

    goto :goto_a

    .line 153
    :cond_1d
    new-instance v0, Lfreemarker/core/NonBooleanException;

    invoke-direct {v0, p0, p1, p2}, Lfreemarker/core/NonBooleanException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)V

    throw v0
.end method

.method modelToNumber(Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Ljava/lang/Number;
    .registers 4
    .param p1, "model"    # Lfreemarker/template/TemplateModel;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 135
    instance-of v0, p1, Lfreemarker/template/TemplateNumberModel;

    if-eqz v0, :cond_b

    .line 136
    check-cast p1, Lfreemarker/template/TemplateNumberModel;

    .end local p1    # "model":Lfreemarker/template/TemplateModel;
    invoke-static {p1, p0}, Lfreemarker/core/EvalUtil;->modelToNumber(Lfreemarker/template/TemplateNumberModel;Lfreemarker/core/Expression;)Ljava/lang/Number;

    move-result-object v0

    return-object v0

    .line 138
    .restart local p1    # "model":Lfreemarker/template/TemplateModel;
    :cond_b
    new-instance v0, Lfreemarker/core/NonNumericalException;

    invoke-direct {v0, p0, p1, p2}, Lfreemarker/core/NonNumericalException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)V

    throw v0
.end method

.method setLocation(Lfreemarker/template/Template;IIII)V
    .registers 7
    .param p1, "template"    # Lfreemarker/template/Template;
    .param p2, "beginColumn"    # I
    .param p3, "beginLine"    # I
    .param p4, "endColumn"    # I
    .param p5, "endLine"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 93
    invoke-super/range {p0 .. p5}, Lfreemarker/core/TemplateObject;->setLocation(Lfreemarker/template/Template;IIII)V

    .line 94
    invoke-virtual {p0}, Lfreemarker/core/Expression;->isLiteral()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 96
    const/4 v0, 0x0

    :try_start_a
    invoke-virtual {p0, v0}, Lfreemarker/core/Expression;->_eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/Expression;->constantValue:Lfreemarker/template/TemplateModel;
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_10} :catch_11

    .line 101
    :cond_10
    :goto_10
    return-void

    .line 97
    :catch_11
    move-exception v0

    goto :goto_10
.end method
