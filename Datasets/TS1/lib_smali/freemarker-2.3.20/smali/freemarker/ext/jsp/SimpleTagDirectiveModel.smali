.class Lfreemarker/ext/jsp/SimpleTagDirectiveModel;
.super Lfreemarker/ext/jsp/JspTagModelBase;
.source "SimpleTagDirectiveModel.java"

# interfaces
.implements Lfreemarker/template/TemplateDirectiveModel;


# static fields
.field static class$javax$servlet$jsp$tagext$JspTag:Ljava/lang/Class;

.field static class$javax$servlet$jsp$tagext$SimpleTag:Ljava/lang/Class;

.field static class$javax$servlet$jsp$tagext$Tag:Ljava/lang/Class;


# direct methods
.method protected constructor <init>(Ljava/lang/Class;)V
    .registers 5
    .param p1, "tagClass"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lfreemarker/ext/jsp/JspTagModelBase;-><init>(Ljava/lang/Class;)V

    .line 29
    sget-object v0, Lfreemarker/ext/jsp/SimpleTagDirectiveModel;->class$javax$servlet$jsp$tagext$SimpleTag:Ljava/lang/Class;

    if-nez v0, :cond_66

    const-string v0, "javax.servlet.jsp.tagext.SimpleTag"

    invoke-static {v0}, Lfreemarker/ext/jsp/SimpleTagDirectiveModel;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jsp/SimpleTagDirectiveModel;->class$javax$servlet$jsp$tagext$SimpleTag:Ljava/lang/Class;

    :goto_f
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_6f

    .line 30
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v2, " does not implement either the "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    sget-object v0, Lfreemarker/ext/jsp/SimpleTagDirectiveModel;->class$javax$servlet$jsp$tagext$Tag:Ljava/lang/Class;

    if-nez v0, :cond_69

    const-string v0, "javax.servlet.jsp.tagext.Tag"

    invoke-static {v0}, Lfreemarker/ext/jsp/SimpleTagDirectiveModel;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jsp/SimpleTagDirectiveModel;->class$javax$servlet$jsp$tagext$Tag:Ljava/lang/Class;

    :goto_36
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v2, " interface or the "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    sget-object v0, Lfreemarker/ext/jsp/SimpleTagDirectiveModel;->class$javax$servlet$jsp$tagext$SimpleTag:Ljava/lang/Class;

    if-nez v0, :cond_6c

    const-string v0, "javax.servlet.jsp.tagext.SimpleTag"

    invoke-static {v0}, Lfreemarker/ext/jsp/SimpleTagDirectiveModel;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jsp/SimpleTagDirectiveModel;->class$javax$servlet$jsp$tagext$SimpleTag:Ljava/lang/Class;

    :goto_50
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v2, " interface."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 29
    :cond_66
    sget-object v0, Lfreemarker/ext/jsp/SimpleTagDirectiveModel;->class$javax$servlet$jsp$tagext$SimpleTag:Ljava/lang/Class;

    goto :goto_f

    .line 30
    :cond_69
    sget-object v0, Lfreemarker/ext/jsp/SimpleTagDirectiveModel;->class$javax$servlet$jsp$tagext$Tag:Ljava/lang/Class;

    goto :goto_36

    :cond_6c
    sget-object v0, Lfreemarker/ext/jsp/SimpleTagDirectiveModel;->class$javax$servlet$jsp$tagext$SimpleTag:Ljava/lang/Class;

    goto :goto_50

    .line 35
    :cond_6f
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
.method public execute(Lfreemarker/core/Environment;Ljava/util/Map;[Lfreemarker/template/TemplateModel;Lfreemarker/template/TemplateDirectiveBody;)V
    .registers 11
    .param p1, "env"    # Lfreemarker/core/Environment;
    .param p2, "args"    # Ljava/util/Map;
    .param p3, "outArgs"    # [Lfreemarker/template/TemplateModel;
    .param p4, "body"    # Lfreemarker/template/TemplateDirectiveBody;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 41
    :try_start_0
    invoke-virtual {p0}, Lfreemarker/ext/jsp/SimpleTagDirectiveModel;->getTagInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljavax/servlet/jsp/tagext/SimpleTag;

    .line 42
    .local v3, "tag":Ljavax/servlet/jsp/tagext/SimpleTag;
    invoke-static {}, Lfreemarker/ext/jsp/PageContextFactory;->getCurrentPageContext()Lfreemarker/ext/jsp/FreeMarkerPageContext;

    move-result-object v1

    .line 43
    .local v1, "pageContext":Lfreemarker/ext/jsp/FreeMarkerPageContext;
    new-instance v4, Lfreemarker/ext/jsp/JspWriterAdapter;

    invoke-virtual {p1}, Lfreemarker/core/Environment;->getOut()Ljava/io/Writer;

    move-result-object v5

    invoke-direct {v4, v5}, Lfreemarker/ext/jsp/JspWriterAdapter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {v1, v4}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->pushWriter(Ljavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;
    :try_end_16
    .catch Lfreemarker/template/TemplateException; {:try_start_0 .. :try_end_16} :catch_5b
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_16} :catch_61
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_16} :catch_63

    .line 45
    :try_start_16
    invoke-interface {v3, v1}, Ljavax/servlet/jsp/tagext/SimpleTag;->setJspContext(Ljavax/servlet/jsp/JspContext;)V

    .line 46
    sget-object v4, Lfreemarker/ext/jsp/SimpleTagDirectiveModel;->class$javax$servlet$jsp$tagext$JspTag:Ljava/lang/Class;

    if-nez v4, :cond_4e

    const-string v4, "javax.servlet.jsp.tagext.JspTag"

    invoke-static {v4}, Lfreemarker/ext/jsp/SimpleTagDirectiveModel;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lfreemarker/ext/jsp/SimpleTagDirectiveModel;->class$javax$servlet$jsp$tagext$JspTag:Ljava/lang/Class;

    :goto_25
    invoke-virtual {v1, v4}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->peekTopTag(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavax/servlet/jsp/tagext/JspTag;

    .line 47
    .local v2, "parentTag":Ljavax/servlet/jsp/tagext/JspTag;
    if-eqz v2, :cond_30

    .line 48
    invoke-interface {v3, v2}, Ljavax/servlet/jsp/tagext/SimpleTag;->setParent(Ljavax/servlet/jsp/tagext/JspTag;)V

    .line 50
    :cond_30
    invoke-virtual {v1}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getObjectWrapper()Lfreemarker/template/ObjectWrapper;

    move-result-object v4

    invoke-virtual {p0, v3, p2, v4}, Lfreemarker/ext/jsp/SimpleTagDirectiveModel;->setupTag(Ljava/lang/Object;Ljava/util/Map;Lfreemarker/template/ObjectWrapper;)V

    .line 51
    if-eqz p4, :cond_5d

    .line 52
    new-instance v4, Lfreemarker/ext/jsp/SimpleTagDirectiveModel$1;

    invoke-direct {v4, p0, v1, p4}, Lfreemarker/ext/jsp/SimpleTagDirectiveModel$1;-><init>(Lfreemarker/ext/jsp/SimpleTagDirectiveModel;Lfreemarker/ext/jsp/FreeMarkerPageContext;Lfreemarker/template/TemplateDirectiveBody;)V

    invoke-interface {v3, v4}, Ljavax/servlet/jsp/tagext/SimpleTag;->setJspBody(Ljavax/servlet/jsp/tagext/JspFragment;)V

    .line 66
    invoke-virtual {v1, v3}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->pushTopTag(Ljava/lang/Object;)V
    :try_end_44
    .catchall {:try_start_16 .. :try_end_44} :catchall_56

    .line 68
    :try_start_44
    invoke-interface {v3}, Ljavax/servlet/jsp/tagext/SimpleTag;->doTag()V
    :try_end_47
    .catchall {:try_start_44 .. :try_end_47} :catchall_51

    .line 71
    :try_start_47
    invoke-virtual {v1}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->popTopTag()V
    :try_end_4a
    .catchall {:try_start_47 .. :try_end_4a} :catchall_56

    .line 79
    :goto_4a
    :try_start_4a
    invoke-virtual {v1}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->popWriter()V
    :try_end_4d
    .catch Lfreemarker/template/TemplateException; {:try_start_4a .. :try_end_4d} :catch_5b
    .catch Ljava/lang/RuntimeException; {:try_start_4a .. :try_end_4d} :catch_61
    .catch Ljava/lang/Exception; {:try_start_4a .. :try_end_4d} :catch_63

    .line 91
    return-void

    .line 46
    .end local v2    # "parentTag":Ljavax/servlet/jsp/tagext/JspTag;
    :cond_4e
    :try_start_4e
    sget-object v4, Lfreemarker/ext/jsp/SimpleTagDirectiveModel;->class$javax$servlet$jsp$tagext$JspTag:Ljava/lang/Class;

    goto :goto_25

    .line 71
    .restart local v2    # "parentTag":Ljavax/servlet/jsp/tagext/JspTag;
    :catchall_51
    move-exception v4

    invoke-virtual {v1}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->popTopTag()V

    throw v4
    :try_end_56
    .catchall {:try_start_4e .. :try_end_56} :catchall_56

    .line 79
    .end local v2    # "parentTag":Ljavax/servlet/jsp/tagext/JspTag;
    :catchall_56
    move-exception v4

    :try_start_57
    invoke-virtual {v1}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->popWriter()V

    throw v4
    :try_end_5b
    .catch Lfreemarker/template/TemplateException; {:try_start_57 .. :try_end_5b} :catch_5b
    .catch Ljava/lang/RuntimeException; {:try_start_57 .. :try_end_5b} :catch_61
    .catch Ljava/lang/Exception; {:try_start_57 .. :try_end_5b} :catch_63

    .line 82
    .end local v1    # "pageContext":Lfreemarker/ext/jsp/FreeMarkerPageContext;
    .end local v3    # "tag":Ljavax/servlet/jsp/tagext/SimpleTag;
    :catch_5b
    move-exception v0

    .line 83
    .local v0, "e":Lfreemarker/template/TemplateException;
    throw v0

    .line 75
    .end local v0    # "e":Lfreemarker/template/TemplateException;
    .restart local v1    # "pageContext":Lfreemarker/ext/jsp/FreeMarkerPageContext;
    .restart local v2    # "parentTag":Ljavax/servlet/jsp/tagext/JspTag;
    .restart local v3    # "tag":Ljavax/servlet/jsp/tagext/SimpleTag;
    :cond_5d
    :try_start_5d
    invoke-interface {v3}, Ljavax/servlet/jsp/tagext/SimpleTag;->doTag()V
    :try_end_60
    .catchall {:try_start_5d .. :try_end_60} :catchall_56

    goto :goto_4a

    .line 85
    .end local v1    # "pageContext":Lfreemarker/ext/jsp/FreeMarkerPageContext;
    .end local v2    # "parentTag":Ljavax/servlet/jsp/tagext/JspTag;
    .end local v3    # "tag":Ljavax/servlet/jsp/tagext/SimpleTag;
    :catch_61
    move-exception v0

    .line 86
    .local v0, "e":Ljava/lang/RuntimeException;
    throw v0

    .line 88
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catch_63
    move-exception v0

    .line 89
    .local v0, "e":Ljava/lang/Exception;
    new-instance v4, Lfreemarker/template/TemplateModelException;

    invoke-direct {v4, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v4
.end method
