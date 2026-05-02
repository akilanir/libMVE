.class public Lorg/msgpack/template/builder/beans/EventSetDescriptor;
.super Lorg/msgpack/template/builder/beans/FeatureDescriptor;
.source "EventSetDescriptor.java"


# instance fields
.field private addListenerMethod:Ljava/lang/reflect/Method;

.field private getListenerMethod:Ljava/lang/reflect/Method;

.field private inDefaultEventSet:Z

.field private listenerMethodDescriptors:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/msgpack/template/builder/beans/MethodDescriptor;",
            ">;"
        }
    .end annotation
.end field

.field private listenerMethods:[Ljava/lang/reflect/Method;

.field private listenerType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private removeListenerMethod:Ljava/lang/reflect/Method;

.field private unicast:Z


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)V
    .registers 8
    .param p2, "eventSetName"    # Ljava/lang/String;
    .param p4, "listenerMethodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 44
    .local p1, "sourceClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p3, "listenerType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Lorg/msgpack/template/builder/beans/FeatureDescriptor;-><init>()V

    .line 40
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->inDefaultEventSet:Z

    .line 45
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 47
    invoke-virtual {p0, p2}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->setName(Ljava/lang/String;)V

    .line 48
    iput-object p3, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerType:Ljava/lang/Class;

    .line 50
    invoke-direct {p0, p4}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->findListenerMethodByName(Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 51
    .local v0, "method":Ljava/lang/reflect/Method;
    invoke-static {p2, v0}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->checkEventType(Ljava/lang/String;Ljava/lang/reflect/Method;)V

    .line 52
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethodDescriptors:Ljava/util/ArrayList;

    .line 53
    iget-object v1, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethodDescriptors:Ljava/util/ArrayList;

    new-instance v2, Lorg/msgpack/template/builder/beans/MethodDescriptor;

    invoke-direct {v2, v0}, Lorg/msgpack/template/builder/beans/MethodDescriptor;-><init>(Ljava/lang/reflect/Method;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    const-string v1, "add"

    const-string v2, ""

    invoke-direct {p0, p1, v1, v2}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->findMethodByPrefix(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->addListenerMethod:Ljava/lang/reflect/Method;

    .line 55
    const-string v1, "remove"

    const-string v2, ""

    invoke-direct {p0, p1, v1, v2}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->findMethodByPrefix(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->removeListenerMethod:Ljava/lang/reflect/Method;

    .line 57
    iget-object v1, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->addListenerMethod:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_42

    iget-object v1, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->removeListenerMethod:Ljava/lang/reflect/Method;

    if-nez v1, :cond_4e

    .line 58
    :cond_42
    new-instance v1, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v2, "custom.beans.38"

    invoke-static {v2}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 61
    :cond_4e
    const-string v1, "get"

    const-string v2, "s"

    invoke-direct {p0, p1, v1, v2}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->findMethodByPrefix(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->getListenerMethod:Ljava/lang/reflect/Method;

    .line 62
    iget-object v1, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->addListenerMethod:Ljava/lang/reflect/Method;

    invoke-static {v1}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->isUnicastByDefault(Ljava/lang/reflect/Method;)Z

    move-result v1

    iput-boolean v1, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->unicast:Z

    .line 63
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 15
    .param p2, "eventSetName"    # Ljava/lang/String;
    .param p4, "listenerMethodNames"    # [Ljava/lang/String;
    .param p5, "addListenerMethodName"    # Ljava/lang/String;
    .param p6, "removeListenerMethodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 69
    .local p1, "sourceClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p3, "listenerType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 15
    .param p2, "eventSetName"    # Ljava/lang/String;
    .param p4, "listenerMethodNames"    # [Ljava/lang/String;
    .param p5, "addListenerMethodName"    # Ljava/lang/String;
    .param p6, "removeListenerMethodName"    # Ljava/lang/String;
    .param p7, "getListenerMethodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 77
    .local p1, "sourceClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p3, "listenerType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Lorg/msgpack/template/builder/beans/FeatureDescriptor;-><init>()V

    .line 40
    const/4 v5, 0x1

    iput-boolean v5, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->inDefaultEventSet:Z

    .line 79
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 82
    invoke-virtual {p0, p2}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->setName(Ljava/lang/String;)V

    .line 83
    iput-object p3, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerType:Ljava/lang/Class;

    .line 85
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethodDescriptors:Ljava/util/ArrayList;

    .line 86
    move-object v0, p4

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_18
    if-ge v2, v3, :cond_2d

    aget-object v1, v0, v2

    .line 87
    .local v1, "element":Ljava/lang/String;
    invoke-direct {p0, v1}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->findListenerMethodByName(Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 90
    .local v4, "m":Ljava/lang/reflect/Method;
    iget-object v5, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethodDescriptors:Ljava/util/ArrayList;

    new-instance v6, Lorg/msgpack/template/builder/beans/MethodDescriptor;

    invoke-direct {v6, v4}, Lorg/msgpack/template/builder/beans/MethodDescriptor;-><init>(Ljava/lang/reflect/Method;)V

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 86
    add-int/lit8 v2, v2, 0x1

    goto :goto_18

    .line 93
    .end local v1    # "element":Ljava/lang/String;
    .end local v4    # "m":Ljava/lang/reflect/Method;
    :cond_2d
    if-eqz p5, :cond_35

    .line 94
    invoke-direct {p0, p1, p5}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->findAddRemoveListenerMethod(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v5

    iput-object v5, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->addListenerMethod:Ljava/lang/reflect/Method;

    .line 97
    :cond_35
    if-eqz p6, :cond_3d

    .line 98
    invoke-direct {p0, p1, p6}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->findAddRemoveListenerMethod(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v5

    iput-object v5, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->removeListenerMethod:Ljava/lang/reflect/Method;

    .line 101
    :cond_3d
    if-eqz p7, :cond_45

    .line 102
    invoke-direct {p0, p1, p7}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->findGetListenerMethod(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v5

    iput-object v5, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->getListenerMethod:Ljava/lang/reflect/Method;

    .line 105
    :cond_45
    iget-object v5, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->addListenerMethod:Ljava/lang/reflect/Method;

    invoke-static {v5}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->isUnicastByDefault(Ljava/lang/reflect/Method;)Z

    move-result v5

    iput-boolean v5, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->unicast:Z

    .line 106
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V
    .registers 13
    .param p1, "eventSetName"    # Ljava/lang/String;
    .param p3, "listenerMethods"    # [Ljava/lang/reflect/Method;
    .param p4, "addListenerMethod"    # Ljava/lang/reflect/Method;
    .param p5, "removeListenerMethod"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/reflect/Method;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 134
    .local p2, "listenerType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;-><init>(Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V

    .line 136
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V
    .registers 13
    .param p1, "eventSetName"    # Ljava/lang/String;
    .param p3, "listenerMethods"    # [Ljava/lang/reflect/Method;
    .param p4, "addListenerMethod"    # Ljava/lang/reflect/Method;
    .param p5, "removeListenerMethod"    # Ljava/lang/reflect/Method;
    .param p6, "getListenerMethod"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/reflect/Method;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 141
    .local p2, "listenerType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Lorg/msgpack/template/builder/beans/FeatureDescriptor;-><init>()V

    .line 40
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->inDefaultEventSet:Z

    .line 143
    invoke-virtual {p0, p1}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->setName(Ljava/lang/String;)V

    .line 144
    iput-object p2, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerType:Ljava/lang/Class;

    .line 146
    iput-object p3, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethods:[Ljava/lang/reflect/Method;

    .line 147
    if-eqz p3, :cond_2a

    .line 148
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethodDescriptors:Ljava/util/ArrayList;

    .line 150
    move-object v0, p3

    .local v0, "arr$":[Ljava/lang/reflect/Method;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_19
    if-ge v2, v3, :cond_2a

    aget-object v1, v0, v2

    .line 154
    .local v1, "element":Ljava/lang/reflect/Method;
    iget-object v4, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethodDescriptors:Ljava/util/ArrayList;

    new-instance v5, Lorg/msgpack/template/builder/beans/MethodDescriptor;

    invoke-direct {v5, v1}, Lorg/msgpack/template/builder/beans/MethodDescriptor;-><init>(Ljava/lang/reflect/Method;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 150
    add-int/lit8 v2, v2, 0x1

    goto :goto_19

    .line 160
    .end local v0    # "arr$":[Ljava/lang/reflect/Method;
    .end local v1    # "element":Ljava/lang/reflect/Method;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :cond_2a
    iput-object p4, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->addListenerMethod:Ljava/lang/reflect/Method;

    .line 161
    iput-object p5, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->removeListenerMethod:Ljava/lang/reflect/Method;

    .line 162
    iput-object p6, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->getListenerMethod:Ljava/lang/reflect/Method;

    .line 163
    invoke-static {p4}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->isUnicastByDefault(Ljava/lang/reflect/Method;)Z

    move-result v4

    iput-boolean v4, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->unicast:Z

    .line 164
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Class;[Lorg/msgpack/template/builder/beans/MethodDescriptor;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V
    .registers 17
    .param p1, "eventSetName"    # Ljava/lang/String;
    .param p3, "listenerMethodDescriptors"    # [Lorg/msgpack/template/builder/beans/MethodDescriptor;
    .param p4, "addListenerMethod"    # Ljava/lang/reflect/Method;
    .param p5, "removeListenerMethod"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;[",
            "Lorg/msgpack/template/builder/beans/MethodDescriptor;",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/reflect/Method;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 171
    .local p2, "listenerType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v3, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    move-object/from16 v5, p5

    invoke-direct/range {v0 .. v6}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;-><init>(Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V

    .line 174
    if-eqz p3, :cond_23

    .line 175
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethodDescriptors:Ljava/util/ArrayList;

    .line 177
    move-object v7, p3

    .local v7, "arr$":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    array-length v10, v7

    .local v10, "len$":I
    const/4 v9, 0x0

    .local v9, "i$":I
    :goto_17
    if-ge v9, v10, :cond_23

    aget-object v8, v7, v9

    .line 178
    .local v8, "element":Lorg/msgpack/template/builder/beans/MethodDescriptor;
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethodDescriptors:Ljava/util/ArrayList;

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 177
    add-int/lit8 v9, v9, 0x1

    goto :goto_17

    .line 181
    .end local v7    # "arr$":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    .end local v8    # "element":Lorg/msgpack/template/builder/beans/MethodDescriptor;
    .end local v9    # "i$":I
    .end local v10    # "len$":I
    :cond_23
    return-void
.end method

.method private static checkEventType(Ljava/lang/String;Ljava/lang/reflect/Method;)V
    .registers 8
    .param p0, "eventSetName"    # Ljava/lang/String;
    .param p1, "listenerMethod"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 213
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    .line 214
    .local v2, "params":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .line 215
    .local v1, "firstParamTypeName":Ljava/lang/String;
    invoke-static {p0}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->prepareEventTypeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 217
    .local v0, "eventTypeName":Ljava/lang/String;
    array-length v3, v2

    if-lez v3, :cond_17

    .line 218
    const/4 v3, 0x0

    aget-object v3, v2, v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->extractShortClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 222
    :cond_17
    if-eqz v1, :cond_1f

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2f

    .line 224
    :cond_1f
    new-instance v3, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v4, "custom.beans.51"

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 227
    :cond_2f
    return-void
.end method

.method private checkNotNull(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 7
    .param p1, "sourceClass"    # Ljava/lang/Object;
    .param p2, "eventSetName"    # Ljava/lang/Object;
    .param p3, "alistenerType"    # Ljava/lang/Object;
    .param p4, "listenerMethodName"    # Ljava/lang/Object;

    .prologue
    .line 187
    if-nez p1, :cond_e

    .line 188
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "custom.beans.0C"

    invoke-static {v1}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 190
    :cond_e
    if-nez p2, :cond_1c

    .line 191
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "custom.beans.53"

    invoke-static {v1}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 193
    :cond_1c
    if-nez p3, :cond_2a

    .line 194
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "custom.beans.54"

    invoke-static {v1}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 196
    :cond_2a
    if-nez p4, :cond_38

    .line 197
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "custom.beans.52"

    invoke-static {v1}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 199
    :cond_38
    return-void
.end method

.method private static extractShortClassName(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "fullClassName"    # Ljava/lang/String;

    .prologue
    .line 234
    const/16 v1, 0x24

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 235
    .local v0, "k":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_f

    const/16 v1, 0x2e

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 236
    :cond_f
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private findAddRemoveListenerMethod(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Method;
    .registers 7
    .param p2, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 322
    .local p1, "sourceClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x1

    :try_start_1
    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerType:Ljava/lang/Class;

    aput-object v3, v1, v2

    invoke-virtual {p1, p2, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_b
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_b} :catch_d
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_b} :catch_13

    move-result-object v1

    .line 324
    :goto_c
    return-object v1

    .line 323
    :catch_d
    move-exception v0

    .line 324
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    invoke-direct {p0, p1, p2}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->findAddRemoveListnerMethodWithLessCheck(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v1

    goto :goto_c

    .line 326
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :catch_13
    move-exception v0

    .line 327
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v2, "custom.beans.31"

    iget-object v3, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerType:Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, p2, v3}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private findAddRemoveListnerMethodWithLessCheck(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Method;
    .registers 13
    .param p2, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 335
    .local p1, "sourceClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v4

    .line 336
    .local v4, "methods":[Ljava/lang/reflect/Method;
    const/4 v6, 0x0

    .line 337
    .local v6, "result":Ljava/lang/reflect/Method;
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/reflect/Method;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_8
    if-ge v1, v2, :cond_1f

    aget-object v3, v0, v1

    .line 338
    .local v3, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_33

    .line 339
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v5

    .line 340
    .local v5, "paramTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v7, v5

    const/4 v8, 0x1

    if-ne v7, v8, :cond_33

    .line 341
    move-object v6, v3

    .line 346
    .end local v3    # "method":Ljava/lang/reflect/Method;
    .end local v5    # "paramTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_1f
    if-nez v6, :cond_36

    .line 347
    new-instance v7, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v8, "custom.beans.31"

    iget-object v9, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerType:Ljava/lang/Class;

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, p2, v9}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 337
    .restart local v3    # "method":Ljava/lang/reflect/Method;
    :cond_33
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 350
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :cond_36
    return-object v6
.end method

.method private findGetListenerMethod(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Method;
    .registers 5
    .param p2, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .line 363
    .local p1, "sourceClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    :try_start_1
    new-array v1, v1, [Ljava/lang/Class;

    invoke-virtual {p1, p2, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_6} :catch_8

    move-result-object v1

    .line 366
    :goto_7
    return-object v1

    .line 364
    :catch_8
    move-exception v0

    .line 366
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_7
.end method

.method private findListenerMethodByName(Ljava/lang/String;)Ljava/lang/reflect/Method;
    .registers 12
    .param p1, "listenerMethodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 110
    const/4 v6, 0x0

    .line 111
    .local v6, "result":Ljava/lang/reflect/Method;
    iget-object v7, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerType:Ljava/lang/Class;

    invoke-virtual {v7}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v4

    .line 112
    .local v4, "methods":[Ljava/lang/reflect/Method;
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/reflect/Method;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_a
    if-ge v1, v2, :cond_30

    aget-object v3, v0, v1

    .line 113
    .local v3, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_44

    .line 114
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v5

    .line 115
    .local v5, "paramTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v7, v5

    const/4 v8, 0x1

    if-ne v7, v8, :cond_44

    const/4 v7, 0x0

    aget-object v7, v5, v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "Event"

    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_44

    .line 117
    move-object v6, v3

    .line 123
    .end local v3    # "method":Ljava/lang/reflect/Method;
    .end local v5    # "paramTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_30
    if-nez v6, :cond_47

    .line 124
    new-instance v7, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v8, "custom.beans.31"

    iget-object v9, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerType:Ljava/lang/Class;

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, p1, v9}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 112
    .restart local v3    # "method":Ljava/lang/reflect/Method;
    :cond_44
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 127
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :cond_47
    return-object v6
.end method

.method private findMethodByPrefix(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/reflect/Method;
    .registers 13
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "postfix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .local p1, "sourceClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v6, 0x0

    .line 372
    iget-object v7, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerType:Ljava/lang/Class;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    .line 373
    .local v5, "shortName":Ljava/lang/String;
    iget-object v7, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerType:Ljava/lang/Class;

    invoke-virtual {v7}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v7

    if-eqz v7, :cond_23

    .line 374
    iget-object v7, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerType:Ljava/lang/Class;

    invoke-virtual {v7}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v5, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 377
    :cond_23
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 379
    .local v1, "methodName":Ljava/lang/String;
    :try_start_38
    const-string v7, "get"

    invoke-virtual {v7, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4a

    .line 380
    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Class;

    invoke-virtual {p1, v1, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_46
    .catch Ljava/lang/NoSuchMethodException; {:try_start_38 .. :try_end_46} :catch_48

    move-result-object v6

    .line 394
    :cond_47
    :goto_47
    return-object v6

    .line 382
    :catch_48
    move-exception v3

    .line 383
    .local v3, "nsme":Ljava/lang/NoSuchMethodException;
    goto :goto_47

    .line 385
    .end local v3    # "nsme":Ljava/lang/NoSuchMethodException;
    :cond_4a
    invoke-virtual {p1}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v2

    .line 386
    .local v2, "methods":[Ljava/lang/reflect/Method;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4f
    array-length v7, v2

    if-ge v0, v7, :cond_47

    .line 387
    aget-object v7, v2, v0

    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6b

    .line 388
    aget-object v7, v2, v0

    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v4

    .line 389
    .local v4, "paramTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v7, v4

    const/4 v8, 0x1

    if-ne v7, v8, :cond_6b

    .line 390
    aget-object v6, v2, v0

    goto :goto_47

    .line 386
    .end local v4    # "paramTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_6b
    add-int/lit8 v0, v0, 0x1

    goto :goto_4f
.end method

.method private static isUnicastByDefault(Ljava/lang/reflect/Method;)Z
    .registers 7
    .param p0, "addMethod"    # Ljava/lang/reflect/Method;

    .prologue
    .line 398
    if-eqz p0, :cond_1a

    .line 399
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getExceptionTypes()[Ljava/lang/Class;

    move-result-object v2

    .line 400
    .local v2, "exceptionTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_9
    if-ge v3, v4, :cond_1a

    aget-object v1, v0, v3

    .line 401
    .local v1, "element":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v5, Ljava/util/TooManyListenersException;

    invoke-virtual {v1, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    .line 402
    const/4 v5, 0x1

    .line 406
    .end local v0    # "arr$":[Ljava/lang/Class;
    .end local v1    # "element":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "exceptionTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :goto_16
    return v5

    .line 400
    .restart local v0    # "arr$":[Ljava/lang/Class;
    .restart local v1    # "element":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v2    # "exceptionTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .restart local v3    # "i$":I
    .restart local v4    # "len$":I
    :cond_17
    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    .line 406
    .end local v0    # "arr$":[Ljava/lang/Class;
    .end local v1    # "element":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "exceptionTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_1a
    const/4 v5, 0x0

    goto :goto_16
.end method

.method private static prepareEventTypeName(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "eventSetName"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 240
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 242
    .local v0, "sb":Ljava/lang/StringBuilder;
    if-eqz p0, :cond_27

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_27

    .line 243
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 245
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v2, :cond_27

    .line 246
    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    :cond_27
    const-string v1, "Event"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public getAddListenerMethod()Ljava/lang/reflect/Method;
    .registers 2

    .prologue
    .line 284
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->addListenerMethod:Ljava/lang/reflect/Method;

    return-object v0
.end method

.method public getGetListenerMethod()Ljava/lang/reflect/Method;
    .registers 2

    .prologue
    .line 280
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->getListenerMethod:Ljava/lang/reflect/Method;

    return-object v0
.end method

.method public getListenerMethodDescriptors()[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    .registers 3

    .prologue
    .line 271
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethodDescriptors:Ljava/util/ArrayList;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethodDescriptors:Ljava/util/ArrayList;

    const/4 v1, 0x0

    new-array v1, v1, [Lorg/msgpack/template/builder/beans/MethodDescriptor;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/msgpack/template/builder/beans/MethodDescriptor;

    goto :goto_5
.end method

.method public getListenerMethods()[Ljava/lang/reflect/Method;
    .registers 7

    .prologue
    .line 255
    iget-object v4, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethods:[Ljava/lang/reflect/Method;

    if-eqz v4, :cond_7

    .line 256
    iget-object v4, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethods:[Ljava/lang/reflect/Method;

    .line 267
    :goto_6
    return-object v4

    .line 259
    :cond_7
    iget-object v4, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethodDescriptors:Ljava/util/ArrayList;

    if-eqz v4, :cond_37

    .line 260
    iget-object v4, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethodDescriptors:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v4, v4, [Ljava/lang/reflect/Method;

    iput-object v4, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethods:[Ljava/lang/reflect/Method;

    .line 261
    const/4 v1, 0x0

    .line 262
    .local v1, "index":I
    iget-object v4, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethodDescriptors:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_34

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/msgpack/template/builder/beans/MethodDescriptor;

    .line 263
    .local v3, "md":Lorg/msgpack/template/builder/beans/MethodDescriptor;
    iget-object v4, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethods:[Ljava/lang/reflect/Method;

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "index":I
    .local v2, "index":I
    invoke-virtual {v3}, Lorg/msgpack/template/builder/beans/MethodDescriptor;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v5

    aput-object v5, v4, v1

    move v1, v2

    .line 264
    .end local v2    # "index":I
    .restart local v1    # "index":I
    goto :goto_1c

    .line 265
    .end local v3    # "md":Lorg/msgpack/template/builder/beans/MethodDescriptor;
    :cond_34
    iget-object v4, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethods:[Ljava/lang/reflect/Method;

    goto :goto_6

    .line 267
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "index":I
    :cond_37
    const/4 v4, 0x0

    goto :goto_6
.end method

.method public getListenerType()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 288
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerType:Ljava/lang/Class;

    return-object v0
.end method

.method public getRemoveListenerMethod()Ljava/lang/reflect/Method;
    .registers 2

    .prologue
    .line 276
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->removeListenerMethod:Ljava/lang/reflect/Method;

    return-object v0
.end method

.method public isInDefaultEventSet()Z
    .registers 2

    .prologue
    .line 304
    iget-boolean v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->inDefaultEventSet:Z

    return v0
.end method

.method public isUnicast()Z
    .registers 2

    .prologue
    .line 300
    iget-boolean v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->unicast:Z

    return v0
.end method

.method merge(Lorg/msgpack/template/builder/beans/EventSetDescriptor;)V
    .registers 4
    .param p1, "event"    # Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    .prologue
    .line 410
    invoke-super {p0, p1}, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->merge(Lorg/msgpack/template/builder/beans/FeatureDescriptor;)V

    .line 411
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->addListenerMethod:Ljava/lang/reflect/Method;

    if-nez v0, :cond_b

    .line 412
    iget-object v0, p1, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->addListenerMethod:Ljava/lang/reflect/Method;

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->addListenerMethod:Ljava/lang/reflect/Method;

    .line 414
    :cond_b
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->getListenerMethod:Ljava/lang/reflect/Method;

    if-nez v0, :cond_13

    .line 415
    iget-object v0, p1, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->getListenerMethod:Ljava/lang/reflect/Method;

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->getListenerMethod:Ljava/lang/reflect/Method;

    .line 417
    :cond_13
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethodDescriptors:Ljava/util/ArrayList;

    if-nez v0, :cond_1b

    .line 418
    iget-object v0, p1, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethodDescriptors:Ljava/util/ArrayList;

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethodDescriptors:Ljava/util/ArrayList;

    .line 420
    :cond_1b
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethods:[Ljava/lang/reflect/Method;

    if-nez v0, :cond_23

    .line 421
    iget-object v0, p1, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethods:[Ljava/lang/reflect/Method;

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerMethods:[Ljava/lang/reflect/Method;

    .line 423
    :cond_23
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerType:Ljava/lang/Class;

    if-nez v0, :cond_2b

    .line 424
    iget-object v0, p1, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerType:Ljava/lang/Class;

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->listenerType:Ljava/lang/Class;

    .line 427
    :cond_2b
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->removeListenerMethod:Ljava/lang/reflect/Method;

    if-nez v0, :cond_33

    .line 428
    iget-object v0, p1, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->removeListenerMethod:Ljava/lang/reflect/Method;

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->removeListenerMethod:Ljava/lang/reflect/Method;

    .line 430
    :cond_33
    iget-boolean v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->inDefaultEventSet:Z

    iget-boolean v1, p1, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->inDefaultEventSet:Z

    and-int/2addr v0, v1

    iput-boolean v0, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->inDefaultEventSet:Z

    .line 431
    return-void
.end method

.method public setInDefaultEventSet(Z)V
    .registers 2
    .param p1, "inDefaultEventSet"    # Z

    .prologue
    .line 296
    iput-boolean p1, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->inDefaultEventSet:Z

    .line 297
    return-void
.end method

.method public setUnicast(Z)V
    .registers 2
    .param p1, "unicast"    # Z

    .prologue
    .line 292
    iput-boolean p1, p0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->unicast:Z

    .line 293
    return-void
.end method
