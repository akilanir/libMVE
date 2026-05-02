.class final Lfreemarker/core/Assignment;
.super Lfreemarker/core/TemplateElement;
.source "Assignment.java"


# static fields
.field static final GLOBAL:I = 0x3

.field static final LOCAL:I = 0x2

.field static final NAMESPACE:I = 0x1


# instance fields
.field private namespaceExp:Lfreemarker/core/Expression;

.field private scope:I

.field private value:Lfreemarker/core/Expression;

.field private variableName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Lfreemarker/core/Expression;I)V
    .registers 4
    .param p1, "variableName"    # Ljava/lang/String;
    .param p2, "value"    # Lfreemarker/core/Expression;
    .param p3, "scope"    # I

    .prologue
    .line 82
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 83
    iput-object p1, p0, Lfreemarker/core/Assignment;->variableName:Ljava/lang/String;

    .line 84
    iput-object p2, p0, Lfreemarker/core/Assignment;->value:Lfreemarker/core/Expression;

    .line 85
    iput p3, p0, Lfreemarker/core/Assignment;->scope:I

    .line 86
    return-void
.end method

.method static getDirectiveName(I)Ljava/lang/String;
    .registers 2
    .param p0, "scope"    # I

    .prologue
    .line 161
    const/4 v0, 0x2

    if-ne p0, v0, :cond_6

    .line 162
    const-string v0, "#local"

    .line 168
    :goto_5
    return-object v0

    .line 163
    :cond_6
    const/4 v0, 0x3

    if-ne p0, v0, :cond_c

    .line 164
    const-string v0, "#global"

    goto :goto_5

    .line 165
    :cond_c
    const/4 v0, 0x1

    if-ne p0, v0, :cond_12

    .line 166
    const-string v0, "#assign"

    goto :goto_5

    .line 168
    :cond_12
    const-string v0, "#{unknown_assignment_type}"

    goto :goto_5
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 10
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 93
    const/4 v2, 0x0

    .line 94
    .local v2, "namespace":Lfreemarker/core/Environment$Namespace;
    iget-object v5, p0, Lfreemarker/core/Assignment;->namespaceExp:Lfreemarker/core/Expression;

    if-eqz v5, :cond_23

    .line 95
    iget-object v5, p0, Lfreemarker/core/Assignment;->namespaceExp:Lfreemarker/core/Expression;

    invoke-virtual {v5, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v3

    .line 97
    .local v3, "namespaceTM":Lfreemarker/template/TemplateModel;
    :try_start_b
    move-object v0, v3

    check-cast v0, Lfreemarker/core/Environment$Namespace;

    move-object v2, v0
    :try_end_f
    .catch Ljava/lang/ClassCastException; {:try_start_b .. :try_end_f} :catch_18

    .line 101
    if-nez v2, :cond_23

    .line 102
    iget-object v5, p0, Lfreemarker/core/Assignment;->namespaceExp:Lfreemarker/core/Expression;

    invoke-static {v5, p1}, Lfreemarker/core/InvalidReferenceException;->getInstance(Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Lfreemarker/core/InvalidReferenceException;

    move-result-object v5

    throw v5

    .line 98
    :catch_18
    move-exception v1

    .line 99
    .local v1, "e":Ljava/lang/ClassCastException;
    new-instance v5, Lfreemarker/core/UnexpectedTypeException;

    iget-object v6, p0, Lfreemarker/core/Assignment;->namespaceExp:Lfreemarker/core/Expression;

    const-string v7, "namespace"

    invoke-direct {v5, v6, v3, v7, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v5

    .line 106
    .end local v1    # "e":Ljava/lang/ClassCastException;
    .end local v3    # "namespaceTM":Lfreemarker/template/TemplateModel;
    :cond_23
    iget-object v5, p0, Lfreemarker/core/Assignment;->value:Lfreemarker/core/Expression;

    invoke-virtual {v5, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v4

    .line 107
    .local v4, "tm":Lfreemarker/template/TemplateModel;
    if-nez v4, :cond_33

    .line 108
    invoke-virtual {p1}, Lfreemarker/core/Environment;->isClassicCompatible()Z

    move-result v5

    if-eqz v5, :cond_3e

    .line 109
    sget-object v4, Lfreemarker/template/TemplateScalarModel;->EMPTY_STRING:Lfreemarker/template/TemplateModel;

    .line 115
    :cond_33
    iget v5, p0, Lfreemarker/core/Assignment;->scope:I

    const/4 v6, 0x2

    if-ne v5, v6, :cond_45

    .line 116
    iget-object v5, p0, Lfreemarker/core/Assignment;->variableName:Ljava/lang/String;

    invoke-virtual {p1, v5, v4}, Lfreemarker/core/Environment;->setLocalVariable(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    .line 132
    :goto_3d
    return-void

    .line 112
    :cond_3e
    iget-object v5, p0, Lfreemarker/core/Assignment;->value:Lfreemarker/core/Expression;

    invoke-static {v5, p1}, Lfreemarker/core/InvalidReferenceException;->getInstance(Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Lfreemarker/core/InvalidReferenceException;

    move-result-object v5

    throw v5

    .line 119
    :cond_45
    if-nez v2, :cond_50

    .line 120
    iget v5, p0, Lfreemarker/core/Assignment;->scope:I

    const/4 v6, 0x3

    if-ne v5, v6, :cond_56

    .line 121
    invoke-virtual {p1}, Lfreemarker/core/Environment;->getGlobalNamespace()Lfreemarker/core/Environment$Namespace;

    move-result-object v2

    .line 130
    :cond_50
    :goto_50
    iget-object v5, p0, Lfreemarker/core/Assignment;->variableName:Ljava/lang/String;

    invoke-virtual {v2, v5, v4}, Lfreemarker/core/Environment$Namespace;->put(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_3d

    .line 123
    :cond_56
    iget v5, p0, Lfreemarker/core/Assignment;->scope:I

    const/4 v6, 0x1

    if-ne v5, v6, :cond_60

    .line 124
    invoke-virtual {p1}, Lfreemarker/core/Environment;->getCurrentNamespace()Lfreemarker/core/Environment$Namespace;

    move-result-object v2

    goto :goto_50

    .line 127
    :cond_60
    new-instance v5, Ljava/lang/RuntimeException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Unexpected scope type: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget v7, p0, Lfreemarker/core/Assignment;->scope:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 6
    .param p1, "canonical"    # Z

    .prologue
    .line 135
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 136
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget-object v3, p0, Lfreemarker/core/Assignment;->parent:Lfreemarker/core/TemplateElement;

    instance-of v3, v3, Lfreemarker/core/AssignmentInstruction;

    if-eqz v3, :cond_50

    const/4 v1, 0x0

    .line 137
    .local v1, "dn":Ljava/lang/String;
    :goto_c
    if-eqz v1, :cond_1d

    .line 138
    if-eqz p1, :cond_15

    const-string v3, "<"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 139
    :cond_15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 140
    const/16 v3, 0x20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 142
    :cond_1d
    iget-object v3, p0, Lfreemarker/core/Assignment;->variableName:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 143
    const-string v3, " = "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 144
    iget-object v3, p0, Lfreemarker/core/Assignment;->value:Lfreemarker/core/Expression;

    invoke-virtual {v3}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 145
    if-eqz v1, :cond_4b

    .line 146
    iget-object v3, p0, Lfreemarker/core/Assignment;->namespaceExp:Lfreemarker/core/Expression;

    if-eqz v3, :cond_44

    .line 147
    const-string v3, " in "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 148
    iget-object v3, p0, Lfreemarker/core/Assignment;->namespaceExp:Lfreemarker/core/Expression;

    invoke-virtual {v3}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 150
    :cond_44
    if-eqz p1, :cond_4b

    const-string v3, ">"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 152
    :cond_4b
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 153
    .local v2, "result":Ljava/lang/String;
    return-object v2

    .line 136
    .end local v1    # "dn":Ljava/lang/String;
    .end local v2    # "result":Ljava/lang/String;
    :cond_50
    invoke-virtual {p0}, Lfreemarker/core/Assignment;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 157
    iget v0, p0, Lfreemarker/core/Assignment;->scope:I

    invoke-static {v0}, Lfreemarker/core/Assignment;->getDirectiveName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 173
    const/4 v0, 0x4

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 187
    packed-switch p1, :pswitch_data_16

    .line 192
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 188
    :pswitch_9
    sget-object v0, Lfreemarker/core/ParameterRole;->ASSIGNMENT_TARGET:Lfreemarker/core/ParameterRole;

    .line 191
    :goto_b
    return-object v0

    .line 189
    :pswitch_c
    sget-object v0, Lfreemarker/core/ParameterRole;->ASSIGNMENT_SOURCE:Lfreemarker/core/ParameterRole;

    goto :goto_b

    .line 190
    :pswitch_f
    sget-object v0, Lfreemarker/core/ParameterRole;->VARIABLE_SCOPE:Lfreemarker/core/ParameterRole;

    goto :goto_b

    .line 191
    :pswitch_12
    sget-object v0, Lfreemarker/core/ParameterRole;->NAMESPACE:Lfreemarker/core/ParameterRole;

    goto :goto_b

    .line 187
    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
        :pswitch_f
        :pswitch_12
    .end packed-switch
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 4
    .param p1, "idx"    # I

    .prologue
    .line 177
    packed-switch p1, :pswitch_data_1a

    .line 182
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 178
    :pswitch_9
    iget-object v0, p0, Lfreemarker/core/Assignment;->variableName:Ljava/lang/String;

    .line 181
    :goto_b
    return-object v0

    .line 179
    :pswitch_c
    iget-object v0, p0, Lfreemarker/core/Assignment;->value:Lfreemarker/core/Expression;

    goto :goto_b

    .line 180
    :pswitch_f
    new-instance v0, Ljava/lang/Integer;

    iget v1, p0, Lfreemarker/core/Assignment;->scope:I

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_b

    .line 181
    :pswitch_17
    iget-object v0, p0, Lfreemarker/core/Assignment;->namespaceExp:Lfreemarker/core/Expression;

    goto :goto_b

    .line 177
    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
        :pswitch_f
        :pswitch_17
    .end packed-switch
.end method

.method setNamespaceExp(Lfreemarker/core/Expression;)V
    .registers 2
    .param p1, "namespaceExp"    # Lfreemarker/core/Expression;

    .prologue
    .line 89
    iput-object p1, p0, Lfreemarker/core/Assignment;->namespaceExp:Lfreemarker/core/Expression;

    .line 90
    return-void
.end method
