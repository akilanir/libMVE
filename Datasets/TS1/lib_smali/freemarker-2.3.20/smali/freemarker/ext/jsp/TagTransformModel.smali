.class Lfreemarker/ext/jsp/TagTransformModel;
.super Lfreemarker/ext/jsp/JspTagModelBase;
.source "TagTransformModel.java"

# interfaces
.implements Lfreemarker/template/TemplateTransformModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/ext/jsp/TagTransformModel$TagWriter;,
        Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;
    }
.end annotation


# static fields
.field static class$javax$servlet$jsp$tagext$BodyTag:Ljava/lang/Class;

.field static class$javax$servlet$jsp$tagext$IterationTag:Ljava/lang/Class;

.field static class$javax$servlet$jsp$tagext$Tag:Ljava/lang/Class;

.field static class$javax$servlet$jsp$tagext$TryCatchFinally:Ljava/lang/Class;

.field private static final logger:Lfreemarker/log/Logger;


# instance fields
.field private final isBodyTag:Z

.field private final isIterationTag:Z

.field private final isTryCatchFinally:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 81
    const-string v0, "freemarker.jsp"

    invoke-static {v0}, Lfreemarker/log/Logger;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jsp/TagTransformModel;->logger:Lfreemarker/log/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;)V
    .registers 3
    .param p1, "tagClass"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lfreemarker/ext/jsp/JspTagModelBase;-><init>(Ljava/lang/Class;)V

    .line 89
    sget-object v0, Lfreemarker/ext/jsp/TagTransformModel;->class$javax$servlet$jsp$tagext$IterationTag:Ljava/lang/Class;

    if-nez v0, :cond_41

    const-string v0, "javax.servlet.jsp.tagext.IterationTag"

    invoke-static {v0}, Lfreemarker/ext/jsp/TagTransformModel;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jsp/TagTransformModel;->class$javax$servlet$jsp$tagext$IterationTag:Ljava/lang/Class;

    :goto_f
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    iput-boolean v0, p0, Lfreemarker/ext/jsp/TagTransformModel;->isIterationTag:Z

    .line 90
    iget-boolean v0, p0, Lfreemarker/ext/jsp/TagTransformModel;->isIterationTag:Z

    if-eqz v0, :cond_47

    sget-object v0, Lfreemarker/ext/jsp/TagTransformModel;->class$javax$servlet$jsp$tagext$BodyTag:Ljava/lang/Class;

    if-nez v0, :cond_44

    const-string v0, "javax.servlet.jsp.tagext.BodyTag"

    invoke-static {v0}, Lfreemarker/ext/jsp/TagTransformModel;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jsp/TagTransformModel;->class$javax$servlet$jsp$tagext$BodyTag:Ljava/lang/Class;

    :goto_25
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_47

    const/4 v0, 0x1

    :goto_2c
    iput-boolean v0, p0, Lfreemarker/ext/jsp/TagTransformModel;->isBodyTag:Z

    .line 91
    sget-object v0, Lfreemarker/ext/jsp/TagTransformModel;->class$javax$servlet$jsp$tagext$TryCatchFinally:Ljava/lang/Class;

    if-nez v0, :cond_49

    const-string v0, "javax.servlet.jsp.tagext.TryCatchFinally"

    invoke-static {v0}, Lfreemarker/ext/jsp/TagTransformModel;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jsp/TagTransformModel;->class$javax$servlet$jsp$tagext$TryCatchFinally:Ljava/lang/Class;

    :goto_3a
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    iput-boolean v0, p0, Lfreemarker/ext/jsp/TagTransformModel;->isTryCatchFinally:Z

    .line 92
    return-void

    .line 89
    :cond_41
    sget-object v0, Lfreemarker/ext/jsp/TagTransformModel;->class$javax$servlet$jsp$tagext$IterationTag:Ljava/lang/Class;

    goto :goto_f

    .line 90
    :cond_44
    sget-object v0, Lfreemarker/ext/jsp/TagTransformModel;->class$javax$servlet$jsp$tagext$BodyTag:Ljava/lang/Class;

    goto :goto_25

    :cond_47
    const/4 v0, 0x0

    goto :goto_2c

    .line 91
    :cond_49
    sget-object v0, Lfreemarker/ext/jsp/TagTransformModel;->class$javax$servlet$jsp$tagext$TryCatchFinally:Ljava/lang/Class;

    goto :goto_3a
.end method

.method static access$000(Lfreemarker/ext/jsp/TagTransformModel;)Z
    .registers 2
    .param p0, "x0"    # Lfreemarker/ext/jsp/TagTransformModel;

    .prologue
    .line 79
    iget-boolean v0, p0, Lfreemarker/ext/jsp/TagTransformModel;->isBodyTag:Z

    return v0
.end method

