.class Lfreemarker/core/Environment$2;
.super Ljava/lang/Object;
.source "Environment.java"

# interfaces
.implements Lfreemarker/core/LocalContext;


# instance fields
.field private final this$0:Lfreemarker/core/Environment;

.field private final val$bodyParameterNames:Ljava/util/List;

.field private final val$outArgs:[Lfreemarker/template/TemplateModel;


# direct methods
.method constructor <init>(Lfreemarker/core/Environment;Ljava/util/List;[Lfreemarker/template/TemplateModel;)V
    .registers 4

    .prologue
    .line 329
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/Environment$2;->this$0:Lfreemarker/core/Environment;

    iput-object p2, p0, Lfreemarker/core/Environment$2;->val$bodyParameterNames:Ljava/util/List;

    iput-object p3, p0, Lfreemarker/core/Environment$2;->val$outArgs:[Lfreemarker/template/TemplateModel;

    return-void
.end method


# virtual methods
.method public getLocalVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 331
    iget-object v1, p0, Lfreemarker/core/Environment$2;->val$bodyParameterNames:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 332
    .local v0, "index":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_e

    iget-object v1, p0, Lfreemarker/core/Environment$2;->val$outArgs:[Lfreemarker/template/TemplateModel;

    aget-object v1, v1, v0

    :goto_d
    return-object v1

    :cond_e
    const/4 v1, 0x0

    goto :goto_d
.end method

.method public getLocalVariableNames()Ljava/util/Collection;
    .registers 2

    .prologue
    .line 336
    iget-object v0, p0, Lfreemarker/core/Environment$2;->val$bodyParameterNames:Ljava/util/List;

    return-object v0
.end method
