.class public Lorg/apache/commons/digester/CallParamRule;
.super Lorg/apache/commons/digester/Rule;
.source "CallParamRule.java"


# instance fields
.field protected attributeName:Ljava/lang/String;

.field protected bodyTextStack:Lorg/apache/commons/collections/ArrayStack;

.field protected fromStack:Z

.field protected paramIndex:I

.field protected stackIndex:I


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "paramIndex"    # I

    .prologue
    .line 106
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/digester/CallParamRule;-><init>(ILjava/lang/String;)V

    .line 108
    return-void
.end method

.method public constructor <init>(II)V
    .registers 5
    .param p1, "paramIndex"    # I
    .param p2, "stackIndex"    # I

    .prologue
    const/4 v1, 0x0

    .line 148
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 161
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/digester/CallParamRule;->attributeName:Ljava/lang/String;

    .line 167
    iput v1, p0, Lorg/apache/commons/digester/CallParamRule;->paramIndex:I

    .line 173
    iput-boolean v1, p0, Lorg/apache/commons/digester/CallParamRule;->fromStack:Z

    .line 178
    iput v1, p0, Lorg/apache/commons/digester/CallParamRule;->stackIndex:I

    .line 150
    iput p1, p0, Lorg/apache/commons/digester/CallParamRule;->paramIndex:I

    .line 151
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/digester/CallParamRule;->fromStack:Z

    .line 152
    iput p2, p0, Lorg/apache/commons/digester/CallParamRule;->stackIndex:I

    .line 153
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .registers 5
    .param p1, "paramIndex"    # I
    .param p2, "attributeName"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 119
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 161
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/digester/CallParamRule;->attributeName:Ljava/lang/String;

    .line 167
    iput v1, p0, Lorg/apache/commons/digester/CallParamRule;->paramIndex:I

    .line 173
    iput-boolean v1, p0, Lorg/apache/commons/digester/CallParamRule;->fromStack:Z

    .line 178
    iput v1, p0, Lorg/apache/commons/digester/CallParamRule;->stackIndex:I

    .line 121
    iput p1, p0, Lorg/apache/commons/digester/CallParamRule;->paramIndex:I

    .line 122
    iput-object p2, p0, Lorg/apache/commons/digester/CallParamRule;->attributeName:Ljava/lang/String;

    .line 124
    return-void
.end method

.method public constructor <init>(IZ)V
    .registers 5
    .param p1, "paramIndex"    # I
    .param p2, "fromStack"    # Z

    .prologue
    const/4 v1, 0x0

    .line 133
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 161
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/digester/CallParamRule;->attributeName:Ljava/lang/String;

    .line 167
    iput v1, p0, Lorg/apache/commons/digester/CallParamRule;->paramIndex:I

    .line 173
    iput-boolean v1, p0, Lorg/apache/commons/digester/CallParamRule;->fromStack:Z

    .line 178
    iput v1, p0, Lorg/apache/commons/digester/CallParamRule;->stackIndex:I

    .line 135
    iput p1, p0, Lorg/apache/commons/digester/CallParamRule;->paramIndex:I

    .line 136
    iput-boolean p2, p0, Lorg/apache/commons/digester/CallParamRule;->fromStack:Z

    .line 138
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;I)V
    .registers 3
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "paramIndex"    # I

    .prologue
    .line 69
    invoke-direct {p0, p2}, Lorg/apache/commons/digester/CallParamRule;-><init>(I)V

    .line 71
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;ILjava/lang/String;)V
    .registers 4
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "paramIndex"    # I
    .param p3, "attributeName"    # Ljava/lang/String;

    .prologue
    .line 88
    invoke-direct {p0, p2, p3}, Lorg/apache/commons/digester/CallParamRule;-><init>(ILjava/lang/String;)V

    .line 90
    return-void
.end method


