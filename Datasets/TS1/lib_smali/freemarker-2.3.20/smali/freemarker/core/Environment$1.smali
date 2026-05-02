.class Lfreemarker/core/Environment$1;
.super Ljava/lang/Object;
.source "Environment.java"

# interfaces
.implements Lfreemarker/template/TemplateDirectiveBody;


# instance fields
.field private final this$0:Lfreemarker/core/Environment;

.field private final val$element:Lfreemarker/core/TemplateElement;


# direct methods
.method constructor <init>(Lfreemarker/core/Environment;Lfreemarker/core/TemplateElement;)V
    .registers 3

    .prologue
    .line 308
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/Environment$1;->this$0:Lfreemarker/core/Environment;

    iput-object p2, p0, Lfreemarker/core/Environment$1;->val$element:Lfreemarker/core/TemplateElement;

    return-void
.end method


# virtual methods
.method public render(Ljava/io/Writer;)V
    .registers 5
    .param p1, "newOut"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 310
    iget-object v1, p0, Lfreemarker/core/Environment$1;->this$0:Lfreemarker/core/Environment;

    invoke-static {v1}, Lfreemarker/core/Environment;->access$000(Lfreemarker/core/Environment;)Ljava/io/Writer;

    move-result-object v0

    .line 311
    .local v0, "prevOut":Ljava/io/Writer;
    iget-object v1, p0, Lfreemarker/core/Environment$1;->this$0:Lfreemarker/core/Environment;

    invoke-static {v1, p1}, Lfreemarker/core/Environment;->access$002(Lfreemarker/core/Environment;Ljava/io/Writer;)Ljava/io/Writer;

    .line 313
    :try_start_b
    iget-object v1, p0, Lfreemarker/core/Environment$1;->this$0:Lfreemarker/core/Environment;

    iget-object v2, p0, Lfreemarker/core/Environment$1;->val$element:Lfreemarker/core/TemplateElement;

    invoke-virtual {v1, v2}, Lfreemarker/core/Environment;->visit(Lfreemarker/core/TemplateElement;)V
    :try_end_12
    .catchall {:try_start_b .. :try_end_12} :catchall_18

    .line 316
    iget-object v1, p0, Lfreemarker/core/Environment$1;->this$0:Lfreemarker/core/Environment;

    invoke-static {v1, v0}, Lfreemarker/core/Environment;->access$002(Lfreemarker/core/Environment;Ljava/io/Writer;)Ljava/io/Writer;

    .line 318
    return-void

    .line 316
    :catchall_18
    move-exception v1

    iget-object v2, p0, Lfreemarker/core/Environment$1;->this$0:Lfreemarker/core/Environment;

    invoke-static {v2, v0}, Lfreemarker/core/Environment;->access$002(Lfreemarker/core/Environment;Ljava/io/Writer;)Ljava/io/Writer;

    throw v1
.end method
