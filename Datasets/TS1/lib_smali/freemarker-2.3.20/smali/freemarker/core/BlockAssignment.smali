.class final Lfreemarker/core/BlockAssignment;
.super Lfreemarker/core/TemplateElement;
.source "BlockAssignment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/BlockAssignment$CaptureOutput;
    }
.end annotation


# instance fields
.field private final namespaceExp:Lfreemarker/core/Expression;

.field private final scope:I

.field private final varName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lfreemarker/core/TemplateElement;Ljava/lang/String;ILfreemarker/core/Expression;)V
    .registers 5
    .param p1, "nestedBlock"    # Lfreemarker/core/TemplateElement;
    .param p2, "varName"    # Ljava/lang/String;
    .param p3, "scope"    # I
    .param p4, "namespaceExp"    # Lfreemarker/core/Expression;

    .prologue
    .line 74
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 75
    iput-object p1, p0, Lfreemarker/core/BlockAssignment;->nestedBlock:Lfreemarker/core/TemplateElement;

    .line 76
    iput-object p2, p0, Lfreemarker/core/BlockAssignment;->varName:Ljava/lang/String;

    .line 77
    iput-object p4, p0, Lfreemarker/core/BlockAssignment;->namespaceExp:Lfreemarker/core/Expression;

    .line 78
    iput p3, p0, Lfreemarker/core/BlockAssignment;->scope:I

    .line 79
    return-void
.end method

.method static access$000(Lfreemarker/core/BlockAssignment;)Lfreemarker/core/Expression;
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/BlockAssignment;

    .prologue
    .line 68
    iget-object v0, p0, Lfreemarker/core/BlockAssignment;->namespaceExp:Lfreemarker/core/Expression;

    return-object v0
.end method

.method static access$200(Lfreemarker/core/BlockAssignment;)I
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/BlockAssignment;

    .prologue
    .line 68
    iget v0, p0, Lfreemarker/core/BlockAssignment;->scope:I

    return v0
.end method

