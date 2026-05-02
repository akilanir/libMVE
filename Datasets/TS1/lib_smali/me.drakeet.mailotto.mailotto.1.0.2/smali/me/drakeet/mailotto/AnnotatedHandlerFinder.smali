.class final Lme/drakeet/mailotto/AnnotatedHandlerFinder;
.super Ljava/lang/Object;
.source "AnnotatedHandlerFinder.java"


# static fields
.field private static final SUBSCRIBER_CACHE:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 39
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lme/drakeet/mailotto/AnnotatedHandlerFinder;->SUBSCRIBER_CACHE:Ljava/util/concurrent/ConcurrentMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    return-void
.end method

.method static findOnMailReceived(Ljava/lang/Object;)Lme/drakeet/mailotto/MailHandler;
    .registers 5
    .param p0, "listener"    # Ljava/lang/Object;

    .prologue
    .line 93
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 95
    .local v0, "listenerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v2, Lme/drakeet/mailotto/AnnotatedHandlerFinder;->SUBSCRIBER_CACHE:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, v0}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Method;

    .line 97
    .local v1, "method":Ljava/lang/reflect/Method;
    if-nez v1, :cond_21

    .line 98
    invoke-static {v0}, Lme/drakeet/mailotto/AnnotatedHandlerFinder;->loadAnnotatedMethod(Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 99
    if-nez v1, :cond_1c

    .line 100
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "You must set a @OnMailReceived method for handle mail."

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 103
    :cond_1c
    sget-object v2, Lme/drakeet/mailotto/AnnotatedHandlerFinder;->SUBSCRIBER_CACHE:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, v0, v1}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    :cond_21
    new-instance v2, Lme/drakeet/mailotto/MailHandler;

    invoke-direct {v2, p0, v1}, Lme/drakeet/mailotto/MailHandler;-><init>(Ljava/lang/Object;Ljava/lang/reflect/Method;)V

    return-object v2
.end method

.method private static loadAnnotatedMethod(Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .local p0, "listenerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v4, 0x0

    .line 53
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v5

    array-length v6, v5

    move v3, v4

    :goto_7
    if-ge v3, v6, :cond_b0

    aget-object v1, v5, v3

    .line 58
    .local v1, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->isBridge()Z

    move-result v7

    if-eqz v7, :cond_14

    .line 53
    :cond_11
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 61
    :cond_14
    const-class v7, Lme/drakeet/mailotto/OnMailReceived;

    invoke-virtual {v1, v7}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_11

    .line 62
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    .line 63
    .local v2, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v3, v2

    const/4 v5, 0x1

    if-eq v3, v5, :cond_4e

    .line 64
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Method "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " has @OnMailReceived annotation but requires "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    array-length v5, v2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " arguments.  Methods must require a single argument."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 70
    :cond_4e
    aget-object v0, v2, v4

    .line 71
    .local v0, "mailType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->isInterface()Z

    move-result v3

    if-eqz v3, :cond_7f

    .line 72
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Method "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " has @OnMailReceived annotation on "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " which is an interface.  Subscription must be on a concrete class type."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 77
    :cond_7f
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v3

    and-int/lit8 v3, v3, 0x1

    if-nez v3, :cond_b1

    .line 78
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Method "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " has @OnMailReceived annotation on "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " but is not \'public\'."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 85
    .end local v0    # "mailType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method":Ljava/lang/reflect/Method;
    .end local v2    # "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_b0
    const/4 v1, 0x0

    :cond_b1
    return-object v1
.end method
