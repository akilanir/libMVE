.class final Lfreemarker/template/TemplateExceptionHandler$4;
.super Ljava/lang/Object;
.source "TemplateExceptionHandler.java"

# interfaces
.implements Lfreemarker/template/TemplateExceptionHandler;


# static fields
.field private static final FONT_RESET_CSS:Ljava/lang/String; = "color:#A80000; font-size:12px; font-style:normal; font-variant:normal; font-weight:normal; text-decoration:none; text-transform: none"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleTemplateException(Lfreemarker/template/TemplateException;Lfreemarker/core/Environment;Ljava/io/Writer;)V
    .registers 11
    .param p1, "te"    # Lfreemarker/template/TemplateException;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .param p3, "out"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 132
    invoke-virtual {p2}, Lfreemarker/core/Environment;->isInAttemptBlock()Z

    move-result v4

    if-nez v4, :cond_54

    .line 133
    instance-of v0, p3, Ljava/io/PrintWriter;

    .line 134
    .local v0, "externalPw":Z
    if-eqz v0, :cond_55

    check-cast p3, Ljava/io/PrintWriter;

    .end local p3    # "out":Ljava/io/Writer;
    move-object v1, p3

    .line 136
    .local v1, "pw":Ljava/io/PrintWriter;
    :goto_d
    :try_start_d
    const-string v4, "<!-- FREEMARKER ERROR MESSAGE STARTS HERE --><!-- ]]> --><script language=javascript>//\"></script><script language=javascript>//\'></script><script language=javascript>//\"></script><script language=javascript>//\'></script></title></xmp></script></noscript></style></object></head></pre></table></form></table></table></table></a></u></i></b><div align=\'left\' style=\'background-color:#FFFF7C; display:block; border-top:double; padding:4px; margin:0; font-family:Arial,sans-serif; "

    invoke-virtual {v1, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 149
    const-string v4, "color:#A80000; font-size:12px; font-style:normal; font-variant:normal; font-weight:normal; text-decoration:none; text-transform: none"

    invoke-virtual {v1, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 150
    const-string v4, "\'><b style=\'font-size:12px; font-style:normal; font-weight:bold; text-decoration:none; text-transform: none;\'>FreeMarker template error</b><pre style=\'display:block; background: none; border: 0; margin:0; padding: 0;font-family:monospace; "

    invoke-virtual {v1, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 155
    const-string v4, "color:#A80000; font-size:12px; font-style:normal; font-variant:normal; font-weight:normal; text-decoration:none; text-transform: none"

    invoke-virtual {v1, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 156
    const-string v4, "; white-space: pre-wrap; white-space: -moz-pre-wrap; white-space: -pre-wrap; white-space: -o-pre-wrap; word-wrap: break-word;\'>"

    invoke-virtual {v1, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 159
    new-instance v3, Ljava/io/StringWriter;

    invoke-direct {v3}, Ljava/io/StringWriter;-><init>()V

    .line 160
    .local v3, "stackTraceSW":Ljava/io/StringWriter;
    new-instance v2, Ljava/io/PrintWriter;

    invoke-direct {v2, v3}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 161
    .local v2, "stackPW":Ljava/io/PrintWriter;
    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x1

    invoke-virtual {p1, v2, v4, v5, v6}, Lfreemarker/template/TemplateException;->printStackTrace(Ljava/io/PrintWriter;ZZZ)V

    .line 162
    invoke-virtual {v2}, Ljava/io/PrintWriter;->close()V

    .line 163
    invoke-virtual {v1}, Ljava/io/PrintWriter;->println()V

    .line 164
    invoke-virtual {v3}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lfreemarker/template/utility/StringUtil;->XMLEncNQG(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 166
    const-string v4, "</pre></div></html>"

    invoke-virtual {v1, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 167
    invoke-virtual {v1}, Ljava/io/PrintWriter;->flush()V
    :try_end_4f
    .catchall {:try_start_d .. :try_end_4f} :catchall_5b

    .line 169
    if-nez v0, :cond_54

    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V

    .line 173
    .end local v0    # "externalPw":Z
    .end local v1    # "pw":Ljava/io/PrintWriter;
    .end local v2    # "stackPW":Ljava/io/PrintWriter;
    .end local v3    # "stackTraceSW":Ljava/io/StringWriter;
    :cond_54
    throw p1

    .line 134
    .restart local v0    # "externalPw":Z
    .restart local p3    # "out":Ljava/io/Writer;
    :cond_55
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, p3}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    goto :goto_d

    .line 169
    .end local p3    # "out":Ljava/io/Writer;
    .restart local v1    # "pw":Ljava/io/PrintWriter;
    :catchall_5b
    move-exception v4

    if-nez v0, :cond_61

    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V

    :cond_61
    throw v4
.end method
