.class Lfreemarker/core/BlockAssignment$CaptureOutput$1;
.super Ljava/io/StringWriter;
.source "BlockAssignment.java"


# instance fields
.field private final this$1:Lfreemarker/core/BlockAssignment$CaptureOutput;


# direct methods
.method constructor <init>(Lfreemarker/core/BlockAssignment$CaptureOutput;)V
    .registers 2

    .prologue
    .line 116
    invoke-direct {p0}, Ljava/io/StringWriter;-><init>()V

    iput-object p1, p0, Lfreemarker/core/BlockAssignment$CaptureOutput$1;->this$1:Lfreemarker/core/BlockAssignment$CaptureOutput;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 4

    .prologue
    .line 118
    new-instance v0, Lfreemarker/template/SimpleScalar;

    invoke-virtual {p0}, Lfreemarker/core/BlockAssignment$CaptureOutput$1;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    .line 119
    .local v0, "result":Lfreemarker/template/SimpleScalar;
    iget-object v1, p0, Lfreemarker/core/BlockAssignment$CaptureOutput$1;->this$1:Lfreemarker/core/BlockAssignment$CaptureOutput;

    invoke-static {v1}, Lfreemarker/core/BlockAssignment$CaptureOutput;->access$100(Lfreemarker/core/BlockAssignment$CaptureOutput;)Lfreemarker/core/BlockAssignment;

    move-result-object v1

    invoke-static {v1}, Lfreemarker/core/BlockAssignment;->access$200(Lfreemarker/core/BlockAssignment;)I

    move-result v1

    packed-switch v1, :pswitch_data_70

    .line 138
    :goto_16
    return-void

    .line 121
    :pswitch_17
    iget-object v1, p0, Lfreemarker/core/BlockAssignment$CaptureOutput$1;->this$1:Lfreemarker/core/BlockAssignment$CaptureOutput;

    invoke-static {v1}, Lfreemarker/core/BlockAssignment$CaptureOutput;->access$300(Lfreemarker/core/BlockAssignment$CaptureOutput;)Lfreemarker/core/Environment$Namespace;

    move-result-object v1

    if-eqz v1, :cond_33

    .line 122
    iget-object v1, p0, Lfreemarker/core/BlockAssignment$CaptureOutput$1;->this$1:Lfreemarker/core/BlockAssignment$CaptureOutput;

    invoke-static {v1}, Lfreemarker/core/BlockAssignment$CaptureOutput;->access$300(Lfreemarker/core/BlockAssignment$CaptureOutput;)Lfreemarker/core/Environment$Namespace;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/BlockAssignment$CaptureOutput$1;->this$1:Lfreemarker/core/BlockAssignment$CaptureOutput;

    invoke-static {v2}, Lfreemarker/core/BlockAssignment$CaptureOutput;->access$100(Lfreemarker/core/BlockAssignment$CaptureOutput;)Lfreemarker/core/BlockAssignment;

    move-result-object v2

    invoke-static {v2}, Lfreemarker/core/BlockAssignment;->access$400(Lfreemarker/core/BlockAssignment;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lfreemarker/core/Environment$Namespace;->put(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_16

    .line 125
    :cond_33
    iget-object v1, p0, Lfreemarker/core/BlockAssignment$CaptureOutput$1;->this$1:Lfreemarker/core/BlockAssignment$CaptureOutput;

    invoke-static {v1}, Lfreemarker/core/BlockAssignment$CaptureOutput;->access$500(Lfreemarker/core/BlockAssignment$CaptureOutput;)Lfreemarker/core/Environment;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/BlockAssignment$CaptureOutput$1;->this$1:Lfreemarker/core/BlockAssignment$CaptureOutput;

    invoke-static {v2}, Lfreemarker/core/BlockAssignment$CaptureOutput;->access$100(Lfreemarker/core/BlockAssignment$CaptureOutput;)Lfreemarker/core/BlockAssignment;

    move-result-object v2

    invoke-static {v2}, Lfreemarker/core/BlockAssignment;->access$400(Lfreemarker/core/BlockAssignment;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lfreemarker/core/Environment;->setVariable(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    goto :goto_16

    .line 130
    :pswitch_47
    iget-object v1, p0, Lfreemarker/core/BlockAssignment$CaptureOutput$1;->this$1:Lfreemarker/core/BlockAssignment$CaptureOutput;

    invoke-static {v1}, Lfreemarker/core/BlockAssignment$CaptureOutput;->access$500(Lfreemarker/core/BlockAssignment$CaptureOutput;)Lfreemarker/core/Environment;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/BlockAssignment$CaptureOutput$1;->this$1:Lfreemarker/core/BlockAssignment$CaptureOutput;

    invoke-static {v2}, Lfreemarker/core/BlockAssignment$CaptureOutput;->access$100(Lfreemarker/core/BlockAssignment$CaptureOutput;)Lfreemarker/core/BlockAssignment;

    move-result-object v2

    invoke-static {v2}, Lfreemarker/core/BlockAssignment;->access$400(Lfreemarker/core/BlockAssignment;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lfreemarker/core/Environment;->setLocalVariable(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    goto :goto_16

    .line 134
    :pswitch_5b
    iget-object v1, p0, Lfreemarker/core/BlockAssignment$CaptureOutput$1;->this$1:Lfreemarker/core/BlockAssignment$CaptureOutput;

    invoke-static {v1}, Lfreemarker/core/BlockAssignment$CaptureOutput;->access$500(Lfreemarker/core/BlockAssignment$CaptureOutput;)Lfreemarker/core/Environment;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/BlockAssignment$CaptureOutput$1;->this$1:Lfreemarker/core/BlockAssignment$CaptureOutput;

    invoke-static {v2}, Lfreemarker/core/BlockAssignment$CaptureOutput;->access$100(Lfreemarker/core/BlockAssignment$CaptureOutput;)Lfreemarker/core/BlockAssignment;

    move-result-object v2

    invoke-static {v2}, Lfreemarker/core/BlockAssignment;->access$400(Lfreemarker/core/BlockAssignment;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lfreemarker/core/Environment;->setGlobalVariable(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    goto :goto_16

    .line 119
    nop

    :pswitch_data_70
    .packed-switch 0x1
        :pswitch_17
        :pswitch_47
        :pswitch_5b
    .end packed-switch
.end method
