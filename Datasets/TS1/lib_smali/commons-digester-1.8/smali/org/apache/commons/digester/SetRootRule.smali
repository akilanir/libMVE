.class public Lorg/apache/commons/digester/SetRootRule;
.super Lorg/apache/commons/digester/Rule;
.source "SetRootRule.java"


# instance fields
.field protected methodName:Ljava/lang/String;

.field protected paramType:Ljava/lang/String;

.field protected useExactMatch:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    .line 90
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/digester/SetRootRule;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "paramType"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 105
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 118
    iput-object v0, p0, Lorg/apache/commons/digester/SetRootRule;->methodName:Ljava/lang/String;

    .line 124
    iput-object v0, p0, Lorg/apache/commons/digester/SetRootRule;->paramType:Ljava/lang/String;

    .line 129
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/digester/SetRootRule;->useExactMatch:Z

    .line 107
    iput-object p1, p0, Lorg/apache/commons/digester/SetRootRule;->methodName:Ljava/lang/String;

    .line 108
    iput-object p2, p0, Lorg/apache/commons/digester/SetRootRule;->paramType:Ljava/lang/String;

    .line 110
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;Ljava/lang/String;)V
    .registers 3
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "methodName"    # Ljava/lang/String;

    .prologue
    .line 56
    invoke-direct {p0, p2}, Lorg/apache/commons/digester/SetRootRule;-><init>(Ljava/lang/String;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "paramType"    # Ljava/lang/String;

    .prologue
    .line 77
    invoke-direct {p0, p2, p3}, Lorg/apache/commons/digester/SetRootRule;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
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

    .line 180
    iget-object v3, p0, Lorg/apache/commons/digester/SetRootRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v3, v6}, Lorg/apache/commons/digester/Digester;->peek(I)Ljava/lang/Object;

    move-result-object v0

    .line 181
    .local v0, "child":Ljava/lang/Object;
    iget-object v3, p0, Lorg/apache/commons/digester/SetRootRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v2, v3, Lorg/apache/commons/digester/Digester;->root:Ljava/lang/Object;

    .line 182
    .local v2, "parent":Ljava/lang/Object;
    iget-object v3, p0, Lorg/apache/commons/digester/SetRootRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v3, v3, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_52

    .line 183
    if-nez v2, :cond_74

    .line 184
    iget-object v3, p0, Lorg/apache/commons/digester/SetRootRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v3, v3, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "[SetRootRule]{"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/commons/digester/SetRootRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v5, v5, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "} Call [NULL ROOT]."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/commons/digester/SetRootRule;->methodName:Ljava/lang/String;

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

    .line 195
    :cond_52
    :goto_52
    new-array v1, v7, [Ljava/lang/Class;

    .line 196
    .local v1, "paramTypes":[Ljava/lang/Class;
    iget-object v3, p0, Lorg/apache/commons/digester/SetRootRule;->paramType:Ljava/lang/String;

    if-eqz v3, :cond_c1

    .line 197
    iget-object v3, p0, Lorg/apache/commons/digester/SetRootRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v3}, Lorg/apache/commons/digester/Digester;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/digester/SetRootRule;->paramType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    aput-object v3, v1, v6

    .line 203
    :goto_66
    iget-boolean v3, p0, Lorg/apache/commons/digester/SetRootRule;->useExactMatch:Z

    if-eqz v3, :cond_c8

    .line 205
    iget-object v3, p0, Lorg/apache/commons/digester/SetRootRule;->methodName:Ljava/lang/String;

    new-array v4, v7, [Ljava/lang/Object;

    aput-object v0, v4, v6

    invoke-static {v2, v3, v4, v1}, Lorg/apache/commons/beanutils/MethodUtils;->invokeExactMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;

    .line 214
    :goto_73
    return-void

    .line 188
    .end local v1    # "paramTypes":[Ljava/lang/Class;
    :cond_74
    iget-object v3, p0, Lorg/apache/commons/digester/SetRootRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v3, v3, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "[SetRootRule]{"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/commons/digester/SetRootRule;->digester:Lorg/apache/commons/digester/Digester;

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

    iget-object v5, p0, Lorg/apache/commons/digester/SetRootRule;->methodName:Ljava/lang/String;

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

    goto :goto_52

    .line 200
    .restart local v1    # "paramTypes":[Ljava/lang/Class;
    :cond_c1
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    aput-object v3, v1, v6

    goto :goto_66

    .line 210
    :cond_c8
    iget-object v3, p0, Lorg/apache/commons/digester/SetRootRule;->methodName:Ljava/lang/String;

    new-array v4, v7, [Ljava/lang/Object;

    aput-object v0, v4, v6

    invoke-static {v2, v3, v4, v1}, Lorg/apache/commons/beanutils/MethodUtils;->invokeMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;

    goto :goto_73
.end method

.method public isExactMatch()Z
    .registers 2

    .prologue
    .line 157
    iget-boolean v0, p0, Lorg/apache/commons/digester/SetRootRule;->useExactMatch:Z

    return v0
.end method

.method public setExactMatch(Z)V
    .registers 2
    .param p1, "useExactMatch"    # Z

    .prologue
    .line 171
    iput-boolean p1, p0, Lorg/apache/commons/digester/SetRootRule;->useExactMatch:Z

    .line 172
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 222
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "SetRootRule["

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 223
    .local v0, "sb":Ljava/lang/StringBuffer;
    const-string v1, "methodName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 224
    iget-object v1, p0, Lorg/apache/commons/digester/SetRootRule;->methodName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 225
    const-string v1, ", paramType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 226
    iget-object v1, p0, Lorg/apache/commons/digester/SetRootRule;->paramType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 227
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 228
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
