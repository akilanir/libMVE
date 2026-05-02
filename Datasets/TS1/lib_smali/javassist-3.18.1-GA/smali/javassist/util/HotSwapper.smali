.class public Ljavassist/util/HotSwapper;
.super Ljava/lang/Object;
.source "HotSwapper.java"


# static fields
.field private static final HOST_NAME:Ljava/lang/String; = "localhost"

.field private static final TRIGGER_NAME:Ljava/lang/String;


# instance fields
.field private jvm:Lcom/sun/jdi/VirtualMachine;

.field private newClassFiles:Ljava/util/Map;

.field private request:Lcom/sun/jdi/request/MethodEntryRequest;

.field private trigger:Ljavassist/util/Trigger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 85
    const-class v0, Ljavassist/util/Trigger;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Ljavassist/util/HotSwapper;->TRIGGER_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/jdi/connect/IllegalConnectorArgumentsException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljavassist/util/HotSwapper;-><init>(Ljava/lang/String;)V

    .line 96
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 7
    .param p1, "port"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/jdi/connect/IllegalConnectorArgumentsException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    iput-object v3, p0, Ljavassist/util/HotSwapper;->jvm:Lcom/sun/jdi/VirtualMachine;

    .line 107
    iput-object v3, p0, Ljavassist/util/HotSwapper;->request:Lcom/sun/jdi/request/MethodEntryRequest;

    .line 108
    iput-object v3, p0, Ljavassist/util/HotSwapper;->newClassFiles:Ljava/util/Map;

    .line 109
    new-instance v3, Ljavassist/util/Trigger;

    invoke-direct {v3}, Ljavassist/util/Trigger;-><init>()V

    iput-object v3, p0, Ljavassist/util/HotSwapper;->trigger:Ljavassist/util/Trigger;

    .line 110
    const-string v3, "com.sun.jdi.SocketAttach"

    invoke-direct {p0, v3}, Ljavassist/util/HotSwapper;->findConnector(Ljava/lang/String;)Lcom/sun/jdi/connect/Connector;

    move-result-object v1

    check-cast v1, Lcom/sun/jdi/connect/AttachingConnector;

    .line 113
    .local v1, "connector":Lcom/sun/jdi/connect/AttachingConnector;
    invoke-interface {v1}, Lcom/sun/jdi/connect/AttachingConnector;->defaultArguments()Ljava/util/Map;

    move-result-object v0

    .line 114
    .local v0, "arguments":Ljava/util/Map;
    const-string v3, "hostname"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/sun/jdi/connect/Connector$Argument;

    const-string v4, "localhost"

    invoke-interface {v3, v4}, Lcom/sun/jdi/connect/Connector$Argument;->setValue(Ljava/lang/String;)V

    .line 115
    const-string v3, "port"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/sun/jdi/connect/Connector$Argument;

    invoke-interface {v3, p1}, Lcom/sun/jdi/connect/Connector$Argument;->setValue(Ljava/lang/String;)V

    .line 116
    invoke-interface {v1, v0}, Lcom/sun/jdi/connect/AttachingConnector;->attach(Ljava/util/Map;)Lcom/sun/jdi/VirtualMachine;

    move-result-object v3

    iput-object v3, p0, Ljavassist/util/HotSwapper;->jvm:Lcom/sun/jdi/VirtualMachine;

    .line 117
    iget-object v3, p0, Ljavassist/util/HotSwapper;->jvm:Lcom/sun/jdi/VirtualMachine;

    invoke-interface {v3}, Lcom/sun/jdi/VirtualMachine;->eventRequestManager()Lcom/sun/jdi/request/EventRequestManager;

    move-result-object v2

    .line 118
    .local v2, "manager":Lcom/sun/jdi/request/EventRequestManager;
    sget-object v3, Ljavassist/util/HotSwapper;->TRIGGER_NAME:Ljava/lang/String;

    invoke-static {v2, v3}, Ljavassist/util/HotSwapper;->methodEntryRequests(Lcom/sun/jdi/request/EventRequestManager;Ljava/lang/String;)Lcom/sun/jdi/request/MethodEntryRequest;

    move-result-object v3

    iput-object v3, p0, Ljavassist/util/HotSwapper;->request:Lcom/sun/jdi/request/MethodEntryRequest;

    .line 119
    return-void
.end method

