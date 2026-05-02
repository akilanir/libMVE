.class final Lfreemarker/core/StopInstruction;
.super Lfreemarker/core/TemplateElement;
.source "StopInstruction.java"


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
    iput-object p1, p0, Lfreemarker/core/StopInstruction;->exp:Lfreemarker/core/Expression;

    .line 67
    return-void
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 70
    iget-object v0, p0, Lfreemarker/core/StopInstruction;->exp:Lfreemarker/core/Expression;

    if-nez v0, :cond_a

    .line 71
    new-instance v0, Lfreemarker/core/StopException;

    invoke-direct {v0, p1}, Lfreemarker/core/StopException;-><init>(Lfreemarker/core/Environment;)V

    throw v0

    .line 73
    :cond_a
    new-instance v0, Lfreemarker/core/StopException;

    iget-object v1, p0, Lfreemarker/core/StopInstruction;->exp:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1}, Lfreemarker/core/Expression;->evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lfreemarker/core/StopException;-><init>(Lfreemarker/core/Environment;Ljava/lang/String;)V

    throw v0
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 4
    .param p1, "canonical"    # Z

    .prologue
    .line 77
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 78
    .local v0, "sb":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_c

    const/16 v1, 0x3c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 79
    :cond_c
    invoke-virtual {p0}, Lfreemarker/core/StopInstruction;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 80
    iget-object v1, p0, Lfreemarker/core/StopInstruction;->exp:Lfreemarker/core/Expression;

    if-eqz v1, :cond_25

    .line 81
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 82
    iget-object v1, p0, Lfreemarker/core/StopInstruction;->exp:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 84
    :cond_25
    if-eqz p1, :cond_2c

    const-string v1, "/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 85
    :cond_2c
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 89
    const-string v0, "#stop"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 93
    const/4 v0, 0x1

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 102
    if-eqz p1, :cond_8

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 103
    :cond_8
    sget-object v0, Lfreemarker/core/ParameterRole;->MESSAGE:Lfreemarker/core/ParameterRole;

    return-object v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 97
    if-eqz p1, :cond_8

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 98
    :cond_8
    iget-object v0, p0, Lfreemarker/core/StopInstruction;->exp:Lfreemarker/core/Expression;

    return-object v0
.end method
