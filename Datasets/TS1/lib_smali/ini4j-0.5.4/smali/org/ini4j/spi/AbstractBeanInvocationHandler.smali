.class public abstract Lorg/ini4j/spi/AbstractBeanInvocationHandler;
.super Ljava/lang/Object;
.source "AbstractBeanInvocationHandler.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/ini4j/spi/AbstractBeanInvocationHandler$1;,
        Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;
    }
.end annotation


# static fields
.field private static final ADD_PREFIX:Ljava/lang/String; = "add"

.field private static final HAS_PREFIX:Ljava/lang/String; = "has"

.field private static final PROPERTY_CHANGE_LISTENER:Ljava/lang/String; = "PropertyChangeListener"

.field private static final READ_BOOLEAN_PREFIX:Ljava/lang/String; = "is"

.field private static final READ_PREFIX:Ljava/lang/String; = "get"

.field private static final REMOVE_PREFIX:Ljava/lang/String; = "remove"

.field private static final VETOABLE_CHANGE_LISTENER:Ljava/lang/String; = "VetoableChangeListener"

.field private static final WRITE_PREFIX:Ljava/lang/String; = "set"


# instance fields
.field private _pcSupport:Ljava/beans/PropertyChangeSupport;

.field private _proxy:Ljava/lang/Object;

.field private _vcSupport:Ljava/beans/VetoableChangeSupport;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    return-void
.end method

