.class public Lme/drakeet/mailotto/Mailbox;
.super Ljava/lang/Object;
.source "Mailbox.java"


# static fields
.field public static final DEFAULT_IDENTIFIER:Ljava/lang/String; = "default"

.field private static volatile instance:Lme/drakeet/mailotto/Mailbox;


# instance fields
.field private final currentAtHomeHandlerByClass:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lme/drakeet/mailotto/MailHandler;",
            ">;"
        }
    .end annotation
.end field

.field private final enforcer:Lme/drakeet/mailotto/ThreadEnforcer;

.field private final handlerFinder:Lme/drakeet/mailotto/HandlerFinder;

.field private final identifier:Ljava/lang/String;

.field private final isDispatching:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final mailsToDispatch:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/LinkedList",
            "<",
            "Lme/drakeet/mailotto/Mail;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 42
    const/4 v0, 0x0

    sput-object v0, Lme/drakeet/mailotto/Mailbox;->instance:Lme/drakeet/mailotto/Mailbox;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 66
    const-string v0, "default"

    invoke-direct {p0, v0}, Lme/drakeet/mailotto/Mailbox;-><init>(Ljava/lang/String;)V

    .line 67
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "identifier"    # Ljava/lang/String;

    .prologue
    .line 71
    sget-object v0, Lme/drakeet/mailotto/ThreadEnforcer;->MAIN:Lme/drakeet/mailotto/ThreadEnforcer;

    invoke-direct {p0, v0, p1}, Lme/drakeet/mailotto/Mailbox;-><init>(Lme/drakeet/mailotto/ThreadEnforcer;Ljava/lang/String;)V

    .line 72
    return-void
.end method

.method public constructor <init>(Lme/drakeet/mailotto/ThreadEnforcer;)V
    .registers 3
    .param p1, "enforcer"    # Lme/drakeet/mailotto/ThreadEnforcer;

    .prologue
    .line 76
    const-string v0, "default"

    invoke-direct {p0, p1, v0}, Lme/drakeet/mailotto/Mailbox;-><init>(Lme/drakeet/mailotto/ThreadEnforcer;Ljava/lang/String;)V

    .line 77
    return-void
.end method

.method public constructor <init>(Lme/drakeet/mailotto/ThreadEnforcer;Ljava/lang/String;)V
    .registers 4
    .param p1, "enforcer"    # Lme/drakeet/mailotto/ThreadEnforcer;
    .param p2, "identifier"    # Ljava/lang/String;

    .prologue
    .line 81
    sget-object v0, Lme/drakeet/mailotto/HandlerFinder;->ANNOTATED:Lme/drakeet/mailotto/HandlerFinder;

    invoke-direct {p0, p1, p2, v0}, Lme/drakeet/mailotto/Mailbox;-><init>(Lme/drakeet/mailotto/ThreadEnforcer;Ljava/lang/String;Lme/drakeet/mailotto/HandlerFinder;)V

    .line 82
    return-void
.end method

.method constructor <init>(Lme/drakeet/mailotto/ThreadEnforcer;Ljava/lang/String;Lme/drakeet/mailotto/HandlerFinder;)V
    .registers 5
    .param p1, "enforcer"    # Lme/drakeet/mailotto/ThreadEnforcer;
    .param p2, "identifier"    # Ljava/lang/String;
    .param p3, "handlerFinder"    # Lme/drakeet/mailotto/HandlerFinder;

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lme/drakeet/mailotto/Mailbox;->currentAtHomeHandlerByClass:Ljava/util/concurrent/ConcurrentMap;

    .line 48
    new-instance v0, Lme/drakeet/mailotto/Mailbox$1;

    invoke-direct {v0, p0}, Lme/drakeet/mailotto/Mailbox$1;-><init>(Lme/drakeet/mailotto/Mailbox;)V

    iput-object v0, p0, Lme/drakeet/mailotto/Mailbox;->mailsToDispatch:Ljava/lang/ThreadLocal;

    .line 58
    new-instance v0, Lme/drakeet/mailotto/Mailbox$2;

    invoke-direct {v0, p0}, Lme/drakeet/mailotto/Mailbox$2;-><init>(Lme/drakeet/mailotto/Mailbox;)V

    iput-object v0, p0, Lme/drakeet/mailotto/Mailbox;->isDispatching:Ljava/lang/ThreadLocal;

    .line 86
    iput-object p1, p0, Lme/drakeet/mailotto/Mailbox;->enforcer:Lme/drakeet/mailotto/ThreadEnforcer;

    .line 87
    iput-object p2, p0, Lme/drakeet/mailotto/Mailbox;->identifier:Ljava/lang/String;

    .line 88
    iput-object p3, p0, Lme/drakeet/mailotto/Mailbox;->handlerFinder:Lme/drakeet/mailotto/HandlerFinder;

    .line 89
    return-void
.end method

