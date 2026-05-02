.class public Lorg/apache/commons/digester/ObjectCreateRule;
.super Lorg/apache/commons/digester/Rule;
.source "ObjectCreateRule.java"


# instance fields
.field protected attributeName:Ljava/lang/String;

.field protected className:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 4
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 129
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v1, v0}, Lorg/apache/commons/digester/ObjectCreateRule;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 117
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/digester/ObjectCreateRule;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Class;)V
    .registers 4
    .param p1, "attributeName"    # Ljava/lang/String;
    .param p2, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 162
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/digester/ObjectCreateRule;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "attributeName"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 143
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 172
    iput-object v0, p0, Lorg/apache/commons/digester/ObjectCreateRule;->attributeName:Ljava/lang/String;

    .line 178
    iput-object v0, p0, Lorg/apache/commons/digester/ObjectCreateRule;->className:Ljava/lang/String;

    .line 145
    iput-object p1, p0, Lorg/apache/commons/digester/ObjectCreateRule;->className:Ljava/lang/String;

    .line 146
    iput-object p2, p0, Lorg/apache/commons/digester/ObjectCreateRule;->attributeName:Ljava/lang/String;

    .line 148
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;Ljava/lang/Class;)V
    .registers 3
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 65
    invoke-direct {p0, p2}, Lorg/apache/commons/digester/ObjectCreateRule;-><init>(Ljava/lang/Class;)V

    .line 67
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;Ljava/lang/String;)V
    .registers 3
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "className"    # Ljava/lang/String;

    .prologue
    .line 49
    invoke-direct {p0, p2}, Lorg/apache/commons/digester/ObjectCreateRule;-><init>(Ljava/lang/String;)V

    .line 51
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;Ljava/lang/String;Ljava/lang/Class;)V
    .registers 4
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "attributeName"    # Ljava/lang/String;
    .param p3, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 106
    invoke-direct {p0, p2, p3}, Lorg/apache/commons/digester/ObjectCreateRule;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 108
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "className"    # Ljava/lang/String;
    .param p3, "attributeName"    # Ljava/lang/String;

    .prologue
    .line 85
    invoke-direct {p0, p2, p3}, Lorg/apache/commons/digester/ObjectCreateRule;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    return-void
.end method


# virtual methods
.method public begin(Lorg/xml/sax/Attributes;)V
    .registers 9
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 192
    iget-object v2, p0, Lorg/apache/commons/digester/ObjectCreateRule;->className:Ljava/lang/String;

    .line 193
    .local v2, "realClassName":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/commons/digester/ObjectCreateRule;->attributeName:Ljava/lang/String;

    if-eqz v4, :cond_f

    .line 194
    iget-object v4, p0, Lorg/apache/commons/digester/ObjectCreateRule;->attributeName:Ljava/lang/String;

    invoke-interface {p1, v4}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 195
    .local v3, "value":Ljava/lang/String;
    if-eqz v3, :cond_f

    .line 196
    move-object v2, v3

    .line 199
    .end local v3    # "value":Ljava/lang/String;
    :cond_f
    iget-object v4, p0, Lorg/apache/commons/digester/ObjectCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v4, v4, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_41

    .line 200
    iget-object v4, p0, Lorg/apache/commons/digester/ObjectCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v4, v4, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "[ObjectCreateRule]{"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/digester/ObjectCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v6, v6, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "}New "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 205
    :cond_41
    iget-object v4, p0, Lorg/apache/commons/digester/ObjectCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v4}, Lorg/apache/commons/digester/Digester;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 206
    .local v0, "clazz":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    .line 207
    .local v1, "instance":Ljava/lang/Object;
    iget-object v4, p0, Lorg/apache/commons/digester/ObjectCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v4, v1}, Lorg/apache/commons/digester/Digester;->push(Ljava/lang/Object;)V

    .line 209
    return-void
.end method

.method public end()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 217
    iget-object v1, p0, Lorg/apache/commons/digester/ObjectCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v1}, Lorg/apache/commons/digester/Digester;->pop()Ljava/lang/Object;

    move-result-object v0

    .line 218
    .local v0, "top":Ljava/lang/Object;
    iget-object v1, p0, Lorg/apache/commons/digester/ObjectCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v1, v1, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_40

    .line 219
    iget-object v1, p0, Lorg/apache/commons/digester/ObjectCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v1, v1, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "[ObjectCreateRule]{"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/digester/ObjectCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v3, v3, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "} Pop "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 223
    :cond_40
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 231
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "ObjectCreateRule["

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 232
    .local v0, "sb":Ljava/lang/StringBuffer;
    const-string v1, "className="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 233
    iget-object v1, p0, Lorg/apache/commons/digester/ObjectCreateRule;->className:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 234
    const-string v1, ", attributeName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 235
    iget-object v1, p0, Lorg/apache/commons/digester/ObjectCreateRule;->attributeName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 236
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 237
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
