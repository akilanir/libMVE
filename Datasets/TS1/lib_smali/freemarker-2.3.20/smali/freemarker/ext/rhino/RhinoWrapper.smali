.class public Lfreemarker/ext/rhino/RhinoWrapper;
.super Lfreemarker/ext/beans/BeansWrapper;
.source "RhinoWrapper.java"


# static fields
.field private static final UNDEFINED_INSTANCE:Ljava/lang/Object;

.field static class$org$mozilla$javascript$Scriptable:Ljava/lang/Class;

.field static class$org$mozilla$javascript$Undefined:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 27
    :try_start_0
    new-instance v1, Lfreemarker/ext/rhino/RhinoWrapper$1;

    invoke-direct {v1}, Lfreemarker/ext/rhino/RhinoWrapper$1;-><init>()V

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;

    move-result-object v1

    sput-object v1, Lfreemarker/ext/rhino/RhinoWrapper;->UNDEFINED_INSTANCE:Ljava/lang/Object;
    :try_end_b
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_b} :catch_c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_b} :catch_e

    .line 39
    return-void

    .line 33
    :catch_c
    move-exception v0

    .line 34
    .local v0, "e":Ljava/lang/RuntimeException;
    throw v0

    .line 36
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catch_e
    move-exception v0

    .line 37
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v1, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Lfreemarker/ext/beans/BeansWrapper;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 29
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


# virtual methods
.method protected getModelFactory(Ljava/lang/Class;)Lfreemarker/ext/util/ModelFactory;
    .registers 3
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 64
    sget-object v0, Lfreemarker/ext/rhino/RhinoWrapper;->class$org$mozilla$javascript$Scriptable:Ljava/lang/Class;

    if-nez v0, :cond_15

    const-string v0, "org.mozilla.javascript.Scriptable"

    invoke-static {v0}, Lfreemarker/ext/rhino/RhinoWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/rhino/RhinoWrapper;->class$org$mozilla$javascript$Scriptable:Ljava/lang/Class;

    :goto_c
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 65
    sget-object v0, Lfreemarker/ext/rhino/RhinoScriptableModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    .line 67
    :goto_14
    return-object v0

    .line 64
    :cond_15
    sget-object v0, Lfreemarker/ext/rhino/RhinoWrapper;->class$org$mozilla$javascript$Scriptable:Ljava/lang/Class;

    goto :goto_c

    .line 67
    :cond_18
    invoke-super {p0, p1}, Lfreemarker/ext/beans/BeansWrapper;->getModelFactory(Ljava/lang/Class;)Lfreemarker/ext/util/ModelFactory;

    move-result-object v0

    goto :goto_14
.end method

.method public wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 43
    sget-object v1, Lfreemarker/ext/rhino/RhinoWrapper;->UNDEFINED_INSTANCE:Ljava/lang/Object;

    if-eq p1, v1, :cond_9

    sget-object v1, Lorg/mozilla/javascript/UniqueTag;->NOT_FOUND:Lorg/mozilla/javascript/UniqueTag;

    if-ne p1, v1, :cond_a

    .line 60
    :cond_9
    :goto_9
    return-object v0

    .line 53
    :cond_a
    sget-object v1, Lorg/mozilla/javascript/UniqueTag;->NULL_VALUE:Lorg/mozilla/javascript/UniqueTag;

    if-ne p1, v1, :cond_13

    .line 54
    invoke-super {p0, v0}, Lfreemarker/ext/beans/BeansWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    goto :goto_9

    .line 57
    :cond_13
    instance-of v0, p1, Lorg/mozilla/javascript/Wrapper;

    if-eqz v0, :cond_1d

    .line 58
    check-cast p1, Lorg/mozilla/javascript/Wrapper;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object p1

    .line 60
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_1d
    invoke-super {p0, p1}, Lfreemarker/ext/beans/BeansWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    goto :goto_9
.end method
