.class public Lfreemarker/ext/rhino/RhinoFunctionModel;
.super Lfreemarker/ext/rhino/RhinoScriptableModel;
.source "RhinoFunctionModel.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModelEx;


# instance fields
.field private final fnThis:Lorg/mozilla/javascript/Scriptable;


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/Function;Lorg/mozilla/javascript/Scriptable;Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 4
    .param p1, "function"    # Lorg/mozilla/javascript/Function;
    .param p2, "fnThis"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 25
    invoke-direct {p0, p1, p3}, Lfreemarker/ext/rhino/RhinoScriptableModel;-><init>(Lorg/mozilla/javascript/Scriptable;Lfreemarker/ext/beans/BeansWrapper;)V

    .line 26
    iput-object p2, p0, Lfreemarker/ext/rhino/RhinoFunctionModel;->fnThis:Lorg/mozilla/javascript/Scriptable;

    .line 27
    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 9
    .param p1, "arguments"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 30
    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v1

    .line 31
    .local v1, "cx":Lorg/mozilla/javascript/Context;
    invoke-interface {p1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v0

    .line 32
    .local v0, "args":[Ljava/lang/Object;
    invoke-virtual {p0}, Lfreemarker/ext/rhino/RhinoFunctionModel;->getWrapper()Lfreemarker/ext/beans/BeansWrapper;

    move-result-object v3

    .line 33
    .local v3, "wrapper":Lfreemarker/ext/beans/BeansWrapper;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_d
    array-length v4, v0

    if-ge v2, v4, :cond_1d

    .line 34
    aget-object v4, v0, v2

    check-cast v4, Lfreemarker/template/TemplateModel;

    invoke-virtual {v3, v4}, Lfreemarker/ext/beans/BeansWrapper;->unwrap(Lfreemarker/template/TemplateModel;)Ljava/lang/Object;

    move-result-object v4

    aput-object v4, v0, v2

    .line 33
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 36
    :cond_1d
    invoke-virtual {p0}, Lfreemarker/ext/rhino/RhinoFunctionModel;->getScriptable()Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    check-cast v4, Lorg/mozilla/javascript/Function;

    iget-object v5, p0, Lfreemarker/ext/rhino/RhinoFunctionModel;->fnThis:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v5}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v5

    iget-object v6, p0, Lfreemarker/ext/rhino/RhinoFunctionModel;->fnThis:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v4, v1, v5, v6, v0}, Lorg/mozilla/javascript/Function;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lfreemarker/ext/beans/BeansWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v4

    return-object v4
.end method
