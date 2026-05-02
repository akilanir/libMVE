.class Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;
.super Ljava/lang/Object;
.source "FreeMarkerJspApplicationContext.java"

# interfaces
.implements Ljavax/servlet/jsp/JspApplicationContext;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext;
    }
.end annotation


# static fields
.field static class$javax$el$ExpressionFactory:Ljava/lang/Class;

.field private static final expressionFactoryImpl:Ljavax/el/ExpressionFactory;

.field private static final logger:Lfreemarker/log/Logger;


# instance fields
.field private final additionalResolvers:Ljavax/el/CompositeELResolver;

.field private final elResolver:Ljavax/el/CompositeELResolver;

.field private final listeners:Ljava/util/LinkedList;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 32
    const-string v0, "freemarker.jsp"

    invoke-static {v0}, Lfreemarker/log/Logger;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->logger:Lfreemarker/log/Logger;

    .line 33
    invoke-static {}, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->findExpressionFactoryImplementation()Ljavax/el/ExpressionFactory;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->expressionFactoryImpl:Ljavax/el/ExpressionFactory;

    return-void
.end method

.method constructor <init>()V
    .registers 3

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->listeners:Ljava/util/LinkedList;

    .line 36
    new-instance v0, Ljavax/el/CompositeELResolver;

    invoke-direct {v0}, Ljavax/el/CompositeELResolver;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->elResolver:Ljavax/el/CompositeELResolver;

    .line 37
    new-instance v0, Ljavax/el/CompositeELResolver;

    invoke-direct {v0}, Ljavax/el/CompositeELResolver;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->additionalResolvers:Ljavax/el/CompositeELResolver;

    .line 39
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->elResolver:Ljavax/el/CompositeELResolver;

    new-instance v1, Ljavax/servlet/jsp/el/ImplicitObjectELResolver;

    invoke-direct {v1}, Ljavax/servlet/jsp/el/ImplicitObjectELResolver;-><init>()V

    invoke-virtual {v0, v1}, Ljavax/el/CompositeELResolver;->add(Ljavax/el/ELResolver;)V

    .line 40
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->elResolver:Ljavax/el/CompositeELResolver;

    iget-object v1, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->additionalResolvers:Ljavax/el/CompositeELResolver;

    invoke-virtual {v0, v1}, Ljavax/el/CompositeELResolver;->add(Ljavax/el/ELResolver;)V

    .line 41
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->elResolver:Ljavax/el/CompositeELResolver;

    new-instance v1, Ljavax/el/MapELResolver;

    invoke-direct {v1}, Ljavax/el/MapELResolver;-><init>()V

    invoke-virtual {v0, v1}, Ljavax/el/CompositeELResolver;->add(Ljavax/el/ELResolver;)V

    .line 42
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->elResolver:Ljavax/el/CompositeELResolver;

    new-instance v1, Ljavax/el/ResourceBundleELResolver;

    invoke-direct {v1}, Ljavax/el/ResourceBundleELResolver;-><init>()V

    invoke-virtual {v0, v1}, Ljavax/el/CompositeELResolver;->add(Ljavax/el/ELResolver;)V

    .line 43
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->elResolver:Ljavax/el/CompositeELResolver;

    new-instance v1, Ljavax/el/ListELResolver;

    invoke-direct {v1}, Ljavax/el/ListELResolver;-><init>()V

    invoke-virtual {v0, v1}, Ljavax/el/CompositeELResolver;->add(Ljavax/el/ELResolver;)V

    .line 44
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->elResolver:Ljavax/el/CompositeELResolver;

    new-instance v1, Ljavax/el/ArrayELResolver;

    invoke-direct {v1}, Ljavax/el/ArrayELResolver;-><init>()V

    invoke-virtual {v0, v1}, Ljavax/el/CompositeELResolver;->add(Ljavax/el/ELResolver;)V

    .line 45
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->elResolver:Ljavax/el/CompositeELResolver;

    new-instance v1, Ljavax/el/BeanELResolver;

    invoke-direct {v1}, Ljavax/el/BeanELResolver;-><init>()V

    invoke-virtual {v0, v1}, Ljavax/el/CompositeELResolver;->add(Ljavax/el/ELResolver;)V

    .line 46
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->elResolver:Ljavax/el/CompositeELResolver;

    new-instance v1, Ljavax/servlet/jsp/el/ScopedAttributeELResolver;

    invoke-direct {v1}, Ljavax/servlet/jsp/el/ScopedAttributeELResolver;-><init>()V

    invoke-virtual {v0, v1}, Ljavax/el/CompositeELResolver;->add(Ljavax/el/ELResolver;)V

    .line 107
    return-void