.method static access$400(Lfreemarker/core/BlockAssignment;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/BlockAssignment;

    .prologue
    .line 68
    iget-object v0, p0, Lfreemarker/core/BlockAssignment;->varName:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 7
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    iget-object v2, p0, Lfreemarker/core/BlockAssignment;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v2, :cond_10

    .line 83
    iget-object v2, p0, Lfreemarker/core/BlockAssignment;->nestedBlock:Lfreemarker/core/TemplateElement;

    new-instance v3, Lfreemarker/core/BlockAssignment$CaptureOutput;

    invoke-direct {v3, p0, p1}, Lfreemarker/core/BlockAssignment$CaptureOutput;-><init>(Lfreemarker/core/BlockAssignment;Lfreemarker/core/Environment;)V

    const/4 v4, 0x0

    invoke-virtual {p1, v2, v3, v4}, Lfreemarker/core/Environment;->visitAndTransform(Lfreemarker/core/TemplateElement;Lfreemarker/template/TemplateTransformModel;Ljava/util/Map;)V

    .line 97
    :cond_f
    :goto_f
    return-void

    .line 85
    :cond_10
    new-instance v1, Lfreemarker/template/SimpleScalar;

    const-string v2, ""

    invoke-direct {v1, v2}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    .line 86
    .local v1, "value":Lfreemarker/template/TemplateModel;
    iget-object v2, p0, Lfreemarker/core/BlockAssignment;->namespaceExp:Lfreemarker/core/Expression;

    if-eqz v2, :cond_29

    .line 87
    iget-object v2, p0, Lfreemarker/core/BlockAssignment;->namespaceExp:Lfreemarker/core/Expression;

    invoke-virtual {v2, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    check-cast v0, Lfreemarker/core/Environment$Namespace;

    .line 88
    .local v0, "ns":Lfreemarker/core/Environment$Namespace;
    iget-object v2, p0, Lfreemarker/core/BlockAssignment;->varName:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lfreemarker/core/Environment$Namespace;->put(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_f

    .line 89
    .end local v0    # "ns":Lfreemarker/core/Environment$Namespace;
    :cond_29
    iget v2, p0, Lfreemarker/core/BlockAssignment;->scope:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_34

    .line 90
    iget-object v2, p0, Lfreemarker/core/BlockAssignment;->varName:Ljava/lang/String;

    invoke-virtual {p1, v2, v1}, Lfreemarker/core/Environment;->setVariable(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    goto :goto_f

    .line 91
    :cond_34
    iget v2, p0, Lfreemarker/core/BlockAssignment;->scope:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_3f

    .line 92
    iget-object v2, p0, Lfreemarker/core/BlockAssignment;->varName:Ljava/lang/String;

    invoke-virtual {p1, v2, v1}, Lfreemarker/core/Environment;->setGlobalVariable(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    goto :goto_f

    .line 93
    :cond_3f
    iget v2, p0, Lfreemarker/core/BlockAssignment;->scope:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_f

    .line 94
    iget-object v2, p0, Lfreemarker/core/BlockAssignment;->varName:Ljava/lang/String;

    invoke-virtual {p1, v2, v1}, Lfreemarker/core/Environment;->setLocalVariable(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    goto :goto_f
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 5
    .param p1, "canonical"    # Z

    .prologue
    const/16 v2, 0x3e

    .line 144
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 145
    .local v0, "sb":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_e

    const-string v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 146
    :cond_e
    invoke-virtual {p0}, Lfreemarker/core/BlockAssignment;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 147
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 148
    iget-object v1, p0, Lfreemarker/core/BlockAssignment;->varName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 149
    iget-object v1, p0, Lfreemarker/core/BlockAssignment;->namespaceExp:Lfreemarker/core/Expression;

    if-eqz v1, :cond_31

    .line 150
    const-string v1, " in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 151
    iget-object v1, p0, Lfreemarker/core/BlockAssignment;->namespaceExp:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 153
    :cond_31
    if-eqz p1, :cond_5a

    .line 154
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 155
    iget-object v1, p0, Lfreemarker/core/BlockAssignment;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-nez v1, :cond_53

    const-string v1, ""

    :goto_3c
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 156
    const-string v1, "</"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 157
    invoke-virtual {p0}, Lfreemarker/core/BlockAssignment;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 158
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 162
    :goto_4e
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 155
    :cond_53
    iget-object v1, p0, Lfreemarker/core/BlockAssignment;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v1}, Lfreemarker/core/TemplateElement;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    goto :goto_3c

    .line 160
    :cond_5a
    const-string v1, " = .nested_output"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_4e
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 166
    iget v0, p0, Lfreemarker/core/BlockAssignment;->scope:I

    invoke-static {v0}, Lfreemarker/core/Assignment;->getDirectiveName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 170
    const/4 v0, 0x3

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 183
    packed-switch p1, :pswitch_data_12

    .line 187
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 184
    :pswitch_9
    sget-object v0, Lfreemarker/core/ParameterRole;->ASSIGNMENT_TARGET:Lfreemarker/core/ParameterRole;

    .line 186
    :goto_b
    return-object v0

    .line 185
    :pswitch_c
    sget-object v0, Lfreemarker/core/ParameterRole;->VARIABLE_SCOPE:Lfreemarker/core/ParameterRole;

    goto :goto_b

    .line 186
    :pswitch_f
    sget-object v0, Lfreemarker/core/ParameterRole;->NAMESPACE:Lfreemarker/core/ParameterRole;

    goto :goto_b

    .line 183
    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
        :pswitch_f
    .end packed-switch
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 4
    .param p1, "idx"    # I

    .prologue
    .line 174
    packed-switch p1, :pswitch_data_18

    .line 178
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 175
    :pswitch_9
    iget-object v0, p0, Lfreemarker/core/BlockAssignment;->varName:Ljava/lang/String;

    .line 177
    :goto_b
    return-object v0

    .line 176
    :pswitch_c
    new-instance v0, Ljava/lang/Integer;

    iget v1, p0, Lfreemarker/core/BlockAssignment;->scope:I

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_b

    .line 177
    :pswitch_14
    iget-object v0, p0, Lfreemarker/core/BlockAssignment;->namespaceExp:Lfreemarker/core/Expression;

    goto :goto_b

    .line 174
    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
        :pswitch_14
    .end packed-switch
.end method

.method isIgnorable()Z
    .registers 2

    .prologue
    .line 192
    const/4 v0, 0x0

    return v0
.end method
