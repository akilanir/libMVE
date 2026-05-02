.class final Lfreemarker/core/HashLiteral;
.super Lfreemarker/core/Expression;
.source "HashLiteral.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/HashLiteral$SequenceHash;
    }
.end annotation


# instance fields
.field private final keys:Ljava/util/ArrayList;

.field private final size:I

.field private final values:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .registers 4
    .param p1, "keys"    # Ljava/util/ArrayList;
    .param p2, "values"    # Ljava/util/ArrayList;

    .prologue
    .line 70
    invoke-direct {p0}, Lfreemarker/core/Expression;-><init>()V

    .line 71
    iput-object p1, p0, Lfreemarker/core/HashLiteral;->keys:Ljava/util/ArrayList;

    .line 72
    iput-object p2, p0, Lfreemarker/core/HashLiteral;->values:Ljava/util/ArrayList;

    .line 73
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    iput v0, p0, Lfreemarker/core/HashLiteral;->size:I

    .line 74
    invoke-virtual {p1}, Ljava/util/ArrayList;->trimToSize()V

    .line 75
    invoke-virtual {p2}, Ljava/util/ArrayList;->trimToSize()V

    .line 76
    return-void
.end method

.method static access$000(Lfreemarker/core/HashLiteral;)I
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/HashLiteral;

    .prologue
    .line 65
    iget v0, p0, Lfreemarker/core/HashLiteral;->size:I

    return v0
.end method

