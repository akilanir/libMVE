.class final Lfreemarker/core/BooleanLiteral;
.super Lfreemarker/core/Expression;
.source "BooleanLiteral.java"


# instance fields
.field private final val:Z


# direct methods
.method public constructor <init>(Z)V
    .registers 2
    .param p1, "val"    # Z

    .prologue
    .line 62
    invoke-direct {p0}, Lfreemarker/core/Expression;-><init>()V

    .line 63
    iput-boolean p1, p0, Lfreemarker/core/BooleanLiteral;->val:Z

    .line 64
    return-void
.end method

.method static getTemplateModel(Z)Lfreemarker/template/TemplateBooleanModel;
    .registers 2
    .param p0, "b"    # Z

    .prologue
    .line 67
    if-eqz p0, :cond_5

    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    :goto_4
    return-object v0

    :cond_5
    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->FALSE:Lfreemarker/template/TemplateBooleanModel;

    goto :goto_4
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 87
    iget-boolean v0, p0, Lfreemarker/core/BooleanLiteral;->val:Z

    if-eqz v0, :cond_7

    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    :goto_6
    return-object v0

    :cond_7
    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->FALSE:Lfreemarker/template/TemplateBooleanModel;

    goto :goto_6
.end method

.method protected deepCloneWithIdentifierReplaced_inner(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;
    .registers 6
    .param p1, "replacedIdentifier"    # Ljava/lang/String;
    .param p2, "replacement"    # Lfreemarker/core/Expression;
    .param p3, "replacementState"    # Lfreemarker/core/Expression$ReplacemenetState;

    .prologue
    .line 96
    new-instance v0, Lfreemarker/core/BooleanLiteral;

    iget-boolean v1, p0, Lfreemarker/core/BooleanLiteral;->val:Z

    invoke-direct {v0, v1}, Lfreemarker/core/BooleanLiteral;-><init>(Z)V

    return-object v0
.end method

.method evalToBoolean(Lfreemarker/core/Environment;)Z
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 71
    iget-boolean v0, p0, Lfreemarker/core/BooleanLiteral;->val:Z

    return v0
.end method

.method public getCanonicalForm()Ljava/lang/String;
    .registers 2

    .prologue
    .line 75
    iget-boolean v0, p0, Lfreemarker/core/BooleanLiteral;->val:Z

    if-eqz v0, :cond_7

    const-string v0, "true"

    :goto_6
    return-object v0

    :cond_7
    const-string v0, "false"

    goto :goto_6
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 79
    invoke-virtual {p0}, Lfreemarker/core/BooleanLiteral;->getCanonicalForm()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 100
    const/4 v0, 0x0

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 108
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 104
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method isLiteral()Z
    .registers 2

    .prologue
    .line 91
    const/4 v0, 0x1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 83
    iget-boolean v0, p0, Lfreemarker/core/BooleanLiteral;->val:Z

    if-eqz v0, :cond_7

    const-string v0, "true"

    :goto_6
    return-object v0

    :cond_7
    const-string v0, "false"

    goto :goto_6
.end method
