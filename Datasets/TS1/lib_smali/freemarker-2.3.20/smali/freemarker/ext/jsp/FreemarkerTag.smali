.class public Lfreemarker/ext/jsp/FreemarkerTag;
.super Ljava/lang/Object;
.source "FreemarkerTag.java"

# interfaces
.implements Ljavax/servlet/jsp/tagext/BodyTag;


# instance fields
.field private bodyContent:Ljavax/servlet/jsp/tagext/BodyContent;

.field private caching:Z

.field private name:Ljava/lang/String;

.field private pageContext:Ljavax/servlet/jsp/PageContext;

.field private parent:Ljavax/servlet/jsp/tagext/Tag;

.field private root:Lfreemarker/template/SimpleHash;

.field private template:Lfreemarker/template/Template;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    const/4 v0, 0x1

    iput-boolean v0, p0, Lfreemarker/ext/jsp/FreemarkerTag;->caching:Z

    .line 81
    const-string v0, ""

    iput-object v0, p0, Lfreemarker/ext/jsp/FreemarkerTag;->name:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public doAfterBody()I
    .registers 2

    .prologue
    .line 130
    const/4 v0, 0x0

    return v0
.end method

.method public doEndTag()I
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/jsp/JspException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x6

    const/4 v7, 0x0

    .line 143
    iget-object v2, p0, Lfreemarker/ext/jsp/FreemarkerTag;->bodyContent:Ljavax/servlet/jsp/tagext/BodyContent;

    if-nez v2, :cond_7

    .line 187
    :cond_6
    :goto_6
    return v8

    .line 148
    :cond_7
    :try_start_7
    iget-object v2, p0, Lfreemarker/ext/jsp/FreemarkerTag;->template:Lfreemarker/template/Template;

    if-nez v2, :cond_1a

    .line 150
    new-instance v2, Lfreemarker/template/Template;

    iget-object v3, p0, Lfreemarker/ext/jsp/FreemarkerTag;->name:Ljava/lang/String;

    iget-object v4, p0, Lfreemarker/ext/jsp/FreemarkerTag;->bodyContent:Ljavax/servlet/jsp/tagext/BodyContent;

    invoke-virtual {v4}, Ljavax/servlet/jsp/tagext/BodyContent;->getReader()Ljava/io/Reader;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lfreemarker/template/Template;-><init>(Ljava/lang/String;Ljava/io/Reader;)V

    iput-object v2, p0, Lfreemarker/ext/jsp/FreemarkerTag;->template:Lfreemarker/template/Template;

    .line 153
    :cond_1a
    iget-object v2, p0, Lfreemarker/ext/jsp/FreemarkerTag;->root:Lfreemarker/template/SimpleHash;

    if-nez v2, :cond_70

    .line 155
    new-instance v2, Lfreemarker/template/SimpleHash;

    invoke-direct {v2}, Lfreemarker/template/SimpleHash;-><init>()V

    iput-object v2, p0, Lfreemarker/ext/jsp/FreemarkerTag;->root:Lfreemarker/template/SimpleHash;

    .line 156
    iget-object v2, p0, Lfreemarker/ext/jsp/FreemarkerTag;->root:Lfreemarker/template/SimpleHash;

    const-string v3, "page"

    new-instance v4, Lfreemarker/ext/jsp/JspContextModel;

    iget-object v5, p0, Lfreemarker/ext/jsp/FreemarkerTag;->pageContext:Ljavax/servlet/jsp/PageContext;

    const/4 v6, 0x1

    invoke-direct {v4, v5, v6}, Lfreemarker/ext/jsp/JspContextModel;-><init>(Ljavax/servlet/jsp/PageContext;I)V

    invoke-virtual {v2, v3, v4}, Lfreemarker/template/SimpleHash;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 157
    iget-object v2, p0, Lfreemarker/ext/jsp/FreemarkerTag;->root:Lfreemarker/template/SimpleHash;

    const-string v3, "request"

    new-instance v4, Lfreemarker/ext/jsp/JspContextModel;

    iget-object v5, p0, Lfreemarker/ext/jsp/FreemarkerTag;->pageContext:Ljavax/servlet/jsp/PageContext;

    const/4 v6, 0x2

    invoke-direct {v4, v5, v6}, Lfreemarker/ext/jsp/JspContextModel;-><init>(Ljavax/servlet/jsp/PageContext;I)V

    invoke-virtual {v2, v3, v4}, Lfreemarker/template/SimpleHash;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 158
    iget-object v2, p0, Lfreemarker/ext/jsp/FreemarkerTag;->root:Lfreemarker/template/SimpleHash;

    const-string v3, "session"

    new-instance v4, Lfreemarker/ext/jsp/JspContextModel;

    iget-object v5, p0, Lfreemarker/ext/jsp/FreemarkerTag;->pageContext:Ljavax/servlet/jsp/PageContext;

    const/4 v6, 0x3

    invoke-direct {v4, v5, v6}, Lfreemarker/ext/jsp/JspContextModel;-><init>(Ljavax/servlet/jsp/PageContext;I)V

    invoke-virtual {v2, v3, v4}, Lfreemarker/template/SimpleHash;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 159
    iget-object v2, p0, Lfreemarker/ext/jsp/FreemarkerTag;->root:Lfreemarker/template/SimpleHash;

    const-string v3, "application"

    new-instance v4, Lfreemarker/ext/jsp/JspContextModel;

    iget-object v5, p0, Lfreemarker/ext/jsp/FreemarkerTag;->pageContext:Ljavax/servlet/jsp/PageContext;

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Lfreemarker/ext/jsp/JspContextModel;-><init>(Ljavax/servlet/jsp/PageContext;I)V

    invoke-virtual {v2, v3, v4}, Lfreemarker/template/SimpleHash;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 160
    iget-object v2, p0, Lfreemarker/ext/jsp/FreemarkerTag;->root:Lfreemarker/template/SimpleHash;

    const-string v3, "any"

    new-instance v4, Lfreemarker/ext/jsp/JspContextModel;

    iget-object v5, p0, Lfreemarker/ext/jsp/FreemarkerTag;->pageContext:Ljavax/servlet/jsp/PageContext;

    const/4 v6, -0x1

    invoke-direct {v4, v5, v6}, Lfreemarker/ext/jsp/JspContextModel;-><init>(Ljavax/servlet/jsp/PageContext;I)V

    invoke-virtual {v2, v3, v4}, Lfreemarker/template/SimpleHash;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 162
    :cond_70
    iget-object v2, p0, Lfreemarker/ext/jsp/FreemarkerTag;->template:Lfreemarker/template/Template;

    iget-object v3, p0, Lfreemarker/ext/jsp/FreemarkerTag;->root:Lfreemarker/template/SimpleHash;

    iget-object v4, p0, Lfreemarker/ext/jsp/FreemarkerTag;->pageContext:Ljavax/servlet/jsp/PageContext;

    invoke-virtual {v4}, Ljavax/servlet/jsp/PageContext;->getOut()Ljavax/servlet/jsp/JspWriter;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lfreemarker/template/Template;->process(Ljava/lang/Object;Ljava/io/Writer;)V
    :try_end_7d
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7d} :catch_84
    .catchall {:try_start_7 .. :try_end_7d} :catchall_9d

    .line 181
    iget-boolean v2, p0, Lfreemarker/ext/jsp/FreemarkerTag;->caching:Z

    if-nez v2, :cond_6

    .line 183
    iput-object v7, p0, Lfreemarker/ext/jsp/FreemarkerTag;->template:Lfreemarker/template/Template;

    goto :goto_6

    .line 164
    :catch_84
    move-exception v0

    .line 168
    .local v0, "e":Ljava/lang/Exception;
    :try_start_85
    iget-object v2, p0, Lfreemarker/ext/jsp/FreemarkerTag;->pageContext:Ljavax/servlet/jsp/PageContext;

    invoke-virtual {v2, v0}, Ljavax/servlet/jsp/PageContext;->handlePageException(Ljava/lang/Exception;)V
    :try_end_8a
    .catch Ljavax/servlet/ServletException; {:try_start_85 .. :try_end_8a} :catch_92
    .catch Ljava/io/IOException; {:try_start_85 .. :try_end_8a} :catch_a5
    .catchall {:try_start_85 .. :try_end_8a} :catchall_9d

    .line 181
    iget-boolean v2, p0, Lfreemarker/ext/jsp/FreemarkerTag;->caching:Z

    if-nez v2, :cond_6

    .line 183
    iput-object v7, p0, Lfreemarker/ext/jsp/FreemarkerTag;->template:Lfreemarker/template/Template;

    goto/16 :goto_6

    .line 170
    :catch_92
    move-exception v1

    .line 172
    .local v1, "e2":Ljavax/servlet/ServletException;
    :try_start_93
    new-instance v2, Ljavax/servlet/jsp/JspException;

    invoke-virtual {v1}, Ljavax/servlet/ServletException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavax/servlet/jsp/JspException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_9d
    .catchall {:try_start_93 .. :try_end_9d} :catchall_9d

    .line 181
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "e2":Ljavax/servlet/ServletException;
    :catchall_9d
    move-exception v2

    iget-boolean v3, p0, Lfreemarker/ext/jsp/FreemarkerTag;->caching:Z

    if-nez v3, :cond_a4

    .line 183
    iput-object v7, p0, Lfreemarker/ext/jsp/FreemarkerTag;->template:Lfreemarker/template/Template;

    :cond_a4
    throw v2

    .line 174
    .restart local v0    # "e":Ljava/lang/Exception;
    :catch_a5
    move-exception v1

    .line 176
    .local v1, "e2":Ljava/io/IOException;
    :try_start_a6
    new-instance v2, Ljavax/servlet/jsp/JspException;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavax/servlet/jsp/JspException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_b0
    .catchall {:try_start_a6 .. :try_end_b0} :catchall_9d