.method private declared-synchronized updateProxy(Ljava/lang/Object;)V
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 293
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_proxy:Ljava/lang/Object;

    if-nez v0, :cond_7

    .line 295
    iput-object p1, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_proxy:Ljava/lang/Object;
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_9

    .line 297
    :cond_7
    monitor-exit p0

    return-void

    .line 293
    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method protected declared-synchronized addPropertyChangeListener(Ljava/lang/String;Ljava/beans/PropertyChangeListener;)V
    .registers 5
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "listener"    # Ljava/beans/PropertyChangeListener;

    .prologue
    .line 215
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_pcSupport:Ljava/beans/PropertyChangeSupport;

    if-nez v0, :cond_e

    .line 217
    new-instance v0, Ljava/beans/PropertyChangeSupport;

    iget-object v1, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_proxy:Ljava/lang/Object;

    invoke-direct {v0, v1}, Ljava/beans/PropertyChangeSupport;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_pcSupport:Ljava/beans/PropertyChangeSupport;

    .line 220
    :cond_e
    iget-object v0, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_pcSupport:Ljava/beans/PropertyChangeSupport;

    invoke-virtual {v0, p1, p2}, Ljava/beans/PropertyChangeSupport;->addPropertyChangeListener(Ljava/lang/String;Ljava/beans/PropertyChangeListener;)V
    :try_end_13
    .catchall {:try_start_1 .. :try_end_13} :catchall_15

    .line 221
    monitor-exit p0

    return-void

    .line 215
    :catchall_15
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized addVetoableChangeListener(Ljava/lang/String;Ljava/beans/VetoableChangeListener;)V
    .registers 5
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "listener"    # Ljava/beans/VetoableChangeListener;

    .prologue
    .line 225
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_vcSupport:Ljava/beans/VetoableChangeSupport;

    if-nez v0, :cond_e

    .line 227
    new-instance v0, Ljava/beans/VetoableChangeSupport;

    iget-object v1, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_proxy:Ljava/lang/Object;

    invoke-direct {v0, v1}, Ljava/beans/VetoableChangeSupport;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_vcSupport:Ljava/beans/VetoableChangeSupport;

    .line 230
    :cond_e
    iget-object v0, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_vcSupport:Ljava/beans/VetoableChangeSupport;

    invoke-virtual {v0, p1, p2}, Ljava/beans/VetoableChangeSupport;->addVetoableChangeListener(Ljava/lang/String;Ljava/beans/VetoableChangeListener;)V
    :try_end_13
    .catchall {:try_start_1 .. :try_end_13} :catchall_15

    .line 231
    monitor-exit p0

    return-void

    .line 225
    :catchall_15
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized firePropertyChange(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "oldValue"    # Ljava/lang/Object;
    .param p3, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 235
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_pcSupport:Ljava/beans/PropertyChangeSupport;

    if-eqz v0, :cond_a

    .line 237
    iget-object v0, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_pcSupport:Ljava/beans/PropertyChangeSupport;

    invoke-virtual {v0, p1, p2, p3}, Ljava/beans/PropertyChangeSupport;->firePropertyChange(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 239
    :cond_a
    monitor-exit p0

    return-void

    .line 235
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized fireVetoableChange(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "oldValue"    # Ljava/lang/Object;
    .param p3, "newValue"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/beans/PropertyVetoException;
        }
    .end annotation

    .prologue
    .line 243
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_vcSupport:Ljava/beans/VetoableChangeSupport;

    if-eqz v0, :cond_a

    .line 245
    iget-object v0, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_vcSupport:Ljava/beans/VetoableChangeSupport;

    invoke-virtual {v0, p1, p2, p3}, Ljava/beans/VetoableChangeSupport;->fireVetoableChange(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 247
    :cond_a
    monitor-exit p0

    return-void

    .line 243
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized getProperty(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 10
    .param p1, "property"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 156
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0, p1, p2}, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->getPropertySpi(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    .line 157
    .local v2, "o":Ljava/lang/Object;
    if-nez v2, :cond_d

    .line 159
    invoke-virtual {p0, p2}, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->zero(Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_a} :catch_55
    .catchall {:try_start_1 .. :try_end_a} :catchall_5b

    move-result-object v2

    .line 181
    :cond_b
    :goto_b
    monitor-exit p0

    return-object v2

    .line 161
    :cond_d
    :try_start_d
    invoke-virtual {p2}, Ljava/lang/Class;->isArray()Z

    move-result v5

    if-eqz v5, :cond_42

    instance-of v5, v2, [Ljava/lang/String;

    if-eqz v5, :cond_42

    const-class v5, [Ljava/lang/String;

    invoke-virtual {p2, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_42

    .line 163
    check-cast v2, [Ljava/lang/String;

    .end local v2    # "o":Ljava/lang/Object;
    move-object v0, v2

    check-cast v0, [Ljava/lang/String;

    move-object v3, v0

    .line 165
    .local v3, "str":[Ljava/lang/String;
    invoke-virtual {p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v5

    array-length v6, v3

    invoke-static {v5, v6}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v2

    .line 166
    .restart local v2    # "o":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2f
    array-length v5, v3

    if-ge v1, v5, :cond_b

    .line 168
    aget-object v5, v3, v1

    invoke-virtual {p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v2, v1, v5}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 166
    add-int/lit8 v1, v1, 0x1

    goto :goto_2f

    .line 171
    .end local v1    # "i":I
    .end local v3    # "str":[Ljava/lang/String;
    :cond_42
    instance-of v5, v2, Ljava/lang/String;

    if-eqz v5, :cond_b

    const-class v5, Ljava/lang/String;

    invoke-virtual {p2, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_b

    .line 173
    check-cast v2, Ljava/lang/String;

    .end local v2    # "o":Ljava/lang/Object;
    invoke-virtual {p0, v2, p2}, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_53
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_53} :catch_55
    .catchall {:try_start_d .. :try_end_53} :catchall_5b

    move-result-object v2

    .restart local v2    # "o":Ljava/lang/Object;
    goto :goto_b

    .line 176
    .end local v2    # "o":Ljava/lang/Object;
    :catch_55
    move-exception v4

    .line 178
    .local v4, "x":Ljava/lang/Exception;
    :try_start_56
    invoke-virtual {p0, p2}, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->zero(Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_59
    .catchall {:try_start_56 .. :try_end_59} :catchall_5b

    move-result-object v2

    .restart local v2    # "o":Ljava/lang/Object;
    goto :goto_b

    .line 156
    .end local v2    # "o":Ljava/lang/Object;
    .end local v4    # "x":Ljava/lang/Exception;
    :catchall_5b
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method protected abstract getPropertySpi(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method protected declared-synchronized getProxy()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 210
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_proxy:Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized hasProperty(Ljava/lang/String;)Z
    .registers 5
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 255
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0, p1}, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->hasPropertySpi(Ljava/lang/String;)Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4} :catch_7
    .catchall {:try_start_1 .. :try_end_4} :catchall_a

    move-result v0

    .line 262
    .local v0, "ret":Z
    :goto_5
    monitor-exit p0

    return v0

    .line 257
    .end local v0    # "ret":Z
    :catch_7
    move-exception v1

    .line 259
    .local v1, "x":Ljava/lang/Exception;
    const/4 v0, 0x0

    .restart local v0    # "ret":Z
    goto :goto_5

    .line 255
    .end local v0    # "ret":Z
    .end local v1    # "x":Ljava/lang/Exception;
    :catchall_a
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method protected abstract hasPropertySpi(Ljava/lang/String;)Z
.end method

.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11
    .param p1, "proxy"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/beans/PropertyVetoException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 93
    const/4 v1, 0x0

    .line 94
    .local v1, "ret":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->parse(Ljava/lang/String;)Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    move-result-object v0

    .line 96
    .local v0, "prefix":Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;
    if-eqz v0, :cond_23

    .line 98
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->getTail(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 100
    .local v2, "tail":Ljava/lang/String;
    invoke-direct {p0, p1}, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->updateProxy(Ljava/lang/Object;)V

    .line 101
    sget-object v3, Lorg/ini4j/spi/AbstractBeanInvocationHandler$1;->$SwitchMap$org$ini4j$spi$AbstractBeanInvocationHandler$Prefix:[I

    invoke-virtual {v0}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_94

    .line 141
    .end local v1    # "ret":Ljava/lang/Object;
    .end local v2    # "tail":Ljava/lang/String;
    :cond_23
    :goto_23
    return-object v1

    .line 105
    .restart local v1    # "ret":Ljava/lang/Object;
    .restart local v2    # "tail":Ljava/lang/String;
    :pswitch_24
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->getTail(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->getProperty(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    .line 106
    goto :goto_23

    .line 109
    :pswitch_35
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->getTail(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->getProperty(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    .line 110
    goto :goto_23

    .line 113
    :pswitch_46
    aget-object v3, p3, v5

    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v4

    aget-object v4, v4, v5

    invoke-virtual {p0, v2, v3, v4}, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->setProperty(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V

    goto :goto_23

    .line 117
    :pswitch_52
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->getTail(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->hasProperty(Ljava/lang/String;)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 118
    .local v1, "ret":Ljava/lang/Boolean;
    goto :goto_23

    .line 121
    .local v1, "ret":Ljava/lang/Object;
    :pswitch_63
    aget-object v3, p3, v5

    check-cast v3, Ljava/lang/String;

    aget-object v4, p3, v6

    check-cast v4, Ljava/beans/PropertyChangeListener;

    invoke-virtual {p0, v3, v4}, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->addPropertyChangeListener(Ljava/lang/String;Ljava/beans/PropertyChangeListener;)V

    goto :goto_23

    .line 125
    :pswitch_6f
    aget-object v3, p3, v5

    check-cast v3, Ljava/lang/String;

    aget-object v4, p3, v6

    check-cast v4, Ljava/beans/VetoableChangeListener;

    invoke-virtual {p0, v3, v4}, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->addVetoableChangeListener(Ljava/lang/String;Ljava/beans/VetoableChangeListener;)V

    goto :goto_23

    .line 129
    :pswitch_7b
    aget-object v3, p3, v5

    check-cast v3, Ljava/lang/String;

    aget-object v4, p3, v6

    check-cast v4, Ljava/beans/PropertyChangeListener;

    invoke-virtual {p0, v3, v4}, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->removePropertyChangeListener(Ljava/lang/String;Ljava/beans/PropertyChangeListener;)V

    goto :goto_23

    .line 133
    :pswitch_87
    aget-object v3, p3, v5

    check-cast v3, Ljava/lang/String;

    aget-object v4, p3, v6

    check-cast v4, Ljava/beans/VetoableChangeListener;

    invoke-virtual {p0, v3, v4}, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->removeVetoableChangeListener(Ljava/lang/String;Ljava/beans/VetoableChangeListener;)V

    goto :goto_23

    .line 101
    nop

    :pswitch_data_94
    .packed-switch 0x1
        :pswitch_24
        :pswitch_35
        :pswitch_46
        :pswitch_52
        :pswitch_63
        :pswitch_6f
        :pswitch_7b
        :pswitch_87
    .end packed-switch
.end method

.method protected parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 267
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/ini4j/spi/BeanTool;->parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected declared-synchronized removePropertyChangeListener(Ljava/lang/String;Ljava/beans/PropertyChangeListener;)V
    .registers 4
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "listener"    # Ljava/beans/PropertyChangeListener;

    .prologue
    .line 272
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_pcSupport:Ljava/beans/PropertyChangeSupport;

    if-eqz v0, :cond_a

    .line 274
    iget-object v0, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_pcSupport:Ljava/beans/PropertyChangeSupport;

    invoke-virtual {v0, p1, p2}, Ljava/beans/PropertyChangeSupport;->removePropertyChangeListener(Ljava/lang/String;Ljava/beans/PropertyChangeListener;)V
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 276
    :cond_a
    monitor-exit p0

    return-void

    .line 272
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized removeVetoableChangeListener(Ljava/lang/String;Ljava/beans/VetoableChangeListener;)V
    .registers 4
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "listener"    # Ljava/beans/VetoableChangeListener;

    .prologue
    .line 280
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_vcSupport:Ljava/beans/VetoableChangeSupport;

    if-eqz v0, :cond_a

    .line 282
    iget-object v0, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_vcSupport:Ljava/beans/VetoableChangeSupport;

    invoke-virtual {v0, p1, p2}, Ljava/beans/VetoableChangeSupport;->removeVetoableChangeListener(Ljava/lang/String;Ljava/beans/VetoableChangeListener;)V
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 284
    :cond_a
    monitor-exit p0

    return-void

    .line 280
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized setProperty(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V
    .registers 10
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/beans/PropertyVetoException;
        }
    .end annotation

    .prologue
    .local p3, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 186
    monitor-enter p0

    :try_start_3
    iget-object v5, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_pcSupport:Ljava/beans/PropertyChangeSupport;

    if-eqz v5, :cond_46

    iget-object v5, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_pcSupport:Ljava/beans/PropertyChangeSupport;

    invoke-virtual {v5, p1}, Ljava/beans/PropertyChangeSupport;->hasListeners(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_46

    move v2, v3

    .line 187
    .local v2, "pc":Z
    :goto_10
    iget-object v5, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_vcSupport:Ljava/beans/VetoableChangeSupport;

    if-eqz v5, :cond_48

    iget-object v5, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->_vcSupport:Ljava/beans/VetoableChangeSupport;

    invoke-virtual {v5, p1}, Ljava/beans/VetoableChangeSupport;->hasListeners(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_48

    .line 188
    .local v3, "vc":Z
    :goto_1c
    const/4 v1, 0x0

    .line 189
    .local v1, "oldVal":Ljava/lang/Object;
    if-eqz p2, :cond_4a

    const-class v4, Ljava/lang/String;

    invoke-virtual {p3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4a

    instance-of v4, p2, Ljava/lang/String;

    if-nez v4, :cond_4a

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 191
    .local v0, "newVal":Ljava/lang/Object;
    :goto_2f
    if-nez v2, :cond_33

    if-eqz v3, :cond_37

    .line 193
    :cond_33
    invoke-virtual {p0, p1, p3}, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->getProperty(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    .line 196
    .end local v1    # "oldVal":Ljava/lang/Object;
    :cond_37
    if-eqz v3, :cond_3c

    .line 198
    invoke-virtual {p0, p1, v1, p2}, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->fireVetoableChange(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 201
    :cond_3c
    invoke-virtual {p0, p1, v0, p3}, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->setPropertySpi(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V

    .line 202
    if-eqz v2, :cond_44

    .line 204
    invoke-virtual {p0, p1, v1, p2}, Lorg/ini4j/spi/AbstractBeanInvocationHandler;->firePropertyChange(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_44
    .catchall {:try_start_3 .. :try_end_44} :catchall_4c

    .line 206
    :cond_44
    monitor-exit p0

    return-void

    .end local v0    # "newVal":Ljava/lang/Object;
    .end local v2    # "pc":Z
    .end local v3    # "vc":Z
    :cond_46
    move v2, v4

    .line 186
    goto :goto_10

    .restart local v2    # "pc":Z
    :cond_48
    move v3, v4

    .line 187
    goto :goto_1c

    .restart local v1    # "oldVal":Ljava/lang/Object;
    .restart local v3    # "vc":Z
    :cond_4a
    move-object v0, p2

    .line 189
    goto :goto_2f

    .line 186
    .end local v1    # "oldVal":Ljava/lang/Object;
    .end local v2    # "pc":Z
    .end local v3    # "vc":Z
    :catchall_4c
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method protected abstract setPropertySpi(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation
.end method

.method protected zero(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 288
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/ini4j/spi/BeanTool;->zero(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