.method private dispatchMails(Ljava/lang/Object;Lme/drakeet/mailotto/MailHandler;)V
    .registers 7
    .param p1, "to"    # Ljava/lang/Object;
    .param p2, "onMailReceived"    # Lme/drakeet/mailotto/MailHandler;

    .prologue
    .line 164
    iget-object v2, p0, Lme/drakeet/mailotto/Mailbox;->isDispatching:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_f

    .line 179
    :goto_e
    return-void

    .line 167
    :cond_f
    iget-object v2, p0, Lme/drakeet/mailotto/Mailbox;->isDispatching:Ljava/lang/ThreadLocal;

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 168
    iget-object v2, p0, Lme/drakeet/mailotto/Mailbox;->mailsToDispatch:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 169
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lme/drakeet/mailotto/Mail;>;"
    :cond_25
    :goto_25
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_46

    .line 170
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lme/drakeet/mailotto/Mail;

    .line 171
    .local v0, "_mail":Lme/drakeet/mailotto/Mail;
    iget-object v2, v0, Lme/drakeet/mailotto/Mail;->to:Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_25

    .line 172
    invoke-virtual {p2}, Lme/drakeet/mailotto/MailHandler;->isValid()Z

    move-result v2

    if-eqz v2, :cond_42

    .line 173
    invoke-virtual {p0, v0, p2}, Lme/drakeet/mailotto/Mailbox;->dispatch(Lme/drakeet/mailotto/Mail;Lme/drakeet/mailotto/MailHandler;)V

    .line 175
    :cond_42
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_25

    .line 178
    .end local v0    # "_mail":Lme/drakeet/mailotto/Mail;
    :cond_46
    iget-object v2, p0, Lme/drakeet/mailotto/Mailbox;->isDispatching:Ljava/lang/ThreadLocal;

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    goto :goto_e
.end method

.method public static getInstance()Lme/drakeet/mailotto/Mailbox;
    .registers 2

    .prologue
    .line 93
    sget-object v0, Lme/drakeet/mailotto/Mailbox;->instance:Lme/drakeet/mailotto/Mailbox;

    if-nez v0, :cond_13

    .line 94
    const-class v1, Lme/drakeet/mailotto/Mailbox;

    monitor-enter v1

    .line 95
    :try_start_7
    sget-object v0, Lme/drakeet/mailotto/Mailbox;->instance:Lme/drakeet/mailotto/Mailbox;

    if-nez v0, :cond_12

    new-instance v0, Lme/drakeet/mailotto/Mailbox;

    invoke-direct {v0}, Lme/drakeet/mailotto/Mailbox;-><init>()V

    sput-object v0, Lme/drakeet/mailotto/Mailbox;->instance:Lme/drakeet/mailotto/Mailbox;

    .line 96
    :cond_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_16

    .line 98
    :cond_13
    sget-object v0, Lme/drakeet/mailotto/Mailbox;->instance:Lme/drakeet/mailotto/Mailbox;

    return-object v0

    .line 96
    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v0
.end method

.method private static throwRuntimeException(Ljava/lang/String;Ljava/lang/reflect/InvocationTargetException;)V
    .registers 6
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "e"    # Ljava/lang/reflect/InvocationTargetException;

    .prologue
    .line 193
    invoke-virtual {p1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 194
    .local v0, "cause":Ljava/lang/Throwable;
    if-eqz v0, :cond_27

    .line 195
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 197
    :cond_27
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/reflect/InvocationTargetException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public atHome(Ljava/lang/Object;)V
    .registers 5
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 103
    if-nez p1, :cond_a

    .line 104
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "Object to atHome must not be null."

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 106
    :cond_a
    iget-object v1, p0, Lme/drakeet/mailotto/Mailbox;->enforcer:Lme/drakeet/mailotto/ThreadEnforcer;

    invoke-interface {v1, p0}, Lme/drakeet/mailotto/ThreadEnforcer;->enforce(Lme/drakeet/mailotto/Mailbox;)V

    .line 108
    iget-object v1, p0, Lme/drakeet/mailotto/Mailbox;->handlerFinder:Lme/drakeet/mailotto/HandlerFinder;

    invoke-interface {v1, p1}, Lme/drakeet/mailotto/HandlerFinder;->findOnMailReceived(Ljava/lang/Object;)Lme/drakeet/mailotto/MailHandler;

    move-result-object v0

    .line 109
    .local v0, "onMailReceived":Lme/drakeet/mailotto/MailHandler;
    if-eqz v0, :cond_20

    .line 110
    iget-object v1, p0, Lme/drakeet/mailotto/Mailbox;->currentAtHomeHandlerByClass:Ljava/util/concurrent/ConcurrentMap;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    :cond_20
    invoke-direct {p0, p1, v0}, Lme/drakeet/mailotto/Mailbox;->dispatchMails(Ljava/lang/Object;Lme/drakeet/mailotto/MailHandler;)V

    .line 113
    return-void
.end method

.method protected dispatch(Lme/drakeet/mailotto/Mail;Lme/drakeet/mailotto/MailHandler;)V
    .registers 6
    .param p1, "mail"    # Lme/drakeet/mailotto/Mail;
    .param p2, "wrapper"    # Lme/drakeet/mailotto/MailHandler;

    .prologue
    .line 184
    :try_start_0
    invoke-virtual {p2, p1}, Lme/drakeet/mailotto/MailHandler;->handleMail(Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_3} :catch_4

    .line 189
    :goto_3
    return-void

    .line 185
    :catch_4
    move-exception v0

    .line 186
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not dispatch mail: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 187
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to handler "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 186
    invoke-static {v1, v0}, Lme/drakeet/mailotto/Mailbox;->throwRuntimeException(Ljava/lang/String;Ljava/lang/reflect/InvocationTargetException;)V

    goto :goto_3
.end method

.method protected enqueue(Lme/drakeet/mailotto/Mail;)V
    .registers 3
    .param p1, "mail"    # Lme/drakeet/mailotto/Mail;

    .prologue
    .line 159
    iget-object v0, p0, Lme/drakeet/mailotto/Mailbox;->mailsToDispatch:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 160
    return-void
.end method

.method getCacheCurrentAtHomeHandler(Ljava/lang/Class;)Lme/drakeet/mailotto/MailHandler;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lme/drakeet/mailotto/MailHandler;"
        }
    .end annotation

    .prologue
    .line 138
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lme/drakeet/mailotto/Mailbox;->currentAtHomeHandlerByClass:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lme/drakeet/mailotto/MailHandler;

    return-object v0
