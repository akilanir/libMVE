.class final Lorg/junit/internal/runners/rules/RuleMemberValidator$FieldMustBeATestRule;
.super Ljava/lang/Object;
.source "RuleMemberValidator.java"

# interfaces
.implements Lorg/junit/internal/runners/rules/RuleMemberValidator$RuleValidator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/internal/runners/rules/RuleMemberValidator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FieldMustBeATestRule"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 269
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/junit/internal/runners/rules/RuleMemberValidator$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/junit/internal/runners/rules/RuleMemberValidator$1;

    .prologue
    .line 269
    invoke-direct {p0}, Lorg/junit/internal/runners/rules/RuleMemberValidator$FieldMustBeATestRule;-><init>()V

    return-void
.end method


# virtual methods
.method public validate(Lorg/junit/runners/model/FrameworkMember;Ljava/lang/Class;Ljava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runners/model/FrameworkMember",
            "<*>;",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 273
    .local p1, "member":Lorg/junit/runners/model/FrameworkMember;, "Lorg/junit/runners/model/FrameworkMember<*>;"
    .local p2, "annotation":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    .local p3, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    # invokes: Lorg/junit/internal/runners/rules/RuleMemberValidator;->isTestRule(Lorg/junit/runners/model/FrameworkMember;)Z
    invoke-static {p1}, Lorg/junit/internal/runners/rules/RuleMemberValidator;->access$1400(Lorg/junit/runners/model/FrameworkMember;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 274
    new-instance v0, Lorg/junit/internal/runners/rules/ValidationError;

    const-string v1, "must implement TestRule."

    invoke-direct {v0, p1, p2, v1}, Lorg/junit/internal/runners/rules/ValidationError;-><init>(Lorg/junit/runners/model/FrameworkMember;Ljava/lang/Class;Ljava/lang/String;)V

    invoke-interface {p3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 277
    :cond_10
    return-void
.end method