.end method

.method static access$000(Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;)Ljavax/el/CompositeELResolver;
    .registers 2
    .param p0, "x0"    # Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;

    .prologue
    .line 30
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->elResolver:Ljavax/el/CompositeELResolver;

    return-object v0
.end method

.method static access$200()Ljavax/el/ExpressionFactory;
    .registers 1

    .prologue
    .line 30
    sget-object v0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->expressionFactoryImpl:Ljavax/el/ExpressionFactory;

    return-object v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 61
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static findExpressionFactoryImplementation()Ljavax/el/ExpressionFactory;
    .registers 4

    .prologue
    .line 56
    const-string v1, "com.sun"

    invoke-static {v1}, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->tryExpressionFactoryImplementation(Ljava/lang/String;)Ljavax/el/ExpressionFactory;

    move-result-object v0

    .line 57
    .local v0, "ef":Ljavax/el/ExpressionFactory;
    if-nez v0, :cond_38

    .line 58
    const-string v1, "org.apache"

    invoke-static {v1}, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->tryExpressionFactoryImplementation(Ljava/lang/String;)Ljavax/el/ExpressionFactory;

    move-result-object v0

    .line 59
    if-nez v0, :cond_38

    .line 60
    sget-object v2, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->logger:Lfreemarker/log/Logger;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Could not find any implementation for "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    sget-object v1, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->class$javax$el$ExpressionFactory:Ljava/lang/Class;

    if-nez v1, :cond_39

    const-string v1, "javax.el.ExpressionFactory"

    invoke-static {v1}, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->class$javax$el$ExpressionFactory:Ljava/lang/Class;

    :goto_29
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lfreemarker/log/Logger;->warn(Ljava/lang/String;)V

    .line 64
    :cond_38
    return-object v0

    .line 60
    :cond_39
    sget-object v1, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->class$javax$el$ExpressionFactory:Ljava/lang/Class;

    goto :goto_29
.end method

.method private static tryExpressionFactoryImplementation(Ljava/lang/String;)Ljavax/el/ExpressionFactory;
    .registers 7
    .param p0, "packagePrefix"    # Ljava/lang/String;

    .prologue
    .line 68
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, ".el.ExpressionFactoryImpl"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 70
    .local v1, "className":Ljava/lang/String;
    :try_start_13
    invoke-static {v1}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 71
    .local v0, "cl":Ljava/lang/Class;
    sget-object v3, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->class$javax$el$ExpressionFactory:Ljava/lang/Class;

    if-nez v3, :cond_62

    const-string v3, "javax.el.ExpressionFactory"

    invoke-static {v3}, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->class$javax$el$ExpressionFactory:Ljava/lang/Class;

    :goto_23
    invoke-virtual {v3, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_68

    .line 72
    sget-object v4, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->logger:Lfreemarker/log/Logger;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Using "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v5, " as implementation of "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    sget-object v3, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->class$javax$el$ExpressionFactory:Ljava/lang/Class;

    if-nez v3, :cond_65

    const-string v3, "javax.el.ExpressionFactory"

    invoke-static {v3}, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->class$javax$el$ExpressionFactory:Ljava/lang/Class;

    :goto_4c
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lfreemarker/log/Logger;->info(Ljava/lang/String;)V

    .line 74
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljavax/el/ExpressionFactory;

    .line 84
    .end local v0    # "cl":Ljava/lang/Class;
    :goto_61
    return-object v3

    .line 71
    .restart local v0    # "cl":Ljava/lang/Class;
    :cond_62
    sget-object v3, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->class$javax$el$ExpressionFactory:Ljava/lang/Class;

    goto :goto_23

    .line 72
    :cond_65
    sget-object v3, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->class$javax$el$ExpressionFactory:Ljava/lang/Class;

    goto :goto_4c

    .line 76
    :cond_68
    sget-object v4, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->logger:Lfreemarker/log/Logger;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Class "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v5, " does not implement "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    sget-object v3, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->class$javax$el$ExpressionFactory:Ljava/lang/Class;

    if-nez v3, :cond_9c

    const-string v3, "javax.el.ExpressionFactory"

    invoke-static {v3}, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->class$javax$el$ExpressionFactory:Ljava/lang/Class;

    :goto_8b
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lfreemarker/log/Logger;->warn(Ljava/lang/String;)V

    .line 84
    .end local v0    # "cl":Ljava/lang/Class;
    :goto_9a
    const/4 v3, 0x0

    goto :goto_61

    .line 76
    .restart local v0    # "cl":Ljava/lang/Class;
    :cond_9c
    sget-object v3, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->class$javax$el$ExpressionFactory:Ljava/lang/Class;
    :try_end_9e
    .catch Ljava/lang/ClassNotFoundException; {:try_start_13 .. :try_end_9e} :catch_b9
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_9e} :catch_9f

    goto :goto_8b

    .line 81
    .end local v0    # "cl":Ljava/lang/Class;
    :catch_9f
    move-exception v2

    .line 82
    .local v2, "e":Ljava/lang/Exception;
    sget-object v3, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->logger:Lfreemarker/log/Logger;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Failed to instantiate "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v2}, Lfreemarker/log/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_9a

    .line 79
    .end local v2    # "e":Ljava/lang/Exception;
    :catch_b9
    move-exception v3

    goto :goto_9a