.end method

.method public leave(Ljava/lang/Object;)V
    .registers 7
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 117
    if-nez p1, :cond_a

    .line 118
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "Object to leave must not be null."

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 120
    :cond_a
    iget-object v2, p0, Lme/drakeet/mailotto/Mailbox;->enforcer:Lme/drakeet/mailotto/ThreadEnforcer;

    invoke-interface {v2, p0}, Lme/drakeet/mailotto/ThreadEnforcer;->enforce(Lme/drakeet/mailotto/Mailbox;)V

    .line 122
    iget-object v2, p0, Lme/drakeet/mailotto/Mailbox;->handlerFinder:Lme/drakeet/mailotto/HandlerFinder;

    invoke-interface {v2, p1}, Lme/drakeet/mailotto/HandlerFinder;->findOnMailReceived(Ljava/lang/Object;)Lme/drakeet/mailotto/MailHandler;

    move-result-object v1

    .line 123
    .local v1, "foundHandler":Lme/drakeet/mailotto/MailHandler;
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0, v2}, Lme/drakeet/mailotto/Mailbox;->getCacheCurrentAtHomeHandler(Ljava/lang/Class;)Lme/drakeet/mailotto/MailHandler;

    move-result-object v0

    .line 124
    .local v0, "cacheHandler":Lme/drakeet/mailotto/MailHandler;
    if-eqz v0, :cond_25

    invoke-virtual {v0, v1}, Lme/drakeet/mailotto/MailHandler;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_48

    .line 125
    :cond_25
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Missing mail handler for an annotated method. Is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 126
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " atHome?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 130
    :cond_48
    invoke-virtual {v1, v0}, Lme/drakeet/mailotto/MailHandler;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5a

    .line 131
    invoke-virtual {v0}, Lme/drakeet/mailotto/MailHandler;->invalidate()V

    .line 132
    iget-object v2, p0, Lme/drakeet/mailotto/Mailbox;->currentAtHomeHandlerByClass:Ljava/util/concurrent/ConcurrentMap;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    :cond_5a
    return-void
.end method

.method public post(Lme/drakeet/mailotto/Mail;)V
    .registers 6
    .param p1, "mail"    # Lme/drakeet/mailotto/Mail;

    .prologue
    .line 143
    if-nez p1, :cond_a

    .line 144
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "Mail to post must not be null."

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 146
    :cond_a
    iget-object v2, p0, Lme/drakeet/mailotto/Mailbox;->enforcer:Lme/drakeet/mailotto/ThreadEnforcer;

    invoke-interface {v2, p0}, Lme/drakeet/mailotto/ThreadEnforcer;->enforce(Lme/drakeet/mailotto/Mailbox;)V

    .line 147
    iget-object v1, p1, Lme/drakeet/mailotto/Mail;->to:Ljava/lang/Class;

    .line 149
    .local v1, "toClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, v1}, Lme/drakeet/mailotto/Mailbox;->getCacheCurrentAtHomeHandler(Ljava/lang/Class;)Lme/drakeet/mailotto/MailHandler;

    move-result-object v0

    .line 150
    .local v0, "handler":Lme/drakeet/mailotto/MailHandler;
    if-eqz v0, :cond_1b

    .line 151
    invoke-virtual {p0, p1, v0}, Lme/drakeet/mailotto/Mailbox;->dispatch(Lme/drakeet/mailotto/Mail;Lme/drakeet/mailotto/MailHandler;)V

    .line 155
    :goto_1a
    return-void

    .line 153
    :cond_1b
    invoke-virtual {p0, p1}, Lme/drakeet/mailotto/Mailbox;->enqueue(Lme/drakeet/mailotto/Mail;)V

    goto :goto_1a
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 203
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[Mailbox \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lme/drakeet/mailotto/Mailbox;->identifier:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\"]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
