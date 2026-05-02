.class public Lfreemarker/ext/servlet/AllHttpScopesHashModel;
.super Lfreemarker/template/SimpleHash;
.source "AllHttpScopesHashModel.java"


# instance fields
.field private final context:Ljavax/servlet/ServletContext;

.field private final request:Ljavax/servlet/http/HttpServletRequest;

.field private final unlistedModels:Ljava/util/Map;


# direct methods
.method public constructor <init>(Lfreemarker/template/ObjectWrapper;Ljavax/servlet/ServletContext;Ljavax/servlet/http/HttpServletRequest;)V
    .registers 5
    .param p1, "wrapper"    # Lfreemarker/template/ObjectWrapper;
    .param p2, "context"    # Ljavax/servlet/ServletContext;
    .param p3, "request"    # Ljavax/servlet/http/HttpServletRequest;

    .prologue
    .line 94
    invoke-direct {p0}, Lfreemarker/template/SimpleHash;-><init>()V

    .line 84
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/servlet/AllHttpScopesHashModel;->unlistedModels:Ljava/util/Map;

    .line 95
    invoke-virtual {p0, p1}, Lfreemarker/ext/servlet/AllHttpScopesHashModel;->setObjectWrapper(Lfreemarker/template/ObjectWrapper;)V

    .line 96
    iput-object p2, p0, Lfreemarker/ext/servlet/AllHttpScopesHashModel;->context:Ljavax/servlet/ServletContext;

    .line 97
    iput-object p3, p0, Lfreemarker/ext/servlet/AllHttpScopesHashModel;->request:Ljavax/servlet/http/HttpServletRequest;

    .line 98
    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 7
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 114
    invoke-super {p0, p1}, Lfreemarker/template/SimpleHash;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 115
    .local v0, "model":Lfreemarker/template/TemplateModel;
    if-eqz v0, :cond_8

    move-object v3, v0

    .line 147
    :goto_7
    return-object v3

    .line 120
    :cond_8
    iget-object v3, p0, Lfreemarker/ext/servlet/AllHttpScopesHashModel;->unlistedModels:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "model":Lfreemarker/template/TemplateModel;
    check-cast v0, Lfreemarker/template/TemplateModel;

    .line 121
    .restart local v0    # "model":Lfreemarker/template/TemplateModel;
    if-eqz v0, :cond_14

    move-object v3, v0

    .line 122
    goto :goto_7

    .line 126
    :cond_14
    iget-object v3, p0, Lfreemarker/ext/servlet/AllHttpScopesHashModel;->request:Ljavax/servlet/http/HttpServletRequest;

    invoke-interface {v3, p1}, Ljavax/servlet/http/HttpServletRequest;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 127
    .local v1, "obj":Ljava/lang/Object;
    if-eqz v1, :cond_21

    .line 128
    invoke-virtual {p0, v1}, Lfreemarker/ext/servlet/AllHttpScopesHashModel;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v3

    goto :goto_7

    .line 132
    :cond_21
    iget-object v3, p0, Lfreemarker/ext/servlet/AllHttpScopesHashModel;->request:Ljavax/servlet/http/HttpServletRequest;

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Ljavax/servlet/http/HttpServletRequest;->getSession(Z)Ljavax/servlet/http/HttpSession;

    move-result-object v2

    .line 133
    .local v2, "session":Ljavax/servlet/http/HttpSession;
    if-eqz v2, :cond_35

    .line 134
    invoke-interface {v2, p1}, Ljavax/servlet/http/HttpSession;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 135
    if-eqz v1, :cond_35

    .line 136
    invoke-virtual {p0, v1}, Lfreemarker/ext/servlet/AllHttpScopesHashModel;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v3

    goto :goto_7

    .line 141
    :cond_35
    iget-object v3, p0, Lfreemarker/ext/servlet/AllHttpScopesHashModel;->context:Ljavax/servlet/ServletContext;

    invoke-interface {v3, p1}, Ljavax/servlet/ServletContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 142
    if-eqz v1, :cond_42

    .line 143
    invoke-virtual {p0, v1}, Lfreemarker/ext/servlet/AllHttpScopesHashModel;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v3

    goto :goto_7

    .line 147
    :cond_42
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lfreemarker/ext/servlet/AllHttpScopesHashModel;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v3

    goto :goto_7
.end method

.method public putUnlistedModel(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "model"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 109
    iget-object v0, p0, Lfreemarker/ext/servlet/AllHttpScopesHashModel;->unlistedModels:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    return-void
.end method
