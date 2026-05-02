.class public Lorg/apache/commons/digester/BeanPropertySetterRule;
.super Lorg/apache/commons/digester/Rule;
.source "BeanPropertySetterRule.java"


# instance fields
.field protected bodyText:Ljava/lang/String;

.field protected propertyName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 101
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lorg/apache/commons/digester/BeanPropertySetterRule;-><init>(Ljava/lang/String;)V

    .line 103
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 87
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 111
    iput-object v0, p0, Lorg/apache/commons/digester/BeanPropertySetterRule;->propertyName:Ljava/lang/String;

    .line 117
    iput-object v0, p0, Lorg/apache/commons/digester/BeanPropertySetterRule;->bodyText:Ljava/lang/String;

    .line 89
    iput-object p1, p0, Lorg/apache/commons/digester/BeanPropertySetterRule;->propertyName:Ljava/lang/String;

    .line 91
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;)V
    .registers 2
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 78
    invoke-direct {p0}, Lorg/apache/commons/digester/BeanPropertySetterRule;-><init>()V

    .line 80
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;Ljava/lang/String;)V
    .registers 3
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 61
    invoke-direct {p0, p2}, Lorg/apache/commons/digester/BeanPropertySetterRule;-><init>(Ljava/lang/String;)V

    .line 63
    return-void
.end method


# virtual methods
.method public body(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 137
    iget-object v0, p0, Lorg/apache/commons/digester/BeanPropertySetterRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v0, v0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_38

    .line 138
    iget-object v0, p0, Lorg/apache/commons/digester/BeanPropertySetterRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v0, v0, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "[BeanPropertySetterRule]{"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/digester/BeanPropertySetterRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v2, v2, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "} Called with text \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 142
    :cond_38
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/digester/BeanPropertySetterRule;->bodyText:Ljava/lang/String;

    .line 144
    return-void
.end method

.method public end(Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 161
    iget-object v1, p0, Lorg/apache/commons/digester/BeanPropertySetterRule;->propertyName:Ljava/lang/String;

    .line 163
    .local v1, "property":Ljava/lang/String;
    if-nez v1, :cond_5

    .line 166
    move-object v1, p2

    .line 170
    :cond_5
    iget-object v3, p0, Lorg/apache/commons/digester/BeanPropertySetterRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v3}, Lorg/apache/commons/digester/Digester;->peek()Ljava/lang/Object;

    move-result-object v2

    .line 173
    .local v2, "top":Ljava/lang/Object;
    iget-object v3, p0, Lorg/apache/commons/digester/BeanPropertySetterRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v3, v3, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_5b

    .line 174
    iget-object v3, p0, Lorg/apache/commons/digester/BeanPropertySetterRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v3, v3, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "[BeanPropertySetterRule]{"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/commons/digester/BeanPropertySetterRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v5, v5, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "} Set "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " property "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " with text "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/commons/digester/BeanPropertySetterRule;->bodyText:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 181
    :cond_5b
    instance-of v3, v2, Lorg/apache/commons/beanutils/DynaBean;

    if-eqz v3, :cond_85

    move-object v3, v2

    .line 182
    check-cast v3, Lorg/apache/commons/beanutils/DynaBean;

    invoke-interface {v3}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v3

    invoke-interface {v3, v1}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v0

    .line 184
    .local v0, "desc":Lorg/apache/commons/beanutils/DynaProperty;
    if-nez v0, :cond_a4

    .line 185
    new-instance v3, Ljava/lang/NoSuchMethodException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Bean has no property named "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 189
    .end local v0    # "desc":Lorg/apache/commons/beanutils/DynaProperty;
    :cond_85
    invoke-static {v2, v1}, Lorg/apache/commons/beanutils/PropertyUtils;->getPropertyDescriptor(Ljava/lang/Object;Ljava/lang/String;)Ljava/beans/PropertyDescriptor;

    move-result-object v0

    .line 191
    .local v0, "desc":Ljava/beans/PropertyDescriptor;
    if-nez v0, :cond_a4

    .line 192
    new-instance v3, Ljava/lang/NoSuchMethodException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Bean has no property named "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 198
    .end local v0    # "desc":Ljava/beans/PropertyDescriptor;
    :cond_a4
    iget-object v3, p0, Lorg/apache/commons/digester/BeanPropertySetterRule;->bodyText:Ljava/lang/String;

    invoke-static {v2, v1, v3}, Lorg/apache/commons/beanutils/BeanUtils;->setProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 200
    return-void
.end method

.method public finish()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 208
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/digester/BeanPropertySetterRule;->bodyText:Ljava/lang/String;

    .line 210
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 218
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "BeanPropertySetterRule["

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 219
    .local v0, "sb":Ljava/lang/StringBuffer;
    const-string v1, "propertyName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 220
    iget-object v1, p0, Lorg/apache/commons/digester/BeanPropertySetterRule;->propertyName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 221
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 222
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
