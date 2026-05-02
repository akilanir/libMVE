.class final Lfreemarker/core/TrimInstruction;
.super Lfreemarker/core/TemplateElement;
.source "TrimInstruction.java"


# instance fields
.field private final TYPE_LT:I

.field private final TYPE_NT:I

.field private final TYPE_RT:I

.field private final TYPE_T:I

.field final left:Z

.field final right:Z


# direct methods
.method constructor <init>(ZZ)V
    .registers 4
    .param p1, "left"    # Z
    .param p2, "right"    # Z

    .prologue
    .line 68
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 61
    const/4 v0, 0x0

    iput v0, p0, Lfreemarker/core/TrimInstruction;->TYPE_T:I

    .line 62
    const/4 v0, 0x1

    iput v0, p0, Lfreemarker/core/TrimInstruction;->TYPE_LT:I

    .line 63
    const/4 v0, 0x2

    iput v0, p0, Lfreemarker/core/TrimInstruction;->TYPE_RT:I

    .line 64
    const/4 v0, 0x3

    iput v0, p0, Lfreemarker/core/TrimInstruction;->TYPE_NT:I

    .line 69
    iput-boolean p1, p0, Lfreemarker/core/TrimInstruction;->left:Z

    .line 70
    iput-boolean p2, p0, Lfreemarker/core/TrimInstruction;->right:Z

    .line 71
    return-void
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 2
    .param p1, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 75
    return-void
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 4
    .param p1, "canonical"    # Z

    .prologue
    .line 78
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 79
    .local v0, "sb":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_c

    const/16 v1, 0x3c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 80
    :cond_c
    invoke-virtual {p0}, Lfreemarker/core/TrimInstruction;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 81
    if-eqz p1, :cond_1a

    const-string v1, "/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 82
    :cond_1a
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 86
    iget-boolean v0, p0, Lfreemarker/core/TrimInstruction;->left:Z

    if-eqz v0, :cond_b

    iget-boolean v0, p0, Lfreemarker/core/TrimInstruction;->right:Z

    if-eqz v0, :cond_b

    .line 87
    const-string v0, "#t"

    .line 93
    :goto_a
    return-object v0

    .line 88
    :cond_b
    iget-boolean v0, p0, Lfreemarker/core/TrimInstruction;->left:Z

    if-eqz v0, :cond_12

    .line 89
    const-string v0, "#lt"

    goto :goto_a

    .line 90
    :cond_12
    iget-boolean v0, p0, Lfreemarker/core/TrimInstruction;->right:Z

    if-eqz v0, :cond_19

    .line 91
    const-string v0, "#rt"

    goto :goto_a

    .line 93
    :cond_19
    const-string v0, "#nt"

    goto :goto_a
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 102
    const/4 v0, 0x1

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 121
    if-eqz p1, :cond_8

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 122
    :cond_8
    sget-object v0, Lfreemarker/core/ParameterRole;->AST_NODE_SUBTYPE:Lfreemarker/core/ParameterRole;

    return-object v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 4
    .param p1, "idx"    # I

    .prologue
    .line 106
    if-eqz p1, :cond_8

    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v1

    .line 108
    :cond_8
    iget-boolean v1, p0, Lfreemarker/core/TrimInstruction;->left:Z

    if-eqz v1, :cond_17

    iget-boolean v1, p0, Lfreemarker/core/TrimInstruction;->right:Z

    if-eqz v1, :cond_17

    .line 109
    const/4 v0, 0x0

    .line 117
    .local v0, "type":I
    :goto_11
    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, v0}, Ljava/lang/Integer;-><init>(I)V

    return-object v1

    .line 110
    .end local v0    # "type":I
    :cond_17
    iget-boolean v1, p0, Lfreemarker/core/TrimInstruction;->left:Z

    if-eqz v1, :cond_1d

    .line 111
    const/4 v0, 0x1

    .restart local v0    # "type":I
    goto :goto_11

    .line 112
    .end local v0    # "type":I
    :cond_1d
    iget-boolean v1, p0, Lfreemarker/core/TrimInstruction;->right:Z

    if-eqz v1, :cond_23

    .line 113
    const/4 v0, 0x2

    .restart local v0    # "type":I
    goto :goto_11

    .line 115
    .end local v0    # "type":I
    :cond_23
    const/4 v0, 0x3

    .restart local v0    # "type":I
    goto :goto_11
.end method

.method isIgnorable()Z
    .registers 2

    .prologue
    .line 98
    const/4 v0, 0x1

    return v0
.end method
