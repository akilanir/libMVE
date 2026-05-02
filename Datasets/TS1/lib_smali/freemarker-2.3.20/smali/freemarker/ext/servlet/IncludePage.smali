.class public Lfreemarker/ext/servlet/IncludePage;
.super Ljava/lang/Object;
.source "IncludePage.java"

# interfaces
.implements Lfreemarker/template/TemplateDirectiveModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/ext/servlet/IncludePage$CustomParamsRequest;
    }
.end annotation


# instance fields
.field private final request:Ljavax/servlet/http/HttpServletRequest;

.field private final response:Ljavax/servlet/http/HttpServletResponse;


# direct methods
.method public constructor <init>(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .registers 3
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "response"    # Ljavax/servlet/http/HttpServletResponse;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lfreemarker/ext/servlet/IncludePage;->request:Ljavax/servlet/http/HttpServletRequest;

    .line 52
    iput-object p2, p0, Lfreemarker/ext/servlet/IncludePage;->response:Ljavax/servlet/http/HttpServletResponse;

    .line 53
    return-void
.end method


# virtual methods
.method public execute(Lfreemarker/core/Environment;Ljava/util/Map;[Lfreemarker/template/TemplateModel;Lfreemarker/template/TemplateDirectiveBody;)V
    .registers 22
    .param p1, "env"    # Lfreemarker/core/Environment;
    .param p2, "params"    # Ljava/util/Map;
    .param p3, "loopVars"    # [Lfreemarker/template/TemplateModel;
    .param p4, "body"    # Lfreemarker/template/TemplateDirectiveBody;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    const-string v13, "path"

    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lfreemarker/template/TemplateModel;

    .line 61
    .local v7, "path":Lfreemarker/template/TemplateModel;
    if-nez v7, :cond_16

    .line 62
    new-instance v13, Lfreemarker/core/_MiscTemplateException;

    const-string v14, "Missing required parameter \"path\""

    move-object/from16 v0, p1

    invoke-direct {v13, v0, v14}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;Ljava/lang/String;)V

    throw v13

    .line 64
    :cond_16
    instance-of v13, v7, Lfreemarker/template/TemplateScalarModel;

    if-nez v13, :cond_34

    .line 65
    new-instance v13, Lfreemarker/core/_MiscTemplateException;

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    const-string v16, "Expected a scalar model. \"path\" is instead "

    aput-object v16, v14, v15

    const/4 v15, 0x1

    new-instance v16, Lfreemarker/core/_DelayedFTLTypeDescription;

    move-object/from16 v0, v16

    invoke-direct {v0, v7}, Lfreemarker/core/_DelayedFTLTypeDescription;-><init>(Lfreemarker/template/TemplateModel;)V

    aput-object v16, v14, v15

    move-object/from16 v0, p1

    invoke-direct {v13, v0, v14}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v13

    .line 69
    :cond_34
    check-cast v7, Lfreemarker/template/TemplateScalarModel;

    .end local v7    # "path":Lfreemarker/template/TemplateModel;
    invoke-interface {v7}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v9

    .line 70
    .local v9, "strPath":Ljava/lang/String;
    if-nez v9, :cond_46

    .line 71
    new-instance v13, Lfreemarker/core/_MiscTemplateException;

    const-string v14, "String value of \"path\" parameter is null"

    move-object/from16 v0, p1

    invoke-direct {v13, v0, v14}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;Ljava/lang/String;)V

    throw v13

    .line 78
    :cond_46
    invoke-virtual/range {p1 .. p1}, Lfreemarker/core/Environment;->getOut()Ljava/io/Writer;

    move-result-object v2

    .line 80
    .local v2, "envOut":Ljava/io/Writer;
    move-object/from16 v0, p0

    iget-object v13, v0, Lfreemarker/ext/servlet/IncludePage;->response:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v13}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v13

    if-ne v2, v13, :cond_83

    .line 83
    move-object/from16 v0, p0

    iget-object v12, v0, Lfreemarker/ext/servlet/IncludePage;->response:Ljavax/servlet/http/HttpServletResponse;

    .line 101
    .end local v2    # "envOut":Ljava/io/Writer;
    .local v12, "wrappedResponse":Ljavax/servlet/http/HttpServletResponse;
    :goto_58
    const-string v13, "inherit_params"

    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lfreemarker/template/TemplateModel;

    .line 102
    .local v4, "inheritParamsModel":Lfreemarker/template/TemplateModel;
    if-nez v4, :cond_9c

    .line 104
    const/4 v3, 0x1

    .line 116
    .end local v4    # "inheritParamsModel":Lfreemarker/template/TemplateModel;
    .local v3, "inheritParams":Z
    :goto_65
    const-string v13, "params"

    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lfreemarker/template/TemplateModel;

    .line 120
    .local v6, "paramsModel":Lfreemarker/template/TemplateModel;
    if-nez v6, :cond_c7

    if-eqz v3, :cond_c7

    .line 123
    move-object/from16 v0, p0

    iget-object v11, v0, Lfreemarker/ext/servlet/IncludePage;->request:Ljavax/servlet/http/HttpServletRequest;

    .line 147
    .local v11, "wrappedRequest":Ljavax/servlet/http/HttpServletRequest;
    :goto_77
    :try_start_77
    move-object/from16 v0, p0

    iget-object v13, v0, Lfreemarker/ext/servlet/IncludePage;->request:Ljavax/servlet/http/HttpServletRequest;

    invoke-interface {v13, v9}, Ljavax/servlet/http/HttpServletRequest;->getRequestDispatcher(Ljava/lang/String;)Ljavax/servlet/RequestDispatcher;

    move-result-object v13

    invoke-interface {v13, v11, v12}, Ljavax/servlet/RequestDispatcher;->include(Ljavax/servlet/ServletRequest;Ljavax/servlet/ServletResponse;)V
    :try_end_82
    .catch Ljavax/servlet/ServletException; {:try_start_77 .. :try_end_82} :catch_103

    .line 153
    return-void

    .line 86
    .end local v3    # "inheritParams":Z
    .end local v6    # "paramsModel":Lfreemarker/template/TemplateModel;
    .end local v11    # "wrappedRequest":Ljavax/servlet/http/HttpServletRequest;
    .end local v12    # "wrappedResponse":Ljavax/servlet/http/HttpServletResponse;
    .restart local v2    # "envOut":Ljava/io/Writer;
    :cond_83
    instance-of v13, v2, Ljava/io/PrintWriter;

    if-eqz v13, :cond_96

    check-cast v2, Ljava/io/PrintWriter;

    .end local v2    # "envOut":Ljava/io/Writer;
    move-object v8, v2

    .line 92
    .local v8, "printWriter":Ljava/io/PrintWriter;
    :goto_8a
    new-instance v12, Lfreemarker/ext/servlet/IncludePage$1;

    move-object/from16 v0, p0

    iget-object v13, v0, Lfreemarker/ext/servlet/IncludePage;->response:Ljavax/servlet/http/HttpServletResponse;

    move-object/from16 v0, p0

    invoke-direct {v12, v0, v13, v8}, Lfreemarker/ext/servlet/IncludePage$1;-><init>(Lfreemarker/ext/servlet/IncludePage;Ljavax/servlet/http/HttpServletResponse;Ljava/io/PrintWriter;)V

    .restart local v12    # "wrappedResponse":Ljavax/servlet/http/HttpServletResponse;
    goto :goto_58

    .line 86
    .end local v8    # "printWriter":Ljava/io/PrintWriter;
    .end local v12    # "wrappedResponse":Ljavax/servlet/http/HttpServletResponse;
    .restart local v2    # "envOut":Ljava/io/Writer;
    :cond_96
    new-instance v8, Ljava/io/PrintWriter;

    invoke-direct {v8, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    goto :goto_8a

    .line 107
    .end local v2    # "envOut":Ljava/io/Writer;
    .restart local v4    # "inheritParamsModel":Lfreemarker/template/TemplateModel;
    .restart local v12    # "wrappedResponse":Ljavax/servlet/http/HttpServletResponse;
    :cond_9c
    instance-of v13, v4, Lfreemarker/template/TemplateBooleanModel;

    if-nez v13, :cond_c0

    .line 108
    new-instance v13, Lfreemarker/core/_MiscTemplateException;

    const/4 v14, 0x3

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    const-string v16, "\"inherit_params\" should be a boolean but it\'s a(n) "

    aput-object v16, v14, v15

    const/4 v15, 0x1

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x2

    const-string v16, " instead"

    aput-object v16, v14, v15

    move-object/from16 v0, p1

    invoke-direct {v13, v0, v14}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v13

    .line 112
    :cond_c0
    check-cast v4, Lfreemarker/template/TemplateBooleanModel;

    .end local v4    # "inheritParamsModel":Lfreemarker/template/TemplateModel;
    invoke-interface {v4}, Lfreemarker/template/TemplateBooleanModel;->getAsBoolean()Z

    move-result v3

    .restart local v3    # "inheritParams":Z
    goto :goto_65

    .line 128
    .restart local v6    # "paramsModel":Lfreemarker/template/TemplateModel;
    :cond_c7
    if-eqz v6, :cond_100

    .line 130
    invoke-static {v6}, Lfreemarker/template/utility/DeepUnwrap;->unwrap(Lfreemarker/template/TemplateModel;)Ljava/lang/Object;

    move-result-object v10

    .line 131
    .local v10, "unwrapped":Ljava/lang/Object;
    instance-of v13, v10, Ljava/util/Map;

    if-nez v13, :cond_f1

    .line 132
    new-instance v13, Lfreemarker/core/_MiscTemplateException;

    const/4 v14, 0x3

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    const-string v16, "Expected \"params\" to unwrap into a java.util.Map. It unwrapped into "

    aput-object v16, v14, v15

    const/4 v15, 0x1

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x2

    const-string v16, " instead."

    aput-object v16, v14, v15

    move-object/from16 v0, p1

    invoke-direct {v13, v0, v14}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v13

    :cond_f1
    move-object v5, v10

    .line 136
    check-cast v5, Ljava/util/Map;

    .line 141
    .end local v10    # "unwrapped":Ljava/lang/Object;
    .local v5, "paramsMap":Ljava/util/Map;
    :goto_f4
    new-instance v11, Lfreemarker/ext/servlet/IncludePage$CustomParamsRequest;

    move-object/from16 v0, p0

    iget-object v13, v0, Lfreemarker/ext/servlet/IncludePage;->request:Ljavax/servlet/http/HttpServletRequest;

    const/4 v14, 0x0

    invoke-direct {v11, v13, v5, v3, v14}, Lfreemarker/ext/servlet/IncludePage$CustomParamsRequest;-><init>(Ljavax/servlet/http/HttpServletRequest;Ljava/util/Map;ZLfreemarker/ext/servlet/IncludePage$1;)V

    .restart local v11    # "wrappedRequest":Ljavax/servlet/http/HttpServletRequest;
    goto/16 :goto_77

    .line 139
    .end local v5    # "paramsMap":Ljava/util/Map;
    .end local v11    # "wrappedRequest":Ljavax/servlet/http/HttpServletRequest;
    :cond_100
    sget-object v5, Lfreemarker/template/utility/Collections12;->EMPTY_MAP:Ljava/util/Map;

    .restart local v5    # "paramsMap":Ljava/util/Map;
    goto :goto_f4

    .line 150
    .end local v5    # "paramsMap":Ljava/util/Map;
    .restart local v11    # "wrappedRequest":Ljavax/servlet/http/HttpServletRequest;
    :catch_103
    move-exception v1

    .line 151
    .local v1, "e":Ljavax/servlet/ServletException;
    new-instance v13, Lfreemarker/core/_MiscTemplateException;

    move-object/from16 v0, p1

    invoke-direct {v13, v1, v0}, Lfreemarker/core/_MiscTemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;)V

    throw v13
.end method
