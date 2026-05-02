.class Lfreemarker/core/BlockAssignment$CaptureOutput;
.super Ljava/lang/Object;
.source "BlockAssignment.java"

# interfaces
.implements Lfreemarker/template/TemplateTransformModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/BlockAssignment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CaptureOutput"
.end annotation


# instance fields
.field private final env:Lfreemarker/core/Environment;

.field private final fnsModel:Lfreemarker/core/Environment$Namespace;

.field private final this$0:Lfreemarker/core/BlockAssignment;


# direct methods
.method constructor <init>(Lfreemarker/core/BlockAssignment;Lfreemarker/core/Environment;)V
    .registers 7
    .param p2, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/BlockAssignment$CaptureOutput;->this$0:Lfreemarker/core/BlockAssignment;

    .line 104
    iput-object p2, p0, Lfreemarker/core/BlockAssignment$CaptureOutput;->env:Lfreemarker/core/Environment;

    .line 105
    const/4 v0, 0x0

    .line 106
    .local v0, "nsModel":Lfreemarker/template/TemplateModel;
    invoke-static {p1}, Lfreemarker/core/BlockAssignment;->access$000(Lfreemarker/core/BlockAssignment;)Lfreemarker/core/Expression;

    move-result-object v1

    if-eqz v1, :cond_26

    .line 107
    invoke-static {p1}, Lfreemarker/core/BlockAssignment;->access$000(Lfreemarker/core/BlockAssignment;)Lfreemarker/core/Expression;

    move-result-object v1

    invoke-virtual {v1, p2}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 108
    instance-of v1, v0, Lfreemarker/core/Environment$Namespace;

    if-nez v1, :cond_26

    .line 109
    new-instance v1, Lfreemarker/core/UnexpectedTypeException;

    invoke-static {p1}, Lfreemarker/core/BlockAssignment;->access$000(Lfreemarker/core/BlockAssignment;)Lfreemarker/core/Expression;

    move-result-object v2

    const-string v3, "namespace"

    invoke-direct {v1, v2, v0, v3, p2}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v1

    .line 112
    :cond_26
    check-cast v0, Lfreemarker/core/Environment$Namespace;

    .end local v0    # "nsModel":Lfreemarker/template/TemplateModel;
    iput-object v0, p0, Lfreemarker/core/BlockAssignment$CaptureOutput;->fnsModel:Lfreemarker/core/Environment$Namespace;

    .line 113
    return-void
.end method

.method static access$100(Lfreemarker/core/BlockAssignment$CaptureOutput;)Lfreemarker/core/BlockAssignment;
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/BlockAssignment$CaptureOutput;

    .prologue
    .line 99
    iget-object v0, p0, Lfreemarker/core/BlockAssignment$CaptureOutput;->this$0:Lfreemarker/core/BlockAssignment;

    return-object v0
.end method

.method static access$300(Lfreemarker/core/BlockAssignment$CaptureOutput;)Lfreemarker/core/Environment$Namespace;
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/BlockAssignment$CaptureOutput;

    .prologue
    .line 99
    iget-object v0, p0, Lfreemarker/core/BlockAssignment$CaptureOutput;->fnsModel:Lfreemarker/core/Environment$Namespace;

    return-object v0
.end method

.method static access$500(Lfreemarker/core/BlockAssignment$CaptureOutput;)Lfreemarker/core/Environment;
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/BlockAssignment$CaptureOutput;

    .prologue
    .line 99
    iget-object v0, p0, Lfreemarker/core/BlockAssignment$CaptureOutput;->env:Lfreemarker/core/Environment;

    return-object v0
.end method


# virtual methods
.method public getWriter(Ljava/io/Writer;Ljava/util/Map;)Ljava/io/Writer;
    .registers 4
    .param p1, "out"    # Ljava/io/Writer;
    .param p2, "args"    # Ljava/util/Map;

    .prologue
    .line 116
    new-instance v0, Lfreemarker/core/BlockAssignment$CaptureOutput$1;

    invoke-direct {v0, p0}, Lfreemarker/core/BlockAssignment$CaptureOutput$1;-><init>(Lfreemarker/core/BlockAssignment$CaptureOutput;)V

    return-object v0
.end method
