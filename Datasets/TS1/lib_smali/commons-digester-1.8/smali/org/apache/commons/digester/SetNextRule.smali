.class public Lorg/apache/commons/digester/SetNextRule;
.super Lorg/apache/commons/digester/Rule;
.source "SetNextRule.java"


# instance fields
.field protected methodName:Ljava/lang/String;

.field protected paramType:Ljava/lang/String;

.field protected useExactMatch:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    .line 98
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/digester/SetNextRule;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "paramType"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 113
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 127
    iput-object v0, p0, Lorg/apache/commons/digester/SetNextRule;->methodName:Ljava/lang/String;

    .line 133
    iput-object v0, p0, Lorg/apache/commons/digester/SetNextRule;->paramType:Ljava/lang/String;

    .line 138
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/digester/SetNextRule;->useExactMatch:Z

    .line 115
    iput-object p1, p0, Lorg/apache/commons/digester/SetNextRule;->methodName:Ljava/lang/String;

    .line 116
    iput-object p2, p0, Lorg/apache/commons/digester/SetNextRule;->paramType:Ljava/lang/String;

    .line 118
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;Ljava/lang/String;)V
    .registers 3
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "methodName"    # Ljava/lang/String;

    .prologue
    .line 64
    invoke-direct {p0, p2}, Lorg/apache/commons/digester/SetNextRule;-><init>(Ljava/lang/String;)V

    .line 66
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "paramType"    # Ljava/lang/String;

    .prologue
    .line 85
    invoke-direct {p0, p2, p3}, Lorg/apache/commons/digester/SetNextRule;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    return-void
.end method


# virtual methods
.method public end()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 187
    iget-object v3, p0, Lorg/apache/commons/digester/SetNextRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v3, v6}, Lorg/apache/commons/digester/Digester;->peek(I)Ljava/lang/Object;

    move-result-object v0

    .line 188
    .local v0, "child":Ljava/lang/Object;
    iget-object v3, p0, Lorg/apache/commons/digester/SetNextRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v3, v7}, Lorg/apache/commons/digester/Digester;->peek(I)Ljava/lang/Object;

    move-result-object v2

    .line 189
    .local v2, "parent":Ljava/lang/Object;
    iget-object v3, p0, Lorg/apache/commons/digester/SetNextRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v3, v3, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_54

    .line 190
    if-nez v2, :cond_76

    .line 191
    iget-object v3, p0, Lorg/apache/commons/digester/SetNextRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v3, v3, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "[SetNextRule]{"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/commons/digester/SetNextRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v5, v5, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "} Call [NULL PARENT]."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/commons/digester/SetNextRule;->methodName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 202
    :cond_54
    :goto_54
    new-array v1, v7, [Ljava/lang/Class;

    .line 203
    .local v1, "paramTypes":[Ljava/lang/Class;
    iget-object v3, p0, Lorg/apache/commons/digester/SetNextRule;->paramType:Ljava/lang/String;

    if-eqz v3, :cond_c3

    .line 204
    iget-object v3, p0, Lorg/apache/commons/digester/SetNextRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v3}, Lorg/apache/commons/digester/Digester;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/digester/SetNextRule;->paramType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    aput-object v3, v1, v6

    .line 210
    :goto_68
    iget-boolean v3, p0, Lorg/apache/commons/digester/SetNextRule;->useExactMatch:Z

    if-eqz v3, :cond_ca

    .line 212
    iget-object v3, p0, Lorg/apache/commons/digester/SetNextRule;->methodName:Ljava/lang/String;

    new-array v4, v7, [Ljava/lang/Object;

    aput-object v0, v4, v6

    invoke-static {v2, v3, v4, v1}, Lorg/apache/commons/beanutils/MethodUtils;->invokeExactMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;

    .line 221
    :goto_75
    return-void

    .line 195
    .end local v1    # "paramTypes":[Ljava/lang/Class;
    :cond_76
    iget-object v3, p0, Lorg/apache/commons/digester/SetNextRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v3, v3, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "[SetNextRule]{"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/commons/digester/SetNextRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v5, v5, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "} Call "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/commons/digester/SetNextRule;->methodName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_54

    .line 207
    .restart local v1    # "paramTypes":[Ljava/lang/Class;
    :cond_c3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    aput-object v3, v1, v6

    goto :goto_68

    .line 217
    :cond_ca
    iget-object v3, p0, Lorg/apache/commons/digester/SetNextRule;->methodName:Ljava/lang/String;

    new-array v4, v7, [Ljava/lang/Object;

    aput-object v0, v4, v6

    invoke-static {v2, v3, v4, v1}, Lorg/apache/commons/beanutils/MethodUtils;->invokeMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;

    goto :goto_75
.end method

.method public isExactMatch()Z
    .registers 2

    .prologue
    .line 165
    iget-boolean v0, p0, Lorg/apache/commons/digester/SetNextRule;->useExactMatch:Z

    return v0
.end method

.method public setExactMatch(Z)V
    .registers 2
    .param p1, "useExactMatch"    # Z

    .prologue
    .line 178
    iput-boolean p1, p0, Lorg/apache/commons/digester/SetNextRule;->useExactMatch:Z

    .line 179
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 229
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "SetNextRule["

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 230
    .local v0, "sb":Ljava/lang/StringBuffer;
    const-string v1, "methodName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 231
    iget-object v1, p0, Lorg/apache/commons/digester/SetNextRule;->methodName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 232
    const-string v1, ", paramType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 233
    iget-object v1, p0, Lorg/apache/commons/digester/SetNextRule;->paramType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 234
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 235
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