.method static access$100(Lfreemarker/ext/jsp/TagTransformModel;)Z
    .registers 2
    .param p0, "x0"    # Lfreemarker/ext/jsp/TagTransformModel;

    .prologue
    .line 79
    iget-boolean v0, p0, Lfreemarker/ext/jsp/TagTransformModel;->isIterationTag:Z

    return v0
.end method

.method static access$200()Lfreemarker/log/Logger;
    .registers 1

    .prologue
    .line 79
    sget-object v0, Lfreemarker/ext/jsp/TagTransformModel;->logger:Lfreemarker/log/Logger;

    return-object v0
.end method

.method static access$300(Lfreemarker/ext/jsp/TagTransformModel;)Z
    .registers 2
    .param p0, "x0"    # Lfreemarker/ext/jsp/TagTransformModel;

    .prologue
    .line 79
    iget-boolean v0, p0, Lfreemarker/ext/jsp/TagTransformModel;->isTryCatchFinally:Z

    return v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 89
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
.method public getWriter(Ljava/io/Writer;Ljava/util/Map;)Ljava/io/Writer;
    .registers 14
    .param p1, "out"    # Ljava/io/Writer;
    .param p2, "args"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 97
    :try_start_0
    invoke-virtual {p0}, Lfreemarker/ext/jsp/TagTransformModel;->getTagInstance()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljavax/servlet/jsp/tagext/Tag;

    .line 98
    .local v4, "tag":Ljavax/servlet/jsp/tagext/Tag;
    invoke-static {}, Lfreemarker/ext/jsp/PageContextFactory;->getCurrentPageContext()Lfreemarker/ext/jsp/FreeMarkerPageContext;

    move-result-object v5

    .line 99
    .local v5, "pageContext":Lfreemarker/ext/jsp/FreeMarkerPageContext;
    sget-object v2, Lfreemarker/ext/jsp/TagTransformModel;->class$javax$servlet$jsp$tagext$Tag:Ljava/lang/Class;

    if-nez v2, :cond_5c

    const-string v2, "javax.servlet.jsp.tagext.Tag"

    invoke-static {v2}, Lfreemarker/ext/jsp/TagTransformModel;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/jsp/TagTransformModel;->class$javax$servlet$jsp$tagext$Tag:Ljava/lang/Class;

    :goto_16
    invoke-virtual {v5, v2}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->peekTopTag(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljavax/servlet/jsp/tagext/Tag;

    .line 100
    .local v9, "parentTag":Ljavax/servlet/jsp/tagext/Tag;
    invoke-interface {v4, v9}, Ljavax/servlet/jsp/tagext/Tag;->setParent(Ljavax/servlet/jsp/tagext/Tag;)V

    .line 101
    invoke-interface {v4, v5}, Ljavax/servlet/jsp/tagext/Tag;->setPageContext(Ljavax/servlet/jsp/PageContext;)V

    .line 102
    invoke-virtual {v5}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getObjectWrapper()Lfreemarker/template/ObjectWrapper;

    move-result-object v2

    invoke-virtual {p0, v4, p2, v2}, Lfreemarker/ext/jsp/TagTransformModel;->setupTag(Ljava/lang/Object;Ljava/util/Map;Lfreemarker/template/ObjectWrapper;)V

    .line 106
    instance-of v2, p1, Ljavax/servlet/jsp/JspWriter;

    if-eqz v2, :cond_6e

    .line 109
    invoke-virtual {v5}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getOut()Ljavax/servlet/jsp/JspWriter;

    move-result-object v2

    if-eq p1, v2, :cond_5f

    .line 110
    new-instance v2, Lfreemarker/template/TemplateModelException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "out != pageContext.getOut(). Out is "

    invoke-virtual {v3, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v10, " pageContext.getOut() is "

    invoke-virtual {v3, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v5}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getOut()Ljavax/servlet/jsp/JspWriter;

    move-result-object v10

    invoke-virtual {v3, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_5a
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_5a} :catch_5a
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_5a} :catch_7d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5a} :catch_7f

    .line 127
    .end local v4    # "tag":Ljavax/servlet/jsp/tagext/Tag;
    .end local v5    # "pageContext":Lfreemarker/ext/jsp/FreeMarkerPageContext;
    .end local v9    # "parentTag":Ljavax/servlet/jsp/tagext/Tag;
    :catch_5a
    move-exception v7

    .line 128
    .local v7, "e":Lfreemarker/template/TemplateModelException;
    :goto_5b
    throw v7

    .line 99
    .end local v7    # "e":Lfreemarker/template/TemplateModelException;
    .restart local v4    # "tag":Ljavax/servlet/jsp/tagext/Tag;
    .restart local v5    # "pageContext":Lfreemarker/ext/jsp/FreeMarkerPageContext;
    :cond_5c
    :try_start_5c
    sget-object v2, Lfreemarker/ext/jsp/TagTransformModel;->class$javax$servlet$jsp$tagext$Tag:Ljava/lang/Class;

    goto :goto_16

    .line 115
    .restart local v9    # "parentTag":Ljavax/servlet/jsp/tagext/Tag;
    :cond_5f
    const/4 v6, 0x0

    .line 122
    .local v6, "usesAdapter":Z
    :goto_60
    new-instance v1, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;

    move-object v2, p0

    move-object v3, p1

    invoke-direct/range {v1 .. v6}, Lfreemarker/ext/jsp/TagTransformModel$TagWriter;-><init>(Lfreemarker/ext/jsp/TagTransformModel;Ljava/io/Writer;Ljavax/servlet/jsp/tagext/Tag;Lfreemarker/ext/jsp/FreeMarkerPageContext;Z)V

    .line 123
    .local v1, "w":Ljavax/servlet/jsp/JspWriter;
    invoke-virtual {v5, v4}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->pushTopTag(Ljava/lang/Object;)V

    .line 124
    invoke-virtual {v5, v1}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->pushWriter(Ljavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;

    .line 125
    return-object v1

    .line 118
    .end local v1    # "w":Ljavax/servlet/jsp/JspWriter;
    .end local v6    # "usesAdapter":Z
    :cond_6e
    new-instance v8, Lfreemarker/ext/jsp/JspWriterAdapter;

    invoke-direct {v8, p1}, Lfreemarker/ext/jsp/JspWriterAdapter;-><init>(Ljava/io/Writer;)V
    :try_end_73
    .catch Lfreemarker/template/TemplateModelException; {:try_start_5c .. :try_end_73} :catch_5a
    .catch Ljava/lang/RuntimeException; {:try_start_5c .. :try_end_73} :catch_7d
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_73} :catch_7f

    .line 119
    .end local p1    # "out":Ljava/io/Writer;
    .local v8, "out":Ljava/io/Writer;
    :try_start_73
    move-object v0, v8

    check-cast v0, Ljavax/servlet/jsp/JspWriter;

    move-object v2, v0

    invoke-virtual {v5, v2}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->pushWriter(Ljavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;
    :try_end_7a
    .catch Lfreemarker/template/TemplateModelException; {:try_start_73 .. :try_end_7a} :catch_8c
    .catch Ljava/lang/RuntimeException; {:try_start_73 .. :try_end_7a} :catch_89
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_7a} :catch_86

    .line 120
    const/4 v6, 0x1

    .restart local v6    # "usesAdapter":Z
    move-object p1, v8

    .end local v8    # "out":Ljava/io/Writer;
    .restart local p1    # "out":Ljava/io/Writer;
    goto :goto_60

    .line 130
    .end local v4    # "tag":Ljavax/servlet/jsp/tagext/Tag;
    .end local v5    # "pageContext":Lfreemarker/ext/jsp/FreeMarkerPageContext;
    .end local v6    # "usesAdapter":Z
    .end local v9    # "parentTag":Ljavax/servlet/jsp/tagext/Tag;
    :catch_7d
    move-exception v7

    .line 131
    .local v7, "e":Ljava/lang/RuntimeException;
    :goto_7e
    throw v7

    .line 133
    .end local v7    # "e":Ljava/lang/RuntimeException;
    :catch_7f
    move-exception v7

    .line 134
    .local v7, "e":Ljava/lang/Exception;
    :goto_80
    new-instance v2, Lfreemarker/template/TemplateModelException;

    invoke-direct {v2, v7}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v2

    .line 133
    .end local v7    # "e":Ljava/lang/Exception;
    .end local p1    # "out":Ljava/io/Writer;
    .restart local v4    # "tag":Ljavax/servlet/jsp/tagext/Tag;
    .restart local v5    # "pageContext":Lfreemarker/ext/jsp/FreeMarkerPageContext;
    .restart local v8    # "out":Ljava/io/Writer;
    .restart local v9    # "parentTag":Ljavax/servlet/jsp/tagext/Tag;
    :catch_86
    move-exception v7

    move-object p1, v8

    .end local v8    # "out":Ljava/io/Writer;
    .restart local p1    # "out":Ljava/io/Writer;
    goto :goto_80

    .line 130
    .end local p1    # "out":Ljava/io/Writer;
    .restart local v8    # "out":Ljava/io/Writer;
    :catch_89
    move-exception v7

    move-object p1, v8

    .end local v8    # "out":Ljava/io/Writer;
    .restart local p1    # "out":Ljava/io/Writer;
    goto :goto_7e

    .line 127
    .end local p1    # "out":Ljava/io/Writer;
    .restart local v8    # "out":Ljava/io/Writer;
    :catch_8c
    move-exception v7

    move-object p1, v8

    .end local v8    # "out":Ljava/io/Writer;
    .restart local p1    # "out":Ljava/io/Writer;
    goto :goto_5b
.end method
