.class Lfreemarker/template/utility/CaptureOutput$1;
.super Ljava/io/Writer;
.source "CaptureOutput.java"


# instance fields
.field private final this$0:Lfreemarker/template/utility/CaptureOutput;

.field private final val$buf:Ljava/lang/StringBuffer;

.field private final val$env:Lfreemarker/core/Environment;

.field private final val$globalVar:Z

.field private final val$localVar:Z

.field private final val$nsModel:Lfreemarker/template/TemplateModel;

.field private final val$out:Ljava/io/Writer;

.field private final val$varName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lfreemarker/template/utility/CaptureOutput;Ljava/lang/StringBuffer;Ljava/io/Writer;ZLfreemarker/core/Environment;Ljava/lang/String;ZLfreemarker/template/TemplateModel;)V
    .registers 9

    .prologue
    .line 146
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    iput-object p1, p0, Lfreemarker/template/utility/CaptureOutput$1;->this$0:Lfreemarker/template/utility/CaptureOutput;

    iput-object p2, p0, Lfreemarker/template/utility/CaptureOutput$1;->val$buf:Ljava/lang/StringBuffer;

    iput-object p3, p0, Lfreemarker/template/utility/CaptureOutput$1;->val$out:Ljava/io/Writer;

    iput-boolean p4, p0, Lfreemarker/template/utility/CaptureOutput$1;->val$localVar:Z

    iput-object p5, p0, Lfreemarker/template/utility/CaptureOutput$1;->val$env:Lfreemarker/core/Environment;

    iput-object p6, p0, Lfreemarker/template/utility/CaptureOutput$1;->val$varName:Ljava/lang/String;

    iput-boolean p7, p0, Lfreemarker/template/utility/CaptureOutput$1;->val$globalVar:Z

    iput-object p8, p0, Lfreemarker/template/utility/CaptureOutput$1;->val$nsModel:Lfreemarker/template/TemplateModel;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 157
    new-instance v1, Lfreemarker/template/SimpleScalar;

    iget-object v2, p0, Lfreemarker/template/utility/CaptureOutput$1;->val$buf:Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    .line 159
    .local v1, "result":Lfreemarker/template/SimpleScalar;
    :try_start_b
    iget-boolean v2, p0, Lfreemarker/template/utility/CaptureOutput$1;->val$localVar:Z

    if-eqz v2, :cond_17

    .line 160
    iget-object v2, p0, Lfreemarker/template/utility/CaptureOutput$1;->val$env:Lfreemarker/core/Environment;

    iget-object v3, p0, Lfreemarker/template/utility/CaptureOutput$1;->val$varName:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Lfreemarker/core/Environment;->setLocalVariable(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    .line 174
    :goto_16
    return-void

    .line 161
    :cond_17
    iget-boolean v2, p0, Lfreemarker/template/utility/CaptureOutput$1;->val$globalVar:Z

    if-eqz v2, :cond_4d

    .line 162
    iget-object v2, p0, Lfreemarker/template/utility/CaptureOutput$1;->val$env:Lfreemarker/core/Environment;

    iget-object v3, p0, Lfreemarker/template/utility/CaptureOutput$1;->val$varName:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Lfreemarker/core/Environment;->setGlobalVariable(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V
    :try_end_22
    .catch Ljava/lang/IllegalStateException; {:try_start_b .. :try_end_22} :catch_23

    goto :goto_16

    .line 171
    :catch_23
    move-exception v0

    .line 172
    .local v0, "ise":Ljava/lang/IllegalStateException;
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Could not set variable "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lfreemarker/template/utility/CaptureOutput$1;->val$varName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 165
    .end local v0    # "ise":Ljava/lang/IllegalStateException;
    :cond_4d
    :try_start_4d
    iget-object v2, p0, Lfreemarker/template/utility/CaptureOutput$1;->val$nsModel:Lfreemarker/template/TemplateModel;

    if-nez v2, :cond_59

    .line 166
    iget-object v2, p0, Lfreemarker/template/utility/CaptureOutput$1;->val$env:Lfreemarker/core/Environment;

    iget-object v3, p0, Lfreemarker/template/utility/CaptureOutput$1;->val$varName:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Lfreemarker/core/Environment;->setVariable(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    goto :goto_16

    .line 168
    :cond_59
    iget-object v2, p0, Lfreemarker/template/utility/CaptureOutput$1;->val$nsModel:Lfreemarker/template/TemplateModel;

    check-cast v2, Lfreemarker/core/Environment$Namespace;

    iget-object v3, p0, Lfreemarker/template/utility/CaptureOutput$1;->val$varName:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Lfreemarker/core/Environment$Namespace;->put(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_62
    .catch Ljava/lang/IllegalStateException; {:try_start_4d .. :try_end_62} :catch_23

    goto :goto_16
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 153
    iget-object v0, p0, Lfreemarker/template/utility/CaptureOutput$1;->val$out:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    .line 154
    return-void
.end method

.method public write([CII)V
    .registers 5
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 149
    iget-object v0, p0, Lfreemarker/template/utility/CaptureOutput$1;->val$buf:Ljava/lang/StringBuffer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 150
    return-void
.end method