.end method

.method public doInitBody()V
    .registers 1

    .prologue
    .line 126
    return-void
.end method

.method public doStartTag()I
    .registers 2

    .prologue
    .line 110
    const/4 v0, 0x2

    return v0
.end method

.method public getCaching()Z
    .registers 2

    .prologue
    .line 85
    iget-boolean v0, p0, Lfreemarker/ext/jsp/FreemarkerTag;->caching:Z

    return v0
.end method

.method public getParent()Ljavax/servlet/jsp/tagext/Tag;
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Lfreemarker/ext/jsp/FreemarkerTag;->parent:Ljavax/servlet/jsp/tagext/Tag;

    return-object v0
.end method

.method public release()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 135
    iput-object v0, p0, Lfreemarker/ext/jsp/FreemarkerTag;->root:Lfreemarker/template/SimpleHash;

    .line 136
    iput-object v0, p0, Lfreemarker/ext/jsp/FreemarkerTag;->template:Lfreemarker/template/Template;

    .line 137
    const-string v0, ""

    iput-object v0, p0, Lfreemarker/ext/jsp/FreemarkerTag;->name:Ljava/lang/String;

    .line 138
    return-void
.end method

.method public setBodyContent(Ljavax/servlet/jsp/tagext/BodyContent;)V
    .registers 2
    .param p1, "bodyContent"    # Ljavax/servlet/jsp/tagext/BodyContent;

    .prologue
    .line 115
    iput-object p1, p0, Lfreemarker/ext/jsp/FreemarkerTag;->bodyContent:Ljavax/servlet/jsp/tagext/BodyContent;

    .line 116
    return-void