.end method


# virtual methods
.method public addELContextListener(Ljavax/el/ELContextListener;)V
    .registers 4
    .param p1, "listener"    # Ljavax/el/ELContextListener;

    .prologue
    .line 50
    iget-object v1, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->listeners:Ljava/util/LinkedList;

    monitor-enter v1

    .line 51
    :try_start_3
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->listeners:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 52
    monitor-exit v1

    .line 53
    return-void

    .line 52
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public addELResolver(Ljavax/el/ELResolver;)V
    .registers 3
    .param p1, "resolver"    # Ljavax/el/ELResolver;

    .prologue
    .line 88
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->additionalResolvers:Ljavax/el/CompositeELResolver;

    invoke-virtual {v0, p1}, Ljavax/el/CompositeELResolver;->add(Ljavax/el/ELResolver;)V

    .line 89
    return-void
.end method

.method createNewELContext(Lfreemarker/ext/jsp/FreeMarkerPageContext;)Ljavax/el/ELContext;
    .registers 8
    .param p1, "pageCtx"    # Lfreemarker/ext/jsp/FreeMarkerPageContext;

    .prologue
    .line 96
    new-instance v0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext;

    invoke-direct {v0, p0, p1}, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext;-><init>(Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;Lfreemarker/ext/jsp/FreeMarkerPageContext;)V

    .line 97
    .local v0, "ctx":Ljavax/el/ELContext;
    new-instance v1, Ljavax/el/ELContextEvent;

    invoke-direct {v1, v0}, Ljavax/el/ELContextEvent;-><init>(Ljavax/el/ELContext;)V

    .line 98
    .local v1, "event":Ljavax/el/ELContextEvent;
    iget-object v5, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->listeners:Ljava/util/LinkedList;

    monitor-enter v5

    .line 99
    :try_start_d
    iget-object v4, p0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->listeners:Ljava/util/LinkedList;

    invoke-virtual {v4}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "iter":Ljava/util/Iterator;
    :goto_13
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_26

    .line 100
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljavax/el/ELContextListener;

    .line 101
    .local v3, "l":Ljavax/el/ELContextListener;
    invoke-interface {v3, v1}, Ljavax/el/ELContextListener;->contextCreated(Ljavax/el/ELContextEvent;)V

    goto :goto_13

    .line 103
    .end local v2    # "iter":Ljava/util/Iterator;
    .end local v3    # "l":Ljavax/el/ELContextListener;
    :catchall_23
    move-exception v4

    monitor-exit v5
    :try_end_25
    .catchall {:try_start_d .. :try_end_25} :catchall_23

    throw v4

    .restart local v2    # "iter":Ljava/util/Iterator;
    :cond_26
    :try_start_26
    monitor-exit v5
    :try_end_27
    .catchall {:try_start_26 .. :try_end_27} :catchall_23

    .line 104
    return-object v0
.end method

.method public getExpressionFactory()Ljavax/el/ExpressionFactory;
    .registers 2

    .prologue
    .line 92
    sget-object v0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->expressionFactoryImpl:Ljavax/el/ExpressionFactory;

    return-object v0
.end method
