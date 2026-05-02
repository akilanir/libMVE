.class public Lfreemarker/ext/servlet/HttpRequestParametersHashModel;
.super Ljava/lang/Object;
.source "HttpRequestParametersHashModel.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModelEx;


# instance fields
.field private keys:Ljava/util/List;

.field private final request:Ljavax/servlet/http/HttpServletRequest;


# direct methods
.method public constructor <init>(Ljavax/servlet/http/HttpServletRequest;)V
    .registers 2
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    iput-object p1, p0, Lfreemarker/ext/servlet/HttpRequestParametersHashModel;->request:Ljavax/servlet/http/HttpServletRequest;

    .line 83
    return-void
.end method

.method static access$000(Lfreemarker/ext/servlet/HttpRequestParametersHashModel;)Ljavax/servlet/http/HttpServletRequest;
    .registers 2
    .param p0, "x0"    # Lfreemarker/ext/servlet/HttpRequestParametersHashModel;

    .prologue
    .line 73
    iget-object v0, p0, Lfreemarker/ext/servlet/HttpRequestParametersHashModel;->request:Ljavax/servlet/http/HttpServletRequest;

    return-object v0
.end method

.method private declared-synchronized getKeys()Ljava/util/List;
    .registers 4

    .prologue
    .line 126
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lfreemarker/ext/servlet/HttpRequestParametersHashModel;->keys:Ljava/util/List;

    if-nez v1, :cond_25

    .line 127
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lfreemarker/ext/servlet/HttpRequestParametersHashModel;->keys:Ljava/util/List;

    .line 128
    iget-object v1, p0, Lfreemarker/ext/servlet/HttpRequestParametersHashModel;->request:Ljavax/servlet/http/HttpServletRequest;

    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getParameterNames()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "enumeration":Ljava/util/Enumeration;
    :goto_12
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_25

    .line 129
    iget-object v1, p0, Lfreemarker/ext/servlet/HttpRequestParametersHashModel;->keys:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_21
    .catchall {:try_start_1 .. :try_end_21} :catchall_22

    goto :goto_12

    .line 126
    .end local v0    # "enumeration":Ljava/util/Enumeration;
    :catchall_22
    move-exception v1

    monitor-exit p0

    throw v1

    .line 132
    :cond_25
    :try_start_25
    iget-object v1, p0, Lfreemarker/ext/servlet/HttpRequestParametersHashModel;->keys:Ljava/util/List;
    :try_end_27
    .catchall {:try_start_25 .. :try_end_27} :catchall_22

    monitor-exit p0

    return-object v1
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 87
    iget-object v1, p0, Lfreemarker/ext/servlet/HttpRequestParametersHashModel;->request:Ljavax/servlet/http/HttpServletRequest;

    invoke-interface {v1, p1}, Ljavax/servlet/http/HttpServletRequest;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 88
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_a

    const/4 v1, 0x0

    :goto_9
    return-object v1

    :cond_a
    new-instance v1, Lfreemarker/template/SimpleScalar;

    invoke-direct {v1, v0}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    goto :goto_9
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lfreemarker/ext/servlet/HttpRequestParametersHashModel;->request:Ljavax/servlet/http/HttpServletRequest;

    invoke-interface {v0}, Ljavax/servlet/http/HttpServletRequest;->getParameterNames()Ljava/util/Enumeration;

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
    .registers 3

    .prologue
    .line 101
    new-instance v0, Lfreemarker/template/SimpleCollection;

    invoke-direct {p0}, Lfreemarker/ext/servlet/HttpRequestParametersHashModel;->getKeys()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleCollection;-><init>(Ljava/util/Iterator;)V

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 97
    invoke-direct {p0}, Lfreemarker/ext/servlet/HttpRequestParametersHashModel;->getKeys()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method protected transcode(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 122
    return-object p1
.end method

.method public values()Lfreemarker/template/TemplateCollectionModel;
    .registers 4

    .prologue
    .line 105
    invoke-direct {p0}, Lfreemarker/ext/servlet/HttpRequestParametersHashModel;->getKeys()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 106
    .local v0, "iter":Ljava/util/Iterator;
    new-instance v1, Lfreemarker/template/SimpleCollection;

    new-instance v2, Lfreemarker/ext/servlet/HttpRequestParametersHashModel$1;

    invoke-direct {v2, p0, v0}, Lfreemarker/ext/servlet/HttpRequestParametersHashModel$1;-><init>(Lfreemarker/ext/servlet/HttpRequestParametersHashModel;Ljava/util/Iterator;)V

    invoke-direct {v1, v2}, Lfreemarker/template/SimpleCollection;-><init>(Ljava/util/Iterator;)V

    return-object v1
.end method