# virtual methods
.method public begin(Lorg/xml/sax/Attributes;)V
    .registers 7
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 196
    const/4 v0, 0x0

    .line 198
    .local v0, "param":Ljava/lang/Object;
    iget-object v3, p0, Lorg/apache/commons/digester/CallParamRule;->attributeName:Ljava/lang/String;

    if-eqz v3, :cond_1a

    .line 200
    iget-object v3, p0, Lorg/apache/commons/digester/CallParamRule;->attributeName:Ljava/lang/String;

    invoke-interface {p1, v3}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 222
    .end local v0    # "param":Ljava/lang/Object;
    :cond_b
    :goto_b
    if-eqz v0, :cond_19

    .line 223
    iget-object v3, p0, Lorg/apache/commons/digester/CallParamRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v3}, Lorg/apache/commons/digester/Digester;->peekParams()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    .line 224
    .local v1, "parameters":[Ljava/lang/Object;
    iget v3, p0, Lorg/apache/commons/digester/CallParamRule;->paramIndex:I

    aput-object v0, v1, v3

    .line 226
    .end local v1    # "parameters":[Ljava/lang/Object;
    :cond_19
    return-void

    .line 202
    .restart local v0    # "param":Ljava/lang/Object;
    :cond_1a
    iget-boolean v3, p0, Lorg/apache/commons/digester/CallParamRule;->fromStack:Z

    if-eqz v3, :cond_b

    .line 204
    iget-object v3, p0, Lorg/apache/commons/digester/CallParamRule;->digester:Lorg/apache/commons/digester/Digester;

    iget v4, p0, Lorg/apache/commons/digester/CallParamRule;->stackIndex:I

    invoke-virtual {v3, v4}, Lorg/apache/commons/digester/Digester;->peek(I)Ljava/lang/Object;

    move-result-object v0

    .line 206
    iget-object v3, p0, Lorg/apache/commons/digester/CallParamRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v3, v3, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_b

    .line 208
    new-instance v2, Ljava/lang/StringBuffer;

    const-string v3, "[CallParamRule]{"

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 209
    .local v2, "sb":Ljava/lang/StringBuffer;
    iget-object v3, p0, Lorg/apache/commons/digester/CallParamRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v3, v3, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 210
    const-string v3, "} Save from stack; from stack?"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-boolean v4, p0, Lorg/apache/commons/digester/CallParamRule;->fromStack:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    .line 211
    const-string v3, "; object="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 212
    iget-object v3, p0, Lorg/apache/commons/digester/CallParamRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v3, v3, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_b
.end method

.method public body(Ljava/lang/String;)V
    .registers 4
    .param p1, "bodyText"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 236
    iget-object v0, p0, Lorg/apache/commons/digester/CallParamRule;->attributeName:Ljava/lang/String;

    if-nez v0, :cond_1c

    iget-boolean v0, p0, Lorg/apache/commons/digester/CallParamRule;->fromStack:Z

    if-nez v0, :cond_1c

    .line 240
    iget-object v0, p0, Lorg/apache/commons/digester/CallParamRule;->bodyTextStack:Lorg/apache/commons/collections/ArrayStack;

    if-nez v0, :cond_13

    .line 241
    new-instance v0, Lorg/apache/commons/collections/ArrayStack;

    invoke-direct {v0}, Lorg/apache/commons/collections/ArrayStack;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/CallParamRule;->bodyTextStack:Lorg/apache/commons/collections/ArrayStack;

    .line 243
    :cond_13
    iget-object v0, p0, Lorg/apache/commons/digester/CallParamRule;->bodyTextStack:Lorg/apache/commons/collections/ArrayStack;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/collections/ArrayStack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    :cond_1c
    return-void
.end method

.method public end(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 252
    iget-object v1, p0, Lorg/apache/commons/digester/CallParamRule;->bodyTextStack:Lorg/apache/commons/collections/ArrayStack;

    if-eqz v1, :cond_1e

    iget-object v1, p0, Lorg/apache/commons/digester/CallParamRule;->bodyTextStack:Lorg/apache/commons/collections/ArrayStack;

    invoke-virtual {v1}, Lorg/apache/commons/collections/ArrayStack;->empty()Z

    move-result v1

    if-nez v1, :cond_1e

    .line 254
    iget-object v1, p0, Lorg/apache/commons/digester/CallParamRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v1}, Lorg/apache/commons/digester/Digester;->peekParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    .line 255
    .local v0, "parameters":[Ljava/lang/Object;
    iget v1, p0, Lorg/apache/commons/digester/CallParamRule;->paramIndex:I

    iget-object v2, p0, Lorg/apache/commons/digester/CallParamRule;->bodyTextStack:Lorg/apache/commons/collections/ArrayStack;

    invoke-virtual {v2}, Lorg/apache/commons/collections/ArrayStack;->pop()Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v0, v1

    .line 257
    .end local v0    # "parameters":[Ljava/lang/Object;
    :cond_1e
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 264
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "CallParamRule["

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 265
    .local v0, "sb":Ljava/lang/StringBuffer;
    const-string v1, "paramIndex="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 266
    iget v1, p0, Lorg/apache/commons/digester/CallParamRule;->paramIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 267
    const-string v1, ", attributeName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 268
    iget-object v1, p0, Lorg/apache/commons/digester/CallParamRule;->attributeName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 269
    const-string v1, ", from stack="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 270
    iget-boolean v1, p0, Lorg/apache/commons/digester/CallParamRule;->fromStack:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    .line 271
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 272
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
