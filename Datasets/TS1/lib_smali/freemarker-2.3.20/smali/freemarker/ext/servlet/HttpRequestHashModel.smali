.class public final Lfreemarker/ext/servlet/HttpRequestHashModel;
.super Ljava/lang/Object;
.source "HttpRequestHashModel.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModelEx;


# instance fields
.field private final request:Ljavax/servlet/http/HttpServletRequest;

.field private final response:Ljavax/servlet/http/HttpServletResponse;

.field private final wrapper:Lfreemarker/template/ObjectWrapper;


# direct methods
.method public constructor <init>(Ljavax/servlet/http/HttpServletRequest;Lfreemarker/template/ObjectWrapper;)V
    .registers 4
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "wrapper"    # Lfreemarker/template/ObjectWrapper;

    .prologue
    .line 81
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lfreemarker/ext/servlet/HttpRequestHashModel;-><init>(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lfreemarker/template/ObjectWrapper;)V

    .line 82
    return-void
.end method

.method public constructor <init>(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lfreemarker/template/ObjectWrapper;)V
    .registers 4
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .param p3, "wrapper"    # Lfreemarker/template/ObjectWrapper;

    .prologue
    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    iput-object p1, p0, Lfreemarker/ext/servlet/HttpRequestHashModel;->request:Ljavax/servlet/http/HttpServletRequest;

    .line 89
    iput-object p2, p0, Lfreemarker/ext/servlet/HttpRequestHashModel;->response:Ljavax/servlet/http/HttpServletResponse;

    .line 90
    iput-object p3, p0, Lfreemarker/ext/servlet/HttpRequestHashModel;->wrapper:Lfreemarker/template/ObjectWrapper;

    .line 91
    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 95
    iget-object v0, p0, Lfreemarker/ext/servlet/HttpRequestHashModel;->wrapper:Lfreemarker/template/ObjectWrapper;

    iget-object v1, p0, Lfreemarker/ext/servlet/HttpRequestHashModel;->request:Ljavax/servlet/http/HttpServletRequest;

    invoke-interface {v1, p1}, Ljavax/servlet/http/HttpServletRequest;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lfreemarker/template/ObjectWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    return-object v0
.end method

.method public getObjectWrapper()Lfreemarker/template/ObjectWrapper;
    .registers 2

    .prologue
    .line 140
    iget-object v0, p0, Lfreemarker/ext/servlet/HttpRequestHashModel;->wrapper:Lfreemarker/template/ObjectWrapper;

    return-object v0
.end method

.method public getRequest()Ljavax/servlet/http/HttpServletRequest;
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Lfreemarker/ext/servlet/HttpRequestHashModel;->request:Ljavax/servlet/http/HttpServletRequest;

    return-object v0
.end method

.method public getResponse()Ljavax/servlet/http/HttpServletResponse;
    .registers 2

    .prologue
    .line 135
    iget-object v0, p0, Lfreemarker/ext/servlet/HttpRequestHashModel;->response:Ljavax/servlet/http/HttpServletResponse;

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Lfreemarker/ext/servlet/HttpRequestHashModel;->request:Ljavax/servlet/http/HttpServletRequest;

    invoke-interface {v0}, Ljavax/servlet/http/HttpServletRequest;->getAttributeNames()Ljava/util/Enumeration;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public keys()Lfreemarker/template/TemplateCollectionModel;
    .registers 5

    .prologue
    .line 113
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 114
    .local v1, "keys":Ljava/util/ArrayList;
    iget-object v2, p0, Lfreemarker/ext/servlet/HttpRequestHashModel;->request:Ljavax/servlet/http/HttpServletRequest;

    invoke-interface {v2}, Ljavax/servlet/http/HttpServletRequest;->getAttributeNames()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "enumeration":Ljava/util/Enumeration;
    :goto_b
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 115
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 117
    :cond_19
    new-instance v2, Lfreemarker/template/SimpleCollection;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/SimpleCollection;-><init>(Ljava/util/Iterator;)V

    return-object v2
.end method

.method public size()I
    .registers 4

    .prologue
    .line 104
    const/4 v1, 0x0

    .line 105
    .local v1, "result":I
    iget-object v2, p0, Lfreemarker/ext/servlet/HttpRequestHashModel;->request:Ljavax/servlet/http/HttpServletRequest;

    invoke-interface {v2}, Ljavax/servlet/http/HttpServletRequest;->getAttributeNames()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "enumeration":Ljava/util/Enumeration;
    :goto_7
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_13

    .line 106
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 107
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 109
    :cond_13
    return v1
.end method

.method public values()Lfreemarker/template/TemplateCollectionModel;
    .registers 6

    .prologue
    .line 121
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 122
    .local v1, "values":Ljava/util/ArrayList;
    iget-object v2, p0, Lfreemarker/ext/servlet/HttpRequestHashModel;->request:Ljavax/servlet/http/HttpServletRequest;

    invoke-interface {v2}, Ljavax/servlet/http/HttpServletRequest;->getAttributeNames()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "enumeration":Ljava/util/Enumeration;
    :goto_b
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_21

    .line 123
    iget-object v3, p0, Lfreemarker/ext/servlet/HttpRequestHashModel;->request:Ljavax/servlet/http/HttpServletRequest;

    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v3, v2}, Ljavax/servlet/http/HttpServletRequest;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 125
    :cond_21
    new-instance v2, Lfreemarker/template/SimpleCollection;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    iget-object v4, p0, Lfreemarker/ext/servlet/HttpRequestHashModel;->wrapper:Lfreemarker/template/ObjectWrapper;

    invoke-direct {v2, v3, v4}, Lfreemarker/template/SimpleCollection;-><init>(Ljava/util/Iterator;Lfreemarker/template/ObjectWrapper;)V

    return-object v2
.end method
