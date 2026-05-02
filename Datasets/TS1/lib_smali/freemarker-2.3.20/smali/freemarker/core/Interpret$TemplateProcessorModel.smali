.class Lfreemarker/core/Interpret$TemplateProcessorModel;
.super Ljava/lang/Object;
.source "Interpret.java"

# interfaces
.implements Lfreemarker/template/TemplateTransformModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/Interpret;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TemplateProcessorModel"
.end annotation


# instance fields
.field private final template:Lfreemarker/template/Template;

.field private final this$0:Lfreemarker/core/Interpret;


# direct methods
.method constructor <init>(Lfreemarker/core/Interpret;Lfreemarker/template/Template;)V
    .registers 3
    .param p2, "template"    # Lfreemarker/template/Template;

    .prologue
    .line 150
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/Interpret$TemplateProcessorModel;->this$0:Lfreemarker/core/Interpret;

    .line 151
    iput-object p2, p0, Lfreemarker/core/Interpret$TemplateProcessorModel;->template:Lfreemarker/template/Template;

    .line 152
    return-void
.end method


# virtual methods
.method public getWriter(Ljava/io/Writer;Ljava/util/Map;)Ljava/io/Writer;
    .registers 10
    .param p1, "out"    # Ljava/io/Writer;
    .param p2, "args"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 158
    :try_start_1
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v1

    .line 159
    .local v1, "env":Lfreemarker/core/Environment;
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lfreemarker/core/Environment;->setFastInvalidReferenceExceptions(Z)Z
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_9} :catch_1d

    move-result v2

    .line 161
    .local v2, "lastFIRE":Z
    :try_start_a
    iget-object v3, p0, Lfreemarker/core/Interpret$TemplateProcessorModel;->template:Lfreemarker/template/Template;

    invoke-virtual {v1, v3}, Lfreemarker/core/Environment;->include(Lfreemarker/template/Template;)V
    :try_end_f
    .catchall {:try_start_a .. :try_end_f} :catchall_18

    .line 163
    :try_start_f
    invoke-virtual {v1, v2}, Lfreemarker/core/Environment;->setFastInvalidReferenceExceptions(Z)Z
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_12} :catch_1d

    .line 175
    new-instance v3, Lfreemarker/core/Interpret$TemplateProcessorModel$1;

    invoke-direct {v3, p0, p1, p1}, Lfreemarker/core/Interpret$TemplateProcessorModel$1;-><init>(Lfreemarker/core/Interpret$TemplateProcessorModel;Ljava/lang/Object;Ljava/io/Writer;)V

    return-object v3

    .line 163
    :catchall_18
    move-exception v3

    :try_start_19
    invoke-virtual {v1, v2}, Lfreemarker/core/Environment;->setFastInvalidReferenceExceptions(Z)Z

    throw v3
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_1d} :catch_1d

    .line 166
    .end local v1    # "env":Lfreemarker/core/Environment;
    .end local v2    # "lastFIRE":Z
    :catch_1d
    move-exception v0

    .line 168
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Lfreemarker/core/_TemplateModelException;

    const/4 v4, 0x6

    new-array v4, v4, [Ljava/lang/Object;

    const-string v5, "Template created with \"?"

    aput-object v5, v4, v6

    const/4 v5, 0x1

    iget-object v6, p0, Lfreemarker/core/Interpret$TemplateProcessorModel;->this$0:Lfreemarker/core/Interpret;

    iget-object v6, v6, Lfreemarker/core/Interpret;->key:Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "\" has stopped with this error:\n\n"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string v6, "---begin-message---\n"

    aput-object v6, v4, v5

    const/4 v5, 0x4

    new-instance v6, Lfreemarker/core/_DelayedGetMessage;

    invoke-direct {v6, v0}, Lfreemarker/core/_DelayedGetMessage;-><init>(Ljava/lang/Throwable;)V

    aput-object v6, v4, v5

    const/4 v5, 0x5

    const-string v6, "\n---end-message---"

    aput-object v6, v4, v5

    invoke-direct {v3, v0, v4}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v3
.end method
