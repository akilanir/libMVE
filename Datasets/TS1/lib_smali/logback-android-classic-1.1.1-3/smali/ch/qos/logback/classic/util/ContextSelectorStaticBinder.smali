.class public Lch/qos/logback/classic/util/ContextSelectorStaticBinder;
.super Ljava/lang/Object;


# static fields
.field static singleton:Lch/qos/logback/classic/util/ContextSelectorStaticBinder;


# instance fields
.field contextSelector:Lch/qos/logback/classic/selector/ContextSelector;

.field key:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lch/qos/logback/classic/util/ContextSelectorStaticBinder;

    invoke-direct {v0}, Lch/qos/logback/classic/util/ContextSelectorStaticBinder;-><init>()V

    sput-object v0, Lch/qos/logback/classic/util/ContextSelectorStaticBinder;->singleton:Lch/qos/logback/classic/util/ContextSelectorStaticBinder;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static dynamicalContextSelector(Lch/qos/logback/classic/LoggerContext;Ljava/lang/String;)Lch/qos/logback/classic/selector/ContextSelector;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    const/4 v4, 0x1

    const/4 v3, 0x0

    invoke-static {p1}, Lch/qos/logback/core/util/Loader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    new-array v1, v4, [Ljava/lang/Class;

    const-class v2, Lch/qos/logback/classic/LoggerContext;

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    new-array v1, v4, [Ljava/lang/Object;

    aput-object p0, v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/classic/selector/ContextSelector;

    return-object v0
.end method

.method public static getSingleton()Lch/qos/logback/classic/util/ContextSelectorStaticBinder;
    .registers 1

    sget-object v0, Lch/qos/logback/classic/util/ContextSelectorStaticBinder;->singleton:Lch/qos/logback/classic/util/ContextSelectorStaticBinder;

    return-object v0
.end method


# virtual methods
.method public getContextSelector()Lch/qos/logback/classic/selector/ContextSelector;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/util/ContextSelectorStaticBinder;->contextSelector:Lch/qos/logback/classic/selector/ContextSelector;

    return-object v0
.end method

.method public init(Lch/qos/logback/classic/LoggerContext;Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/classic/util/ContextSelectorStaticBinder;->key:Ljava/lang/Object;

    if-nez v0, :cond_16

    iput-object p2, p0, Lch/qos/logback/classic/util/ContextSelectorStaticBinder;->key:Ljava/lang/Object;

    :cond_6
    const-string v0, "logback.ContextSelector"

    invoke-static {v0}, Lch/qos/logback/core/util/OptionHelper;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_22

    new-instance v0, Lch/qos/logback/classic/selector/DefaultContextSelector;

    invoke-direct {v0, p1}, Lch/qos/logback/classic/selector/DefaultContextSelector;-><init>(Lch/qos/logback/classic/LoggerContext;)V

    iput-object v0, p0, Lch/qos/logback/classic/util/ContextSelectorStaticBinder;->contextSelector:Lch/qos/logback/classic/selector/ContextSelector;

    :goto_15
    return-void

    :cond_16
    iget-object v0, p0, Lch/qos/logback/classic/util/ContextSelectorStaticBinder;->key:Ljava/lang/Object;

    if-eq v0, p2, :cond_6

    new-instance v0, Ljava/lang/IllegalAccessException;

    const-string v1, "Only certain classes can access this method."

    invoke-direct {v0, v1}, Ljava/lang/IllegalAccessException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_22
    const-string v1, "JNDI"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_32

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "JNDI not supported"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_32
    invoke-static {p1, v0}, Lch/qos/logback/classic/util/ContextSelectorStaticBinder;->dynamicalContextSelector(Lch/qos/logback/classic/LoggerContext;Ljava/lang/String;)Lch/qos/logback/classic/selector/ContextSelector;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/classic/util/ContextSelectorStaticBinder;->contextSelector:Lch/qos/logback/classic/selector/ContextSelector;

    goto :goto_15
.end method
