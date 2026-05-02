.class public final Lfreemarker/core/ReturnInstruction;
.super Lfreemarker/core/TemplateElement;
.source "ReturnInstruction.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/ReturnInstruction$Return;
    }
.end annotation


# instance fields
.field private exp:Lfreemarker/core/Expression;


# direct methods
.method constructor <init>(Lfreemarker/core/Expression;)V
    .registers 2
    .param p1, "exp"    # Lfreemarker/core/Expression;

    .prologue
    .line 65
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 66
    iput-object p1, p0, Lfreemarker/core/ReturnInstruction;->exp:Lfreemarker/core/Expression;

    .line 67
    return-void
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 70
    iget-object v0, p0, Lfreemarker/core/ReturnInstruction;->exp:Lfreemarker/core/Expression;

    if-eqz v0, :cond_d

    .line 71
    iget-object v0, p0, Lfreemarker/core/ReturnInstruction;->exp:Lfreemarker/core/Expression;

    invoke-virtual {v0, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    invoke-virtual {p1, v0}, Lfreemarker/core/Environment;->setLastReturnValue(Lfreemarker/template/TemplateModel;)V

    .line 73
    :cond_d
    invoke-virtual {p0}, Lfreemarker/core/ReturnInstruction;->nextSibling()Lfreemarker/core/TemplateElement;

    move-result-object v0

    if-eqz v0, :cond_16

    .line 75
    sget-object v0, Lfreemarker/core/ReturnInstruction$Return;->INSTANCE:Lfreemarker/core/ReturnInstruction$Return;

    throw v0

    .line 77
    :cond_16
    invoke-virtual {p0}, Lfreemarker/core/ReturnInstruction;->getParent()Ljavax/swing/tree/TreeNode;

    move-result-object v0

    instance-of v0, v0, Lfreemarker/core/Macro;

    if-nez v0, :cond_2d

    invoke-virtual {p0}, Lfreemarker/core/ReturnInstruction;->getParent()Ljavax/swing/tree/TreeNode;

    move-result-object v0

    invoke-interface {v0}, Ljavax/swing/tree/TreeNode;->getParent()Ljavax/swing/tree/TreeNode;

    move-result-object v0

    instance-of v0, v0, Lfreemarker/core/Macro;

    if-nez v0, :cond_2d

    .line 79
    sget-object v0, Lfreemarker/core/ReturnInstruction$Return;->INSTANCE:Lfreemarker/core/ReturnInstruction$Return;

    throw v0

    .line 81
    :cond_2d
    return-void
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 4
    .param p1, "canonical"    # Z

    .prologue
    .line 84
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 85
    .local v0, "sb":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_c

    const/16 v1, 0x3c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 86
    :cond_c
    invoke-virtual {p0}, Lfreemarker/core/ReturnInstruction;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 87
    iget-object v1, p0, Lfreemarker/core/ReturnInstruction;->exp:Lfreemarker/core/Expression;

    if-eqz v1, :cond_25

    .line 88
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 89
    iget-object v1, p0, Lfreemarker/core/ReturnInstruction;->exp:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 91
    :cond_25
    if-eqz p1, :cond_2c

    const-string v1, "/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 92
    :cond_2c
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 96
    const-string v0, "#return"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 106
    const/4 v0, 0x1

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 115
    if-eqz p1, :cond_8

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 116
    :cond_8
    sget-object v0, Lfreemarker/core/ParameterRole;->VALUE:Lfreemarker/core/ParameterRole;

    return-object v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 110
    if-eqz p1, :cond_8

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 111
    :cond_8
    iget-object v0, p0, Lfreemarker/core/ReturnInstruction;->exp:Lfreemarker/core/Expression;

    return-object v0
.end method