.end method

.method public setCaching(Z)V
    .registers 2
    .param p1, "caching"    # Z

    .prologue
    .line 90
    iput-boolean p1, p0, Lfreemarker/ext/jsp/FreemarkerTag;->caching:Z

    .line 91
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 95
    if-nez p1, :cond_4

    const-string p1, ""

    .end local p1    # "name":Ljava/lang/String;
    :cond_4
    iput-object p1, p0, Lfreemarker/ext/jsp/FreemarkerTag;->name:Ljava/lang/String;

    .line 96
    return-void
.end method

.method public setPageContext(Ljavax/servlet/jsp/PageContext;)V
    .registers 3
    .param p1, "pageContext"    # Ljavax/servlet/jsp/PageContext;

    .prologue
    .line 120
    iput-object p1, p0, Lfreemarker/ext/jsp/FreemarkerTag;->pageContext:Ljavax/servlet/jsp/PageContext;

    .line 121
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/ext/jsp/FreemarkerTag;->root:Lfreemarker/template/SimpleHash;

    .line 122
    return-void
.end method

.method public setParent(Ljavax/servlet/jsp/tagext/Tag;)V
    .registers 2
    .param p1, "parent"    # Ljavax/servlet/jsp/tagext/Tag;

    .prologue
    .line 105
    iput-object p1, p0, Lfreemarker/ext/jsp/FreemarkerTag;->parent:Ljavax/servlet/jsp/tagext/Tag;

    .line 106
    return-void
.end method