.method private deleteEventRequest(Lcom/sun/jdi/request/EventRequestManager;Lcom/sun/jdi/request/MethodEntryRequest;)V
    .registers 3
    .param p1, "manager"    # Lcom/sun/jdi/request/EventRequestManager;
    .param p2, "request"    # Lcom/sun/jdi/request/MethodEntryRequest;

    .prologue
    .line 147
    invoke-interface {p1, p2}, Lcom/sun/jdi/request/EventRequestManager;->deleteEventRequest(Lcom/sun/jdi/request/EventRequest;)V

    .line 148
    return-void
.end method

.method private findConnector(Ljava/lang/String;)Lcom/sun/jdi/connect/Connector;
    .registers 8
    .param p1, "connector"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 122
    invoke-static {}, Lcom/sun/jdi/Bootstrap;->virtualMachineManager()Lcom/sun/jdi/VirtualMachineManager;

    move-result-object v3

    invoke-interface {v3}, Lcom/sun/jdi/VirtualMachineManager;->allConnectors()Ljava/util/List;

    move-result-object v1

    .line 123
    .local v1, "connectors":Ljava/util/List;
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 124
    .local v2, "iter":Ljava/util/Iterator;
    :cond_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_23

    .line 125
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sun/jdi/connect/Connector;

    .line 126
    .local v0, "con":Lcom/sun/jdi/connect/Connector;
    invoke-interface {v0}, Lcom/sun/jdi/connect/Connector;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 127
    return-object v0

    .line 131
    .end local v0    # "con":Lcom/sun/jdi/connect/Connector;
    :cond_23
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Not found: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private static methodEntryRequests(Lcom/sun/jdi/request/EventRequestManager;Ljava/lang/String;)Lcom/sun/jdi/request/MethodEntryRequest;
    .registers 4
    .param p0, "manager"    # Lcom/sun/jdi/request/EventRequestManager;
    .param p1, "classpattern"    # Ljava/lang/String;

    .prologue
    .line 137
    invoke-interface {p0}, Lcom/sun/jdi/request/EventRequestManager;->createMethodEntryRequest()Lcom/sun/jdi/request/MethodEntryRequest;

    move-result-object v0

    .line 138
    .local v0, "mereq":Lcom/sun/jdi/request/MethodEntryRequest;
    invoke-interface {v0, p1}, Lcom/sun/jdi/request/MethodEntryRequest;->addClassFilter(Ljava/lang/String;)V

    .line 139
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/sun/jdi/request/MethodEntryRequest;->setSuspendPolicy(I)V

    .line 140
    return-object v0
.end method

.method private reload2(Ljava/util/Map;Ljava/lang/String;)V
    .registers 8
    .param p1, "map"    # Ljava/util/Map;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 195
    iget-object v2, p0, Ljavassist/util/HotSwapper;->trigger:Ljavassist/util/Trigger;

    monitor-enter v2

    .line 196
    :try_start_3
    invoke-direct {p0}, Ljavassist/util/HotSwapper;->startDaemon()V

    .line 197
    iput-object p1, p0, Ljavassist/util/HotSwapper;->newClassFiles:Ljava/util/Map;

    .line 198
    iget-object v1, p0, Ljavassist/util/HotSwapper;->request:Lcom/sun/jdi/request/MethodEntryRequest;

    invoke-interface {v1}, Lcom/sun/jdi/request/MethodEntryRequest;->enable()V

    .line 199
    iget-object v1, p0, Ljavassist/util/HotSwapper;->trigger:Ljavassist/util/Trigger;

    invoke-virtual {v1}, Ljavassist/util/Trigger;->doSwap()V

    .line 200
    iget-object v1, p0, Ljavassist/util/HotSwapper;->request:Lcom/sun/jdi/request/MethodEntryRequest;

    invoke-interface {v1}, Lcom/sun/jdi/request/MethodEntryRequest;->disable()V

    .line 201
    iget-object v0, p0, Ljavassist/util/HotSwapper;->newClassFiles:Ljava/util/Map;

    .line 202
    .local v0, "ncf":Ljava/util/Map;
    if-eqz v0, :cond_3a

    .line 203
    const/4 v1, 0x0

    iput-object v1, p0, Ljavassist/util/HotSwapper;->newClassFiles:Ljava/util/Map;

    .line 204
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "failed to reload: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 206
    .end local v0    # "ncf":Ljava/util/Map;
    :catchall_37
    move-exception v1

    monitor-exit v2
    :try_end_39
    .catchall {:try_start_3 .. :try_end_39} :catchall_37

    throw v1

    .restart local v0    # "ncf":Ljava/util/Map;
    :cond_3a
    :try_start_3a
    monitor-exit v2
    :try_end_3b
    .catchall {:try_start_3a .. :try_end_3b} :catchall_37

    .line 207
    return-void
