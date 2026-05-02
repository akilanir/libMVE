.class public Lorg/apache/commons/digester/SetPropertyRule;
.super Lorg/apache/commons/digester/Rule;
.source "SetPropertyRule.java"


# instance fields
.field protected name:Ljava/lang/String;

.field protected value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 71
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 84
    iput-object v0, p0, Lorg/apache/commons/digester/SetPropertyRule;->name:Ljava/lang/String;

    .line 90
    iput-object v0, p0, Lorg/apache/commons/digester/SetPropertyRule;->value:Ljava/lang/String;

    .line 73
    iput-object p1, p0, Lorg/apache/commons/digester/SetPropertyRule;->name:Ljava/lang/String;

    .line 74
    iput-object p2, p0, Lorg/apache/commons/digester/SetPropertyRule;->value:Ljava/lang/String;

    .line 76
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 58
    invoke-direct {p0, p2, p3}, Lorg/apache/commons/digester/SetPropertyRule;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    return-void
.end method


# virtual methods
.method public begin(Lorg/xml/sax/Attributes;)V
    .registers 12
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 107
    const/4 v0, 0x0

    .line 108
    .local v0, "actualName":Ljava/lang/String;
    const/4 v1, 0x0

    .line 109
    .local v1, "actualValue":Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_3
    invoke-interface {p1}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v7

    if-lt v3, v7, :cond_87

    .line 123
    iget-object v7, p0, Lorg/apache/commons/digester/SetPropertyRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v7}, Lorg/apache/commons/digester/Digester;->peek()Ljava/lang/Object;

    move-result-object v5

    .line 126
    .local v5, "top":Ljava/lang/Object;
    iget-object v7, p0, Lorg/apache/commons/digester/SetPropertyRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v7, v7, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v7}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v7

    if-eqz v7, :cond_5d

    .line 127
    iget-object v7, p0, Lorg/apache/commons/digester/SetPropertyRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v7, v7, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "[SetPropertyRule]{"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/commons/digester/SetPropertyRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v9, v9, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "} Set "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, " property "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, " to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 137
    :cond_5d
    instance-of v7, v5, Lorg/apache/commons/beanutils/DynaBean;

    if-eqz v7, :cond_b2

    move-object v7, v5

    .line 138
    check-cast v7, Lorg/apache/commons/beanutils/DynaBean;

    invoke-interface {v7}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v7

    invoke-interface {v7, v0}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v2

    .line 140
    .local v2, "desc":Lorg/apache/commons/beanutils/DynaProperty;
    if-nez v2, :cond_d1

    .line 141
    new-instance v7, Ljava/lang/NoSuchMethodException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "Bean has no property named "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 110
    .end local v2    # "desc":Lorg/apache/commons/beanutils/DynaProperty;
    .end local v5    # "top":Ljava/lang/Object;
    :cond_87
    invoke-interface {p1, v3}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v4

    .line 111
    .local v4, "name":Ljava/lang/String;
    const-string v7, ""

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_97

    .line 112
    invoke-interface {p1, v3}, Lorg/xml/sax/Attributes;->getQName(I)Ljava/lang/String;

    move-result-object v4

    .line 114
    :cond_97
    invoke-interface {p1, v3}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v6

    .line 115
    .local v6, "value":Ljava/lang/String;
    iget-object v7, p0, Lorg/apache/commons/digester/SetPropertyRule;->name:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a8

    .line 116
    move-object v0, v6

    .line 109
    :cond_a4
    :goto_a4
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_3

    .line 117
    :cond_a8
    iget-object v7, p0, Lorg/apache/commons/digester/SetPropertyRule;->value:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a4

    .line 118
    move-object v1, v6

    goto :goto_a4

    .line 145
    .end local v4    # "name":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/String;
    .restart local v5    # "top":Ljava/lang/Object;
    :cond_b2
    invoke-static {v5, v0}, Lorg/apache/commons/beanutils/PropertyUtils;->getPropertyDescriptor(Ljava/lang/Object;Ljava/lang/String;)Ljava/beans/PropertyDescriptor;

    move-result-object v2

    .line 147
    .local v2, "desc":Ljava/beans/PropertyDescriptor;
    if-nez v2, :cond_d1

    .line 148
    new-instance v7, Ljava/lang/NoSuchMethodException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "Bean has no property named "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 154
    .end local v2    # "desc":Ljava/beans/PropertyDescriptor;
    :cond_d1
    invoke-static {v5, v0, v1}, Lorg/apache/commons/beanutils/BeanUtils;->setProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 156
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 164
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "SetPropertyRule["

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 165
    .local v0, "sb":Ljava/lang/StringBuffer;
    const-string v1, "name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 166
    iget-object v1, p0, Lorg/apache/commons/digester/SetPropertyRule;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 167
    const-string v1, ", value="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 168
    iget-object v1, p0, Lorg/apache/commons/digester/SetPropertyRule;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 169
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 170
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
