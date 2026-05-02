.class final Lfreemarker/core/Identifier;
.super Lfreemarker/core/Expression;
.source "Identifier.java"


# instance fields
.field private final name:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 65
    invoke-direct {p0}, Lfreemarker/core/Expression;-><init>()V

    .line 66
    iput-object p1, p0, Lfreemarker/core/Identifier;->name:Ljava/lang/String;

    .line 67
    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 7
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 71
    :try_start_0
    iget-object v1, p0, Lfreemarker/core/Identifier;->name:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lfreemarker/core/Environment;->getVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    :try_end_5
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    return-object v1

    .line 72
    :catch_7
    move-exception v0

    .line 73
    .local v0, "e":Ljava/lang/NullPointerException;
    if-nez p1, :cond_1d

    .line 74
    new-instance v1, Lfreemarker/core/_MiscTemplateException;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "Variables are not available (certainly you are in a parse-time executed directive). The name of the variable you tried to read: "

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lfreemarker/core/Identifier;->name:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-direct {v1, v2}, Lfreemarker/core/_MiscTemplateException;-><init>([Ljava/lang/Object;)V

    throw v1

    .line 78
    :cond_1d
    throw v0
.end method

.method protected deepCloneWithIdentifierReplaced_inner(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;
    .registers 7
    .param p1, "replacedIdentifier"    # Ljava/lang/String;
    .param p2, "replacement"    # Lfreemarker/core/Expression;
    .param p3, "replacementState"    # Lfreemarker/core/Expression$ReplacemenetState;

    .prologue
    const/4 v2, 0x0

    .line 113
    iget-object v1, p0, Lfreemarker/core/Identifier;->name:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 114
    iget-boolean v1, p3, Lfreemarker/core/Expression$ReplacemenetState;->replacementAlreadyInUse:Z

    if-eqz v1, :cond_15

    .line 115
    invoke-virtual {p2, v2, v2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v0

    .line 116
    .local v0, "clone":Lfreemarker/core/Expression;
    invoke-virtual {v0, p2}, Lfreemarker/core/Expression;->copyLocationFrom(Lfreemarker/core/TemplateObject;)Lfreemarker/core/TemplateObject;

    .line 123
    .end local v0    # "clone":Lfreemarker/core/Expression;
    :goto_14
    return-object v0

    .line 119
    :cond_15
    const/4 v1, 0x1

    iput-boolean v1, p3, Lfreemarker/core/Expression$ReplacemenetState;->replacementAlreadyInUse:Z

    move-object v0, p2

    .line 120
    goto :goto_14

    .line 123
    :cond_1a
    new-instance v0, Lfreemarker/core/Identifier;

    iget-object v1, p0, Lfreemarker/core/Identifier;->name:Ljava/lang/String;

    invoke-direct {v0, v1}, Lfreemarker/core/Identifier;-><init>(Ljava/lang/String;)V

    goto :goto_14
.end method

.method public getCanonicalForm()Ljava/lang/String;
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lfreemarker/core/Identifier;->name:Ljava/lang/String;

    return-object v0
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 92
    invoke-virtual {p0}, Lfreemarker/core/Identifier;->getCanonicalForm()Ljava/lang/String;

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
    .line 96
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lfreemarker/core/Identifier;->name:Ljava/lang/String;

    return-object v0
.end method
