.class final Lfreemarker/core/DollarVariable;
.super Lfreemarker/core/TemplateElement;
.source "DollarVariable.java"


# instance fields
.field private final escapedExpression:Lfreemarker/core/Expression;

.field private final expression:Lfreemarker/core/Expression;


# direct methods
.method constructor <init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V
    .registers 3
    .param p1, "expression"    # Lfreemarker/core/Expression;
    .param p2, "escapedExpression"    # Lfreemarker/core/Expression;

    .prologue
    .line 67
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 68
    iput-object p1, p0, Lfreemarker/core/DollarVariable;->expression:Lfreemarker/core/Expression;

    .line 69
    iput-object p2, p0, Lfreemarker/core/DollarVariable;->escapedExpression:Lfreemarker/core/Expression;

    .line 70
    return-void
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    invoke-virtual {p1}, Lfreemarker/core/Environment;->getOut()Ljava/io/Writer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/DollarVariable;->escapedExpression:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1}, Lfreemarker/core/Expression;->evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 77
    return-void
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 5
    .param p1, "canonical"    # Z

    .prologue
    .line 80
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 81
    .local v0, "sb":Ljava/lang/StringBuffer;
    const-string v1, "${"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 82
    iget-object v1, p0, Lfreemarker/core/DollarVariable;->expression:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 83
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 84
    if-nez p1, :cond_25

    iget-object v1, p0, Lfreemarker/core/DollarVariable;->expression:Lfreemarker/core/Expression;

    iget-object v2, p0, Lfreemarker/core/DollarVariable;->escapedExpression:Lfreemarker/core/Expression;

    if-eq v1, v2, :cond_25

    .line 85
    const-string v1, " auto-escaped"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 87
    :cond_25
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 91
    const-string v0, "${...}"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 103
    const/4 v0, 0x1

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 112
    if-eqz p1, :cond_8

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 113
    :cond_8
    sget-object v0, Lfreemarker/core/ParameterRole;->CONTENT:Lfreemarker/core/ParameterRole;

    return-object v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 107
    if-eqz p1, :cond_8

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 108
    :cond_8
    iget-object v0, p0, Lfreemarker/core/DollarVariable;->expression:Lfreemarker/core/Expression;

    return-object v0
.end method

.method heedsOpeningWhitespace()Z
    .registers 2

    .prologue
    .line 95
    const/4 v0, 0x1

    return v0
.end method

.method heedsTrailingWhitespace()Z
    .registers 2

    .prologue
    .line 99
    const/4 v0, 0x1

    return v0
.end method