.end method

.method private startDaemon()V
    .registers 2

    .prologue
    .line 210
    new-instance v0, Ljavassist/util/HotSwapper$1;

    invoke-direct {v0, p0}, Ljavassist/util/HotSwapper$1;-><init>(Ljavassist/util/HotSwapper;)V

    invoke-virtual {v0}, Ljavassist/util/HotSwapper$1;->start()V

    .line 241
    return-void
.end method

.method private toRefType(Ljava/lang/String;)Lcom/sun/jdi/ReferenceType;
    .registers 6
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 187
    iget-object v1, p0, Ljavassist/util/HotSwapper;->jvm:Lcom/sun/jdi/VirtualMachine;

    invoke-interface {v1, p1}, Lcom/sun/jdi/VirtualMachine;->classesByName(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 188
    .local v0, "list":Ljava/util/List;
    if-eqz v0, :cond_e

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_27

    .line 189
    :cond_e
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "no such class: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 191
    :cond_27
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sun/jdi/ReferenceType;

    return-object v1
.end method


# virtual methods
.method hotswap()V
    .registers 3

    .prologue
    .line 249
    iget-object v0, p0, Ljavassist/util/HotSwapper;->newClassFiles:Ljava/util/Map;

    .line 250
    .local v0, "map":Ljava/util/Map;
    iget-object v1, p0, Ljavassist/util/HotSwapper;->jvm:Lcom/sun/jdi/VirtualMachine;

    invoke-interface {v1, v0}, Lcom/sun/jdi/VirtualMachine;->redefineClasses(Ljava/util/Map;)V

    .line 251
    const/4 v1, 0x0

    iput-object v1, p0, Ljavassist/util/HotSwapper;->newClassFiles:Ljava/util/Map;

    .line 252
    return-void
.end method

.method public reload(Ljava/lang/String;[B)V
    .registers 5
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "classFile"    # [B

    .prologue
    .line 157
    invoke-direct {p0, p1}, Ljavassist/util/HotSwapper;->toRefType(Ljava/lang/String;)Lcom/sun/jdi/ReferenceType;

    move-result-object v0

    .line 158
    .local v0, "classtype":Lcom/sun/jdi/ReferenceType;
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 159
    .local v1, "map":Ljava/util/Map;
    invoke-interface {v1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    invoke-direct {p0, v1, p1}, Ljavassist/util/HotSwapper;->reload2(Ljava/util/Map;Ljava/lang/String;)V

    .line 161
    return-void
.end method

.method public reload(Ljava/util/Map;)V
    .registers 9
    .param p1, "classFiles"    # Ljava/util/Map;

    .prologue
    .line 172
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    .line 173
    .local v4, "set":Ljava/util/Set;
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 174
    .local v2, "it":Ljava/util/Iterator;
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 175
    .local v3, "map":Ljava/util/Map;
    const/4 v0, 0x0

    .line 176
    .local v0, "className":Ljava/lang/String;
    :goto_e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2c

    .line 177
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 178
    .local v1, "e":Ljava/util/Map$Entry;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "className":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 179
    .restart local v0    # "className":Ljava/lang/String;
    invoke-direct {p0, v0}, Ljavassist/util/HotSwapper;->toRefType(Ljava/lang/String;)Lcom/sun/jdi/ReferenceType;

    move-result-object v5

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_e

    .line 182
    .end local v1    # "e":Ljava/util/Map$Entry;
    :cond_2c
    if-eqz v0, :cond_44

    .line 183
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " etc."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v3, v5}, Ljavassist/util/HotSwapper;->reload2(Ljava/util/Map;Ljava/lang/String;)V

    .line 184
    :cond_44
    return-void
.end method

.method waitEvent()Lcom/sun/jdi/event/EventSet;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 244
    iget-object v1, p0, Ljavassist/util/HotSwapper;->jvm:Lcom/sun/jdi/VirtualMachine;

    invoke-interface {v1}, Lcom/sun/jdi/VirtualMachine;->eventQueue()Lcom/sun/jdi/event/EventQueue;

    move-result-object v0

    .line 245
    .local v0, "queue":Lcom/sun/jdi/event/EventQueue;
    invoke-interface {v0}, Lcom/sun/jdi/event/EventQueue;->remove()Lcom/sun/jdi/event/EventSet;

    move-result-object v1

    return-object v1
.end method
