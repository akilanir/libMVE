.class final Lcom/fasterxml/jackson/databind/type/TypeParser$MyTokenizer;
.super Ljava/util/StringTokenizer;
.source "TypeParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/fasterxml/jackson/databind/type/TypeParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "MyTokenizer"
.end annotation


# instance fields
.field protected _index:I

.field protected final _input:Ljava/lang/String;

.field protected _pushbackToken:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 100
    const-string v0, "<,>"

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 101
    iput-object p1, p0, Lcom/fasterxml/jackson/databind/type/TypeParser$MyTokenizer;->_input:Ljava/lang/String;

    .line 102
    return-void
.end method


# virtual methods
.method public getAllInput()Ljava/lang/String;
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/type/TypeParser$MyTokenizer;->_input:Ljava/lang/String;

    return-object v0
.end method

.method public getRemainingInput()Ljava/lang/String;
    .registers 3

    .prologue
    .line 129
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/type/TypeParser$MyTokenizer;->_input:Ljava/lang/String;

    iget v1, p0, Lcom/fasterxml/jackson/databind/type/TypeParser$MyTokenizer;->_index:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUsedInput()Ljava/lang/String;
    .registers 4

    .prologue
    .line 128
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/type/TypeParser$MyTokenizer;->_input:Ljava/lang/String;

    const/4 v1, 0x0

    iget v2, p0, Lcom/fasterxml/jackson/databind/type/TypeParser$MyTokenizer;->_index:I

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasMoreTokens()Z
    .registers 2

    .prologue
    .line 106
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/type/TypeParser$MyTokenizer;->_pushbackToken:Ljava/lang/String;

    if-nez v0, :cond_a

    invoke-super {p0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public nextToken()Ljava/lang/String;
    .registers 4

    .prologue
    .line 112
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/type/TypeParser$MyTokenizer;->_pushbackToken:Ljava/lang/String;

    if-eqz v1, :cond_13

    .line 113
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/type/TypeParser$MyTokenizer;->_pushbackToken:Ljava/lang/String;

    .line 114
    .local v0, "token":Ljava/lang/String;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/databind/type/TypeParser$MyTokenizer;->_pushbackToken:Ljava/lang/String;

    .line 118
    :goto_9
    iget v1, p0, Lcom/fasterxml/jackson/databind/type/TypeParser$MyTokenizer;->_index:I

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    iput v1, p0, Lcom/fasterxml/jackson/databind/type/TypeParser$MyTokenizer;->_index:I

    .line 119
    return-object v0

    .line 116
    .end local v0    # "token":Ljava/lang/String;
    :cond_13
    invoke-super {p0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "token":Ljava/lang/String;
    goto :goto_9
.end method

.method public pushBack(Ljava/lang/String;)V
    .registers 4
    .param p1, "token"    # Ljava/lang/String;

    .prologue
    .line 123
    iput-object p1, p0, Lcom/fasterxml/jackson/databind/type/TypeParser$MyTokenizer;->_pushbackToken:Ljava/lang/String;

    .line 124
    iget v0, p0, Lcom/fasterxml/jackson/databind/type/TypeParser$MyTokenizer;->_index:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/fasterxml/jackson/databind/type/TypeParser$MyTokenizer;->_index:I

    .line 125
    return-void
.end method