.method static access$100(Lfreemarker/core/HashLiteral;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/HashLiteral;

    .prologue
    .line 65
    iget-object v0, p0, Lfreemarker/core/HashLiteral;->keys:Ljava/util/ArrayList;

    return-object v0
.end method

.method static access$200(Lfreemarker/core/HashLiteral;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/HashLiteral;

    .prologue
    .line 65
    iget-object v0, p0, Lfreemarker/core/HashLiteral;->values:Ljava/util/ArrayList;

    return-object v0
.end method

.method private checkIndex(I)V
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 193
    iget v0, p0, Lfreemarker/core/HashLiteral;->size:I

    mul-int/lit8 v0, v0, 0x2

    if-lt p1, v0, :cond_c

    .line 194
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 196
    :cond_c
    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 79
    new-instance v0, Lfreemarker/core/HashLiteral$SequenceHash;

    invoke-direct {v0, p0, p1}, Lfreemarker/core/HashLiteral$SequenceHash;-><init>(Lfreemarker/core/HashLiteral;Lfreemarker/core/Environment;)V

    return-object v0
.end method

.method protected deepCloneWithIdentifierReplaced_inner(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;
    .registers 8
    .param p1, "replacedIdentifier"    # Ljava/lang/String;
    .param p2, "replacement"    # Lfreemarker/core/Expression;
    .param p3, "replacementState"    # Lfreemarker/core/Expression$ReplacemenetState;

    .prologue
    .line 119
    iget-object v3, p0, Lfreemarker/core/HashLiteral;->keys:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 120
    .local v0, "clonedKeys":Ljava/util/ArrayList;
    invoke-virtual {v0}, Ljava/util/ArrayList;->listIterator()Ljava/util/ListIterator;

    move-result-object v2

    .local v2, "iter":Ljava/util/ListIterator;
    :goto_c
    invoke-interface {v2}, Ljava/util/ListIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_20

    .line 121
    invoke-interface {v2}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfreemarker/core/Expression;

    invoke-virtual {v3, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/ListIterator;->set(Ljava/lang/Object;)V

    goto :goto_c

    .line 124
    :cond_20
    iget-object v3, p0, Lfreemarker/core/HashLiteral;->values:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 125
    .local v1, "clonedValues":Ljava/util/ArrayList;
    invoke-virtual {v1}, Ljava/util/ArrayList;->listIterator()Ljava/util/ListIterator;

    move-result-object v2

    :goto_2c
    invoke-interface {v2}, Ljava/util/ListIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_40

    .line 126
    invoke-interface {v2}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfreemarker/core/Expression;

    invoke-virtual {v3, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/ListIterator;->set(Ljava/lang/Object;)V

    goto :goto_2c

    .line 129
    :cond_40
    new-instance v3, Lfreemarker/core/HashLiteral;

    invoke-direct {v3, v0, v1}, Lfreemarker/core/HashLiteral;-><init>(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    return-object v3
.end method

.method public getCanonicalForm()Ljava/lang/String;
    .registers 6

    .prologue
    .line 83
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v4, "{"

    invoke-direct {v0, v4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 84
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    iget v4, p0, Lfreemarker/core/HashLiteral;->size:I

    if-ge v1, v4, :cond_3d

    .line 85
    iget-object v4, p0, Lfreemarker/core/HashLiteral;->keys:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/core/Expression;

    .line 86
    .local v2, "key":Lfreemarker/core/Expression;
    iget-object v4, p0, Lfreemarker/core/HashLiteral;->values:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfreemarker/core/Expression;

    .line 87
    .local v3, "value":Lfreemarker/core/Expression;
    invoke-virtual {v2}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 88
    const-string v4, " : "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 89
    invoke-virtual {v3}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 90
    iget v4, p0, Lfreemarker/core/HashLiteral;->size:I

    add-int/lit8 v4, v4, -0x1

    if-eq v1, v4, :cond_3a

    .line 91
    const-string v4, ","

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 84
    :cond_3a
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 94
    .end local v2    # "key":Lfreemarker/core/Expression;
    .end local v3    # "value":Lfreemarker/core/Expression;
    :cond_3d
    const-string v4, "}"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 95
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 99
    const-string v0, "{...}"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 179
    iget v0, p0, Lfreemarker/core/HashLiteral;->size:I

    mul-int/lit8 v0, v0, 0x2

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 188
    invoke-direct {p0, p1}, Lfreemarker/core/HashLiteral;->checkIndex(I)V

    .line 189
    rem-int/lit8 v0, p1, 0x2

    if-nez v0, :cond_a

    sget-object v0, Lfreemarker/core/ParameterRole;->ITEM_KEY:Lfreemarker/core/ParameterRole;

    :goto_9
    return-object v0

    :cond_a
    sget-object v0, Lfreemarker/core/ParameterRole;->ITEM_VALUE:Lfreemarker/core/ParameterRole;

    goto :goto_9
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 4
    .param p1, "idx"    # I

    .prologue
    .line 183
    invoke-direct {p0, p1}, Lfreemarker/core/HashLiteral;->checkIndex(I)V

    .line 184
    rem-int/lit8 v0, p1, 0x2

    if-nez v0, :cond_10

    iget-object v0, p0, Lfreemarker/core/HashLiteral;->keys:Ljava/util/ArrayList;

    div-int/lit8 v1, p1, 0x2

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    :goto_f
    return-object v0

    :cond_10
    iget-object v0, p0, Lfreemarker/core/HashLiteral;->values:Ljava/util/ArrayList;

    div-int/lit8 v1, p1, 0x2

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_f
.end method

.method isLiteral()Z
    .registers 6

    .prologue
    const/4 v3, 0x1

    .line 103
    iget-object v4, p0, Lfreemarker/core/HashLiteral;->constantValue:Lfreemarker/template/TemplateModel;

    if-eqz v4, :cond_6

    .line 113
    :cond_5
    :goto_5
    return v3

    .line 106
    :cond_6
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    iget v4, p0, Lfreemarker/core/HashLiteral;->size:I

    if-ge v0, v4, :cond_5

    .line 107
    iget-object v4, p0, Lfreemarker/core/HashLiteral;->keys:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/core/Expression;

    .line 108
    .local v1, "key":Lfreemarker/core/Expression;
    iget-object v4, p0, Lfreemarker/core/HashLiteral;->values:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/core/Expression;

    .line 109
    .local v2, "value":Lfreemarker/core/Expression;
    invoke-virtual {v1}, Lfreemarker/core/Expression;->isLiteral()Z

    move-result v4

    if-eqz v4, :cond_27

    invoke-virtual {v2}, Lfreemarker/core/Expression;->isLiteral()Z

    move-result v4

    if-nez v4, :cond_29

    .line 110
    :cond_27
    const/4 v3, 0x0

    goto :goto_5

    .line 106
    :cond_29
    add-int/lit8 v0, v0, 0x1

    goto :goto_7
.end method
